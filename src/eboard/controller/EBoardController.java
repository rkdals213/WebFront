package eboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cjoinmember.dto.SsafyMember2DTO;
import eboard.dto.EBoardDTO;
import eboard.service.EBoardService;
import eboard.service.EBoardServiceImpl;

@WebServlet("/EBoardController")
public class EBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EBoardService service;

	@Override
	public void init() throws ServletException {
		super.init();
		service = new EBoardServiceImpl();
	}

	public EBoardController() {
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
		if(command.equals("brd_regist")) {
		}//brd_regist
		else if(command.equals("brd_list")) {
			ArrayList<EBoardDTO> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.brdList();
				Gson gson = new Gson();
				for (EBoardDTO dto : list) {
					JsonObject obj = (JsonObject) gson.toJsonTree(dto);
					arr.add(obj);
				}				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				PrintWriter out = response.getWriter();
				out.print(arr);
				out.close();
			}
		}//brd_list
		else if(command.equals("brd_detail")) {
			String articleno = request.getParameter("articleno");
			EBoardDTO dto = null;
			JSONArray arr = new JSONArray();
			try {				
				dto = service.brdDetail(articleno);
				Gson gson = new Gson();
				JsonObject obj = (JsonObject) gson.toJsonTree(dto);
				arr.add(obj);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				PrintWriter out = response.getWriter();
				out.print(arr);
				out.close();
			}
		}//brd_detail
		else if(command.equals("brd_modify")) {
		}//brd_modify
		else if(command.equals("brd_delete")) {
		}//brd_delete
	}//process

}//class
