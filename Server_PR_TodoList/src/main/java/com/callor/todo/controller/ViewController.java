package com.callor.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoListService;
import com.callor.todo.service.impl.TodoListServiceImplV1;

@WebServlet("/todo/*")
public class ViewController extends HttpServlet{
	
	private static final long serialVersionUID = -1237032978932725868L;
	protected TodoListService tlservice;
	
	public ViewController() {
		tlservice = new TodoListServiceImplV1();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String subPath = req.getPathInfo();
		if(subPath.equals("/view")) {
			String strSeq = req.getParameter("to_seq");
			Long to_seq = Long.valueOf(strSeq);
			TodoVO todoVO = tlservice.findById(to_seq);
			req.setAttribute("TL", todoVO);
			req.getRequestDispatcher("/WEB-INF/views/view.jsp").forward(req, resp);
		}else if(subPath.equals("/delete")) {
			String strSeq = req.getParameter("to_seq");
			Long to_seq = Long.valueOf(strSeq);
			System.out.println("SEQ : " + to_seq);
			tlservice.delete(to_seq);
			resp.sendRedirect("/todo/");
		}
		
		
		
	
	
	
	}
	
	

}
