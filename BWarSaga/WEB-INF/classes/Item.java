package bean;

public class Item{
	private int itemID;
	private String itemName;
	private int itemCoin;
	private int itemQty;
	private String itemDesc;

	//setter
	public void setItemID(int itemID)
	{
		this.itemID = itemID;
	}

	public void setItemName(String itemName)
	{
		this.itemName = itemName;
	}

	public void setItemCoin(int itemCoin)
	{
		this.itemCoin = itemCoin;
	}

	public void setItemQty(int itemQty)
	{
		this.itemQty = itemQty;
	}

	public void setItemDesc(String itemDesc)
	{
		this.itemDesc = itemDesc;
	}

	//getter
	public int getItemID()
	{
		return itemID;
	}

	public String getItemName()
	{
		return itemName;
	}

	public int getItemCoin()
	{
		return itemCoin;
	}

	public int getItemQty()
	{
		return itemQty;
	}

	public String getItemDesc()
	{
		return itemDesc;
	}

}