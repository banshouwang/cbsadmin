package com.banshou.app.utils.common;

public class Constants {
	
	public static String ADDUSERSQL = "INSERT INTO bs_user (u_number, u_openid, u_credit, u_is_vip, u_mobile, u_password, u_is_shop, u_registry_time, u_point) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	public static String CHECKMOBILE = "SELECT u_mobile FROM bs_user WHERE u_mobile = ?";
	public static String CHECKOPENID = "SELECT u_openid FROM bs_user WHERE u_openid = ?";
	public static final String ADDPOINT = "UPDATE bs_user set u_point = ? WHERE u_openid = ?";
	
	// Goods related SQL
	public static String ADDGOODSSQL = "INSERT INTO bs_goods (g_number, g_name, g_category, g_is_valid, g_priceori, g_pricehere, g_is_ticket, g_ticket) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
}
