/*Zad1*/
/*CREATE TABLE t_mesure
(
	id_messure int NOT NULL,
	names varchar(4) NOT NULL,
	CONSTRAINT pk_messure PRIMARY KEY (id_messure)
);*/

/*CREATE TABLE t_material
 (
 	id_material int NOT NULL,
 	names varchar(100) NOT NULL,
 	id_messure int NOT NULL,
 	CONSTRAINT pk_material PRIMARY KEY (id_material),
 	CONSTRAINT fk_messure FOREIGN KEY (id_messure) REFERENCES t_measure(id_messure)
 );*/

/* CREATE TABLE t_inprice 
 (
	id_material int NOT NULL,
	price_date date NOT NULL,
	price numeric(10, 2) CHECK (price >= 0),
	CONSTRAINT fk_inprice_material FOREIGN KEY (id_material) REFERENCES t_material (id_material)
);*/

CREATE TABLE t_store
(
	id_store int NOT NULL,
	names varchar(100) NOT NULL,
	CONSTRAINT pk_store PRIMARY KEY (id_store)
);

CREATE TABLE t_surplus
(
	id_store int NOT NULL,
	id_material int NOT NULL,
	volume int NOT NULL,
	CONSTRAINT fk_surplus_material FOREIGN KEY (id_material) REFERENCES t_material (id_material),
	CONSTRAINT fk_surplus_store FOREIGN KEY (id_store) REFERENCES t_store (id_store)
);

CREATE TABLE t_caterer
(
	id_caterer int NOT NULL,
	names varchar (100) NOT NULL,
	address text NOT NULL,
	phone int NOT NULL,
	fax int NOT NULL,
	CONSTRAINT pk_caterer PRIMARY KEY (id_caterer)
);

CREATE TABLE t_supply
(
	id_supply int NOT NULL,
	id_caterer int NOT NULL,
	id_store int NOT NULL,
	id_material int NOT NULL,
	supply_date date NOT NULL,
	volume real NOT NULL,
	CONSTRAINT fk_supply_caterer FOREIGN KEY (id_caterer) REFERENCES t_caterer (id_caterer),
	CONSTRAINT fk_supply_store FOREIGN KEY (id_store) REFERENCES t_store (id_store),
	CONSTRAINT fk_supply_material FOREIGN KEY (id_material) REFERENCES t_material (id_material)
);

CREATE TABLE t_employer
(
	id_employer varchar (100) NOT NULL,
	surname varchar (100) NOT NULL,
	names varchar (100) NOT NULL,
	father_name varchar (100) NOT NULL,
	CONSTRAINT pk_employer PRIMARY KEY (id_employer)
);

CREATE TABLE t_section
(
	id_section int NOT NULL,
	names varchar (100) NOT NULL,
	id_employer varchar (100) NOT NULL,
	CONSTRAINT pk_section PRIMARY KEY (id_section),
	CONSTRAINT fk_section_employer FOREIGN KEY (id_employer) REFERENCES t_employer (id_employer)
);

CREATE TABLE t_deliver
(
	id_deliver varchar (100) NOT NULL,
	id_material int NOT NULL,
	id_store int NOT NULL,
	id_section int NOT NULL,
	deliver_date date NOT NULL,
	CONSTRAINT fk_deliver_material FOREIGN KEY (id_material) REFERENCES t_material (id_material),
	CONSTRAINT fk_deliver_section FOREIGN KEY (id_section) REFERENCES t_section (id_section)
);
/*Zad2*/
ALTER TABLE t_caterer
DROP address,
ADD legal_address text,
ADD fact_address text,
ADD mail varchar(250);
/*Zad3*/
ALTER TABLE t_inprice
DROP CONSTRAINT fk_inprice_material,
ADD CONSTRAINT pk_inprice_price_date PRIMARY KEY (price_date,id_material);

/*Zad4*/
CREATE TABLE t_group
(
	id_material int NOT NULL,
	id_group int NOT NULL,
	name_material int NOT NULL,
	CONSTRAINT fk_group_material FOREIGN KEY (id_material) REFERENCES t_material (id_material) ON DELETE SET NULL
);