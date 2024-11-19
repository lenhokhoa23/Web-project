const Order = require('../models/Order');

const orderController = {
    showOrderList: (req, res) => {
        res.render('order');
    },

    getOrders: (req, res) => {
        Order.getAllOrders((err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersValue: (req, res) => {
        Order.getValueOrders((err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy giá trị đơn hàng:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersByStatus: (req, res) => {
        const status = req.params.status;
        Order.getOrdersByStatus(status, (err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order theo trạng thái:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersNotShipped: (req, res) => {
        Order.getOrdersByStatus('Shipped', (err, shippedOrders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order chưa giao:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            Order.getAllOrders((err, allOrders) => {
                if (err) {
                    console.error('Lỗi khi lấy danh sách tất cả order:', err);
                    return res.status(500).json({ error: 'Lỗi server' });
                }
                const notShippedOrders = allOrders.filter(order => !shippedOrders.some(shipped => shipped.Order_ID === order.Order_ID));
                res.json(notShippedOrders);
            });
        });
    },

    getProductValues: (req, res) => {
        Order.getValueOfProduct((err, products) => {
            if (err) {
                console.error('Lỗi khi lấy giá trị sản phẩm:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(products);
        });
    }
};

module.exports = orderController;