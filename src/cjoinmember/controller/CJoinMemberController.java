package cjoinmember.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cjoinmember.dto.SsafyMember2DTO;
import cjoinmember.service.CJoinMemberService;
import cjoinmember.service.CJoinMemberServiceImpl;

@WebServlet("/CJoinMemberController")
public class CJoinMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CJoinMemberService service;

	@Override
	public void init() throws ServletException {
		super.init();
		service = new CJoinMemberServiceImpl();
	}

	public CJoinMemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		if(command.equals("join_member")) {
			// 파라미터 확인
			/*Map<String, String[]> params = request.getParameterMap();
			Set<String> keys = params.keySet();
			for (String key : keys) {
				System.out.println(key + " : " + Arrays.toString(params.get(key)));
			}
			response.getWriter().write("확인했어");*/
			SsafyMember2DTO dto = new SsafyMember2DTO();
			dto.setUserid(request.getParameter("id"));
			dto.setUsername(request.getParameter("name"));
			dto.setUserpwd(request.getParameter("pwd"));
			dto.setTelephone(request.getParameter("tel"));
			dto.setEmail(request.getParameter("email"));
			dto.setAddress(request.getParameter("address"));
			int successInt = 0;
			try {
				successInt = service.joinMember(dto);
			} catch (Exception e) {
				successInt = -1;
				e.printStackTrace();
			} finally {
				PrintWriter out = response.getWriter();
				out.print(successInt);
				out.close();
			}		
		}//join_member
		else if(command.equals("login")) {
		}//login
		else if(command.equals("logout")) {
		}//logout
	}//process

}//class
