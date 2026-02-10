@echo off
echo Stopping all running servers...
taskkill /F /IM python.exe /T
taskkill /F /IM uvicorn.exe /T
echo.
echo Starting Backend Server on port 8000...
start /B cmd /c "cd backend && .\venv\Scripts\activate && uvicorn app.main:app --host 0.0.0.0 --port 8000"
echo Starting Frontend Server on port 3000...
start /B cmd /c "cd frontend && python -m http.server 3000"
echo.
echo Servers started successfully!
echo Backend: http://localhost:8000/api/health
echo Frontend: http://localhost:3000
