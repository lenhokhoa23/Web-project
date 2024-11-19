
const app = express();
const port = 3000;
app.use(express.json());
// Cấu hình view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware cho static files
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/', employeeRoutes);
app.use('/', projectRoutes);
app.use('/', trainingRoutes);
app.use('/', timesheetRoutes);
app.use('/', childrenRoutes);
app.use('/', feedbackRoutes);

// Trang chủ
app.get('/', (req, res) => {