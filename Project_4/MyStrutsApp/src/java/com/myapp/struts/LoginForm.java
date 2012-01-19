/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;


/**
 *
 * @author ioanna
 */
public class LoginForm extends org.apache.struts.action.ActionForm {
    
     private String error;
     
     private String cafePrice=Parser.Parser("Cafe");
     private String sugarPrice=Parser.Parser("Sugar");
     private String waterPrice=Parser.Parser("Water");
     private double totalS;
     private double sugarQuantity=0.0;
     private double totalW=0.0;
     private double waterQuantity=0.0;
     private double totalC;
     private double cafeQuantity=0.0;
     private double total=0.0;

    public double getTotal() {
        total=totalC+totalS+totalW;
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getCafeQuantity() {
        return cafeQuantity;
        
    }

    public void setCafeQuantity(double cafeQuantity) {
        this.cafeQuantity = cafeQuantity;
    }

    public String getTotalC() {
        double cafeDouble = Double.parseDouble(cafePrice);
        totalC=cafeQuantity*cafeDouble;
        return String.valueOf(totalC);
    }

    public void setTotalC(double totalC) {
        this.totalC = totalC;
    }
     
    public double getTotalW() {
        double waterDouble = Double.parseDouble(waterPrice);
        totalW=waterQuantity*waterDouble;
        return totalW;
    }

    public void setTotalW(double totalW) {
        this.totalW = totalW;
    }

    public double getWaterQuantity() {
        return waterQuantity;
    }

    public void setWaterQuantity(double waterQuantity) {
        this.waterQuantity = waterQuantity;
    }
     
    public double getSugarQuantity() {
        return sugarQuantity;
    }

    public void setSugarQuantity(double sugarQuantity) {
        this.sugarQuantity = sugarQuantity;
    }

    public double getTotalS() {
        double sugarDouble = Double.parseDouble(sugarPrice);
        totalS=sugarQuantity*sugarDouble;
        return totalS;
    }

    public void setTotalS(double totalS) {
        this.totalS = totalS;
    }

    public String getWaterPrice() {
        return waterPrice;
    }

    public void setWaterPrice(String waterPrice) {
        this.waterPrice = waterPrice;
    }

    public String getSugarPrice() {
        return sugarPrice;
    }

    public void setSugarPrice(String sugarPrice) {
        this.sugarPrice = sugarPrice;
    }

    public String getCafePrice() {
        return cafePrice;
    }

    public void setCafePrice(String cafePrice) {
        this.cafePrice = cafePrice;
    }


    public String getError() {
        return error;
    }

    public void setError() {
        this.error =  "<span style='color:red'>Please provide valid entries for the fields</span>";
    }

  

    public LoginForm() {
        super();
        // TODO Auto-generated constructor stub
    }

}