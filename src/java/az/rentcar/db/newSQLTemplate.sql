/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  anarx
 * Created: Apr 7, 2019
 */



select * from marka_car;
create table marka_car(
id number primary key,
name varchar2(255)
);
create sequence marka_car_seq start with 1  increment by 1 ;
insert into MARKA_CAR values (marka_car_seq.nextval,'AUDI');
insert into MARKA_CAR values (marka_car_seq.nextval,'BMW');
insert into MARKA_CAR values (marka_car_seq.nextval,'Hundai');
insert into MARKA_CAR values (marka_car_seq.nextval,'Mercedes');
insert into MARKA_CAR values (marka_car_seq.nextval,'Opel');
insert into MARKA_CAR values (marka_car_seq.nextval,'Toyota');
insert into MARKA_CAR values (marka_car_seq.nextval,'Lada');
insert into MARKA_CAR values (marka_car_seq.nextval,'KIA');

create table model_car(
id number  PRIMARY key,
name varchar2(255),
marka_id number,
CONSTRAINT model_id_fk FOREIGN key(marka_id) REFERENCES  marka_car(id)

);
create sequence model_car_seq start with 1  increment by 1 ;
select * from MODEL_CAR;
insert into MODEL_CAR values(model_car_seq.nextval, 'Camry',7);
insert into MODEL_CAR values(model_car_seq.nextval, 'Corolla',7);
insert into MODEL_CAR values(model_car_seq.nextval, 'Prado',7);
insert into MODEL_CAR values(model_car_seq.nextval, 'Prius',7);
insert into MODEL_CAR values(model_car_seq.nextval, 'Land Cruiser',7);


insert into MODEL_CAR values(model_car_seq.nextval, 'Astra',6);
insert into MODEL_CAR values(model_car_seq.nextval, 'Vita',6);
insert into MODEL_CAR values(model_car_seq.nextval, 'Vectra',6);
insert into MODEL_CAR values(model_car_seq.nextval, 'Sentra',6);
insert into MODEL_CAR values(model_car_seq.nextval, 'Omega',6);




create table rent_car(
ID number primary key,	
Marka_id number,
Model_id number,
Type 	varchar2(255),
Year	varchar2(4),
Motor	varchar2(4),
Color	varchar2(40),
Transmission	 varchar2(40),
Price varchar2(255),
constraint rc_marka_id_fk FOREIGN key (Marka_id) REFERENCES marka_car(id),
constraint rc_model_id_fk FOREIGN key (Model_id) REFERENCES model_car(id)
);
create sequence rent_car_seq start with 1  increment by 1 ;


select * from model_car where id=7;
select * from model_car where marka_id=7;

