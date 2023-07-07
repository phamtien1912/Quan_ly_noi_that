package dal;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.order;
import model.product;

public class orderDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    public List<order> selectAll(int userId) {
        List<order> list = new ArrayList<>();
        String query = "SELECT * FROM `order` where user_id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                order o = new order(rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getInt("amount"),
                        rs.getString("status"));
                list.add(o);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<order> selectByStatus(int userId, String page) {
        List<order> list = new ArrayList<>();
        String query = "SELECT * FROM `order` where user_id = ? and status = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, page);
            rs = ps.executeQuery();
            while (rs.next()) {
                order o = new order(rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getInt("amount"),
                        rs.getString("status"));
                list.add(o);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<product> getAllProductByOrder(int userId) {
        List<product> list = new ArrayList<>();
        String query = "SELECT Product.* FROM `Order`\n"
                + "JOIN Product ON `Order`.product_id = Product.id\n"
                + "WHERE `Order`.user_id = ? ;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
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
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public List<product> getProductByOrder(int userId, String status) {
        List<product> list = new ArrayList<>();
        String query = "SELECT Product.*\n"
                + "FROM `Order`\n"
                + "JOIN Product ON `Order`.product_id = Product.id\n"
                + "WHERE `Order`.user_id = ? AND `Order`.status = ?\n"
                + "GROUP BY Product.id, `Order`.status;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setString(2, status);
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
            return list;
        } catch (Exception e) {
        }

        return null;
    }
    public void updateStatus(int orderId) {        
        String query = "UPDATE `order` SET status = '5' WHERE id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
   
}
