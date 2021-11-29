package kr.or.ssff.cafe.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.domain.RoomVO;
import kr.or.ssff.cafe.domain.RsrvJoinTrnscVO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.RoomDTO;
import kr.or.ssff.manager.domain.ManagerMemberVO;
import kr.or.ssff.studyIns.model.Criteria;

/*
 스터디카페 crud, 예약 정보 관리
 작성자: 신지혜
 */
public interface CafeService {


  //----------------- CAFE CRUD -----------------//

  // 신규 카페 insert
  public abstract String registerCafe(CafeDTO cafeDTO, List<RoomDTO> roomDTO);

  // 기존 카페 update
  public abstract String modifyCafe(CafeDTO cafeDTO, List<RoomDTO> roomDTOList);

  // 전체 스터디카페 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> getCafeList();

  // 단일 카페정보 & room & room img List 조회(사용자) : 신지혜
  public abstract List<CafeInfoVO> getCafeJoinRoom(String cafe_idx);

  // 단일 카페정보 조회 : 신지혜
  public abstract CafeVO getCafe(String cafe_idx);

  // 매니저 뷰단 사용할 카페 리스트 조회 : 신지혜
  public abstract List<CafeVO>  getManagerCafeList(HashMap<String, String> searchKey);

  // 단일 카페의 모든 룸 정보 조회: 신지혜
  public abstract List<RoomVO> getRoom(String cafe_idx);

  // 카페 정보 삭제(Update - delete)
  public abstract boolean removeCafe(String cafe_idx);

  //----------------- RSRV(예약) CRUD -----------------//


  // 특정일자, 특정 room 예약정보만 : 신지혜
  public abstract List<RoomRsrvVO> getRoomRsrvList(String room_idx, String date);

  // 예약 정보 insert
  public abstract boolean registerReservation(ReservationDTO reservationDTO);

  // 예약정보&거래내역 조회 (예약내역리스트 View에서 이용)
  public abstract List<RsrvJoinTrnscVO> getRsrvJoinTrnscList(HashMap<String, String> searchKey);

  // 예약취소
  public abstract boolean cancelReservation(HashMap<String, String> searchKey);
} // end interface