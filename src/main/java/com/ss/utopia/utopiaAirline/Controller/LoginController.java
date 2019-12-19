package com.ss.utopia.utopiaAirline.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import com.ss.utopia.utopiaAirline.POJO.User;
import com.ss.utopia.utopiaAirline.Service.*;
import org.springframework.web.bind.annotation.ResponseStatus;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;

// @CrossOrigin(origins = "*", allowedHeaders = "*")
@CrossOrigin
@RestController 
@Produces({"application/xml", "application/json"})
@Consumes({"application/xml", "application/json"})

public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@GetMapping(path="/health/")
	public HttpStatus isHealthy() {
		return HttpStatus.OK;
	}
	
	@GetMapping(path="/test/")
	public String imTest() {
		return ("Test is working");
	}
	
	 @PostMapping("/users")
	// @CrossOrigin(origins = "http://localhost:3000")
	 @ResponseStatus(code = HttpStatus.OK)
		public ResponseEntity<String> createUser(@RequestBody User user) {
		 loginService.createUser(user);
			return new ResponseEntity<String> ("User created" , HttpStatus.CREATED);
		}
	 
	 @GetMapping ("/users") 
	// @CrossOrigin(origins = "http://localhost:3000")
	 @ResponseStatus(code = HttpStatus.OK)
		public ResponseEntity<?> readUser(@RequestHeader ("username") String username) {
		 	
		 	User user = loginService.readUserbyUsername(username);
			User emptyUser = new User();
		
			if(user.getUsername().equals(username)) {
				User userwdata =loginService.readUserbyUname(username);
				return new ResponseEntity<User>(userwdata, HttpStatus.OK);
			}
			return new ResponseEntity<User>(emptyUser, HttpStatus.NOT_FOUND);
	}
}
