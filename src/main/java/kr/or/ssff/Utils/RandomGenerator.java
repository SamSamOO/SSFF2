package kr.or.ssff.Utils;

import java.util.Random;

public class RandomGenerator {

  /**
   * 랜덤 난수 생성
   * 매개변수 : len = 숫자 길이, dupCd : 중복 허용=1 , 중복 비허용=2
   * 작성자 : 신지혜
   */

  public static String numberGen(int len, int dupCd) {

    Random random = new Random();
    String num = ""; // 난수가 저장될 변수

    for (int i = 0; i < len; i++) {

      // 0~9 범위 난수 생성
      String ran = Integer.toString(random.nextInt(10));

      if (dupCd == 1) {
        // 중복 허용시 numStr에 append
        num += ran;
      } else if (dupCd == 2) {
        // num 허용하지 않을시 중복된 값 유무 검사
        if (!num.contains(ran)) {
          // 중복된 값이 없으면 num에 append
          num += ran;
        } else {
          // 중복수 있으면 다시 돌기
          i -= 1;
        }
      }
    }
    return num;
  }

} // and class