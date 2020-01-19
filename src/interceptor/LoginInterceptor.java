package interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import po.Customer;
import po.User;
/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL:除了登录请求外，其他的URL都进行拦截控制
		if (url.indexOf("/login.action") >= 0) {
			return true;
		}
		if (url.indexOf("/customer/main.action") >= 0) {
			return true;
		}if (url.indexOf("/movie/getclassById.action") >= 0) {
			return true;
		}
		if (url.indexOf("/customernews/show.action") >= 0) {
			return true;
		}
		if (url.indexOf("/news/healthclassshow.action") >= 0) {
			return true;
		}
		if (url.indexOf("/comment/customercomshow.action") >= 0) {
			return true;
		}
		if (url.indexOf("/movie/healthhomeshow.action") >= 0) {
			return true;
		}
		if (url.indexOf("/bmitest.action") >= 0) {
			return true;
		}
		if (url.indexOf("/bmiresultshow.action") >= 0) {
			return true;
		}
		if (url.indexOf("/publishComment.action") >= 0) {
			return true;
		}
		
		if (url.indexOf("/movie/detail.action") >= 0) {
			return true;
		}
		if (url.indexOf("/movie/customersearch.action") >= 0) {
			return true;
		}
		if (url.indexOf("/customerlogin.action") >= 0) {
			return true;
		}
		if (url.indexOf("/user/addbmi.action") >= 0) {
			return true;
		}
		if (url.indexOf("/movie/getMovieById.action") >= 0) {
			return true;
		}
		
		
		
		// 获取Session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");
		Customer customer = (Customer) session.getAttribute("CUSTOMER_SESSION");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (user != null) {
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		else if(user == null) {
			request.setAttribute("msg", "您还没有登录，请先登录！");
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			return false;
			}
		else if (customer != null) {
			return true;
		}
		else if (customer == null) {
			request.setAttribute("msg", "您还没有登录，请先登录！");
			request.getRequestDispatcher("/WEB-INF/jsp/customerlogin.jsp").forward(request, response);
		}
		return false;
	}


	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
