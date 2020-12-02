import java.sql.*;
import java.util.Scanner;

public class DBApp {

  public static void main(String[] args) {
    try {                                               
      Class.forName("com.mysql.jdbc.Driver");      

    } catch(Exception e) {
      System.out.print(e);
      return;
    }                       
    String group_number="70";
    String username = "ht20_2_group_70";
    String password = "pwd_70";
    PreparedStatement p = null;
    Connection con = null;

    Scanner sc = new Scanner(System.in);


    try {
      con = DriverManager.getConnection("jdbc:mysql://localhost",username,password);
      String stmt0 = "use ht20_2_project_group_70";
      p = con.prepareStatement(stmt0); 
      p.clearParameters();
      ResultSet rs = p.executeQuery();

      System.out.print("Input a product ID: ");
      while (!sc.hasNextInt()) {
        System.out.println("Input must be a number.");
        sc.next();
      }
      int id = sc.nextInt();

      String query = "SELECT Discount FROM PRODUCT WHERE Id = ?";
      p = con.prepareStatement(query);        
      p.clearParameters();
      p.setInt(1, id);  // this checks the input for possible injections

      rs = p.executeQuery();

      if (rs.next()) {
        float discount = rs.getFloat("Discount");
        System.out.println("Discount: " + discount);
        System.out.print("What should this be changed to? ");
        
        while (!sc.hasNextFloat()) {
          System.out.println("Input must be a proper number.");
          sc.next();
        }
        discount = sc.nextFloat();

        query = "UPDATE PRODUCT SET Discount = ? WHERE Id = ?";

        p = con.prepareStatement(query);
        p.clearParameters();
        p.setFloat(1, discount);
        p.setInt(2, id);
        p.executeUpdate();
      }

      System.out.println();

    } catch (Exception e) {         
      e.printStackTrace();
    }
    finally {               
      if(p != null){ try{ p.close(); } catch(SQLException sqlEx){} }        
      if(con != null){ try{ con.close(); } catch(SQLException sqlEx){} }  
      sc.close();
    }                                 
  }
}
