import java.util.List;
import org.sql2o.*;
import java.text.ParseException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Client {
  private int id;
  private String first_name;
  private String last_name;
  private int stylistId;

  public Client(String first_name, String last_name, int stylistId) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.stylistId = stylistId;

  }

  public String getFirstName() {
    return first_name;
  }

  public String getLastName() {
    return last_name;
  }

  public int getId() {
    return id;
  }

  public int getStylistId() {
    return stylistId;
  }

  public static List<Client> all() {
    String sql = "SELECT * FROM clients ORDER BY last_name ASC";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Client.class);
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO clients(first_name, last_name, stylistid) VALUES (:first_name, :last_name, :stylistid)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("first_name", this.first_name)
      .addParameter("last_name", this.last_name)
      .addParameter("stylistid", this.stylistId)
      .executeUpdate()
      .getKey();
    }
  }

  public static Client find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM clients where id=:id";
      Client Client = con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Client.class);
      return Client;
    }
  }
}
