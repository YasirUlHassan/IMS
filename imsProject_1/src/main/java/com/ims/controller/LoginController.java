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

@WebServlet("/verifyLogin")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			DAOServiceImpl service = new DAOServiceImpl();
			service.connectDB();
			boolean status = service.verifyLogin(email, password);
			if(status) {
				HttpSession session = request.getSession(true);
				session.setAttribute("email", email);
				session.setMaxInactiveInterval(20);
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/addInquiry.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid credentials");
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
