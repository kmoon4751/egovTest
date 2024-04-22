package member.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import member.service.MemberVO;



@Repository("MemberDAO")
public class MemberDAO extends EgovAbstractDAO{
	
	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember,vo");
				
	}

}
