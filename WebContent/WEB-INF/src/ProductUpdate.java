import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/productUpdate")
@MultipartConfig(maxFileSize=50*1024*1024)
public class ProductUpdate extends HttpServlet {

    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;

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
        throws ServletException, java.io.IOException {

        throw new ServletException("GET method used with " +
            getClass( ).getName( )+": POST method required.");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {

        Integer rows_updated;
        Integer product_id;
        if(request.getParameter("product_id") == null) {
            product_id = 0;
        }else{
            product_id = Integer.parseInt(request.getParameter("product_id"));
        }
        Double price;
        if(request.getParameter("price") == null) {
            price = 0.0;
        }else{
            price = Double.parseDouble(request.getParameter ("price"));
        }
        String category = request.getParameter("category");
        String name = request.getParameter("name");
        Part image = request.getPart("image");
        InputStream istream;
        PrintWriter out = response.getWriter();


        if(product_id != null && category != null && name != null && price != null) {
            try {
                connect();

                String sql = "INSERT INTO Product (id,category,name,price,image) VALUES (?,?,?,?,?) "+
                             "ON DUPLICATE KEY UPDATE category=?,name=?,price=?,image = ?";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,product_id);
                pstmt.setString(2,category);
                pstmt.setString(6,category);
                pstmt.setString(3,name);
                pstmt.setString(7,name);
                pstmt.setDouble(4,price);
                pstmt.setDouble(8,price);
                if(image != null) {

                    istream = image.getInputStream();
                    InputStream istream2 = new BufferedInputStream(image.getInputStream());
                    pstmt.setBlob(5,istream);
                    pstmt.setBlob(9,istream2);
                }
                else {

                    pstmt.setNull(5,Types.BLOB);
                    pstmt.setNull(9,Types.BLOB);
                }
                rows_updated = pstmt.executeUpdate();
                disconnect();
            }
            catch( SQLException e ) {
                out.println(e.getMessage());
                rows_updated = 0;
            }
        }
        else {
            out.println("Null fields!");
            rows_updated = 0;
        }

        if (rows_updated == 1 || rows_updated == 2) {
            response.sendRedirect("/products.jsp");
        } else if (rows_updated == 0) {
            out.println("No rows updated.");
        } else {
            out.println("More than two row updated?");
            out.println(rows_updated);
        }
    }
}
