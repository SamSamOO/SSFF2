package kr.or.ssff.cafe.service;

import java.util.List;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.RoomDTO;

/*
 스터디카페 crud, 예약 정보 관리
 작성자: 신지혜
 */
public interface CafeService {


  //----------------- CAFE CRUD -----------------//

  // 신규 카페 insert
  public abstract boolean registerCafe(CafeDTO cafeDTO, List<RoomDTO> roomDTO);

  // 전체 스터디카페 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> getCafeList();

  // 단일 카페정보 조회(사용자) : 신지혜
  public abstract List<CafeInfoVO> getCafeJoinRoom(String cafe_idx);

  // 단일 카페정보 조회(사용자) : 신지혜
  public abstract CafeVO getCafe(String cafe_idx);



  //----------------- RSRV(예약) CRUD -----------------//


  // 특정일자, 특정 room 예약정보만 : 신지혜
  public abstract List<RoomRsrvVO> getRoomRsrvList(String room_idx, String date);

  // 예약 정보 insert
  public abstract boolean registerReservation(ReservationDTO reservationDTO);



} // end interface

























