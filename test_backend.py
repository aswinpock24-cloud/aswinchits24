import requests

try:
    # Test health
    r1 = requests.get("http://127.0.0.1:8000/api/health")
    print(f"Health check: {r1.status_code}, {r1.json()}")

    # Test login with dummy data (should return 401 or 422, but not crash)
    r2 = requests.post(
        "http://127.0.0.1:8000/api/auth/login",
        data={"username": "test", "password": "testpassword"}
    )
    print(f"Login check: {r2.status_code}, {r2.text}")
except Exception as e:
    print(f"Error connecting: {e}")
