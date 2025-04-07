package pack;

import java.util.Date;

public class Product {
	private String name;
	private double price;
	private String description;
	private Date releaseDate;
	
	public Product(String name, double price, String description, Date releaseDate) {
		this.name = name;
		this.price = price;
		this.description = description;
		this.releaseDate = releaseDate;
		
	}

	public String getName() {
		return name;
	}

	public double getPrice() {
		return price;
	}

	public String getDescription() {
		return description;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}
	
	
}
