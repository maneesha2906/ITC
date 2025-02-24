# test_math_functions.py
import math_functions

def test_add():
    assert math_functions.add(2, 3) == 5
    assert math_functions.add(-1, 1) == 0
    assert math_functions.add(0, 0) == 0

def test_subtract():
    assert math_functions.sub(5, 3) == 2
    assert math_functions.sub(0, 0) == 0
    assert math_functions.sub(-1, -1) == 0
