import pytest
from httpx import AsyncClient


@pytest.mark.asyncio
async def test_get_password(client: AsyncClient):
    response = client.get("/backend/v1")
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Success"
    assert isinstance(data["data"], list)


@pytest.mark.asyncio
async def test_get_pin_code(client: AsyncClient):
    response = client.get("/backend/v1/pin")
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Success"
    assert isinstance(data["data"], list)


@pytest.mark.asyncio
async def test_post_complex_password(client: AsyncClient):
    payload = {
        "adicional_lenght": 16,
        "quantity": 5,
        "ponctuation": True,
        "suffle_string_inject": True,
        "char_inject": ["$", "%", "&"],
        "string_inject": ["Secure", "FastAPI"],
    }
    response = client.post("/backend/v1/complex_password", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["message"] == "Success"
    assert isinstance(data["data"], list)
    assert len(data["data"]) == payload["quantity"]
