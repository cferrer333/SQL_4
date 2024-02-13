CREATE TABLE Salesperson (
  salesperson_id SERIAL primary key,
  first_name varchar(100),
  last_name varchar(100)
);

CREATE TABLE cars_for_sale (
  car_id SERIAL primary key,
  make varchar(50),
  model varchar(50),
  year_ INTEGER,
  color varchar(50),
  price INTEGER
);

CREATE TABLE customer (
  customer_id SERIAL primary key,
  first_name varchar(100),
  last_name varchar(100),
  phone_num INTEGER
);



CREATE TABLE parts (
  part_id SERIAL primary key,
  part_name varchar(150),
  part_cost INTEGER
);

CREATE TABLE mechanic (
  mechanic_id SERIAL primary key,
  first_name varchar(100),
  last_name varchar(100)
);

CREATE TABLE service_history (
  service_id SERIAL primary key,
  part_id INTEGER,
  mechanic_id INTEGER,
  ticket_id INTEGER,
  foreign key (part_id) references parts(part_id),
  foreign key (mechanic_id) references mechanic(mechanic_id)
);

CREATE TABLE sale_invoice (
  invoice_id SERIAL primary key,
  sub_total INTEGER,
  total INTEGER,
  car_id INTEGER,
  salesperson_id INTEGER,
  customer_id INTEGER,
  foreign key (car_id) references cars_for_sale(car_id),
  foreign key (salesperson_id) references salesperson(salesperson_id),
  foreign key (customer_id) references customer(customer_id)
);

CREATE TABLE repair_ticket (
  ticket_id SERIAL primary key,
  car_id INTEGER,
  customer_id INTEGER,
  foreign key (car_id) references cars_for_sale(car_id),
  foreign key (customer_id) references customer(customer_id)
);

CREATE TABLE service_invoice (
  invoice_id SERIAL,
  customer_id INTEGER,
  ticket_id INTEGER,
  service_id INTEGER,
  total INTEGER,
  foreign key (customer_id) references customer(customer_id),
  foreign key (ticket_id) references repair_ticket(ticket_id),
  foreign key (service_id) references service_history(service_id)
);

alter table customer
alter phone_num type varchar(50)