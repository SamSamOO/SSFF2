package kr.or.ssff.studyIns.controller;

import java.io.File;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

/*

 */
@Log4j2
@Controller
@AllArgsConstructor
public class UploadController {

    @PostMapping("/uploadAjaxAction")
    public void uploadAjaxPost(MultipartFile[] uploadFile) {
        log.debug("update ajax post.....");

        String uploadFolder = "C:\\temp\\upload";

        for (MultipartFile multipartFile : uploadFile) {
            log.debug("------------------------------------");
            log.debug("Upload File Name : " + multipartFile.getOriginalFilename());
            log.debug("Upload File Size : " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();

            //IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            log.info("only file name: " + uploadFileName);

            File saveFile = new File(uploadFolder, uploadFileName);
            try {
                multipartFile.transferTo(saveFile);

            } catch (Exception e) {
                log.error(e.getMessage());

            } // end catch
        } // end for
    }
}

























