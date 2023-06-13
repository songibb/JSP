package co.songi.exam.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
//	MEMBER_ID       NOT NULL VARCHAR2(50)  
//	MEMBER_PASSWORD NOT NULL VARCHAR2(256) 
//	MEMBER_NAME     NOT NULL VARCHAR2(50)  
//	MEMBER_AGE               NUMBER        
//	MEMBER_TEL      NOT NULL VARCHAR2(20)  
//	MEMBER_GENDER   NOT NULL VARCHAR2(10)  
	
	String memberId;
	String memberPassword;
	String memberName;
	int memberAge;
	String memberTel;
	String memberGender;
}
