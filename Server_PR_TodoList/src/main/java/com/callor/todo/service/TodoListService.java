package com.callor.todo.service;

import java.util.List;

import com.callor.todo.model.TodoVO;

public interface TodoListService {

	public List<TodoVO> selectAll();
	public TodoVO findById(Long to_seq);
	public Integer insert(TodoVO todoVO);
	public Integer update(TodoVO todoVO);
	public Integer delete(Long to_seq);
}
