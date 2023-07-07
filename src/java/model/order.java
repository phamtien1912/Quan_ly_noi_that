/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 *
 * @author Admin
 */
import java.util.Date;
public class order {
//      id INT AUTO_INCREMENT PRIMARY KEY,
//  user_id INT,
//  order_date DATE,
//  amount INT,
//  status VARCHAR(50),
//  FOREIGN KEY (user_id) REFERENCES User(id)
    
    private int id;
    private int userId;
    private int productId;
    private int amount;
    private String status;

    public order() {
    }

    public order(int id, int userId, int productId, int amount, String status) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.amount = amount;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
