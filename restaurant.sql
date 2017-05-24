/*This will create tables and the primary key in each data table is set increment
by 1. This process of creating the table uses multiple data types, constraints,
primary keys, foreign key, and variable declaration that were learned in class.*/

DROP TABLE MENU;
DROP TABLE contact;
DROP TABLE HOURS;
DROP TABLE RESTAURANT;
DROP TABLE LOCATION;
DROP TABLE NEIGHBORHOOD;
CREATE TABLE Neighborhood
  (
    NEIGHBORHOOD_ID INT GENERATED ALWAYS AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    NEIGHBORHOOD VARCHAR2(50) NOT NULL,
    CONSTRAINT neighborhood_id_pk PRIMARY KEY (NEIGHBORHOOD_ID)
  );
CREATE TABLE Location
  (
    LOCATION_ID INT GENERATED ALWAYS AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    zip_code        INT NOT NULL,
    address         VARCHAR2(100) NOT NULL,
    NEIGHBORHOOD_ID INT NOT NULL,
    CONSTRAINT location_id_pk PRIMARY KEY (LOCATION_ID),
    CONSTRAINT neighborhood_id_fk FOREIGN KEY (NEIGHBORHOOD_ID) REFERENCES Neighborhood(NEIGHBORHOOD_ID)
  );
CREATE TABLE Restaurant
  (
    RESTAURANT_ID INT GENERATED ALWAYS AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    name        VARCHAR2(100) NOT NULL,
    cuisine     VARCHAR2(100),
    rating      DECIMAL(3,1),
    LOCATION_ID INT,
    CONSTRAINT res_id_pk PRIMARY KEY (RESTAURANT_ID),
    CONSTRAINT location_id_fk FOREIGN KEY (LOCATION_ID) REFERENCES Location(LOCATION_ID)
  );
CREATE TABLE Hours
  (
    HOURS_ID INT GENERATED always AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    monday    VARCHAR2(50),
    tuesday   VARCHAR2(50),
    wednesday VARCHAR2(50),
    thursday  VARCHAR2(50),
    friday    VARCHAR2(50),
    saturday  VARCHAR2(50),
    sunday    VARCHAR2(50),
    CONSTRAINT hours_id_pk PRIMARY KEY (HOURS_ID),
    CONSTRAINT hours_id_fk FOREIGN KEY (HOURS_ID) REFERENCES Restaurant(RESTAURANT_ID)
  );
CREATE TABLE Menu
  (
    MENU_ID INT GENERATED ALWAYS AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    kids_menu     CHAR(3),
    alcohol       CHAR(3),
    catering      CHAR(3),
    RESTAURANT_ID INT,
    CONSTRAINT menu_id_pk PRIMARY KEY (MENU_ID),
    CONSTRAINT menu_res_id_fk FOREIGN KEY (RESTAURANT_ID) REFERENCES Restaurant(RESTAURANT_ID)
  );
CREATE TABLE Contact
  (
    CONTACT_ID INT GENERATED ALWAYS AS IDENTITY
    START WITH 1 INCREMENT BY 1,
    telephone     VARCHAR2(20),
    website       VARCHAR2(150),
    RESTAURANT_ID INT,
    CONSTRAINT contact_id_pk PRIMARY KEY (CONTACT_ID),
    CONSTRAINT contact_res_id_fk FOREIGN KEY (RESTAURANT_ID) REFERENCES Restaurant(RESTAURANT_ID)
  );


--USING DATA FROM THE WEB, INSERT THE APPROPRIATE VALUES INTO EACH TABLE
--SOME INSERTS REFER TO THE SAME FOREIGN KEY TO SHOW A MANY TO ONE RELATIONSHIPS.
INSERT INTO NEIGHBORHOOD
  ( neighborhood
  ) VALUES
  ( 'River North'
  );
INSERT INTO NEIGHBORHOOD
  ( neighborhood
  ) VALUES
  ( 'The Loop'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    1,
    60654,
    '744 N Clark St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
name, cuisine, rating ) VALUES
(
  1, 'India House Restaurant', 'Indian', 3.8
)
;
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    1,
    'Yes',
    'No',
    'Yes'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    1,
    '312-645-9500',
    'indiahousechicago.com'
  );
INSERT
INTO hours
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '11:00am - 2:30pm, 5:30-10',
    '11:00am - 2:30pm, 5:30-10',
    '11:00am - 2:30pm, 5:30-10',
    '11:00am - 2:30pm, 5:30-10',
    '11:00am - 2:30pm, 5:30-10',
    '11:30am - 3:00pm, 5-10pm',
    '11:30am - 3:00pm, 5-10pm'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    1,
    60654,
    '445 N Clark St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    name,
    cuisine,
    rating
  )
  VALUES
  (
    2,
    'Frontera Grill',
    'Mexican',
    4.3
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    2,
    'No',
    'Yes',
    'No'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    2,
    '312-661-1434',
    'rickbayless.com'
  );
INSERT
INTO hours
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '11:30am-2:30pm, 5-10pm',
    '11:30am-2:30pm, 5-10pm',
    '11:30am-2:30pm, 5-10pm',
    '11:30am-2:30pm, 5-10pm',
    '11:30am-2:30pm, 5-10pm',
    '11:30am-2:30pm, 5-10pm',
    'CLOSED'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    1,
    60654,
    '22 W Hubbard St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    name,
    cuisine,
    rating
  )
  VALUES
  (
    3,
    'RPM Italian',
    'Italian',
    4.4
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    3,
    'No',
    'Yes',
    'N/A'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    3,
    '312-222-1888',
    'rpmitalian.com'
  );
INSERT
INTO hours
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '4-11pm',
    '4pm-12am',
    '4pm-12am',
    '4pm-12am',
    '4pm-12:30am',
    '4pm-12:30am',
    '12-11pm'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    1,
    60654,
    '651 N LaSalle St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    name,
    cuisine,
    rating
  )
  VALUES
  (
    4,
    'Fago de Chao Brazilian',
    'Brazilian',
    4.6
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    4,
    'Yes',
    'Yes',
    'No'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    4,
    '312-932-9330',
    'fogodechao.com'
  );
INSERT
INTO hours
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '11:00am-2:00pm, 5-10pm',
    '11:00am-2:00pm, 5-10pm',
    '11:00am-2:00pm, 5-10pm',
    '11:00am-2:00pm, 5-10pm',
    '11:00am-2:00pm, 5-10pm',
    '4-10:30pm',
    '11:30am-2:00pm, 4:30-9:00pm'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    1,
    60654,
    '3240 W Randolph St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    name,
    cuisine,
    rating
  )
  VALUES
  (
    5,
    'Mercadito Chicago',
    'Mexican',
    4.5
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    5,
    'No',
    'Yes',
    'Yes'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    5,
    '312-329-9555',
    'mercaditorestaurants.com'
  );
INSERT
INTO hours
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '11:30am-12:00am',
    '11:30am-1:00am',
    '11:30am-1:00am',
    '11:30am-1:00am',
    '11:30am-2:00am',
    '11:30am-3:00am',
    '11:30am-12:00am'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    2,
    60642,
    '833 W Chicago Ave, Chicago, IL'
  );
SET SCAN OFF --THIS will not look at & as a value looking for a substitution variable.
INSERT
INTO RESTAURANT
  (
    location_id,
    cuisine,
    rating,
    name
  )
  VALUES
  (
    6,
    'Asian',
    3.5,
    'Thalia Spice Asian Fusion Bistro \& Bar'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    rating,
    cuisine,
    name
  )
  VALUES
  (
    6,
    3.5,
    'Thai',
    'Thalia Spice Asian Fusion Bistro \& Bar'
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    6,
    'No',
    'Yes',
    'Yes'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    6,
    '312-226-6020',
    '833 W Chicago Ave, Chicago, IL 60642'
  );
INSERT
INTO HOURS
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    'CLOSED',
    '11:00am-10:00pm',
    '11:00am-10:00pm',
    '11:00am-10:00pm',
    '11:00am-10:00pm',
    '3:00-11:00pm',
    '11:30am-10:00pm'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    2,
    60099,
    '601 N LaSalle St, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    cuisine,
    rating,
    name
  )
  VALUES
  (
    7,
    'Chinese',
    3.8,
    'China Phoenix Restaurant'
  );
INSERT
INTO MENU
  (
    restaurant_id,
    kids_menu,
    alcohol,
    catering
  )
  VALUES
  (
    8,
    'No',
    'Yes',
    'No'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    8,
    '312-932-9330',
    'www.chinaphoenixchicago.com/'
  );
INSERT
INTO HOURS
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '10:30 AM – 9:30 PM',
    '10:30 AM – 9:30 PM',
    '10:30 AM – 9:30 PM',
    '10:30 AM – 9:30 PM',
    '10:30 AM – 9:30 PM',
    '11:00 AM – 10:30 PM',
    '11:00 AM – 10:30 PM'
  );
INSERT INTO NEIGHBORHOOD
  (neighborhood
  ) VALUES
  ('Near North Side'
  );
INSERT
INTO LOCATION
  (
    neighborhood_id,
    zip_code,
    address
  )
  VALUES
  (
    3,
    60345,
    '1265 N Central Ave, Chicago, IL'
  );
INSERT
INTO RESTAURANT
  (
    location_id,
    cuisine,
    rating,
    name
  )
  VALUES
  (
    8,
    'Indian',
    4.2,
    'Gaylord Fine Indian Cuisine'
  );
INSERT
INTO MENU
  (
    restaurant_id,
    alcohol,
    kids_menu,
    catering
  )
  VALUES
  (
    9,
    'Yes',
    'Yes',
    'Yes'
  );
INSERT
INTO CONTACT
  (
    restaurant_id,
    telephone,
    website
  )
  VALUES
  (
    9,
    '773-252-2020',
    'gaylordil.com'
  );
INSERT INTO CONTACT
  (restaurant_id,telephone
  ) VALUES
  (9, '312-664-1700'
  );
INSERT
INTO HOURS
  (
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  )
  VALUES
  (
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM',
    '11:30 AM – 2:30 PM, 4:30 – 9:30 PM'
  );


-- simple query where it pulls data from menu where they dont have kids menu.
SELECT *
FROM menu
WHERE kids_menu = 'No';

--using inner join to join two separate table results according to the argument
SELECT *
FROM location l
INNER JOIN Menu m
ON (l.location_id=m.menu_id);

--search all data from the ‘Restaurant’ table where rating is between 3 and 5.
--this query uses both ORDER BY and DESC key words.
SELECT *
FROM Restaurant
WHERE rating between 3 and 5
ORDER BY rating DESC;

--Search all data from the ‘Restaurant’ table where restaurant name is started by alphabet ‘F’
--This uses LIKE key word and the wildcard % symbol.
SELECT *
FROM Restaurant
WHERE name LIKE 'F%';

--Finding Restaurants which serve alcohol. On Sundays
SELECT restaurant.name
FROM restaurant
WHERE restaurant_id IN 
(SELECT hours.hours_id
FROM hours WHERE sunday != 'Closed' AND hours.hours_id IN
(SELECT menu_id FROM menu WHERE alcohol = 'Yes'));

--Finding Restaurants which serve alcohol. Order by cuisine and then rating, both descending
--putting multiple select statement in one select statement.
SELECT name, cuisine, rating
FROM restaurant
WHERE restaurant_id IN 
(SELECT menu.restaurant_id 
FROM menu WHERE alcohol = 'Yes')
ORDER BY cuisine desc, rating desc;

--Finding Restaurants which have kids menus
SELECT name, cuisine, rating
FROM restaurant
WHERE restaurant_id IN 
(SELECT menu.restaurant_id 
FROM menu WHERE kids_menu = 'Yes');

--Basic join between restaurant and menu
SELECT restaurant.name, menu.ALCOHOL, menu.CATERING
FROM restaurant
JOIN menu
ON restaurant.restaurant_ID = menu.restaurant_id;

--Finds all restaurants whose names start with F and the neighborhoods they are in 
SELECT name, cuisine, rating, neighborhood
FROM restaurant, neighborhood
WHERE neighborhood.NEIGHBORHOOD_ID IN 
(SELECT neighborhood_id FROM location WHERE location_id IN
(SELECT restaurant.location_id FROM restaurant WHERE name LIKE 'F%'))
AND restaurant.name LIKE 'F%';

--search all data from the ‘Neighborhood’ and 'location' table where restaurant location matches restaurant neighborhood.
--using temporary variable names to look up information from the tables.
SELECT distinct l.address, l.zip_code, n.neighborhood
FROM Neighborhood n, location l
WHERE n.neighborhood_id = l.neighborhood_id;

--return ‘zip_code’, ‘address’ value that zip_code is ‘60654’ and address is ‘Western’ from ‘Location’ order by address.
--using wild card symbol 
SELECT zip_code, address 
FROM Location
WHERE zip_code = 60654 and (address like '%W%')
Order by address;

--return ‘telephone’, ‘website’ value that telephone number without ‘312-‘ from Contact.
--using String package functions like substr and using key word 'like' and wildcard (_)
SELECT substr(telephone, 5), website
FROM Contact
WHERE telephone like '312_%';

--return ‘name’, ‘cuisine’, ‘rating’ value that cuisine is not ‘Mexican’ and ‘Indian’
--from Restaurant where the rating is about 4.0. This uses not in key words and operators
SELECT name, cuisine, rating
FROM Restaurant
WHERE cuisine not in ('Mexican', 'Indian')
      and rating >4.0;

--calculating the difference between the best rating and the worst rating in the database.
--uses key words MIN and MAX and assigns this to a different column name.
SELECT MAX(RATING)-MIN(RATING) DIFFERENCE
FROM RESTAURANT;

--using and creating views 
CREATE OR REPLACE VIEW restaurant_read_only as
select RESTAURANT.RESTAURANT_ID, name, cuisine, rating,
MONDAY, TUESDAY, WEDNESDAY, THURSDAY ,FRIDAY, SATURDAY, SUNDAY,
 KIDS_MENU, ALCOHOL, CATERING, 
TELEPHONE,WEBSITE,
ZIP_CODE, ADDRESS,
 NEIGHBORHOOD
from RESTAURANT, neighborhood, MENU, CONTACT, LOCATION, HOURS
where RESTAURANT.RESTAURANT_ID=MENU.RESTAURANT_ID and RESTAURANT.RESTAURANT_ID = CONTACT.RESTAURANT_ID
and HOURS.HOURS_ID=RESTAURANT.RESTAURANT_ID and LOCATION.neighborhood_id=neighborhood.NEIGHBORHOOD_ID
and RESTAURANT.LOCATION_ID = LOCATION.LOCATION_ID;

--describes the columns of the view table by their data type
DESCRIBE restaurant_read_only;

--selects all the restaurants in the table where the restaurants open at 11.
select *
FROM RESTAURANT_READ_ONLY
where monday like '11:00am%';

--deleting view using DROP
DROP view restaurant_read_only;

--use savepoint learned in Chapter 15
savepoint a;

--use the concept of rollback after modifying the table neighborhood
insert into neighborhood (neighborhood)
values('lincoln park');
rollback;

--look to see if the new neighborhood is there (it shouldn't be)
select * from neighborhood;

-- creating a user to use the database. The first line allows you to create the user.
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER bob IDENTIFIED BY admin123;

--grating bob create session previleges 
grant create session to bobdba;

--create a profile limit that will lock an account after 5 attempts to get in 
create profile Iimited_profile limit
failed_login_attempts 5;

--make joe a user who will have this limitation
create user joe identified by mypassword
profile limited_profile;

--try to connect joe to the account with a wrong password
connect joe/dad;

--now alter the user account and unlock it so joe can login again.
alter user joe account unlock;

--removing a user
drop user joe;
drop user bob;
--creating a function, using cursors, using package dbms_output, using for loop,
--uses concatinating, return value, and %ROWCOUNT. This function averages the ratings.
SET SERVEROUTPUT ON;
create function avgRating RETURN NUMBER IS 
  total number(5,1);
  average number(3,1);
  cursor rating_cursor is 
    select restaurant.rating from restaurant;
begin
  total := 0;
  for rating_val in rating_cursor
    loop
      total := rating_val.rating + total;
      average := total/rating_cursor%ROWCOUNT;
    end loop;
  dbms_output.put_line('Rating average of all restaurants: ' || average);
  RETURN average;
END;
/

--EXECUTE THE function that was just created from dual.
select avgRating from dual;

--dropping a function
drop function avgRating;
