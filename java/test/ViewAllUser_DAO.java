package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ViewAllUser_DAO {
	public ArrayList<AllUserBean> al = new ArrayList<AllUserBean>();

	public ArrayList<AllUserBean> retrieve() {
		try {
			Connection con = DBConnection.getCon();

			PreparedStatement ps = con.prepareStatement("select * from CustomerTab55");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AllUserBean pb = new AllUserBean();
				
				pb.setuName(rs.getString(1));
				pb.setpWord(rs.getString(2));
				pb.setfName(rs.getString(3));
				pb.setlName(rs.getString(4));
				pb.setAddr(rs.getString(5));
				pb.setmId(rs.getString(6));
				pb.setPhNo(Long.parseLong(rs.getString(7)));
				
				al.add(pb);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}