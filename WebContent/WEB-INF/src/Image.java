import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/image")
public class Image extends HttpServlet {

    private String url = "jdbc:mysql://cosc304.ok.ubc.ca/db_kvankes";
    private String uid = "kvankes";
    private String pw = "37845138";
    private Connection con = null;

    private void connect() throws SQLException {
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        }
        catch (java.lang.ClassNotFoundException e) {
        	System.err.println("ClassNotFoundException: " +e);
        }
        con = DriverManager.getConnection(url, uid, pw);
    }

    private void disconnect() throws SQLException
    {
        if (con != null) {
            con.close();
        }
        con = null;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        response.setContentType("image/jpeg");
        String pid = request.getParameter("pid");
        if(pid == null) {
            return;
        }
            String sql = "SELECT image FROM Product WHERE id = ?";
            try{
            connect();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                response.getOutputStream().write(rs.getBytes(1));
            }
            disconnect();
        }
        catch(SQLException e) {
            con = null;
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {


    }
}
