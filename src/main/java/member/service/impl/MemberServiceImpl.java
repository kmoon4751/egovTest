package member.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import member.service.MemberService;
import member.service.MemberVO;

//service 어노테이션 비지니스 로직을 수행하는 Class라는 것을 나타내는 용도//

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	//회원 등록
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}
	
	// 중복 확인
	@Override
	public int selectIdChk(String userid) {
		return memberDAO.selectIdChk(userid);
	}

	//로그인
	@Override
	public int loginProc(MemberVO vo) {
		return memberDAO.loginProc(vo);
	}

	//멤버 리스트
	@Override
	public List<?> selectMemberList() {
		return memberDAO.selectMemberList();
	}
}
