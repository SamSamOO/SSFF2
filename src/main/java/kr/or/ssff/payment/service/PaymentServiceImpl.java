package kr.or.ssff.payment.service;

/*

 */

import kr.or.ssff.cafe.service.CafeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

@Log4j2
@AllArgsConstructor

@Service("PaymentService")
public class PaymentServiceImpl
    implements PaymentService, InitializingBean, DisposableBean {

  @Override
  public void destroy() throws Exception {

  }

  @Override
  public void afterPropertiesSet() throws Exception {

  }
}

























