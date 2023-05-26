package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendlistServlet extends HttpServlet{
	
	//get 방식 요청을 하면 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//링크를 눌렀으니 여기에 코딩을 하면 된다.
		List<String> list = new ArrayList<>();
		
		//비즈니스 로직을 수행해서 얻어내 데이터(Model) 라고 가정하자
		list.add("김구라");
		list.add("해골");
		list.add("원숭이");
		list.add("주뎅이");
		list.add("덩어리");
		
		// "list" 라는 키 값으로 List<String> 을 request scope에 담기
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/test/friend.jsp");
		
		rd.forward(req, resp);
		
	}
	
	//post 방식 요청을 하면 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
