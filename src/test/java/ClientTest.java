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
  @Test
  public void getId_clientsInstantiateWithAnID_1() {
    Client testClient = new Client("Jane", "Doe", "1985-05-06", 1);
    testClient.save();
    assertEquals(1, testClient.getStylistId());
  }
  // @Test
  // public void all_emptyAtFirst() {
  //   assertEquals(Review.all().size(), 0);
  // }
  //
  // @Test
  // public void equals_returnsTrueIfNamesAretheSame() {
  //   Review firstReview = new Review("This is a good restaurant.", 1, 4);
  //   Review secondReview = new Review("This is a good restaurant.", 1, 4);
  //   assertTrue(firstReview.equals(secondReview));
  // }
  // @Test
  // public void find_findsReviewInDatabase_true() {
  //   Review testReview = new Review("This is a good restaurant.", 1, 4);
  //   testReview.save();
  //   Review savedReview = Review.find(testReview.getId());
  //   assertTrue(testReview.getReview().equals(savedReview.getReview()));
  // }
  // @Test
  // public void save_assignsIdToObject() {
  //   Review testReview = new Review("This is a good restaurant.", 1, 4);
  //   testReview.save();
  //   Review savedReview = Review.all().get(0);
  //   assertEquals(testReview.getId(), savedReview.getId());
  // }
  // @Test
  // public void save_returnsTrueIfReviewsAretheSame() {
  //   Review testReview = new Review("This is a good restaurant.", 1, 4);
  //   testReview.save();
  //   assertTrue(Review.all().get(0).getReview().equals(testReview.getReview()));
  // }
  // @Test
  // public void save_savesRestaurantIdIntoDB_true() {
  //   Restaurant testRestaurant = new Restaurant("Matador", "Mexican", "Portland");
  //   testRestaurant.save();
  //   Review testReview = new Review("This is a good restaurant.", testRestaurant.getId(), 4);
  //   testReview.save();
  //   Review savedReview = Review.find(testReview.getId());
  //   assertEquals(savedReview.getRestaurantId(), testRestaurant.getId());
  // }
  // @Test
  // public void find_returnsNullWhenNoReviewFound_null() {
  //   assertTrue(Review.find(999) == null);
  // }
}
