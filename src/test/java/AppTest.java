import org.fluentlenium.adapter.FluentTest;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import static org.assertj.core.api.Assertions.assertThat;
import static org.fluentlenium.core.filter.FilterConstructor.*;
import org.junit.*;
import java.util.List;
import org.sql2o.*;

public class AppTest extends FluentTest {
  public WebDriver webDriver = new HtmlUnitDriver();
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
  @Override
  public WebDriver getDefaultDriver() {
    return webDriver;
  }
  @ClassRule
  public static ServerRule server = new ServerRule();

  @Test
  public void rootTest() {
    goTo("http://localhost:4567/");
    assertThat(pageSource()).contains("Hair Salon Management");
  }
  @Test
  public void stylistIsCreatedTest(){
    goTo("http://localhost:4567/");
    click("a", withText("Add new Stylist"));
    fill("#firstName").with("Robert");
    fill("#lastName").with("Fitzgerald");
    submit(".btn");
    assertThat(pageSource()).contains("The new Stylist has been saved.");
  }
  // @Test
  // public void doctorIsSavedTest(){
  //   Doctor myDoctor = new Doctor("John Smith", "Endocrinologist");
  //   myDoctor.save();
  //   System.out.println(myDoctor.getId());
  //   String doctorPath = String.format("http://localhost:4567/doctors/%d", myDoctor.getId());
  //   goTo(doctorPath);
  //   assertThat(pageSource()).contains("John Smith");
  // }
}
