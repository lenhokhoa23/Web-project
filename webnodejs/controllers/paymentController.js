const Payment = require('../models/Payment');

const PaymentController = {
    showPaymentList: (req, res) => {
        res.render('payment'); 
    },

    getPayments: (req, res) => {
        Payment.getAllPayments((err, payments) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách thanh toán', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(payments);
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
            res.json(payments);
        });
    },
};

module.exports = PaymentController;
