drop table vendors;
drop table Items;

create table vendors(ven_id number primary key,ven_name varchar2(20),meal_id varchar2(10));


create table Items(item_id number primary key,ven_id number,item_name varchar2(20),time_id varchar2(10),item_price number);


--INSERT COMMAND TO ADD VENDORS

INSERT INTO VENDORS VALUES(2001,'Alva','110');
INSERT INTO VENDORS VALUES(2002,'Juice Jun','111');
INSERT INTO VENDORS VALUES(2003,'Meals','010');
INSERT INTO VENDORS VALUES(2004,'Nature Delight','111');
	

--INSERT COMMAND TO ADD ITEMS

INSERT INTO Items VALUES(501,2001,'omlette','100',26);
INSERT INTO Items VALUES(502,2001,'bread omlette','100',30);
INSERT INTO Items VALUES(503,2001,'sandwich','110',35);
INSERT INTO Items VALUES(534,2001,'Fried Rice','010',51);

INSERT INTO Items VALUES(504,2002,'lemonade','111',20);
INSERT INTO Items VALUES(505,2002,'papaya juice','111',30);
INSERT INTO Items VALUES(506,2002,'orange juice','101',25);

INSERT INTO Items VALUES(507,2003,'north indian','010',55);
INSERT INTO Items VALUES(508,2003,'south indian','010',45);

INSERT INTO Items VALUES(509,2004,'samosa','001',10);
INSERT INTO Items VALUES(510,2004,'pakoda','001',15);
INSERT INTO Items VALUES(511,2004,'pav bhaji','011',30);
INSERT INTO Items VALUES(512,2004,'maggi','101',25);




BEGIN
dbms_output.put_line('Choose: a. Breakfast | b. Lunch | c. Snacks');

END;
/
DECLARE 
meal varchar2(10):='&MEALS';
 PROCEDURE cafe_vendors(meal varchar2)
 IS
 CURSOR cr1 IS SELECT ven_name,meal_id FROM vendors;
 rec1 cr1%rowtype;
 BEGIN
 OPEN cr1;
 LOOP
 FETCH cr1 INTO rec1;
 EXIT WHEN cr1%NOTFOUND;

--FOR BREAKFAST

 IF meal = 'a'
 THEN
 IF rec1.meal_id='100' OR rec1.meal_id='101' OR rec1.meal_id='111' OR rec1.meal_id='110'
 THEN
 dbms_output.put_line(rec1.ven_name);
END IF;

--FOR LUNCH

 ELSIF meal = 'b'
 THEN
 IF rec1.meal_id='010' OR rec1.meal_id='011' OR      rec1.meal_id='110' OR rec1.meal_id='111'
 THEN
 dbms_output.put_line(rec1.ven_name);
 END IF;

--FOR SNACKS

 ELSIF meal = 'c'
 THEN
 IF rec1.meal_id='001' OR rec1.meal_id='011' OR  rec1.meal_id='101' OR rec1.meal_id='111'
 THEN
 dbms_output.put_line(rec1.ven_name);
 END IF;

 END IF;
 END LOOP;
 CLOSE cr1;
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
 SELECT v.ven_id, v.ven_name, i.item_id, i.item_name, i.item_price, i.time_id FROM vendors v, items i WHERE v.ven_id=i.ven_id;
 rec cr%rowtype;
 BEGIN
 OPEN cr;
 LOOP
 FETCH cr INTO rec;
 EXIT WHEN cr%NOTFOUND;
 IF venName = rec.ven_name
 THEN

--For Breakfast

 IF rec.time_id='100' OR rec.time_id='101' OR rec.time_id='110' OR rec.time_id='111'
THEN
dbms_output.put_line(rec.item_id||' '||rec.item_name||' '||rec.item_price|| ' ' || rec.time_id);

--For Lunch

ELSIF rec.time_id='010' OR rec.time_id='110' OR rec.time_id='011' OR rec.time_id='111'
THEN
dbms_output.put_line(rec.item_id||' '||rec.item_name||' '||rec.item_price|| ' ' || rec.time_id);

--For Snacks

ELSIF rec.time_id='011' OR rec.time_id='101' OR rec.time_id='001' OR rec.time_id='111'
THEN
dbms_output.put_line(rec.item_id||' '||rec.item_name||' '||rec.item_price|| ' ' || rec.time_id);
 END IF;
END IF;
 END LOOP;
 CLOSE cr;
 END;


BEGIN

cafe_items(venName);
END;
/