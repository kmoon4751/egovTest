package member.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.service.MemberService;
import member.service.MemberVO;

@Controller
public class MemberController {
	
	/*회원등록 페이지 호출*/
	@RequestMapping("memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
	
	/*특정 리소스 사용 / memberService 사용 */
	@Resource(name = "memberService")
	public MemberService memberService;
	
	
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
	
}
