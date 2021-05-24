package com.callor.todo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TodoVO {

	private Long to_seq;
	private String to_date;
	private String to_time;
	private String to_work;
	private String to_place;
}
