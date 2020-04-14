package edu.wctc.service.converter;

import edu.wctc.entity.Image;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

public class FileToImageConverter implements Converter<MultipartFile, Image> {
    @Override
    public Image convert(MultipartFile file) {
        // No file was selected, return null
        if (file.getSize() == 0) {
            return null;
        }

        Image imageData = new Image();

//        try {
//            imageData.setFile(file.getBytes());

        // Limit file name to 100 characters
        String fileNameLower = file.getOriginalFilename().toLowerCase();
        if (fileNameLower.length() > 100) {
            fileNameLower = fileNameLower.substring(fileNameLower.length() - 100);
        }

        imageData.setName(fileNameLower);

        // Set MIME type based on file extension
        if (fileNameLower.endsWith("png"))
            imageData.setMimeType(MediaType.IMAGE_PNG_VALUE);
        else if (fileNameLower.endsWith("jpg") || fileNameLower.endsWith("jpeg"))
            imageData.setMimeType(MediaType.IMAGE_JPEG_VALUE);
        else if (fileNameLower.endsWith("gif"))
            imageData.setMimeType(MediaType.IMAGE_GIF_VALUE);
        else
            imageData.setMimeType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        return imageData;
    }
}
