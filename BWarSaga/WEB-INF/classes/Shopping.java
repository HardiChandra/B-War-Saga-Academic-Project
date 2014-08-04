package bean;

public class Shopping{
	private int itemID;
	private int userID;
	private int shoppingQty;
	private String dateID;

	//setter
	public void setItemID(int itemID)
	{
		this.itemID = itemID;
	}

	public void setUserID(int userID)
	{
		this.userID = userID;
	}

	public void setShoppingQty(int shoppingQty)
	{
		this.shoppingQty = shoppingQty;
	}

	public void setDateID(String dateID)
		{
			this.dateID = dateID;
	}

	//getter
	public int getItemID()
	{
		return itemID;
	}

	public int getUserID()
	{
		return userID;
	}

	public int getShoppingQty()
	{
		return shoppingQty;
	}
	public String getDateID()
		{
			return dateID;
	}

}