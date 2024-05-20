package com.ims.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ims.model.DAOServiceImpl;

@WebServlet("/addInquiry")
public class AddInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddInquiryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addInquiry.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);
			session.setMaxInactiveInterval(20);
			if(session.getAttribute("email")!=null) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String mobile = request.getParameter("mobile");
				String course = request.getParameter("course");
				
				DAOServiceImpl service = new DAOServiceImpl();
				service.connectDB();
				service.addInquiry(name, email, mobile, course);
				request.setAttribute("msg", "Record is saved!!");
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/addInquiry.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("msg", "Session Timed Out!!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
