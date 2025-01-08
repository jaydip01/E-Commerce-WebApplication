package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Collection_DAO {
	public ArrayList<ProductBean> al5 = new ArrayList<ProductBean>();

	public ArrayList<ProductBean> retrieve() {
		try {
			Connection con = DBConnection.getCon();

			PreparedStatement ps = con.prepareStatement("select * from adminCart");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean pb = new ProductBean();
				pb.setpCode(rs.getString(1));
				pb.setpName(rs.getString(2));
				pb.setpPrice(rs.getFloat(3));
				pb.setpQty(rs.getInt(4));
				pb.setComNmae(rs.getString(5));
				pb.setMprice(rs.getFloat(6));
				
				al5.add(pb);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al5;
	}
}