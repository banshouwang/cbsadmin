package com.banshou.app.domain;

public class Goods {
	private String number;
	private String name;
	private String category;
	private int is_valid;
	private int priceori;
	private int pricehere;
	private int is_ticket;
	private int ticket;
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getIs_valid() {
		return is_valid;
	}
	public void setIs_valid(int is_valid) {
		this.is_valid = is_valid;
	}
	public int getPriceori() {
		return priceori;
	}
	public void setPriceori(int priceori) {
		this.priceori = priceori;
	}
	public int getPricehere() {
		return pricehere;
	}
	public void setPricehere(int pricehere) {
		this.pricehere = pricehere;
	}
	public int getIs_ticket() {
		return is_ticket;
	}
	public void setIs_ticket(int is_ticket) {
		this.is_ticket = is_ticket;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	
}
