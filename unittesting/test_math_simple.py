
#basic unittest 
import unittest

import math_functions

class Testmath_functions_add(unittest.TestCase): #inheritance
    
    def test_add(self):
        self.assertEqual(math_functions.add(3,4),7)

unittest.main()