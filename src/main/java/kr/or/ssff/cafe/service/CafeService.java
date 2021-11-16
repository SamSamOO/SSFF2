package kr.or.ssff.cafe.service;

import java.util.List;
import java.util.Map;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;

/*
 스터디카페 crud
 작성자: 신지혜
 */
public interface CafeService {

  // 전체 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> getCafeList();

  
  // 단일 카페정보 조회(사용자) : 신지혜
  public abstract List<CafeInfoVO> getCafe(String cafe_idx);
  
} // end interface

























