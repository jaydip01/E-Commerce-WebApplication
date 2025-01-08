package test;

import java.sql.*;

public class Delete_Order_DAO {
	public int k = 0;

	public int delete() {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("delete from admincart where name is not null");
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}