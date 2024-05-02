package hcmute.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;

public class DeleteImage {
	public static void deleteImage(String fileImg, String storedFolderName) throws IOException, ServletException {
		
		File imgPath = new File(Constants.DIR + "\\" + storedFolderName + "\\" + fileImg);
		if (imgPath.delete()) {
			System.out.println("Xoa Ok");
		} else {
			System.out.println(Constants.DIR + "\\" + storedFolderName + "\\" + fileImg);
		}
	}
}
