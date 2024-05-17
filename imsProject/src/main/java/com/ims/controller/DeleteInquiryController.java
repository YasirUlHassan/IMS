package com.ims.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

import com.ims.model.DAOServiceImpl;

@WebServlet("/deleteInquiry")
public class DeleteInquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteInquiryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		DAOServiceImpl service = new DAOServiceImpl();
		service.connectDB();
		service.deleteInquiry(email);
		
//		request.setAttribute("msg", "Record is deleted!");
//		RequestDispatcher rd = request.getRequestDispatcher("listInquiries");
//		rd.forward(request, response);
		
		ResultSet result = service.getAllInquiries();
		request.setAttribute("res", result);
		request.setAttribute("msg", "Record is deleted!");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/allInquiries.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
