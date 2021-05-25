package com.callor.todo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.config.DBInfo;
import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoListService;
import com.callor.todo.service.impl.TodoListServiceImplV1;

@WebServlet("/")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 2390118487195951184L;

	protected TodoListService tlservice;

	public HomeController() {
		tlservice = new TodoListServiceImplV1();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<TodoVO> todoList = tlservice.selectAll();
		req.setAttribute("todoList", todoList);

		TodoVO todoVO = new TodoVO();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat st = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		todoVO.setTo_seq(0L);
		todoVO.setTo_date(sd.format(date));
		todoVO.setTo_time(st.format(date));
		req.setAttribute("TODO", todoVO);

		req.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String subPath = req.getPathInfo();

		String strdate = req.getParameter(DBInfo.to_date);
		String strtime = req.getParameter(DBInfo.to_time);
		String strwork = req.getParameter(DBInfo.to_work);
		String strplace = req.getParameter(DBInfo.to_place);

		TodoVO todoVO = new TodoVO();

		todoVO.setTo_date(strdate);
		todoVO.setTo_time(strtime);
		todoVO.setTo_work(strwork);
		todoVO.setTo_place(strplace);

		System.out.println(todoVO.toString());

		tlservice.insert(todoVO);
		resp.sendRedirect("/todo/");
	}
}
