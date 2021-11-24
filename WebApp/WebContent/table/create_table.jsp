<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1 = "create table students(id serial primary key, name varchar(50) not null, regNo varchar(9) unique not null, email varchar(50) not null, phone varchar(10) not null, cgpa float, placementStatus boolean not null default 0, password varchar(60) not null)";
	String q2 = "create table placementofficers(id serial primary key, name varchar(50) not null, regNo varchar(9) unique not null, password varchar(60) not null)";
	String q3 = "create table recruiters(recruiter_id serial primary key, name varchar(50) not null unique)";
	String q4 = "create table jobs(id serial primary key, role varchar(50) not null, ctc float not null, recruiter_id bigint unsigned not null, time_created timestamp default current_timestamp, foreign key (recruiter_id) references recruiters(recruiter_id) on delete cascade)";
	String q5 = "create table applications (id serial primary key, student_id bigint unsigned not null, job_id bigint unsigned not null, foreign key (student_id) references students(id), foreign key(job_id) references jobs(id))";
	//	st.execute(q1);
	//	st.execute(q2);
	//	st.execute(q3);
	//	st.execute(q4);
	//  st.execute(q5);
	System.out.print("Tables created");
	con.close();
} catch(Exception e) {
	System.out.print(e);
}
%>