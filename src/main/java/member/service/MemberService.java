package member.service;

import java.util.List;

public interface MemberService {
	/*회원등록처리*/
	public String insertMember(MemberVO vo) throws Exception;

	/*아이디 중복체크*/
	public int selectIdChk(String userid);

	/*로그인 아이디 유무/패스워드오류/세션*/
	public int loginProc(MemberVO vo);

	/*멤버리스트*/
	public List<?> selectMemberList();
}
