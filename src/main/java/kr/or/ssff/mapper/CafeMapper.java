package kr.or.ssff.mapper;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.domain.ReservationVO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import kr.or.ssff.cafe.domain.RoomVO;
import kr.or.ssff.cafe.domain.RsrvJoinTrnscVO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.RoomDTO;
import org.apache.ibatis.annotations.Param;

/*
 스터디카페 crud DAO
 작성자: 신지혜
 */
public interface CafeMapper {

  //----------------- CAFE CRUD -----------------//

  // 카페 신규 등록 insert : 신지혜
  public abstract Integer insertCafe(CafeDTO cafeDTO);

  // 룸 신규 등록 insert : 신지혜
  public abstract Integer insertRoom(List<RoomDTO> roomDTO);

  // 카페 수정 update : 신지혜
  public abstract Integer updateCafe(CafeDTO cafeDTO);

  // 카페 단일 항목 삭제 : 신지혜
  public abstract Integer deleteCafe(String cafe_idx);

  // 룸 삭제 delete : 신지혜
  public abstract Integer deleteRoom(String cafe_idx);



  // 전체 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> selectCafeList();

  // 카페에 종속되는 룸 리스트를 조회 : 신지혜
  public abstract List<RoomVO> selectRoom(String cafe_idx);

  // 카페&룸 항목 조회 : 신지혜
  public abstract List<CafeInfoVO> selectCafeJoinRoom(String cafe_idx);

  // 카페 단일 항목 조회 : 신지혜
  public abstract CafeVO selectCafe(String cafe_idx);


  // 전체 목록조회(매니저) : 신지혜
  List<CafeVO> selectManagerCafeList(HashMap<String, String> searchKey);





  //----------------- RSRV(예약) CRUD -----------------//

  // 예약정보 insert : 신지혜
  public abstract Integer insertReservation(ReservationDTO reservationDTO);

  // 특정일자, 특정 room 예약정보만 : 신지혜
  public abstract List<RoomRsrvVO> selectRoomRsrvList(@Param("room_idx") String room_idx, @Param("use_date") String use_date);

  // 예약정보&거래내역 조회 (예약내역리스트 View에서 이용)
  public abstract List<RsrvJoinTrnscVO> selectRsrvJoinTrnscList(HashMap<String, String> searchKey);

  // 예약취소
  boolean cancelReservation(HashMap<String, String> searchKey);

  // 임시 예약된 정보 하나를 조회
  ReservationVO selectTempRsrv();

  // 거래정보 등록 실패시 관련 예약 정보도 삭제
  Integer deleteReservation(String tempRsrvIdx);

  // 거래정보 등록 성공시 예약정보의 상태컬럼 정상으로 업데이트!
  Integer setReservation(String tempRsrvIdx);
} // end interface
