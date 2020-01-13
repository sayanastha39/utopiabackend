Utopia Airline 

Utopia Airline project has three core modules Payment Module, Ticket Access Module and Reschedule Module. Each of these modules contains multiple sub-modules like Batch control, Indexing, Scanning, Payment and others. In payment module, the application allows the users to make online purchases, web check in, reschedule travel etc.

Implement business components using spring dependency injection and accessed them using Spring provided annotations.Using Spring boot was very helpful as it is a J2EE framework that takes care of boilerplates and controls the application. I took advantage of this feature and implemented JPA Repository while working with data and objects. I used Hibernate because it is the most common JPA provider. It allowed me to load and save Java objects without writing queries. I took advantage of Java 8 features like lambda, forEach method, Collections and generics to create classes not tied to one datatype. 

I did some JUnit testing in the application and tested out some functionality. I have deployed this service on AWS and have built CI/CD using Jenkins and Docker. Before deploying it using Jenkins I created a dockerfile and tested in my local computer.
