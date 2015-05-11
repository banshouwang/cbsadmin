package com.banshou.app.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.banshou.app.domain.User;
import com.banshou.app.utils.common.Constants;
import com.banshou.app.utils.common.DBConn;

/**
 * 用户操作类
 * @author Adam
 *
 */
public class UserDao {
	
	DBConn conn = null;
	
	public UserDao(){
		conn = new DBConn();
	}
	public int reg(User user){
		int flag = conn.execOther(Constants.ADDUSERSQL, new Object[] { user.getNumber(), user.getOpenId(), user.getCreditId(), user.isIsvip(), user.getMobile(), user.getPassword(), user.isIsshop(), user.getTime(), user.getPoint() });
		return flag;
	}
	public boolean checkMobile(String mobile){
		ResultSet rs = conn.execQuery(Constants.CHECKMOBILE, new Object[]{ mobile });
		try {
			if(rs.next()){
				return false;
			}else{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean checkOpenId(String openId) {
		ResultSet rs = conn.execQuery(Constants.CHECKOPENID, new Object[]{ openId });
		try {
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean addPoint(String openId, String point) {
		int result = conn.execOther(Constants.ADDPOINT, new Object[]{ point, openId });
		return result>0?true:false;
	}
}
