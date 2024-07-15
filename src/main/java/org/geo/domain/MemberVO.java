package org.geo.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {

	private String userid;
	private String userpw;
	private String username;
	private String email;
	private boolean enabled;

	private Date regDate;
	private List<AuthVO> authList;

}
