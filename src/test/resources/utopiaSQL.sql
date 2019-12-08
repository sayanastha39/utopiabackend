USE utopiaairline;

INSERT INTO `utopiaairline`.`role`
(`roleId`,`role`)
VALUES
(1,'Guest'),
(2,'Agent'),
(3,'Clerk'),
(4, 'OnlineUser');

INSERT INTO `utopiaairline`.`user`
(`firstName`,`lastName`,`phoneNumber`,`email`,`address`,`username`,`password`)
VALUES ('Joby','Santhosh','8325087738','joby@gmail.com','94 Sherwood Street
Bethesda, MD 20814','jobysan05','password'),
    ('Janet','Fernando','8327011132','janet@gmail.com','8 Brandywine St.
San Carlos, CA 94070','janfernando','password'),
('Sayana','Shreshta','8427251136','sayana@gmail.com','884 Grandrose Court
Framingham, MA 01701','sayanastha','password'),
('John','Smith','2545920122','john@gmail.com','2 Marconi Drive
Corona, NY 11368','john123','password'),
('Afia','Farijana','8325087736','afia@gmail.com','104 University Dr.
Leland, NC 28451','afia123','password');

INSERT INTO `utopiaairline`.`userrole`
(`role_Id`,`user_Id`)
VALUES
(2, 1),
(3,2),
(1,3),
(2,4),
(3,5);

INSERT INTO `utopiaairline`.`carddetails`
(`userId`,`cardNumber`,`cardType`,`expirationDate`,`nameOnCard`)
VALUES
(1,'4736441942265967','Visa','2021-08-00','Joby Santhosh'),
(2,'4043191919126308','Visa','2020-07-00','Janet Fernando'),
(3,'4698966240086174','Visa','2024-04-00','Afia Farijana'),
(4,'4313740797347163','Visa','2019-12-00','John Smith'),
(5,'4678788571704033','Visa','2021-01-00','Sayana Shrestha');

INSERT INTO `utopiaairline`.`airport`
(`airportName`,`city`,`zipCode`,`airportCode`)
VALUES
('Los Angeles International Airport','Los Angeles','99093','LAX'),
('Dulles','Virginia','22033','IAD'),
('George Bush Intercontinental Airport','Houston','77584','IAH'),
('Hartford','Connecticut','30312','BDL'),
('Atlanta Hartsfield International Airport','Georgia','45321','ATL');

INSERT INTO `utopiaairline`.`flights`
(`flightNo`,`totalSeats`,`departureAirport`,`arrivalAirport`,`departureTime`,`arrivalTime`)
VALUES
('1110',100,'LAX','IAH','12:30:00','15:30:00'),
('1230',100,'IAD','IAH','13:30:00','18:00:00'),
('2120',100,'BDL','ATL','7:30:00','10:45:00');

INSERT INTO `utopiaairline`.`itinerary`
(`flightNo`,`availableSeats`,`departureDate`)
VALUES
('1110',100,'2019-12-12'),
('1230',100,'2019-12-19'),
('2120',100,'2019-12-11');

INSERT INTO `utopiaairline`.`reservation`
(`userId`,`status`)
VALUES
(1,0),
(2,1),
(3,1);

INSERT INTO `utopiaairline`.`ticket`
(`reservationId`,`flightPrice`,`itineraryId`)
VALUES
(4,150,1),
(5,150,2),
(6,150,3);





