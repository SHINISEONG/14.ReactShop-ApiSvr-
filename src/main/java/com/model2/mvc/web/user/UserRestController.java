package com.model2.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/api/users/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping( value="{userId}")
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/api/users/{userId} : GET");
		User returnUser = userService.getUser(userId);
		returnUser.setPassword("");
		//Business Logic
		return returnUser;
	}

	@PostMapping( value="signin")
	public String login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("api/users/signin : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		////////////////////////////////////////////////////////////////////////////////
		// 아이디가 없다면.
		if( dbUser==null ) {
			//dbUser = new User();
			return "아이디가 존재하지 않습니다.";
		}
		/////////////////////////////////////////////////////////////////////////////////
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		} else { 
			return "비밀번호가 맞지 않습니다.";
		}
		
		return "로그인 성공";
	}
}
