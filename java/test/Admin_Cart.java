package test;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

public class Admin_Cart {
	public int k = 0;

	public int insert(ProductBean pb,HttpServletRequest req) {
		try {
			Connection con = DBConnection.getCon();
            
            
            String query = "INSERT INTO adminCart VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,pb.getpCode()); 
            ps.setString(2, pb.getpName());
            ps.setFloat(3, pb.getpPrice());
            ps.setInt(4, Integer.parseInt(req.getParameter("reqqty")));
            ps.setString(5, req.getParameter("cosname"));
            ps.setFloat(6, pb.getMprice());
           

            k= ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}