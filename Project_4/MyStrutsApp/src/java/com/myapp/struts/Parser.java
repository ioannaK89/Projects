package com.myapp.struts;


import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
 

import org.jdom.Element;
import org.jdom.input.SAXBuilder;
 
public class Parser {
 
    static String Parser(String product) {
        SAXBuilder builder = new SAXBuilder();
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            
             //File file = new File("C:/Users/ioanna/Documents/NetBeansProjects/MyStrutsApp/Prices.xml");
                org.jdom.Document doc = (org.jdom.Document) builder.build("http://texwww.inf.uth.gr:8080/~iokostak/Prices.xml");
                //Document doc = db.parse(file);
                Element docEle = doc.getRootElement();
                List list = docEle.getChildren("item");
                Element node1 = (Element) list.get(0);
                Element node2 = (Element) list.get(1);
                Element node3 = (Element) list.get(2);
                
                Element e = (Element) node1;
                Element e2 = (Element) node2;
                Element e3 = (Element) node3;
 
              if(product.equals("Cafe")){ 
                return e.getChildText("Price");
              }
              else if (product.equals("Sugar")){ 
                return e2.getChildText("Price");
              }
              else if (product.equals("Water")){
                return e3.getChildText("Price");
              }
              
        } catch (Exception e) {
            System.out.println(e);
        }
       
         return "";
        
    }
}