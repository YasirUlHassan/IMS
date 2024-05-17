package com.ims.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;

import com.ims.model.DAOServiceImpl;

@WebServlet("/updateInquiry")
public class UpdateInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateInquiryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		request.setAttribute("email", email);
		request.setAttribute("mobile", mobile);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/updateInquiry.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession(false);
			session.setMaxInactiveInterval(10);
			if(session.getAttribute("email")!=null) {
				String email = request.getParameter("email");
				String mobile = request.getParameter("mobile");
				DAOServiceImpl service = new DAOServiceImpl();
				service.connectDB();
				service.updateInquiry(email, mobile);
				ResultSet result = service.getAllInquiries();
				request.setAttribute("res", result);
				request.setAttribute("msg", "Record is updated!!");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/allInquiries.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("msg", "Session TimedOut!!!");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
