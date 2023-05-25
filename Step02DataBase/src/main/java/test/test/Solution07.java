package test.test;

//콜라츠 수열 만들기
public class Solution07 {
	public static int[] solution(int n) {
		int[] answer = {};
		int count = 1;
		int tmp = n;
		
		while(tmp != 1) {
			tmp = tmp % 2 == 0 ? tmp/2 : 3*tmp+1;
			count++;
		}
		
		tmp = n;
		answer = new int[count];
		answer[0] = n;
		int index = 1;
		while(tmp != 1) {
			tmp = tmp % 2 == 0 ? tmp/2 : 3*tmp+1;
			answer[index] = tmp;
			index++;
		}
		return answer;
	}
	
	public static void main(String[] args) {
		int[] a = solution(10);
		for(int i =0; i < a.length; i++) {
			System.out.println(a[i]);
		}
	}
}
