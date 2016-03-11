package br.com.studiotom.infra;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Created by Nando on 09/03/16.
 */

@Component
public class StorageFile {


    private static Logger logger = LoggerFactory.getLogger(StorageFile.class);

    @Autowired
    private HttpServletRequest request;


    public String write(String basePath, MultipartFile file){

        String relativePath = basePath + "/" +file.getOriginalFilename();
        String realPath = request.getServletContext().getRealPath("/" + basePath);

        File dir = new File(realPath);
        if (!(dir.exists() && dir.isDirectory())){

            logger.info("Path not found %s", realPath);

            boolean successToMakedir = dir.mkdir();

            logger.info("Path was created: %s", successToMakedir);

        }

        try{
            String path = realPath + "/" + file.getOriginalFilename();
            file.transferTo(new File(path));

            return request.getContextPath() + "/" + relativePath;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

}
