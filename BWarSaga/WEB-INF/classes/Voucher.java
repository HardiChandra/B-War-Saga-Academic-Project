package bean;

public class Voucher{
	private int voucherID;
	private String voucherNumber;
	private int voucherCoin;
	private int userID;
	private int voucherStatus;

	//setter
	public void setVoucherID(int voucherID)
	{
		this.voucherID = voucherID;
	}

	public void setVoucherNumber(String voucherNumber)
	{
		this.voucherNumber = voucherNumber;
	}

	public void setVoucherCoin(int voucherCoin)
	{
		this.voucherCoin = voucherCoin;
	}

	public void setUserID(int userID)
	{
		this.userID = userID;
	}

	public void setVoucherStatus(int voucherStatus)
	{
		this.voucherStatus = voucherStatus;
	}

	//getter
	public int getVoucherID()
	{
		return voucherID;
	}

	public String getVoucherNumber()
	{
		return voucherNumber;
	}

	public int getVoucherCoin()
	{
		return voucherCoin;
	}

	public int getUserID()
	{
		return userID;
	}

	public int getVoucherStatus()
	{
		return voucherStatus;
	}
}