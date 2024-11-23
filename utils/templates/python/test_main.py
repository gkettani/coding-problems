import unittest
from main import solution

class TestSolution(unittest.TestCase):
    def test_example(self):
        self.assertEqual(solution("example input"), "expected output")
