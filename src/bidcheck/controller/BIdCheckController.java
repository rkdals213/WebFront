package bidcheck.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bidcheck.service.BIdCheckService;
import bidcheck.service.BIdCheckServiceImpl;

@WebServlet("/BIdCheckController")
public class BIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BIdCheckService service;

	@Override
	public void init() throws ServletException {
		super.init();
		service = new BIdCheckServiceImpl();
	}

    public BIdCheckController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		if(command.equals("id_check")) {
			String idFromAjax = request.getParameter("id_input");
			int idCount = 0;
			try {
				idCount = service.idCheck(idFromAjax);
			} catch (Exception e) {
				e.printStackTrace();
				idCount = -1;
			} finally {
				PrintWriter out = response.getWriter();
				out.print(idCount);
				out.close();
			}
		}//id_check
	}//process

}//class
