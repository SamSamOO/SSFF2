package kr.or.ssff.exception;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;


@Log4j2
@NoArgsConstructor(access=lombok.AccessLevel.PUBLIC)

@ControllerAdvice
public class CommonExceptionHandler {
	
	// 매핑정보가 없는 경우에 발생하는 NoHandlerFoundException 예외처리하도록 구현.
		
	@ResponseStatus(code=HttpStatus.BAD_REQUEST)	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, Model model) {
		log.debug("handleException({}, {}) invoked.", e, model);
		
		// 예외처리를 수행...
		log.info("1. Exception Type: {}", e.getClass().getName());
		log.info("2. Exception Message: {}", e.getMessage());
		
		e.printStackTrace();    // 발생한 예외의 스택트레이스를, 콘솔에 출력
		
		model.addAttribute("exception", e);
		
		return "errorPage";
	} // handleException	

} // end class
