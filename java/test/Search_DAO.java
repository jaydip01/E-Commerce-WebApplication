package test;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

public class Search_DAO {
	public ArrayList<ProductBean> al = new ArrayList<ProductBean>();

	public ArrayList<ProductBean> retrieve(HttpServletRequest req) {
		try {
			Connection con = DBConnection.getCon();

			PreparedStatement ps = con.prepareStatement("select * from Product55 where cname=?");
			ps.setString(1, req.getParameter("show"));
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setpCode(rs.getString(1));
				pb.setpName(rs.getString(2));
				pb.setpPrice(rs.getFloat(3));
				pb.setpQty(rs.getInt(4));
				pb.setComNmae(rs.getString(5));
				pb.setMprice(rs.getFloat(6));
				
                InputStream inputStream = rs.getBinaryStream(7);
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                
                byte[] img = new byte[4096];
                
                
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(img)) != -1) {
                    outputStream.write(img, 0, bytesRead);
                }
                
                byte[] imageBytes = outputStream.toByteArray();
                String imgBase64=Base64.getEncoder().encodeToString(imageBytes);
               
                
                pb.setBase64(imgBase64);
                
				
				al.add(pb);// Adding ProductBean object to ArrayList
			} // end of while
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}