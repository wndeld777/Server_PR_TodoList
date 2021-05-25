package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DBContract;
import com.callor.todo.config.DBInfo;
import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoListService;

public class TodoListServiceImplV1 implements TodoListService{
	
	protected Connection dbConn;
	public TodoListServiceImplV1() {
		dbConn = DBContract.getDBConnection();
	}
	
	protected List<TodoVO> select(PreparedStatement pStr) throws SQLException{
		List<TodoVO> todoList = new ArrayList<TodoVO>();
		pStr.executeQuery();
		ResultSet rSet = pStr.executeQuery();
		
		
		while(rSet.next()) {
			
			TodoVO todo = new TodoVO();
			todo.setTo_seq(rSet.getLong(DBInfo.to_seq));
			todo.setTo_work(rSet.getString(DBInfo.to_work));
			todo.setTo_date(rSet.getString(DBInfo.to_date));
			todo.setTo_time(rSet.getString(DBInfo.to_time));
			todo.setTo_place(rSet.getString(DBInfo.to_place));
			
			todoList.add(todo);
		}
		System.out.println(todoList.toString());
		return todoList;
	}

	@Override
	public List<TodoVO> selectAll() {
		// TODO Auto-generated method stub
		String sql = " SELECT * FROM tbl_todoList ";
		sql += " ORDER BY to_date DESC, to_time DESC ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			List<TodoVO> todoList = this.select(pStr);
			pStr.close();
			return todoList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public TodoVO findById(Long to_seq) {
		String sql = " SELECT * FROM tbl_todoList ";
		sql += " WHERE to_seq = ? ";
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, to_seq);
			List<TodoVO> todoList = this.select(pStr);
			pStr.close();
			if(todoList != null && todoList.size() >0 ) {
				System.out.println(todoList.toString());
				return todoList.get(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	@Override
	public Integer insert(TodoVO todoVO) {
		// TODO Auto-generated method stub]
		String sql = " INSERT INTO tbl_todoList( ";
		sql += " to_seq, to_date, to_time, to_work, to_place) ";
		sql += " VALUES( seq_todoList.NEXTVAL, ?, ?, ?, ? ) ";
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			
			pStr.setString(1, todoVO.getTo_date());
			pStr.setString(2, todoVO.getTo_time());
			pStr.setString(3, todoVO.getTo_work());
			pStr.setString(4, todoVO.getTo_place());
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer update(TodoVO todoVO) {
		// TODO Auto-generated method stub
		String sql = " UPDATE tbl_todoList SET ";
		sql += " to_date = ?, ";
		sql += " to_time = ?, ";
		sql += " to_work = ?, ";
		sql += " to_place = ? ";
		sql += " WHERE to_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, todoVO.getTo_date());
			pStr.setString(2, todoVO.getTo_time());
			pStr.setString(3, todoVO.getTo_work());
			pStr.setString(4, todoVO.getTo_place());
			pStr.setLong(5, todoVO.getTo_seq());
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Integer delete(Long to_seq) {
		// TODO Auto-generated method stub
		String sql = " DELETE FROM tbl_todoList ";
		sql += " WHERE to_seq = ? ";
		
		PreparedStatement pStr = null;
		
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, to_seq);
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}



}
