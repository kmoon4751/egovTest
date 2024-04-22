package member.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import member.service.MemberService;
import member.service.MemberVO;

//service 어노테이션 비지니스 로직을 수행하는 Class라는 것을 나타내는 용도//

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectIdChk(String userid) {
		return memberDAO.selectIdChk(userid);
	}

	@Override
	public int loginProc(MemberVO vo) {
		return memberDAO.loginProc(vo);
	}
}
