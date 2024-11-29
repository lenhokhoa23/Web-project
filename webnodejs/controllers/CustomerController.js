const Customer = require('../models/Customer');

const CustomerController = {
    showCustomerList: (req, res) => {
        res.render('customer');
    },

    getCustomer: (req, res) => {
        Customer.getAllCustomer((err, customer) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách khách hàng:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(customer);
        });
    },

    getCustomerById: (req, res) => {
        const id = req.params.id;
        Customer.getCustomerById(id, (err, customer) => {
            if (err) {
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!customer) {
                return res.status(404).json({ error: 'Không tìm thấy khách hàng' });
            }
            res.json(customer);
        });
    },
    getCustomerDebts: (req, res) => {
        Customer.getCustomerDept((err, debts) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách nợ:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(debts);
        });
    }
};

module.exports = CustomerController;