package org.geo.domain;


import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardVO {

	private Long bid;
	
	private String title;
	private String content;
	private String writer;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	private int replyCnt;	//
	
	
	
}
