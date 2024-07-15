package org.geo.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReplyVO {
	private Long rid;
	private Long bid;

	private String reply;
	private String replyer;
	private Timestamp replyDate;
	private int replyUpdate;


}
