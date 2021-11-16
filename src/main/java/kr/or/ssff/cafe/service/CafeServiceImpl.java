package kr.or.ssff.cafe.service;

import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.mapper.CafeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

/*
 스터디카페 crud
 작성자: 신지혜
 */

@Log4j2
@AllArgsConstructor

@Service("CafeService")
public class CafeServiceImpl
    implements CafeService, InitializingBean, DisposableBean {

	@Setter(onMethod_= { @Autowired })
  private CafeMapper mapper;

  /*
 전체 스터디카페 목록 조회
 매개변수 :
 반환 : 스터디카페 목록
 작성자: 신지혜
 */
  @Override
  public List<CafeListVO> getCafeList() {
    log.debug("CafeServiceImpl : selectCafeList() invoked");

    List<CafeListVO> list = this.mapper.selectCafeList();
    log.info("\t list: "+list);

    return list;
  } // selectCafeList


  /*
 단일 카페정보 조회
 매개변수 : cafe_idx 
 반환 : 단일 카페정보
 작성자: 신지혜
 */
  @Override
  public List<CafeInfoVO> getCafe(String cafe_idx) {
	  log.debug("CafeInfoVO {} :  invoked", cafe_idx);
	  
	  List<CafeInfoVO> cafeInfo = this.mapper.selectCafe(cafe_idx); 
	  log.info("\t cafeInfo: "+cafeInfo);
	  
	  return cafeInfo;
  } // 
  
  
  
  //-----------------------------------------------//
  @Override
  public void destroy() throws Exception {

  }

  @Override
  public void afterPropertiesSet() throws Exception {

  }


}

























