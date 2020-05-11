

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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import eboard.dto.EBoardDTO;
import eboard.service.EBoardService;
import eboard.service.EBoardServiceImpl;

@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
	}

    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if(command.equals("ajax1")) {
			String name = request.getParameter("name");
			String formJSP = request.getParameter("formJSP");
			System.out.println("서버에 전달 1 : " + name);
			System.out.println("서버에 전달 2 : " + formJSP);

			PrintWriter out = response.getWriter();
			out.print("이것이 서버에서 보내는 DATA !!!");
			out.close();
		}//ajax1
		else if(command.equals("ajax2")) {
			String html = "<table class='table'>" + 
					"<thead>" + 
					"<tr>" + 
					"<th>Firstname</th>" + 
					"<th>Lastname</th>" + 
					"<th>Email</th>" + 
					"</tr>" + 
					"</thead>" + 
					"<tbody>" + 
					"<tr>" + 
					"<td>Default</td>" + 
					"<td>Defaultson</td>" + 
					"<td>def@somemail.com</td>" + 
					"</tr>" + 
					"<tr class='table-primary'>" + 
					"<td>Primary</td>" + 
					"<td>Joe</td>" + 
					"<td>joe@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-success'>" + 
					"<td>Success</td>" + 
					"<td>Doe</td>" + 
					"<td>john@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-danger'>" + 
					"<td>Danger</td>" + 
					"<td>Moe</td>" + 
					"<td>mary@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-info'>" + 
					"<td>Info</td>" + 
					"<td>Dooley</td>" + 
					"<td>july@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-warning'>" + 
					"<td>Warning</td>" + 
					"<td>Refs</td>" + 
					"<td>bo@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-active'>" + 
					"<td>Active</td>" + 
					"<td>Activeson</td>" + 
					"<td>act@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-secondary'>" + 
					"<td>Secondary</td>" + 
					"<td>Secondson</td>" + 
					"<td>sec@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-light'>" + 
					"<td>Light</td>" + 
					"<td>Angie</td>" + 
					"<td>angie@example.com</td>" + 
					"</tr>" + 
					"<tr class='table-dark text-dark'>" + 
					"<td>Dark</td>" + 
					"<td>Bo</td>" + 
					"<td>bo@example.com</td>" + 
					"</tr>" + 
					"</tbody>" + 
					"</table>";
			PrintWriter out = response.getWriter();
			out.print(html);
			out.close();
		}//ajax2
		else if(command.equals("ajax3")) {
			String xml = "<?xml version='1.0' encoding='UTF-8'?>" + 
					"<response>" + 
					"<header>" + 
					"<resultCode>00</resultCode>" + 
					"<resultMsg>NORMAL SERVICE.</resultMsg>" + 
					"</header>" + 
					"<body>" + 
					"<items>" + 
					"<item>" + 
					"<건축년도>2007</건축년도>" + 
					"<법정동> 필운동</법정동>" + 
					"<아파트>신동아블루아광화문의 꿈</아파트>" + 
					"<지번>254</지번>" + 
					"<지역코드>11110</지역코드>" + 
					"<img>신동아블루아광화문.jpg</img>" + 
					"</item>" + 
					"<item>" + 
					"<건축년도>2008</건축년도>" + 
					"<법정동>사직동</법정동>" + 
					"<아파트>광화문풍림스페이스본(101동~105동)</아파트>" + 
					"<지번>9</지번>" + 
					"<지역코드>11110</지역코드>" + 
					"<img>광화문풍림스페이스본.jpg</img>" + 
					"</item>" + 
					"<item>" + 
					"<건축년도>2008</건축년도>" + 
					"<법정동>사직동</법정동>" + 
					"<아파트>광화문풍림스페이스본(106동)</아파트>" + 
					"<지번>9</지번>" + 
					"<지역코드>11110</지역코드>" + 
					"<img>광화문풍림스페이스본.jpg</img>" + 
					"</item>" + 
					"</items>" + 
					"<numOfRows>10</numOfRows>" + 
					"<pageNo>1</pageNo>" + 
					"<totalCount>57</totalCount>" + 
					"</body>" + 
					"</response>";
			PrintWriter out = response.getWriter();
			out.print(xml);
			out.close();
		}//ajax3
		else if(command.equals("ajax4")) {
			PrintWriter out = response.getWriter();
			EBoardService service = new EBoardServiceImpl();
			ArrayList<EBoardDTO> list = new ArrayList<EBoardDTO>();
			try {
				list = service.brdList();
				/* json-simple
				JSONArray arr = new JSONArray();
				for(EBoardDTO dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("articleno", dto.getArticleno());
					obj.put("userid", dto.getUserid());
					obj.put("subject", dto.getSubject());
					obj.put("content", dto.getContent());
					obj.put("regtime", dto.getRegtime());
					arr.add(obj);
				}
				out.print(arr.toJSONString());
				out.close();*/
				/* gson-1
				JsonArray arr = new JsonArray();
				for(EBoardDTO dto : list) {
					JsonObject obj = new JsonObject();
					obj.addProperty("articleno", dto.getArticleno());
					obj.addProperty("userid", dto.getUserid());
					obj.addProperty("subject", dto.getSubject());
					obj.addProperty("content", dto.getContent());
					obj.addProperty("regtime", dto.getRegtime());
					arr.add(obj);
				}
				out.print(arr.toString());
				out.close();*/
				///* gson-2
				JsonArray arr = new JsonArray();
				for(EBoardDTO dto : list) {
					Gson gson = new Gson();
					JsonObject obj = (JsonObject) gson.toJsonTree(dto);
					arr.add(obj);
				}
				out.print(arr.toString());
				out.close();//*/
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//ajax4
	}//process

}//class
