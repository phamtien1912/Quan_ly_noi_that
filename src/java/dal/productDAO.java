package dal;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Cart1;
import model.Item;
import model.product;
import model.user;

public class productDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public static productDAO getInstance() {
        return new productDAO();
    }

    public void insert(String name, int catId, String image, String des, int qty, Double price) {
        String query = "INSERT INTO product (name, cid, image, price, qty, des) VALUES (?, ?, ?, ?, ?, ?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, catId);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setInt(5, qty);
            ps.setString(6, des);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void delete(int pid) {
        String query = "DELETE FROM `product` WHERE id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void update(int id, String name, int catId, String image, String des, int qty, Double price) {
        String query = "UPDATE product SET NAME = ?, cid = ?, image=?, price = ?, qty = ?, des= ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, catId);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setInt(5, qty);
            ps.setString(6, des);
            ps.setInt(7, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public List<product> selectAll() {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> getbycate(String cid) {

        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM product where cid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> searchByKey(String key) {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE 1=1";
        try {
            conn = new DBContext().getConnection();
            if (key != null && !key.equals("")) {
                query += " and name like '%" + key + "%' or des like '%" + key + "%'";
            }
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<product> filterByKey(Double priceFrom, Double priceTo, String color) {

        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE 1=1";
        try {
            conn = new DBContext().getConnection();
            if (color != null && !color.equals("")) {
                query += " and des like '%" + color + "%'";
            }
            if (priceFrom != null) {
                query += " and price >= " + priceFrom;
            }
            if (priceTo != null) {
                query += " and price <= " + priceTo;
            }

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public product getProductById(int id) {
        String query = "SELECT * FROM product WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getString(7));
            }

        } catch (Exception e) {
        }
        return null;
    }
    
    public void addOrder(user c, Cart1 cart) {
        try {
            String sql = "insert into btlweb3.order(user_id, product_id, amount, status) values(?, ?, ?, '1')";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            for(Item i:cart.getItems()){
                ps.setInt(1, c.getId());
                ps.setInt(2, i.getProduct().getId());
                ps.setInt(3, i.getQuantity());
                ps.executeUpdate();
            }
            sql = "update btlweb3.product set qty=qty-? where id=?";
            ps = conn.prepareStatement(sql);
            for(Item i:cart.getItems()){
                ps.setInt(1, i.getQuantity());
                ps.setInt(2, i.getProduct().getId());
                ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}

