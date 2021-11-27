package kr.or.ssff.exception;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;


@Log4j2
@Controller
@RequestMapping(path="/error")
public class CommonExceptionHandler {

	@GetMapping("/no-resource")
	public String noResource() {
		log.info("noResourceErrorPage() is invoked");

		return "/error/error";
	}
} // end class
