DROP TABLE vendors;
DROP TABLE Items;
DROP TABLE duration;
DROP TABLE employee;
DROP TABLE bill_table;


create table vendors(ven_id number primary key,ven_name varchar2(20),meal_id varchar2(10));


create table Items(item_id number primary key,ven_id number,item_name varchar2(20),time_id varchar2(10),item_price number);

create table duration(ven_id number,time_name varchar2(20));

CREATE TABLE employee(emp_id number,emp_name varchar2(20),pwd varchar2(20));

CREATE TABLE bill_table(i_id number,i_name varchar2(20),i_price number,qty number);

--INSERT COMMAND TO ADD EMPLOYEE

INSERT INTO employee VALUES(160689,'Neeraj','nk1234');
INSERT INTO employee VALUES(160652,'Kshitij','ks1234');
INSERT INTO employee VALUES(160568,'Bhavesh','bh1234');
INSERT INTO employee VALUES(160567,'Ashmita','as1234');
INSERT INTO employee VALUES(160746,'Shashank','sk1234');


--INSERT COMMAND TO ADD VENDORS

INSERT INTO VENDORS VALUES(2001,'Alva','110');
INSERT INTO VENDORS VALUES(2002,'Juice Jun','111');
INSERT INTO VENDORS VALUES(2003,'Meals','010');
INSERT INTO VENDORS VALUES(2004,'Nature Delight','111');
INSERT INTO VENDORS VALUES(2005,'Tea Mount','101');
INSERT INTO VENDORS VALUES(2006,'Corporate Cafe','111');
INSERT INTO VENDORS VALUES(2007,'Dosa Corner','011');
INSERT INTO VENDORS VALUES(2008,'Mugs N Burger','001');
INSERT INTO VENDORS VALUES(2009,'Mughlai Delight','010');
INSERT INTO VENDORS VALUES(2010,'Delim Cafe','101');	

--INSERT COMMAND TO ADD ITEMS

INSERT INTO Items VALUES(501,2001,'omlette','101',26);
INSERT INTO Items VALUES(502,2001,'bread omlette','101',30);
INSERT INTO Items VALUES(503,2001,'egg sandwich','101',35);
INSERT INTO Items VALUES(504,2001,'egg bhurji','011',25);
INSERT INTO Items VALUES(505,2001,'egg bhurji with paratha','010',45);
INSERT INTO Items VALUES(506,2001,'egg bhurji with roti','010',42);
INSERT INTO Items VALUES(507,2001,'egg masala','010',30);
INSERT INTO Items VALUES(508,2001,'egg fried rice','010',50);

INSERT INTO Items VALUES(509,2002,'lemonade','111',20);
INSERT INTO Items VALUES(510,2002,'papaya juice','111',30);
INSERT INTO Items VALUES(511,2002,'orange juice','111',25);
INSERT INTO Items VALUES(512,2002,'lime soda','111',15);
INSERT INTO Items VALUES(513,2002,'kokum juice','111',15);
INSERT INTO Items VALUES(514,2002,'banana shake','111',10);
INSERT INTO Items VALUES(515,2002,'wheat gross','111',43);
INSERT INTO Items VALUES(516,2002,'jaljeera','111',15);

INSERT INTO Items VALUES(517,2003,'north indian','010',55);
INSERT INTO Items VALUES(518,2003,'south indian','010',45);
INSERT INTO Items VALUES(518,2003,'Non-Veg Meal','010',75);

INSERT INTO Items VALUES(519,2004,'samosa','001',10);
INSERT INTO Items VALUES(520,2004,'pakoda','001',15);
INSERT INTO Items VALUES(521,2004,'pav bhaji','011',30);
INSERT INTO Items VALUES(522,2004,'veg maggi','101',25);
INSERT INTO Items VALUES(523,2004,'paneer puff','001',20);
INSERT INTO Items VALUES(524,2004,'cheese maggi','101',30);
INSERT INTO Items VALUES(525,2004,'brown bread','101',05);
INSERT INTO Items VALUES(526,2004,'veg puff','101',15);

INSERT INTO Items VALUES(527,2005,'green tea','101',10);
INSERT INTO Items VALUES(528,2005,'boost','101',10);
INSERT INTO Items VALUES(529,2005,'ragi malt','101',10);
INSERT INTO Items VALUES(530,2005,'mumbai ginger','101',10);
INSERT INTO Items VALUES(531,2005,'bru coffee','101',08);
INSERT INTO Items VALUES(532,2005,'black mint tea','101',08);
INSERT INTO Items VALUES(533,2005,'irish coffee','101',45);
INSERT INTO Items VALUES(534,2005,'espresso','101',20);

INSERT INTO Items VALUES(535,2006,'spicy panner pizza','001',55);
INSERT INTO Items VALUES(536,2006,'special pizza','001',60);
INSERT INTO Items VALUES(537,2006,'veggi pizza','001',45);
INSERT INTO Items VALUES(538,2006,'baby corn pizza','001',20);
INSERT INTO Items VALUES(539,2006,'masala oats','101',22);
INSERT INTO Items VALUES(540,2006,'pracel','001',05);
INSERT INTO Items VALUES(541,2006,'veg cheese','001',30);
INSERT INTO Items VALUES(542,2006,'choco bread','101',36);

INSERT INTO Items VALUES(543,2007,'set dosa','010',35);
INSERT INTO Items VALUES(544,2007,'onion masala dosa','010',39);
INSERT INTO Items VALUES(545,2007,'masala dosa','010',30);
INSERT INTO Items VALUES(546,2007,'idly vada','010',32);
INSERT INTO Items VALUES(547,2007,'paneer masala dosa','010',45);
INSERT INTO Items VALUES(548,2007,'uttpam','010',28);
INSERT INTO Items VALUES(549,2007,'vada smabar','010',25);
INSERT INTO Items VALUES(550,2007,'paper masala','010',35);

INSERT INTO Items VALUES(551,2008,'veg burger','101',35);
INSERT INTO Items VALUES(552,2008,'paneer tikka','101',50);
INSERT INTO Items VALUES(553,2008,'egg burger','101',40);
INSERT INTO Items VALUES(554,2008,'umami burger','101',40);
INSERT INTO Items VALUES(555,2008,'american hamburger','101',60);
INSERT INTO Items VALUES(556,2008,'pug burger','101',30);
INSERT INTO Items VALUES(557,2008,'green chile burger','101',55);
INSERT INTO Items VALUES(558,2008,'chile stuffed cheese burger','101',45);

INSERT INTO Items VALUES(559,2009,'mughlai pulao','010',50);
INSERT INTO Items VALUES(560,2009,'shahi tukda','010',65);
INSERT INTO Items VALUES(561,2009,'roghni naan','010',30);
INSERT INTO Items VALUES(562,2009,'nargisi kofta','010',45);
INSERT INTO Items VALUES(563,2009,'murg malai kebab','010',53);
INSERT INTO Items VALUES(564,2009,'chicken korma','010',50);
INSERT INTO Items VALUES(565,2009,'akbari daal','010',37);
INSERT INTO Items VALUES(566,2009,'chicken briyani','010',50);

INSERT INTO Items VALUES(567,2010,'shortcrust pastry','111',25);
INSERT INTO Items VALUES(568,2010,'puff pastry','111',25);
INSERT INTO Items VALUES(569,2010,'flaky pastry','111',30);
INSERT INTO Items VALUES(570,2010,'choux pastry','111',35);
INSERT INTO Items VALUES(571,2010,'suet crust pastry','111',40);
INSERT INTO Items VALUES(572,2010,'pate sucree pastry','111',50);
INSERT INTO Items VALUES(573,2010,'strudel','111',45);
INSERT INTO Items VALUES(574,2010,'danish pastry','111',43);


BEGIN
dbms_output.put_line('Enter your employee id and password');
END;
/

DECLARE
empID number:=&empID;
passwd varchar2(20):='&password';
flag number;



PROCEDURE verify
IS
CURSOR login
IS
SELECT emp_id,pwd FROM employee; 
log login%rowtype;

BEGIN
OPEN login;
LOOP
FETCH login INTO log;
EXIT WHEN login%NOTFOUND;
flag :=0;
IF (log.emp_id=empID AND log.pwd=passwd)
THEN
dbms_output.put_line('Welcome to Capgemini Cafe' || log.emp_id);
EXIT;
ELSE
flag:=1;
END IF;
END LOOP;
CLOSE login;

IF flag=1
THEN
dbms_output.put_line('Enter the Correct credentials');
END IF;
END;

BEGIN

dbms_output.put_line(chr(13)||chr(10));

verify;
END;
/


BEGIN

dbms_output.put_line('Choose: a. Breakfast | b. Lunch | c. Snacks');

END;
/

DECLARE 
opt EXCEPTION ;
meal varchar2(10):='&MEALS';
 PROCEDURE cafe_vendors(meal varchar2)
 IS
 CURSOR cr1 IS SELECT ven_id,ven_name,meal_id FROM vendors;
 rec1 cr1%rowtype;
 BEGIN
 OPEN cr1;
 LOOP
 FETCH cr1 INTO rec1;
 EXIT WHEN cr1%NOTFOUND;


--FOR BREAKFAST

 IF meal = 'a' OR meal = 'A'
 THEN
INSERT INTO duration values(rec1.ven_id,'break');
 IF rec1.meal_id='100' OR rec1.meal_id='101' OR rec1.meal_id='111' OR rec1.meal_id='110'
 THEN
 dbms_output.put_line(rec1.ven_name);
END IF;

--FOR LUNCH

 ELSIF meal = 'b' OR meal = 'B'
 THEN
INSERT INTO duration values(rec1.ven_id,'lunch');
 IF rec1.meal_id='010' OR rec1.meal_id='011' OR      rec1.meal_id='110' OR rec1.meal_id='111'
 THEN
 dbms_output.put_line(rec1.ven_name);
 END IF;

--FOR SNACKS

 ELSIF meal = 'c' OR meal = 'C'
 THEN
INSERT INTO duration values(rec1.ven_id,'snacks');
 IF rec1.meal_id='001' OR rec1.meal_id='011' OR  rec1.meal_id='101' OR rec1.meal_id='111'
 THEN
 dbms_output.put_line(rec1.ven_name);
 END IF;

 ELSE
 RAISE opt;
 END IF;
 END LOOP;

 CLOSE cr1;

EXCEPTION
 WHEN opt
 THEN
 dbms_output.put_line(chr(10)||'Invalid Input');

 END ;

BEGIN
cafe_vendors(meal);

END;
/

BEGIN
dbms_output.put_line('Choose Your Vendor');

END;
/


DECLARE
venName varchar2(20):='&VENDORS';

PROCEDURE cafe_items(venName varchar2) 
 IS
 CURSOR cr IS
 SELECT v.ven_id, v.ven_name, i.item_id, i.item_name, i.item_price, i.time_id, d.time_name FROM vendors v, items i,duration d WHERE v.ven_id=i.ven_id AND v.ven_id=d.ven_id;
 rec cr%rowtype;
 BEGIN
--OPEN cr;

FOR I in cr
 LOOP
--FETCH cr INTO rec;
--EXIT WHEN cr%NOTFOUND;

	
--For Breakfast

IF venName=I.ven_name AND I.time_name='break'
THEN
 IF I.time_id='100' OR I.time_id='101' OR I.time_id='110' OR I.time_id='111'
THEN
dbms_output.put_line(I.item_id||' '||I.item_name||' '||I.item_price);
END IF;


--For Lunch

ELSIF venName=I.ven_name AND I.time_name='lunch'
THEN
IF I.time_id='010' OR I.time_id='110' OR I.time_id='011' OR I.time_id='111'
THEN
dbms_output.put_line(I.item_id||' '||I.item_name||' '||I.item_price);
END IF;

--For Snacks

ELSIF  venName=I.ven_name AND I.time_name='snacks' 
  THEN
 IF I.time_id='011' OR I.time_id='101' OR I.time_id='001' OR I.time_id='111'
    THEN
	dbms_output.put_line(I.item_id||' '||I.item_name||' '||I.item_price);
    END IF;
END IF;
 	END LOOP;
 --CLOSE cr;
 END;


BEGIN

cafe_items(venName);
END;
/




DECLARE
	item number:=&ItemID;
	qty number:=&Quantity;

PROCEDURE input(item number) 
   IS
CURSOR bill_cr IS
SELECT item_price, item_name FROM Items WHERE item_id=item;
cal bill_cr%rowtype;
BEGIN
OPEN bill_cr;
LOOP
FETCH bill_cr INTO cal;
EXIT WHEN bill_cr%NOTFOUND;
INSERT INTO bill_table VALUES(item,cal.item_name,cal.item_price,qty);
END LOOP;
CLOSE bill_cr;
END;

BEGIN

input(item);
END;
/


BEGIN
dbms_output.put_line('Want to add more items: Y/N ?');
END;
/




DECLARE
	tot number;
	f_tot number:=0;
	choice varchar2(20):='&Choice';
PROCEDURE cal_bill(choice varchar2)
IS
  CURSOR cal IS SELECT i_name,i_id,i_price,qty FROM bill_table;
	cal1 cal%rowtype;
BEGIN
OPEN cal;
LOOP
FETCH cal into cal1;
EXIT WHEN cal%notfound;
IF choice='n'
  THEN
	
	dbms_output.put_line(cal1.i_id     ||'     '||cal1.i_name||'    '||cal1.i_price||'         '||cal1.qty);

	tot:=cal1.qty*cal1.i_price;
	f_tot:=f_tot+tot;

END IF;
END LOOP;
CLOSE cal;
END;

BEGIN
dbms_output.put_line('Item ID|'||' '||'Item Name'||'     '||'Item Price'||' '||'Quantity');
cal_bill(choice);
dbms_output.put_line(chr(13));
dbms_output.put_line('Total:'||f_tot);
END;
/

