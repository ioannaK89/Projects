/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package myBean;

/**
 *
 * @author ioanna
 */
public class WaterAmount {
    String water;
    String WaterQuantity;
    
    public String getWaterQuantity()
    {
    return WaterQuantity;
    }

    public void setWaterQuantity(String WaterQuantity)
    {
      this.WaterQuantity = WaterQuantity;
    }
    
    public void setWater(String name) {
        this.water = name;
    }
    public String getWater(){
        return water;
    }
    
}
