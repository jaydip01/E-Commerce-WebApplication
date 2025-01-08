package test;

import java.sql.Connection;
import java.sql.PreparedStatement;

import test.DBConnection;
import test.ProductBean;

public class UpdateProductDAO {
	public int k = 0;

	public int update(ProductBean pb) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("update Product55 set qty=? where code=?");

			ps.setInt(1, pb.getpQty());
			ps.setString(2, pb.getpCode());
			
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}