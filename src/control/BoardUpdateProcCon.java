package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		// ������ �Ѿ�� �����͸� �޾ƿ�
		int num=Integer.parseInt(request.getParameter("num"));
		String password=request.getParameter("password"); // ����ڷκ��� �Է¹��� �н����尪
		String pass=request.getParameter("pass"); // ���� �����ͺ��̽��� ����Ǿ��ִ� �н����尪
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		// password���� pass���� ��
		if(password.equals(pass)) {
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num,subject,content);
			// ������ �Ϸ�Ǿ��ٸ� ��ü �Խñۺ���� �̵�
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}else {
			// ��й�ȣ�� Ʋ�ȴٸ� ���� �������� �̵�
			request.setAttribute("msg", "revise");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		}
		
	}

}
