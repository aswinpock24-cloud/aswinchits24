# Chit Fund Management System

A full-stack web application for managing chit funds/loans with comprehensive tracking, payment management,  and automated notifications.

## Features

✅ **Bank Account Verification** - All lenders must have verified bank accounts
✅ **Online Transaction Tracking** - All loan disbursements tracked via bank transfers  
✅ **Lender Profiles** - Manage multiple lenders with individual portfolios
✅ **Loan Packages** - Predefined packages (₹50k, ₹1L) with automatic interest calculations
✅ **Payment Tracking** - Monitor due dates, payments, and automatic fine calculations
✅ **Email Notifications** - Automated reminders (7, 3, 1 days before due date)
✅ **Complaint Management** - Track disputes and resolutions
✅ **Responsive Design** - Works on mobile, tablet, and desktop

## Technology Stack

### Backend
- FastAPI (Python 3.10+)
- PostgreSQL 14+
- SQLAlchemy 2.0
- Alembic (migrations)
- JWT Authentication
- APScheduler (background tasks)

### Frontend
- HTML5, CSS3, JavaScript
- Responsive Design (Mobile-first)
- Fetch API

## Project Structure

```
chit-fund-manager/
├── backend/
│   ├── app/
│   │   ├── models/          # Database models
│   │   ├── schemas/         # Pydantic schemas
│   │   ├── routers/         # API endpoints
│   │   ├── services/        # Business logic
│   │   ├── utils/           # Utilities (security, email)
│   │   ├── main.py          # FastAPI app
│   │   ├── config.py        # Configuration
│   │   └── database.py      # Database connection
│   ├── uploads/             # File storage
│   ├── requirements.txt
│   └── .env.example
└── frontend/
    ├── index.html
    ├── css/
    ├── js/
    └── assets/
```

## Setup Instructions

### 1. Prerequisites

- Python 3.10 or higher
- PostgreSQL 14 or higher
- pip (Python package manager)

### 2. Database Setup

1. Install PostgreSQL if not already installed
2. Create a new database:
   ```sql
   CREATE DATABASE chitfund_db;
   ```

3. Create a database user (optional):
   ```sql
   CREATE USER chitfund_user WITH PASSWORD 'your_password';
   GRANT ALL PRIVILEGES ON DATABASE chitfund_db TO chitfund_user;
   ```

### 3. Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Create virtual environment:
   ```bash
   python -m venv venv
   ```

3. Activate virtual environment:
   - Windows: `venv\Scripts\activate`
   - Mac/Linux: `source venv/bin/activate`

4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

5. Create `.env` file from `.env.example`:
   ```bash
   copy .env.example .env   # Windows
   cp .env.example .env     # Mac/Linux
   ```

6. Edit `.env` file with your configuration:
   - Update `DATABASE_URL` with your PostgreSQL credentials
   - Change `SECRET_KEY` to a secure random string
   - Configure email settings (Gmail SMTP or SendGrid)

### 4. Run Database Migrations

The database tables will be created automatically when you first run the application.

Alternatively, you can use Alembic for migrations:
```bash
# Initialize Alembic (already done in project structure)
alembic init alembic

# Create migration
alembic revision --autogenerate -m "Initial migration"

# Run migration
alembic upgrade head
```

### 5. Run the Backend

```bash
cd backend
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at: `http://localhost:8000`
API Documentation (Swagger): `http://localhost:8000/docs`

### 6. Frontend Setup

1. Open `frontend/index.html` in a web browser
2. For development, you can use a simple HTTP server:
   ```bash
   # Python
   cd frontend
   python -m http.server 3000
   ```
   Then visit: `http://localhost:3000`

## Email Configuration

### Option 1: Gmail SMTP

1. Enable 2-Step Verification in your Google Account
2. Generate an App Password:
   - Go to Google Account > Security > 2-Step Verification > App Passwords
   - Create password for "Mail"
3. Update `.env`:
   ```
   SMTP_HOST=smtp.gmail.com
   SMTP_PORT=587
   SMTP_USER=your-email@gmail.com
   SMTP_PASSWORD=your-16-digit-app-password
   SMTP_FROM=your-email@gmail.com
   ```

### Option 2: SendGrid

1. Sign up at sendgrid.com
2. Create an API key
3. Update `.env`:
   ```
   SENDGRID_API_KEY=your-api-key
   SENDGRID_FROM=your-verified-sender@example.com
   ```

## Loan Packages

| Principal | Interest | Total Payable | 6 Months  | 12 Months |
|-----------|----------|---------------|-----------|-----------|
| ₹50,000   | ₹4,000 (8%) | ₹54,000    | ₹9,000/mo | ₹4,500/mo |
| ₹1,00,000 | ₹6,000 (6%) | ₹1,06,000  | ₹17,667/mo | ₹8,833/mo |

## API Endpoints (Planned)

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - Login
- `POST /api/auth/accept-terms` - Accept terms

### Lenders
- `POST /api/lenders` - Create lender profile
- `GET /api/lenders` - List lenders
- `GET /api/lenders/{id}` - Get lender details
- `PUT /api/lenders/{id}/verify-account` - Verify bank account

### Chits (Loans)
- `POST /api/chits` - Create loan
- `GET /api/chits` - List loans
- `GET /api/chits/{id}` - Get loan details
- `POST /api/chits/{id}/documents` - Upload documents

### Payments
- `POST /api/payments` - Record payment
- `GET /api/payments/chit/{id}` - Get payment history

### Notifications
- `GET /api/notifications` - Get notifications
- `PUT /api/notifications/{id}/read` - Mark as read

### Complaints
- `POST /api/complaints` - Create complaint
- `GET /api/complaints` - List complaints

## Current Status

### ✅ Completed
- Project structure created
- Database models implemented
- Configuration setup
- Security utilities (JWT, password hashing)
- Email utilities
- Main FastAPI application
- Requirements file

### 🚧 In Progress
- API route handlers (auth, lenders, chits, payments, etc.)
- Pydantic schemas for request/response validation
- Business logic services
- Frontend interface

### 📋 To Do
- Complete API endpoints
- Frontend implementation
- Notification scheduler
- Testing
- Deployment configuration

## Development

### Running Tests
```bash
pytest
```

### Code Quality
```bash
# Format code
black app/

# Lint
flake8 app/
```

## Security Notes

⚠️ **IMPORTANT**:
1. Change `SECRET_KEY` in `.env` before production
2. Bank account numbers should be encrypted in production
3. Use HTTPS in production
4. Restrict CORS origins in production
5. Regular database backups recommended

## Support

For issues or questions, please refer to the implementation plan document.

## License

Proprietary - All rights reserved
