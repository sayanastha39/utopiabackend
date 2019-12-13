package com.ss.utopia.utopiaAirline.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

@CrossOrigin(origins = "*", allowedHeaders = "*")
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
	
	@GetMapping ("/users/verified") 
	@CrossOrigin(origins = "http://localhost:3000")
	//@ResponseStatus(code = HttpStatus.OK)
		public ResponseEntity<?> verify(@RequestHeader ("username") String username, @RequestHeader ("password") String password) {
				
			User user = loginService.readUserbyUsername(username);
			
			if(user.getPassword().equals(password) ) {
				return new ResponseEntity<> (HttpStatus.OK);
			}
			return new ResponseEntity<> ( HttpStatus.NOT_FOUND);
	}
	
	 @PostMapping("/users/create")
	 @CrossOrigin(origins = "http://localhost:3000")
	 @ResponseStatus(code = HttpStatus.OK)
		public HttpStatus createUser(@RequestBody User user) {
		 loginService.createUser(user);
			return  HttpStatus.CREATED;
		}

}

