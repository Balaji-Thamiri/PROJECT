package com.klef.jfsd.springboot.controller; // Adjust the package as needed

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;

public class ImageUtil {
    public static String encodeImageToBase64(File imageFile) throws IOException {
        byte[] imageBytes = new byte[(int) imageFile.length()];
        FileInputStream fis = new FileInputStream(imageFile);
        fis.read(imageBytes);
        fis.close();
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}
