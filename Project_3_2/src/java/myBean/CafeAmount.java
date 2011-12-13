/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myBean;
/**
 *
 * @author ioanna
 */
public  class CafeAmount implements java.io.Serializable{
    String cafe;
    String CafeQuantity;
    
    public String getCafeQuantity()
    {
    return CafeQuantity;
    }

    public void setCafeQuantity(String CafeQuantity)
    {
      this.CafeQuantity = CafeQuantity;
    }
    
    public void setCafe(String name) {
        this.cafe = name;
    }
    
    public String getCafe(){
        return cafe;
    }

  
}
