const Payment = require('../models/Payment');

const paymentController = {
    // Hiển thị trang danh sách phản hồi
    showPaymentList: (req, res) => {
        res.render('payment'); 
    },

    // Lấy tất cả phản hồi cho API
    getPayments: (req, res) => {
        Payment.getAllPayments((err, payments) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách thanh toasn', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(payments); // Trả về danh sách phản hồi dưới dạng JSON
        });
    },

    getPaymentByCustomerId: (req, res) => {
        const customerId = req.params.id;
        Payment.getPaymentsByCustomerId(customerId, (err, payments) => {
            if (err) {
                console.error('Lỗi khi lấy phản hồi:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!payments || payments.length === 0) {
                return res.status(404).json({ error: 'Không tìm thấy phản hồi' });
            }
            res.json(payments); // Trả về danh sách phản hồi theo Customer_ID
        });
    },
};

module.exports = paymentController;
