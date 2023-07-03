package com.kosmo.travary.model;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static void saveFile(String uploadDir, String fileName, MultipartFile file) throws IOException {
		
        Path uploadPath = Paths.get(uploadDir);

        // 업로드 디렉토리가 존재하지 않으면 생성합니다.
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        try (InputStream inputStream = file.getInputStream()) {
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}
