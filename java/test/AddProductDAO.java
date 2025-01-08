package test;

import java.io.InputStream;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class AddProductDAO {
	public int k = 0;

	public int insert(ProductBean pb,HttpServletRequest req) {
		try {
			Connection con = DBConnection.getCon();
            Part part = req.getPart("image");
            
            String query = "INSERT INTO product55 VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,req.getParameter("code")); 
            ps.setString(2, req.getParameter("name"));
            ps.setFloat(3, Float.parseFloat(req.getParameter("price")));
            ps.setInt(4, Integer.parseInt(req.getParameter("qty")));
            ps.setString(5, req.getParameter("cname"));
            ps.setFloat(6, Float.parseFloat(req.getParameter("mprice")));
            InputStream inputStream = part.getInputStream();
            
			ps.setBinaryStream(7 , inputStream );

            k= ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}