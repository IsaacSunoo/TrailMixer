import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.mvctrailmixer.data.UserDAO;
import com.skilldistillery.mvctrailmixer.data.UserDAOImpl;
import com.skilldistillery.trailmixer.entities.User;

class UserDAOTests {

	UserDAO dao;
	private User user;
	
	@BeforeEach
	public void setUp() throws Exception {
		dao = new UserDAOImpl();
	}
	
	@BeforeAll
	public static void setup_all() {
	}

	@AfterEach
	public void tearDown() throws Exception {
	}
	
	@AfterAll
	public static void tear_down_all() {
	}
	
	@Test
	void test_username_found() {
		User u = dao.getUserByUserName("johnWick@gmail.com");
		assertNotNull(u);
//		assertEquals("johnWick@gmail.com", u.getUsername());
	}

}
