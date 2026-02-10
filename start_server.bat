@echo off
echo ========================================
echo   Chit Fund Manager - Starting Server
echo ========================================
echo.

cd backend

echo Checking if virtual environment exists...
if not exist "venv\" (
    echo Creating virtual environment...
    python -m venv venv
    echo.
)

echo Activating virtual environment...
call venv\Scripts\activate

echo.
echo Installing/Updating dependencies...
pip install -r requirements.txt

echo.
echo ========================================
echo   Starting FastAPI Server...
echo ========================================
echo.
echo Server will start at: http://localhost:8000
echo API Documentation: http://localhost:8000/docs
echo.
echo Press Ctrl+C to stop the server
echo.

uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
