/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myBean;

/**
 *
 * @author ioanna
 */
public class SugarAmount {
    String sugar;
    String SugarQuantity;
    
    public String getSugarQuantity()
    {
    return SugarQuantity;
    }

    public void setSugarQuantity(String SugarQuantity)
    {
      this.SugarQuantity = SugarQuantity;
    }
    
    public void setSugar(String name) {
        this.sugar = name;
    }
    public String getSugar(){
        return sugar;
    }
    
}
