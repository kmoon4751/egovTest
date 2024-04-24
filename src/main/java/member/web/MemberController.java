package member.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.service.MemberService;
import member.service.MemberVO;

@Controller
public class MemberController {
	
	/*특정 리소스 사용 / memberService 사용 */
	@Resource(name = "memberService")
	public MemberService memberService;
	
	
	/*회원등록 페이지 호출*/
	@RequestMapping("memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
	
	//회원등록 로직
	//어노테이션
	@RequestMapping("memberWriteSave.do")
	@ResponseBody //해당하는 메소드 안에 해당하는 값을 던져줄 수 있다. 메세지 전송을 할 수 있다.
	public String insertMamber(MemberVO vo) throws Exception{
		String message = "";
		
		String result = memberService.insertMember(vo);
		if(result == null) {
			message = "ok";
		}
		return message;
	}
	
	//회원등록 아이디 중복체크 
	/*중복체크*/
	@RequestMapping("idChk.do")
	@ResponseBody
	public String selectIdChk(String userid) throws Exception{
		System.out.println("USERID : " + userid);
		String result = "";
		
		int cnt = memberService.selectIdChk(userid);
		if(cnt == 0) {
			result = "ok";
		}
		return result;
	}
	
	
	/*로그인 페이지 호출*/
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인 로직
	@RequestMapping("loginProc.do")
	@ResponseBody
	public String loginProc(MemberVO vo, HttpSession session)  throws Exception{
		String message = "";  //그저 초기화
		
		int cnt = memberService.selectIdChk(vo.getUserid());
		if(cnt == 0) {	//아이디가 없으면
			message = "x";
		}else {
			int cnt2 = memberService.loginProc(vo);
				if(cnt2 == 0) {
					message = "wrong password";	//패스워드가 틀렸습니다.
				}else {
					session.setAttribute("sessionID", vo.getUserid());
					message="ok";	//로그인 성공
							
				}
			}
		
		return message;
	}
	
	
	//로그아웃 로직
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionID");	//세선 없애기
		return "member/main";
	}
	
	// 메인화면
	@RequestMapping("main.do")
	public String main() {
		return "member/main";
	}
	
	/*
	 * 멤버 리스트
	 * 24.04.24
	 * */
	@RequestMapping("memberList.do")
	public String selectMemberList(ModelMap map) throws Exception{
		//리스트 형태로 가져온다.
		List<?> list = memberService.selectMemberList();
		System.out.println("리스트 : " + list);
		map.addAttribute("memberList", list);
		return "member/memberList";
		
	}
		
}
