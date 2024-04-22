package member.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import member.service.MemberVO;



@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO{
	
	// 회원가입
	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
				
	}
	
	//아이디 중복체크
	public int selectIdChk(String userid) {
		return (int) select("memberDAO.selectIdChk, userid");
	}

	//로그인
	public int loginProc(MemberVO vo) {
		return (int) select("memberDAO.loginProc", vo);
	}

}
