import pytest
from pydantic import ValidationError
from app.schemas.input_schemas import PasswordBody, PinPasswordOptions, PasswordOptions

def test_valid_password_body():
    pb = PasswordBody(
        adicional_lenght=10,
        quantity=5,
        ponctuation=True,
        suffle_string_inject=False,
        char_inject=["s", "b", "_", "2"],
        string_inject=["gabriel23%#@", "dudus1@"],
    )
    assert pb.adicional_lenght == 10
    assert pb.quantity == 5
    assert pb.char_inject == ["s", "b", "_", "2"]
    assert pb.string_inject == ["gabriel23%#@", "dudus1@"]

def test_invalid_char_inject():
    with pytest.raises(ValidationError, match="Invalid Char Regex"):
        PasswordBody(
            adicional_lenght=10,
            quantity=5,
            char_inject=["abc", "d"],
            string_inject=["valid_string"]
        )

def test_invalid_string_inject():
    with pytest.raises(ValidationError, match="Invalide String Regex"):
        PasswordBody(
            adicional_lenght=10,
            quantity=5,
            char_inject=["s", "b"],
            string_inject=["a"]
        )

def test_invalid_adicional_lenght():
    with pytest.raises(ValidationError):
        PasswordBody(
            adicional_lenght=-1,
            quantity=5,
            char_inject=["s"],
            string_inject=["valid_string"]
        )

def test_pin_password_options():
    ppo = PinPasswordOptions(password_length=15, quantity=3)
    assert ppo.password_length == 15
    assert ppo.quantity == 3

def test_password_options():
    po = PasswordOptions(password_length=20, quantity=2, has_ponctuation=False)
    assert po.password_length == 20
    assert po.quantity == 2
    assert po.has_ponctuation is False
