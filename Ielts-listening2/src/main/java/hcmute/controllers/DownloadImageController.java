package hcmute.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import hcmute.utils.Constants;

@WebServlet(urlPatterns = { "/image", "/audio", "/video" })
public class DownloadImageController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private boolean FilterUserInputPath(String path, HttpServletResponse resp) throws ServletException, IOException  {	
		File file = new File(Constants.DIR, path);
		System.out.print(file.getCanonicalPath());
		String[] validFolders = {"blogIMG", "topicIMG", "videoLesson"};
		int k = 0;
		for(String folder: validFolders) {
			if (file.getCanonicalPath().startsWith(Constants.DIR + "\\" + folder)) {
				k = 1;
				break;
			}
		}
		if (k == 0) {
			return false;
		}
		return true;
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("fname");
		if (!FilterUserInputPath(fileName, resp)) {
			resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
			resp.getWriter().println("<html><body><p>NOT FOUND</p></body></html>");
			return;
		}
		File file = new File(Constants.DIR + "/" + fileName);
		
		String url = req.getRequestURI().toString();
		if (file.exists()) {
			if (url.contains("image")) {
				resp.setContentType("image/jpeg");
				IOUtils.copy(new FileInputStream(file), resp.getOutputStream());
			} else if (url.contains("audio")) {
				resp.setContentType("audio/mpeg");
				resp.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
				resp.setHeader("Accept-Ranges", "bytes");
				long fileSize = file.length();
				String rangeHeader = req.getHeader("Range");
				resp.setContentLengthLong(fileSize);
				FileInputStream in = new FileInputStream(file);
				if (rangeHeader != null) {
					String[] range = rangeHeader.substring("bytes=".length()).split("-");
					long start = Long.parseLong(range[0]);
					long end = (range.length > 1 && !range[1].isEmpty()) ? Long.parseLong(range[1])
							: (long) (fileSize - 1);
					resp.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + fileSize);
					try {
						byte[] buffer = new byte[1024 * 4];
						int bytesRead;
						while ((start < end) && ((bytesRead = in.read(buffer)) != -1)) {
							resp.getOutputStream().write(buffer, 0, bytesRead);
							start += bytesRead;
						}
					} finally {
						in.close();
					}
				} else {
					try {
						byte[] buffer = new byte[1024 * 4];
						int bytesRead;
						while ((bytesRead = in.read(buffer)) != -1) {
							resp.getOutputStream().write(buffer, 0, bytesRead);
						}
					} finally {
						in.close();
					}
				}
			} else if (url.contains("video")) {
				resp.setContentType("video/mp4");
				ServletOutputStream output = resp.getOutputStream();
				try {
					FileInputStream fin = new FileInputStream(Constants.DIR + "/" + fileName);

					byte[] buf = new byte[4096];
					int read;
					while ((read = fin.read(buf)) != -1) {
						output.write(buf, 0, read);
					}
					fin.close();
					output.flush();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		} else {
			resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
			resp.getWriter().println("<html><body><p>NOT FOUND</p></body></html>");
		}

	}

}
