package com.ss.utopia.utopiaAirline;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;
import com.ss.utopia.utopiaAirline.DAO.UserDAO;
import com.ss.utopia.utopiaAirline.POJO.User;
import org.springframework.test.context.jdbc.Sql;

@SpringBootTest(classes = UtopiaAirlineApplicationTests.class)

@Sql({"schema.sql", "utopiaSQL.sql"})

class UtopiaAirlineApplicationTests{
	
	private User getUser() {
		User user = new User();
		user.setUserId(1);
		user.setFirstName("Joby");
		user.setLastName("Santhosh");
		user.setPhoneNumber("8325087738");
		user.setEmail("joby@gmail.com");
		user.setAddress("94 Sherwood Street Bethesda, MD 20814");
		user.setUsername("jobysan05");
		user.setPassword("password");
		user.setActive(1);
		return user;
	}

	
	@Autowired
	private TestEntityManager entityManager;
	
	@Autowired
	private UserDAO userDao;
	
	@Test
	public void testSaveUser(){
		User user  = getUser();
		User savedInDb = entityManager.persist(user);
		Optional<User> getFromDb = userDao.findById(savedInDb.getUserId());
		
		assertThat(getFromDb).isEqualTo(savedInDb);
	}

	
}
