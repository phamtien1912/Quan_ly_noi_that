package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.comment;
import model.user;

public class commentDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<comment> selectAllByProductId(int productId) {
        List<comment> list = new ArrayList<>();
        String query = "SELECT * FROM Comment WHERE product_id = ? ORDER BY id DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                comment c = new comment(rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("product_id"),
                        rs.getString("comment_text"));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public List<user> getUserByProductId(int productId) {
        List<user> list = new ArrayList<>();
        String query = "SELECT u.* FROM User u JOIN Comment c ON u.id = c.user_id WHERE c.product_id = ? ORDER BY c.id DESC;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                user u = new user(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8));
                list.add(u);
            }
            return list;
        } catch (Exception e) {
        }

        return null;
    }

    public void AddReview(int userId, int productId, String comment){
        String query = "INSERT INTO `comment` (`user_id`, `product_id`, `comment_text`) VALUES (?, ?, ?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
}
