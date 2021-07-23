drop table if exists graduates cascade;
drop table if exists mentors cascade;
drop table if exists cities cascade;
drop table if exists classes cascade;
drop table if exists mentor_matching cascade;

drop table if exists plans cascade;
drop table if exists goal_status cascade;
drop table if exists goals cascade;
drop table if exists feedbacks cascade;

CREATE TABLE cities (
    id              SERIAL PRIMARY KEY,
    city_name      VARCHAR(50) NOT NULL
    
);

CREATE TABLE classes (
    id              SERIAL PRIMARY KEY,
    city_id         INT NOT NULL REFERENCES cities(id),
    class_code      VARCHAR(10) NOT NULL
);



CREATE TABLE graduates (
  id       SERIAL PRIMARY KEY,
  first_name     VARCHAR(50) NOT NULL,
  last_name     VARCHAR(50) NOT NULL,
  email  VARCHAR(255) NOT NULL UNIQUE,
  password     VARCHAR(50) NOT NULL,
  class_id  INT NOT NULL REFERENCES classes(id) ,
  sign_up_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE mentors (
  id       SERIAL PRIMARY KEY,
  first_name     VARCHAR(50) NOT NULL,
  last_name     VARCHAR(50) NOT NULL,
  email  VARCHAR(255) NOT NULL UNIQUE,
  password     VARCHAR(50) NOT NULL,
  city_id  INT NOT NULL REFERENCES cities(id) ,
  sign_up_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE mentor_matching  (
    mentor_id     INT NOT NULL REFERENCES mentors(id),
    graduate_id INT NOT NULL REFERENCES graduates(id) ,
    primary key (mentor_id, graduate_id)
);

CREATE TABLE plans
(
     id              SERIAL PRIMARY KEY ,
     plan_name     varchar(150) NOT NULL,
     graduate_id int NOT NULL  REFERENCES graduates(id),
     last_modified DATE NOT NULL DEFAULT CURRENT_DATE
    
);

CREATE TABLE goal_status
(
   	id       SERIAL PRIMARY KEY,
    status_name varchar(150)  NOT NULL
);
 
CREATE TABLE goals
(
    id         SERIAL PRIMARY KEY ,
    plan_id    int NOT NULL REFERENCES plans(id),
    goal_details varchar(150)  NOT NULL,
    due_date   DATE NOT NULL DEFAULT CURRENT_DATE,
    goal_status_id int not null REFERENCES goal_status(id)  
);


CREATE TABLE feedbacks
(
    id       SERIAL PRIMARY KEY,
    plan_id int NOT NULL REFERENCES plans(id),
    feedback_details text,
    feedback_date DATE NOT NULL DEFAULT CURRENT_DATE
   
);


INSERT INTO cities (city_name) VALUES ('London');
INSERT INTO cities (city_name) VALUES ('Manchester');

INSERT INTO classes (city_id,class_code) VALUES (1,'LDN06');
INSERT INTO classes (city_id,class_code) VALUES (2,'WMS01');
INSERT INTO classes (city_id,class_code) VALUES (1,'LDN07');
INSERT INTO classes (city_id,class_code) VALUES (2,'WMS02');

INSERT INTO graduates ( first_name, last_name, email,password,class_id) VALUES ('Herbert','Cowper','hcowper0@bloglines.com','bhEtiT',1);
INSERT INTO graduates ( first_name, last_name, email,password,class_id) VALUES ('Valentin','Innwood','vinnwood1@pagesperso-orange.fr','ytNqVQS',2);
INSERT INTO graduates ( first_name, last_name, email,password,class_id) VALUES ('Diana','Purle','dpurle2@tmall.com','oZJUcBHhthb',3);
INSERT INTO graduates ( first_name, last_name, email,password,class_id) VALUES ('Dorothee','Moizer','dmoizer3@github.com','CayDzuZqMdL',4);

INSERT INTO mentors ( first_name, last_name, email,password,city_id) VALUES ('Terry','Straun','tstraun4@1688.com','nzAYX1aVUfzL',1);
INSERT INTO mentors ( first_name, last_name, email,password,city_id) VALUES ('Lyle','Edgworth','ledgworth5@ustream.tv','BVvqnioTKI4z',2);
INSERT INTO mentors ( first_name, last_name, email,password,city_id) VALUES ('Rurik','Strivens','rstrivens6@marriott.com','stwfbWt5Vn',1);



INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (2,1);
INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (2,2);
INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (3,1);
INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (3,4);
INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (1,3);
INSERT INTO mentor_matching  (mentor_id,graduate_id) VALUES (1,4);




INSERT INTO plans(plan_name,graduate_id) VALUES ('I am going to find job by September',4);
INSERT INTO plans(plan_name,graduate_id) VALUES ('I am going to improve my CV', 3);
INSERT INTO plans(plan_name,graduate_id) VALUES ('I will improve my CSS skills', 2);


INSERT INTO goal_status(status_name) VALUES ('Not Started');
INSERT INTO goal_status( status_name) VALUES ( 'In Progress');
INSERT INTO goal_status(status_name) VALUES ('Completed');
	


INSERT INTO goals(plan_id, goal_details,goal_status_id) VALUES (2, 'create CV template', 2);
INSERT INTO goals(plan_id, goal_details,goal_status_id) VALUES (2, 'show CV to my mentor',1);
INSERT INTO goals(plan_id, goal_details,goal_status_id) VALUES (3, 'I will improve the styling of my previous projects', 3);
INSERT INTO goals(plan_id, goal_details,goal_status_id) VALUES (1, 'I will apply to 5 jobs everyday', 3);



INSERT INTO feedbacks(plan_id, feedback_details) VALUES (1,'that is good, keep going!');
INSERT INTO feedbacks(plan_id, feedback_details) VALUES (3,'please change heading color.');
INSERT INTO feedbacks(plan_id, feedback_details) VALUES (2,'Provide more details on your recent role.');


