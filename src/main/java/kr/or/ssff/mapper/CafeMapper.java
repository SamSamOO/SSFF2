package kr.or.ssff.mapper;

import java.util.List;
import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import org.apache.ibatis.annotations.Param;

/*
 스터디카페 crud DAO
 작성자: 신지혜
 */
public interface CafeMapper {

   
  // 전체 목록조회(사용자) : 신지혜
  public abstract List<CafeListVO> selectCafeList();

  // 카페&룸 항목 조회 : 신지혜
  public abstract List<CafeInfoVO> selectCafeJoinRoom(String cafe_idx);

  // 특정일자, 특정 room 예약정보만 : 신지혜
  public abstract List<RoomRsrvVO> selectRoomRsrvList(@Param("room_idx") String room_idx, @Param("use_date") String use_date);

  // 카페 단일 항목 조회 : 신지혜
  public abstract CafeVO selectCafe(String cafe_idx);

  // 예약정보 insert
  public abstract Integer insertReservation(ReservationDTO reservationDTO);



} // end interface
