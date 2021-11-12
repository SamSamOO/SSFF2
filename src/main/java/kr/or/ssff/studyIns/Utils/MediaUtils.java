package kr.or.ssff.studyIns.Utils;

import java.util.HashMap;
import java.util.Map;
import org.springframework.http.MediaType;

/*

 */
public class MediaUtils {

    private static Map<String, MediaType> mediaMap;

    //mediaMap에 이미지 확장자명에 따른 MENEType 저장
    static{
        mediaMap = new HashMap<String, MediaType>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    public static MediaType getMediaType(String type) {
        return mediaMap.get(type.toUpperCase());
    }
}

























