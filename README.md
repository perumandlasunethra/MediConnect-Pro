\# MediConnect Pro



\## Integrated Digital Healthcare Portal



MediConnect Pro is a web-based healthcare portal that connects patients and doctors through a simple digital platform. The system allows patients to register, log in, view doctors, book appointments, and track appointment status. Doctors can manage their availability and accept or reject appointments.



\## Features



\### Patient



\* Patient registration

\* Patient login

\* View available doctors

\* Book appointments

\* View appointment history

\* Check appointment status



\### Doctor



\* Doctor registration

\* Doctor login

\* Manage weekly availability

\* View patient appointments

\* Accept or reject appointments



\### Appointment Management



\* Doctor availability-based time slots

\* 30-minute appointment slots

\* Prevents duplicate bookings

\* Appointment status management



\## Technologies Used



\* Java

\* JSP

\* Java Servlets

\* JDBC

\* MySQL

\* HTML

\* CSS

\* JavaScript

\* Apache Tomcat 10.1

\* Eclipse IDE



\## Database



The project uses MySQL as the database.



Main tables:



\* `patient`

\* `doctor`

\* `appointment`

\* `doctor\_availability`



\## Project Structure



```text

MediConnectPro

│

├── src/main/java

│   └── com/example/mediconnect

│       ├── dao

│       ├── model

│       └── servlet

│

└── src/main/webapp

&#x20;   ├── css

&#x20;   ├── WEB-INF

&#x20;   ├── JSP pages

&#x20;   └── META-INF

```



\## How to Run



1\. Install Java JDK.

2\. Install Eclipse Enterprise Java and Web Developers.

3\. Install Apache Tomcat 10.1.

4\. Install XAMPP and start MySQL.

5\. Create the `mediconnect` database in MySQL.

6\. Import/create the required tables.

7\. Open the project in Eclipse.

8\. Configure Apache Tomcat.

9\. Add the MySQL Connector/J library.

10\. Run the project on Tomcat.



Open the application using:



```text

http://localhost:8080/MediConnectPro/

```



\## Future Enhancements



\* Email notifications

\* Online consultation

\* Patient medical records

\* Doctor search by specialization

\* Admin dashboard

\* Online payment integration

\* Improved security and password encryption



\## Project Purpose



This project was developed as an academic project to demonstrate the use of Java web technologies, database connectivity, and healthcare appointment management.



