import java.util.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.List;

public class ClientTest { 

  @Before
  public void setUp() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/hair_salon_test", null, null);
  }
  @After
  public void tearDown() {
    try(Connection con = DB.sql2o.open()) {
      String deleteClientQuery = "DELETE FROM clients *;";
      String deleteStylistQuery = "DELETE FROM stylists *;";
      con.createQuery(deleteClientQuery).executeUpdate();
      con.createQuery(deleteStylistQuery).executeUpdate();
    }
  }
  @Test
  public void clients_instantiatesCorrectly_true() {
    Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
    assertEquals(true, testClient instanceof Client);
  }
  // @Test
  // public void getId_clientsInstantiateWithAnID_1() {
  //   Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testClient.save();
  //   assertEquals(1, testClient.getStylistId());
  // }
  // @Test
  // public void all_emptyAtFirst() {
  //   assertEquals(Client.all().size(), 0);
  // }
  //
  // @Test
  // public void equals_returnsTrueIfNamesAretheSame() {
  //   Client firstClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   Client secondClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   assertTrue(firstClient.equals(secondClient));
  // }
  // @Test
  // public void find_findsClientInDatabase_true() {
  //   Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testClient.save();
  //   Client savedClient = Client.find(testClient.getId());
  //   assertTrue(testClient.getFirstName().equals(savedClient.getFirstName()));
  // }
  // @Test
  // public void save_assignsIdToObject() {
  //   Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testClient.save();
  //   Client savedClient = Client.all().get(0);
  //   assertEquals(testClient.getId(), savedClient.getId());
  // }
  // @Test
  // public void save_returnsTrueIfClientsAretheSame() {
  //   Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testClient.save();
  //   assertTrue(Client.all().get(0).getClient().equals(testClient.getClient()));
  // }
  // @Test
  // public void save_savesRestaurantIdIntoDB_true() {
  //   Restaurant testRestaurant = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testRestaurant.save();
  //   Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
  //   testClient.save();
  //   Client savedClient = Client.find(testClient.getId());
  //   assertEquals(savedClient.getRestaurantId(), testRestaurant.getId());
  // }
  // @Test
  // public void find_returnsNullWhenNoClientFound_null() {
  //   assertTrue(Client.find(999) == null);
  // }
}
