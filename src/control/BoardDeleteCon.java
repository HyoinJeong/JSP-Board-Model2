package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;

@WebServlet("/BoardDeleteCon.do")
public class BoardDeleteCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		// �ۻ����̱⿡ �۹�ȣ�� �Է¹���
		int num = Integer.parseInt(request.getParameter("num"));
		
		// �����ͺ��̽��� ������ �ϳ��� �Խ����� �����ϴ� �޼ҵ�
		BoardDAO bdao = new BoardDAO();
		// ��Ŭ���� Ÿ������ ����
		BoardBean bean = bdao.getOneUpdateBoard(num); // ��ȸ���� ������Ű�� �ʴ� �޼ҵ�
		
		request.setAttribute("bean", bean);
		RequestDispatcher dis = request.getRequestDispatcher("BoardDeleteForm.jsp");
		dis.forward(request, response);
	}
}
