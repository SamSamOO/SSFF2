package kr.or.ssff.cafe.service;

import java.util.HashMap;
import java.util.List;
import kr.or.ssff.cafe.domain.CafeInfoVO;
import kr.or.ssff.cafe.domain.CafeListVO;
import kr.or.ssff.cafe.domain.CafeVO;
import kr.or.ssff.cafe.domain.ReservationDTO;
import kr.or.ssff.cafe.domain.RoomRsrvVO;
import kr.or.ssff.cafe.domain.RoomVO;
import kr.or.ssff.cafe.domain.RsrvJoinTrnscVO;
import kr.or.ssff.cafe.model.CafeDTO;
import kr.or.ssff.cafe.model.RoomDTO;
import kr.or.ssff.mapper.CafeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/*
 스터디카페 crud
 작성자: 신지혜
 */

@Log4j2
@AllArgsConstructor

@Service("CafeService")
public class CafeServiceImpl
    implements CafeService, InitializingBean, DisposableBean {

    @Setter(onMethod_ = {@Autowired})
    private CafeMapper mapper;



    /*
     * 스터디카페 & room insert
     * 매개변수: 카페와 룸 상세 정보를 모두 담은 DTO
     * 반환:
     * */
    @Transactional
    @Override
    public String registerCafe(CafeDTO cafeDTO, List<RoomDTO> roomDTOList) {
        log.debug("registerCafe invoked : {}, {}", cafeDTO, roomDTOList);

        // CAFE insert
        int insertCafeRow = this.mapper.insertCafe(cafeDTO);

        log.info("\t+ insertCafeRow: {}", insertCafeRow);

        // 생성한 cafe의 pk 값을 받아옴
        String cafe_idx = cafeDTO.getCafe_idx();
        log.info("\t + cafe_idx: {}", cafe_idx);

        // 받아온 pk값을 room의 cafe_idx(FK)로 입력
        for (int i = 0; i < roomDTOList.size(); i++) {
            roomDTOList.get(i).setCafe_idx(cafe_idx);
        }
        log.info("\t + roomDTOList: {}", roomDTOList); // 출력

        // ROOM insert
        int insertRoomRow = this.mapper.insertRoom(roomDTOList);

        log.info("\t + insertRoomRow: {}", insertRoomRow);


        return cafe_idx;
    } // registerCafe


    /*
     * 스터디카페 & room update
     * 매개변수: 예약 정보를 모두 담은 DTO
     * 반환:
     * */
    @Override
    public String modifyCafe(CafeDTO cafeDTO, List<RoomDTO> roomDTOList) {

        log.debug("modifyCafe invoked : {}, {}", cafeDTO, roomDTOList);
        // room의 cafe_idx 입력
        String cafe_idx = cafeDTO.getCafe_idx();

        for (int i = 0; i < roomDTOList.size(); i++) {
            roomDTOList.get(i).setCafe_idx(cafe_idx);
        }
        log.info("\t + roomDTOList: {}", roomDTOList);

        // 카페 정보는 update 하고
        int updateCafeRow = this.mapper.updateCafe(cafeDTO);
        log.info("\t + updateCafeRow: {}", updateCafeRow);


        // 룸 정보는 삭제(==update n->y)하고
        int deleteRoomRow = this.mapper.deleteRoom(cafe_idx);
        log.info("\t + deleteRoomRow: {}", deleteRoomRow);


        // 룸 정보 신규등록한다.
        int insertRoomRow = this.mapper.insertRoom(roomDTOList);
        log.info("\t + insertRoomRow: {}", insertRoomRow);


        // return (updateCafeRow!=0 && deleteRoomRow!=0 && insertRoomRow!=0);
        return cafe_idx;
    } // modifyCafe


    /*
       전체 스터디카페만 목록 조회
       매개변수 :
       반환 : 스터디카페 목록
       작성자: 신지혜
       */
    @Override
    public List<CafeListVO> getCafeList() {
        log.debug("CafeServiceImpl : selectCafeList() invoked");


        List<CafeListVO> list = this.mapper.selectCafeList();
        log.info("\t list: " + list);

        return list;
    } // selectCafeList


    /*
   단일 카페정보 & room(+room image List) 조회
   매개변수 : cafe_idx
   반환 : 카페정보 & room
   작성자: 신지혜
   */
    @Override
    public List<CafeInfoVO> getCafeJoinRoom(String cafe_idx) {
        log.debug("getCafeJoinRoom {} :  invoked", cafe_idx);

        List<CafeInfoVO> cafeInfo = this.mapper.selectCafeJoinRoom(cafe_idx);
        log.info("\t cafeInfo: " + cafeInfo);

        return cafeInfo;
    } // getCafeJoinRoom


    /*
     * 온전한 카페 하나의 정보 조회
     * 매개변수 : cafe_idx
     * 반환 : 단일 카페정보
     * 작성자: 신지혜
     * */
    @Override
    public CafeVO getCafe(String cafe_idx) {
        log.debug("getCafe {} :  invoked", cafe_idx);

        CafeVO cafeVO = this.mapper.selectCafe(cafe_idx);
        log.info("\t cafeVO: " + cafeVO);
        return cafeVO;
    } //getCafe

    /*
     * 카페 리스트 조회
     * 매개변수 : 검색할 값
     * 뷰단 : 매니저 카페 리스트
     * 반환 : 카페 리스트
     * 작성자: 신지혜
     * */
    @Override
    public List<CafeVO> getManagerCafeList(HashMap<String, String> searchKey) {
        log.debug("getManagerCafeList {} :  invoked", searchKey);
        List<CafeVO> list = this.mapper.selectManagerCafeList(searchKey);

        return list;
    } // getManagerCafeList


    /*
     * 카페 하나의 모든 룸 정보 조회
     * 매개변수 : cafe_idx
     * 반환 : 단일 카페정보
     * 작성자: 신지혜
     * */
    @Override
    public List<RoomVO> getRoom(String cafe_idx) {
        log.debug("getCafe {} :  invoked", cafe_idx);

        List<RoomVO> roomVoList = this.mapper.selectRoom(cafe_idx);
        log.info("\t roomVoList: " + roomVoList);
        return roomVoList;
    } //getCafe


    /*
     * 카페 정보 삭제(삭제여부 n->n update)
     * 매개변수 : cafe_idx
     * 작성자: 신지혜
     * */
    @Override
    public boolean removeCafe(String cafe_idx) {

        return (this.mapper.deleteCafe(cafe_idx)==1);
    }


    //-----------------------------------------------//


    /*
     * 특정일자, 특정 room 예약정보 조회
     * 매개변수: 룸번호, 조회날짜
     * 반환: 특정일자, 특정룸의 예약정보
     * */
    @Override
    public List<RoomRsrvVO> getRoomRsrvList(String room_idx, String use_date) {
        log.debug("getRoomRsrvList invoked : {}, {}", room_idx, use_date);

        List<RoomRsrvVO> roomRsrvList = this.mapper.selectRoomRsrvList(room_idx, use_date);
        log.info("\t roomRsrvList: " );
        log.info("\t roomRsrvList: " + roomRsrvList);
        return roomRsrvList;
    } // getRoomRsrvList


    /*
     * 예약 insert
     * 매개변수: 예약 정보를 모두 담은 DTO
     * 반환: 특정일자, 특정룸의 예약정보
     * */
    @Override
    public boolean registerReservation(ReservationDTO reservationDTO) {
        log.debug("registerReserve invoked : {}", reservationDTO);


        return (this.mapper.insertReservation(reservationDTO)==1);
    } // registerReserve




    /*
     * 예약정보&거래내역 조회 (예약내역리스트 View에서 이용)
     * 매개변수: 세션id, 검색키워드 등을 담은 map
     * 반환:
     * */
    @Override
    public List<RsrvJoinTrnscVO> getRsrvJoinTrnscList(HashMap<String, String> searchKey) {
        log.debug("getRsrvJoinTrnscList invoked : {}", searchKey);

        List<RsrvJoinTrnscVO> List = this.mapper.selectRsrvJoinTrnscList(searchKey);
        log.info("List : {}", List);

        return List;
    } // getRsrvJoinTrnscList


    /*
     * 예약 취소(예약내역리스트 View에서 이용)
     * 매개변수: 예약정보 등을 담은 map
     * 반환:
     * */
    @Override
    public boolean cancelReservation(HashMap<String, String> searchKey) {
        log.debug("cancelReservation invoked : {}", searchKey);

        return (this.mapper.cancelReservation(searchKey));
    } // cancelReservation


    //-----------------------------------------------//
    @Override
    public void destroy() throws Exception {

    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }


}

























