package com.ass.java5.utils;

import java.io.File;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFileUtil {

	public File handleUploadFile(MultipartFile uploadFile) {
		String folderPath = "D:\\Fall2021_Java5_Spring\\ass-springboot-java5\\src\\main\\webapp\\images";
		File myUploadFolder = new File(folderPath);
		
		if(!myUploadFolder.exists()) {
			myUploadFolder.mkdirs();
		}
		
		File saveFile = null;
		
		try {
			String uuid = UUID.randomUUID().toString();
			String fileName = uuid + '_' + uploadFile.getOriginalFilename();
			saveFile = new File(myUploadFolder,fileName);
			
			uploadFile.transferTo(saveFile);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return saveFile;
	}
}
