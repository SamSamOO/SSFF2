package kr.or.ssff.studyIns.Utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.http.MediaType;

/*

 */
public class UploadFileUtils {

    public static String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    public static boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (Exception e) {

            e.printStackTrace();
        }
        return false;
    }


    // 3. 썸네일 생성 : 이미지 파일의 경우
    private static String makeThumbnail(String uploadPath,  String path, String fileName) throws Exception {
        // BufferedImage : 실제 이미지 X, 메모리상의 이미지를 의미하는 객체
        // 원본 이미지파일을 메모리에 로딩
        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));

        // 정해진 크기에 맞게 원본이미지를 축소
        BufferedImage destImg = Scalr.resize(sourceImg, Method.AUTOMATIC, Mode.FIT_TO_HEIGHT, 100);

        // 썸네일 이미지 파일명
        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

        // 썸네일 이미지 파일 객체 생성
        File newFile = new File(thumbnailName);

        //파일 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

        //썸네일 파일 저장
        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    // 4. 아이콘 생성 : 이미지 파일이 아닐 경우
    private static String makeIcon(String uploadPath, String savedPath, String fileName) throws Exception{
        //아이콘 파일명  = 기본 저장경로 + 날짜경로 + 구분자 + 파일명
        String iconName = uploadPath + savedPath + File.separator + fileName;
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    //파일 삭제처리 메서드
    public static void removeFile(String uploadPath, String fileName) {
        // 파일 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 파일 확장자를 통해 이미지 파일인지 판별
        MediaType mediaType = MediaUtils.getMediaType(formatName);

        //이미지 파일일 경우 , 원본파일 삭제
        if (mediaType != null) {
            // 원본 이미지의 경로 + 파일명 추출
            // 날짜 경로 추출
            String front = fileName.substring(0, 12);

            //UUID + 파일명 추출
            String end = fileName.substring(14);

            //원본 이미지 파일삭제 (구분자 변환)
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();

        }
        //파일 삭제 (일반 파일 or 썸네일 이미지 파일 삭제)
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    }
}

























