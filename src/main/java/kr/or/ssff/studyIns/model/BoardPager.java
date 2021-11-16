package kr.or.ssff.studyIns.model;

import lombok.Data;
import org.springframework.security.web.method.annotation.CurrentSecurityContextArgumentResolver;

/*

 */

public class BoardPager {

    //페이지당 게시물 수
    public static final int PAGE_SCALE = 10;

    //화면당 페이지 수
    public static final int BLOCK_SCALE = 10;

    private int curPage; // 현재 페이지수
    private int prevPage; // 이전 페이지
    private int nextPage; // 다음 페이지
    private int totPage; // 전체 페이지 갯수
    private int totBlock; // 전체 페이지 블록 갯수
    private int curBlock; // 현재 페이지 블록
    private int prevBlock; // 이전 페이지 블록
    private int nextBlock; // 다음 페이지 블록
    // WHERE rn BETWEEN #{start} AND #{end}
    private int pageBegin; // #{start}
    private int pageEnd; // #{end}
    //[이전] blockBegin _>>> 41 42 43 44 45 46 ....50 [다음]
    private int blockBegin; // 현재 페이지 블록의 시작번호
    //[이전] 41 42.... 50  <- blockEnd [다음]
    private int blockEnd;

    //생성자
    //Board Page( 레코드의 갯수  , 현재 페이지의 번호)
    public BoardPager(int count, int curPage) {
        curBlock = 1; // 현재 페이지 블록 번호
        this.curPage = curPage; // 현재 페이지 설정
        setTotPage(count);

    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPrevPage() {
        return prevPage;
    }

    public void setPrevPage(int prevPage) {
        this.prevPage = prevPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotPage() {
        return totPage;
    }

    public void setTotPage(int totPage) {
        this.totPage = totPage;
    }
    public int getTotBlock() {

        return totBlock;
    }
    // 페이지 블록의 갯수 계산 ( 총 101페이지 >> 11개의 블록을 만들어야합니다)

    public void setTotBlock(int totBlock) {
        this.totBlock = (int)Math.ceil(totPage/BLOCK_SCALE);
    }

    public int getCurBlock() {
        return curBlock;
    }

    public void setCurBlock(int curBlock) {
        this.curBlock = curBlock;
    }

    public int getPrevBlock() {
        return prevBlock;
    }

    public void setPrevBlock(int prevBlock) {
        this.prevBlock = prevBlock;
    }

    public int getNextBlock() {
        return nextBlock;
    }

    public void setNextBlock(int nextBlock) {
        this.nextBlock = nextBlock;
    }

    public int getPageBegin() {
        return pageBegin;
    }

    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }

    public int getBlockBegin() {
        return blockBegin;
    }

    public void setBlockBegin(int blockBegin) {
        this.blockBegin = blockBegin;
    }

    public int getBlockEnd() {
        return blockEnd;
    }

    public void setBlockEnd(int blockEnd) {
        this.blockEnd = blockEnd;
    }

    public void setBlockRange() {
        //현재 페이지가 몇번째 블록에 속하는지에 대해서
        curBlock = (int) Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;

        //현재 페이지   블록의 시작 , 끝 번호의 계산
        blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;

        //페이지 블록의 끝 번호
        blockEnd = blockBegin + BLOCK_SCALE - 1;

        //마지막 블록이 범위를 초과하지 않도록 설정합니다.
        if (blockEnd > totPage) {
            blockEnd = totPage;
        }

        //이전을 누르는 경우 이동할 페이지의 번호
        prevPage = (curPage == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE; // 10

        //다음을 누르는 경우 이동할 페이지의 번호
        nextPage = (curBlock > totBlock) ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;

        //마지막 페이지가 범위를 초과하지 않도록 처리합니다
        if (nextPage >= totPage) {
            nextPage = totPage;
        }

    }

    public void setPageRange() {
        //WHERE rn BETWEEN #{start} AND #{end}
        //시작번호  = (현재 페이지-1)* 페이지당 게시물수 +1
        pageBegin = (curPage - 1) * PAGE_SCALE + 1;
        //끝번호 = 시작번호 + 페이지당 게시물 수 -1
        pageEnd = pageBegin + PAGE_SCALE - 1;
    }
}
























