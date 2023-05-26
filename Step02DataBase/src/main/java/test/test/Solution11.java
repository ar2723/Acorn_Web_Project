package test.test;

//char를 int 로 변환해서 연산하기
public class Solution11 {
	public int solution(String number) {
        int answer = 0;
        for(int i =0; i < number.length(); i++) {
        	answer += Character.getNumericValue(number.charAt(i));
        }
        answer %= 9;
        return answer;
    }
}
