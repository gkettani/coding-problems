package main

import (
	"container/heap"
	"fmt"
)

// FrequencyHeap is a max-heap of [value, frequency] pairs
type FrequencyHeap [][2]int

func (h FrequencyHeap) Len() int           { return len(h) }
func (h FrequencyHeap) Less(i, j int) bool { return h[i][1] > h[j][1] } // Max-Heap: Compare frequencies
func (h FrequencyHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *FrequencyHeap) Push(x interface{}) {
	*h = append(*h, x.([2]int))
}

func (h *FrequencyHeap) Pop() interface{} {
	old := *h
	n := len(old)
	item := old[n-1]
	*h = old[:n-1]
	return item
}

func topKFrequent(nums []int, k int) []int {
	// Count the frequencies of each number
	valueToOccurrences := make(map[int]int)
	for _, num := range nums {
		valueToOccurrences[num]++
	}

	// Build a max-heap of frequencies
	h := &FrequencyHeap{}
	heap.Init(h)
	for value, freq := range valueToOccurrences {
		heap.Push(h, [2]int{value, freq})
	}

	// Extract the top-k elements
	res := make([]int, k)
	for i := 0; i < k; i++ {
		top := heap.Pop(h).([2]int)
		res[i] = top[0]
	}

	return res
}

func main() {
	nums := []int{1, 1, 1, 2, 2, 3}
	k := 2
	result := topKFrequent(nums, k)
	fmt.Println(result) // Output: [1, 2]
}
