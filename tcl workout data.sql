create table tcl(
id int,
name varchar(30),
bala int
);

insert into tcl(id, name, bala) values
(101, 'ravi', 5000),
(102, 'ram', 2500),
(103, 'ranga', 3000);

select * from tcl;

drop table tcl;

#begin trans
start transaction;

#scenario 1 for rollback without commit
update tcl set bala=5000 where id=103;

rollback;

commit;

#scenario 2 for rollback without commit
update tcl set bala=10000 where id=103;

commit;

rollback;

insert into tcl(id, name, bala) values
(104,'hari',4000),
(105,'krish',4500);

