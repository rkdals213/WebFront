package dselectkey.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dselectkey.service.DSelectKeyService;
import dselectkey.service.DSelectKeyServiceImpl;

@WebServlet("/DSelectKeyController")
public class DSelectKeyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DSelectKeyService service;

	@Override
	public void init() throws ServletException {
		super.init();
		service = new DSelectKeyServiceImpl();
	}

    public DSelectKeyController() {
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
		String command = request.getParameter("command");
		if(command.equals("search_window")) {
			String searchWordFromAjax = request.getParameter("search_input");
			if(searchWordFromAjax.trim().equals("")) {
				return;
			}
			ArrayList<String> list = new ArrayList<String>();
			JSONArray arr = new JSONArray();
			try {
				list = service.makeSearchList(searchWordFromAjax);
				if(list.size() < 1) {
					return;
				}
				System.out.println(list);
				for(String str : list) {
					JSONObject obj = new JSONObject();
					obj.put("key_word", str);
					arr.add(obj);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				PrintWriter out = response.getWriter();
				out.print(arr.toJSONString());
				out.close();
			}
		}//id_check
	}//process

}//class
