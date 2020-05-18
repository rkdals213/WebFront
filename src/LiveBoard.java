import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LiveBoard
 */
@WebServlet("/LiveBoard")
public class LiveBoard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        // 원래 하던 jsp 작업과의 가장 큰 차이는?
        String reply = request.getParameter("reply");
        String writer = request.getParameter("writer");
        String msg = reply != null && reply.length() > 0 ? writer + " :" + reply : "DB에서 새글 조회 했다치고..세상에.. 어쩌다가.. 조심좀 하지.." + new Date();
        response.getWriter().write(msg);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        try {
            Thread.sleep(1000 * 10);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        doGet(request, response);
    }

}