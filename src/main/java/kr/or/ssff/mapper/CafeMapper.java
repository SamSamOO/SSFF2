package kr.or.ssff.mapper;

import java.util.List;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;

/*
 스터디카페 crud DAO
 작성자: 신지혜
 */
public interface CafeMapper {

   
  // 전체 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> selectCafeList();

  // 카페 단일 항목 조회 : 신지혜
  public abstract List<CafeInfoVO> selectCafe(String cafe_idx); 

} // end interface
