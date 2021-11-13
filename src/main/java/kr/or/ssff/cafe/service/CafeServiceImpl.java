package kr.or.ssff.cafe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.mapper.CafeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
 반환 :
 작성자: 신지혜
 */
  @Override
  public List<CafeListVO> getCafeList() {
    log.debug("CafeServiceImpl : selectCafeList() invoked");

    List<CafeListVO> cafeList = this.mapper.selectCafeList();

    // 이미지를 담을 공간
    List<List> imgList = new ArrayList<>();
    log.debug("cafeList : {}");
    Map<String, List<List>> cafeImg = new HashMap<String, List<List>>();
String temp = cafeList.cafe_idx;
    cafeImg.put(cafeList.get(0).getCafe_idx(), imgList.add(cafeList.get(0).getCafe_image_first());
    return cafeList;
  } // selectCafeList

  @Override
  public void destroy() throws Exception {

  }

  @Override
  public void afterPropertiesSet() throws Exception {

  }
}

























