package hcmute.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class HeaderFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletResponse resp = (HttpServletResponse) response;
		resp.setHeader("X-Content-Type-Options", "nosniff");
		resp.setHeader("Content-Security-Policy", "default-src 'self'; frame-ancestors 'self'; form-action 'self'");

		chain.doFilter(request, response);
	}

}
