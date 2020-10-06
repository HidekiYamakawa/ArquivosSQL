create table Vendas(
    codigo numeric(10),
    vendedor varchar,
    dt_venda date,
    valor numeric(10,2),
    Constraint codigopk primary key(codigo)
    );
    
insert into Vendas(codigo,vendedor,dt_venda,valor) values
(1,'Fallen','2018-07-01',230.00),
(2,'Fer','2018-08-30',300.00),
(3,'Cold','2018-07-07',50.00),
(4,'Taco','2018-07-15',2000.00),
(5,'Fallen','2018-07-20',12000.00),
(6,'Fer','2018-07-26',32000.00),
(7,'Cold','2018-07-31',4300.00),
(8,'Taco','2018-08-03',5000.00),
(9,'Fallen','2018-08-12',8700.00),
(10,'Fer','2018-08-12',20000.00),
(11,'Cold','2018-08-12',400.00),
(12,'Taco','2018-08-14',4500.00),
(13,'Fallen','2018-08-23',3000.00),
(14,'Fallen','2018-08-23',5600.00),
(15,'Fallen','2018-08-23',9000.00)

select sum(valor) from Vendas;

select vendedor,sum(valor) from Vendas group by vendedor;

select count(*) from Vendas;

select vendedor,count(*) from Vendas group by vendedor;

select min(valor),max(valor) from Vendas;

select vendedor,min(valor),max(valor) from Vendas group by vendedor;

select round(avg(valor),2) from Vendas;

select round(avg(valor),2),dt_venda from Vendas where dt_venda='2018-08-23' or dt_venda='2018-08-12' group by dt_venda;