package bean;

public class User
{
	private int userID;
	private String userName;
	private String userPass;
	private String role;
	private String gender;
	private String phone;
	private String address;
	private String city;
	private int userCoin;
	private String nama;

	//setter
	public void setUserID(int userID)
	{
		this.userID = userID;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public void setUserPass(String userPass)
	{
		this.userPass = userPass;
	}

	public void setRole(String role)
	{
		this.role = role;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public void setCity(String city)
	{
		this.city = city;
	}

	public void setUserCoin(int userCoin)
	{
		this.userCoin = userCoin;
	}

	public void setNama(String nama)
	{
		this.nama = nama;
	}

	//getter
	public int getUserID()
	{
		return userID;
	}

	public String getUserName()
	{
		return userName;
	}

	public String getUserPass()
	{
		return userPass;
	}

	public String getRole()
	{
		return role;
	}

	public String getGender()
	{
		return gender;
	}

	public String getPhone()
	{
		return phone;
	}

	public String getAddress()
	{
		return address;
	}

	public String getCity()
	{
		return city;
	}

	public int getUserCoin()
	{
		return userCoin;
	}

	public String getNama()
	{
		return nama;
	}

}