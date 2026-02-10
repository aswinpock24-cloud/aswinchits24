# Quick Start Guide - Chit Fund Manager

## Step 1: Setup Database

1. Install PostgreSQL (if not installed)
2. Create database:
   ```sql
   CREATE DATABASE chitfund_db;
   ```

## Step 2: Setup Backend

1. Open terminal and navigate to backend folder:
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

5. Create `.env` file:
   ```bash
   copy .env.example .env
   ```

6. Edit `.env` file and update:
   - `DATABASE_URL`: Your PostgreSQL connection string
   - `SECRET_KEY`: Generate with `openssl rand -hex 32` or use any random string
   - Email settings (optional for now)

## Step 3: Run the Application

```bash
uvicorn app.main:app --reload
```

The API will start at: http://localhost:8000

**Important URLs:**
- API Documentation: http://localhost:8000/docs
- Health Check: http://localhost:8000/api/health

## Step 4: Create Your First User

Open http://localhost:8000/docs and use the interactive API:

1. Click on `POST /api/auth/register`
2. Click "Try it out"
3. Enter:
   ```json
   {
     "username": "admin",
     "email": "admin@example.com",
     "password": "password123",
     "terms_accepted": true
   }
   ```
4. Click "Execute"

## Step 5: Login and Get Token

1. Click on `POST /api/auth/login`
2. Enter username and password
3. Copy the `access_token` from response

## Step 6: Authorize

1. Click the "Authorize" button at top right
2. Enter: `Bearer YOUR_TOKEN_HERE`
3. Click "Authorize"

Now you can use all protected endpoints!

## Step 7: Create a Lender

1. Click on `POST /api/lenders`
2. Create a lender with bank account details

## Database Tables Created

When you run the app, these tables are automatically created:
- `users` - User accounts
- `lenders` - Lender profiles with bank accounts
- `chits` - Loan records
- `payments` - Payment tracking
- `complaints` - Dispute management
- `notifications` - Notification history

## Troubleshooting

**Database connection error:**
- Check PostgreSQL is running
- Verify DATABASE_URL in .env file
- Ensure database exists

**Import errors:**
- Make sure virtual environment is activated
- Run `pip install -r requirements.txt` again

**Token errors:**
- Get a new token from /api/auth/login
- Click Authorize button and paste token
