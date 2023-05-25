package test.test;

import java.util.ArrayList;

public class Solution08 {
	public int[] solution(int[] arr) {

		ArrayList<Integer> stk = new ArrayList<>();
		
		int i = 0;
		while(i < arr.length) {
			if(stk.size() == 0) {
				stk.add(arr[i]);
				i++;
			} else if(stk.size() != 0 && arr[i] > stk.get(stk.size()-1)) {
				stk.add(arr[i]);
				i++;
			} else if(stk.size() != 0 && arr[i] <= stk.get(stk.size()-1)) {
				stk.remove(stk.size()-1);
			}
		}
		int[] result = new int[stk.size()];
		for(int j = 0; j < stk.size(); j++) {
			result[j] = stk.get(j);
		}
		
		return result;
    }
}
