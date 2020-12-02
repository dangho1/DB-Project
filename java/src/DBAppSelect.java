import java.sql.*;
import java.util.Scanner;

public class DBAppSelect {

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

      System.out.print("Input a department ID: ");
      while (!sc.hasNextInt()) {
        System.out.println("Input must be a number.");
        sc.next();
      }
      int userIn = sc.nextInt();

      String query = "SELECT Id, Title, Price, Discount FROM PRODUCT WHERE DepartmentId = ?";
      p = con.prepareStatement(query);
      p.clearParameters();
      p.setInt(1, userIn);
      rs = p.executeQuery();

      boolean isLeaf = rs.next();
      if (!isLeaf) {
        query = "SELECT Id, Title FROM DEPARTMENT WHERE ParentId = ?";
        p = con.prepareStatement(query);
        p.clearParameters();
        p.setInt(1, userIn);

        rs = p.executeQuery();
      }

      rs.beforeFirst();

      if (isLeaf) {
        System.out.println("Products\nId\t Title\t Cost");
        while (rs.next()) {
          System.out.print(rs.getInt("Id"));
          System.out.print("\t" + rs.getString("Title"));
          double cost = (((double) rs.getInt("Price")) * (100.0 - rs.getFloat("Discount")) / 100);
          System.out.println("\t" + cost);
        }
      } else {
        System.out.println("Departments\nId\t Title");
        while (rs.next()) {
          System.out.print(rs.getInt("Id"));
          System.out.println("\t" + rs.getString("Title"));
        }
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
