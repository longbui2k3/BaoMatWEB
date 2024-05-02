package hcmute.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploadFileUtil {
	public static String processUpload(String fileName, HttpServletRequest req, String storeFolder,
			String storeFileName) throws ServletException, IOException{
		Part filePart = req.getPart(fileName);
		if(filePart == null || filePart.getSize() == 0) {
			return "";
		}
		if(storeFolder == null) {
			storeFolder = Constants.DIR;
		}
		if(storeFileName == null) {
			storeFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		} else {
			storeFileName += "." + FilenameUtils.getExtension(Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
		}
		Path uploadPart = Paths.get(storeFolder);
		if(!Files.exists(uploadPart)) {
			Files.createDirectories(uploadPart);
		}
		filePart.write(Paths.get(uploadPart.toString(),storeFileName).toString());
		return storeFileName;
	}
}
