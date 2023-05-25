package test.test;

//배열만들기
public class Solution05 {
	public static int[] solution(int l, int r) {
		int[] answer = {};
		int count = 0;
		
		// 숫자 개수 계산
	    for (int i = l; i <= r; i++) {
	        if (check(i)) {
	            count++;
	        }
	    }
	    // 배열 초기화
	    answer = new int[count];
	    int index = 0;

	    // 숫자 추출
	    for (int i = l; i <= r; i++) {
	        if (check(i)) {
	            answer[index] = i;
	            index++;
	        }
	    }   
	        if(count != 0){
				return answer;
			} else {
	            answer = new int[1];
				answer[0] = -1;
				return answer;
			}
	    }
	
	public static void main(String[] args) {
		solution(3, 100);
	}
	
	private static boolean check(int num) {
	    while (num != 0) {
	        int digit = num % 10;
	        if (digit != 5 && digit != 0) {
	            return false;
	        }
	        num /= 10;
	    }
	    return true;
	}
}
