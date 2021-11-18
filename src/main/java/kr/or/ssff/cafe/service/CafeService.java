package kr.or.ssff.cafe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;

/*
 스터디카페 crud, 예약 정보 관리
 작성자: 신지혜
 */
public interface CafeService {

  // 전체 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> getCafeList();

  // 단일 카페정보 조회(사용자) : 신지혜
  public abstract List<CafeInfoVO> getCafe(String cafe_idx);

  // 특정일자, 특정 room 예약정보만 : 신지혜
  public abstract List<RoomRsrvVO> getRoomRsrvList(String room_idx, String date);



} // end interface

























