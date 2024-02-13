insert into customer(
	customer_id,
	first_name,
	last_name,
	phone_num
) values (
	1,
	'Gerald',
	'Lebowski',
	'(323)545-6324'
);

insert into customer(
	customer_id,
	first_name,
	last_name,
	phone_num
) values (
	2,
	'Larry',
	'Wurlitzer',
	'(760)252-5781'
);

insert into cars_for_sale(
	car_id,
	make,
	model,
	year_,
	color,
	price
) values (
	1,
	'ford',
	'fusion',
	2019,
	'Black',
	22300
)

insert into cars_for_sale(
	car_id,
	make,
	model,
	year_,
	color,
	price
) values (
	2,
	'toyota',
	'tocoma',
	2020,
	'grey',
	39863
);

insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) values (
	12,
	'Ryan',
	'French'
);

insert into salesperson(
	salesperson_id,
	first_name,
	last_name
) values (
	13,
	'John',
	'Jacob'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values (
	1,
	'Jason',
	'Vega'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name
) values (
	2,
	'Diego',
	'Martinez'
);

insert into parts (
	part_id,
	part_name,
	part_cost
) values (
	1,
	'head gasket',
	75
);

insert into parts (
	part_id,
	part_name,
	part_cost
) values (
	2,
	'spark plug',
	14
);

create or replace function add_part(_part_id INTEGER, _part_name_ VARCHAR, _part_cost INTEGER)
returns void
as $MAIN$
begin
	insert into parts(part_id,part_name,part_cost)
	values (_part_id,_part_name_,_part_cost);
end;
$MAIN$
language plpgsql;

select add_part(3,'alternator', 243);
select add_part(4,'muffler', 507);

insert into repair_ticket(
	ticket_id,
	car_id,
	customer_id
) values (
	23,
	1,
	1
);

insert into repair_ticket(
	ticket_id,
	car_id,
	customer_id
) values (
	24,
	2,
	2
);

insert into service_history(
	service_id,
	part_id,
	mechanic_id,
	ticket_id
) values (
	1,
	3,
	1,
	23
);

insert into service_history(
	service_id,
	mechanic_id,
	ticket_id
) values (
	2,
	2,
	24
);

insert into service_invoice(
	invoice_id,
	customer_id,
	ticket_id,
	service_id,
	total
) values (
	1,
	1,
	23,
	1,
	433
);

insert into service_invoice(
	invoice_id,
	customer_id,
	ticket_id,
	service_id,
	total
) values (
	2,
	2,
	24,
	2,
	55
);

insert into sale_invoice(
	invoice_id,
	sub_total,
	total,
	car_id,
	salesperson_id,
	customer_id
) values (
	1,
	22300,
	23300,
	1,
	12,
	1
);

insert into sale_invoice(
	invoice_id,
	sub_total,
	total,
	car_id,
	salesperson_id,
	customer_id
) values (
	2,
	39863,
	42000,
	2,
	13,
	2
); 