package kr.or.ssff.controller;

import javax.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 * 테스트!
 */
@Log4j2
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	/*메인 화면 입니다.*/
	@GetMapping("/")
	public String home() {
		return "main";
	}

	@GetMapping("/ws")
	public void doWS(HttpSession session) {
		log.debug("doWS(session) invoked.");

		session.setAttribute("KEY_1", "VALUE_1");
		session.setAttribute("KEY_2", "VALUE_2");
		session.setAttribute("KEY_3", "VALUE_3");
	} // doWS


	@GetMapping("/sessionBinding")
	public void doSessionBinding(HttpSession session) {
		log.debug("doSessionBinding(session) invoked.");

		session.setAttribute("KEY_4", "VALUE_4");
		session.setAttribute("KEY_5", "VALUE_5");
		session.setAttribute("KEY_6", "VALUE_6");
	} // doSessionBinding
}
