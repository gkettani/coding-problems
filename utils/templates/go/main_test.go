package main

import "testing"

func TestSolution(t *testing.T) {
	input := "example input"
	expected := "expected output"
	result := Solution(input)

	if result != expected {
		t.Errorf("Solution(%q) = %q; want %q", input, result, expected)
	}
}
