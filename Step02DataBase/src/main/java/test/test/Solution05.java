package test.test;

//배열만들기
public class Solution05 {
	public static int[] solution(int l, int r) {
		int[] answer = {};
		int count = 0;
		for(int i = l; i <= r; i ++) {
			if(i % 5 == 0 && (i % 10 == 0 || i % 10 == 5)) {
				count++;
			}
		}
		
		answer = new int[count];
		int index = 0;
		
		for(int i = l; i <= r; i ++) {
			if(i % 5 == 0 && (i % 10 == 0 || i % 10 == 5)) {
				answer[index] = i;
				index++;
			}
		}
		
		return answer;
	}
	public static void main(String[] args) {
		solution(3, 100);
	}
}
