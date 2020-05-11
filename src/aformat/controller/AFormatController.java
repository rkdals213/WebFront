package aformat.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aformat.service.AFormatService;
import aformat.service.AFormatServiceImpl;

@WebServlet("/AFormatController")
public class AFormatController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AFormatService service;

	@Override
	public void init() throws ServletException {
		super.init();
		service = new AFormatServiceImpl();
	}

    public AFormatController() {
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
			}
			PrintWriter out = response.getWriter();
			out.print(idCount);
			out.close();
		}//id_check
	}//process

}//class
