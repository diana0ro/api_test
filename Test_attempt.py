
import requests


def test_get_users():
    # Send a GET request to the API
    response = requests.get("http://localhost/#/store/getInventory")
        
    # Assert the response status code is 200 (OK)
    assert response.status_code == 200

        
