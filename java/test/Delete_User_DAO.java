package test;

import java.sql.*;

public class Delete_User_DAO {
	public int k = 0;

	public int delete(String uname) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("delete from CustomerTab55 where uname=?");
			ps.setString(1, uname);
			k = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return k;
	}
}