
import unittest

import math_functions

class Testmath_functions_add(unittest.TestCase):

    def setUp(self):
        self.a=3
        self.b=4
        print("setup")
        
    def test_add(self):
        self.assertEqual(math_functions.add(self.a,self.b),7)
        print("test_add")

    def test_add1(self):
        self.assertEqual(math_functions.add(self.a+1,self.b+2),10)
        print("test_add1")

    def tearDown(self):
        print("tear down")

class Testmath_functions_sub(unittest.TestCase):

    def test_sub(self):
        self.assertEqual(math_functions.sub(3,4),-1)

if __name__ == '__main__':
    suite = unittest.TestSuite()
    suite.addTest(Testmath_functions_add("test_add"))
    suite.addTest(Testmath_functions_sub("test_sub"))
    runner = unittest.TextTestRunner()
    runner.run(suite)

    suite2 = unittest.TestSuite()
    suite2.addTest(Testmath_functions_add("test_add1"))

    runner1 = unittest.TextTestRunner()
    runner1.run(suite2)

