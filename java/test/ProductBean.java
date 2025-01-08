package test;

import java.io.*;

@SuppressWarnings("serial")
public class ProductBean implements Serializable{
private String pCode,pName,ComNmae;
private float pPrice,mprice;
private int pQty;
String base64;

public ProductBean() {}

public String getBase64() {
	return base64;
}

public void setBase64(String base64) {
	this.base64 = base64;
}

public String getpCode() {
	return pCode;
}
public void setpCode(String pCode) {
	this.pCode = pCode;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public float getpPrice() {
	return pPrice;
}
public void setpPrice(float pPrice) {
	this.pPrice = pPrice;
}
public int getpQty() {
	return pQty;
}
public void setpQty(int pQty) {
	this.pQty = pQty;
}

public String getComNmae() {
	return ComNmae;
}

public void setComNmae(String comNmae) {
	ComNmae = comNmae;
}

public float getMprice() {
	return mprice;
}

public void setMprice(float mprice) {
	this.mprice = mprice;
}


}
