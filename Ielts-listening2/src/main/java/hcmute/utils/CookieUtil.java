package hcmute.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

	public static void addCookie(HttpServletResponse response, String name, String value, int maxAge, String sameSite) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		response.addCookie(cookie);

		// Thêm thuộc tính SameSite
		response.setHeader("Set-Cookie", String.format("%s; SameSite=%s", cookie.toString(), sameSite));
	}
}
