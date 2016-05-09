import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.Arrays;
import java.util.List;

public class StylistTest {

  @Before
  public void setUp() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/hair_salon_test", null, null);
  }
  @After
  public void tearDown() {
    try(Connection con = DB.sql2o.open()) {
      String deleteClientQuery = "DELETE FROM stylists *;";
      String deleteStylistQuery = "DELETE FROM clients *;";
      con.createQuery(deleteClientQuery).executeUpdate();
      con.createQuery(deleteStylistQuery).executeUpdate();
    }
  }
  @Test
  public void Stylist_instantiatesCorrectly_true() {
    Stylist testStylist = new Stylist("John", "Smith");
    assertEquals(true, testStylist instanceof Stylist);
  }
  @Test
  public void getName_stylistInstantiatesWithName_name() {
    Stylist testStylist = new Stylist("John", "Smith");
    assertEquals("John", testStylist.getFirstName());
  }
  @Test
  public void all_emptyAtFirst() {
    assertEquals(Stylist.all().size(), 0);
  }
  @Test
  public void save_returnsTrueIfSaved_true() {
    Stylist testStylist = new Stylist("John", "Smith");
    testStylist.save();
    assertEquals(Stylist.all().get(0).getFirstName(),testStylist.getFirstName());
  }
  @Test
    public void save_assignsIdToObject() {
    Stylist testStylist = new Stylist("John", "Smith");
    testStylist.save();
    Stylist savedStylist = Stylist.all().get(0);
    assertEquals(testStylist.getId(), savedStylist.getId());
  }
  @Test
    public void find_findStylistInDatabase_true() {
    Stylist testStylist = new Stylist("John", "Smith");
    testStylist.save();
    Stylist savedStylist = Stylist.find(testStylist.getId());
    assertEquals(savedStylist.getFirstName(), testStylist.getFirstName());
  }
  @Test
  public void getClients_retrievesAllClientsFromDatabase() {
    Stylist testStylist = new Stylist("John", "Smith");
    testStylist.save();
    Client firstClient = new Client("John", "Doe", testStylist.getId());
    firstClient.save();
    Client secondClient = new Client("Jane", "Doe", testStylist.getId());
    secondClient.save();
    Client[] reviews = new Client[] { firstClient, secondClient };
    assertEquals(testStylist.getClients().size(), 2);
  }
}
