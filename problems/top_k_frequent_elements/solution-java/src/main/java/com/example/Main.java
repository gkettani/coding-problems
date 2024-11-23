package com.example;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;

public class Main {
    public static int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> valueToOccurences = new HashMap<>();

        for (int i = 0; i < nums.length; i++) { // O(n)
            int occs = valueToOccurences.getOrDefault(nums[i], 0);
            valueToOccurences.put(nums[i], occs + 1);
        }

        Queue<Map.Entry<Integer, Integer>> queue = new PriorityQueue<>(
                valueToOccurences.entrySet().size(),
                (e1, e2) -> e2.getValue() - e1.getValue());

        for (var entry : valueToOccurences.entrySet()) { // O(n*log(n))
            queue.add(entry);
        }

        int[] res = new int[k];
        for (int i = 0; i < k; i++) {
            res[i] = queue.poll().getKey();
        }

        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 1, 1, 2, 2, 3 };
        int k = 2;
        int[] result = topKFrequent(nums, k);
        System.out.println(Arrays.toString(result)); // Output: [1, 2]
    }
}
