CREATE DATABASE wine_shop;

USE wine_shop;

/*DOMANDE:
1. l'ordine di acquisto potrebbe essere la stessa cosa della proposta di acquisto. nel file non c'è nessun attributo riferito all'ordine di acquisto.
2. nel caso di cardinalità 1 a N, l'N 
*/

CREATE TABLE user(
    firstname varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    tax_code varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone_number varchar(50) NOT NULL,
    user_address varchar(50) NOT NULL,
    primary key (email)
);

CREATE TABLE courier(
    firstname varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    tax_code varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone_number varchar(50) NOT NULL,
    user_address varchar(50) NOT NULL,
    primary key (email)
);

CREATE TABLE supplier(
    firstname varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    tax_code varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone_number varchar(50) NOT NULL,
    user_address varchar(50) NOT NULL,
    fk_courier_email varChar(50) NOT NULL,
    fk_purchase_order_id varChar(5) NOT NULL,
    fk_wine_name varChar(50) NOT NULL,
    foreign key (fk_courier_email) references courier(email),
    foreign key (fk_purchase_order_id) references purchase_order(id), 
    foreign key (fk_wine_name) references wine(wine_name),
    primary key (email)
);

CREATE TABLE wine(
    wine_name varChar(50) NOT NULL,
    productor varChar(50) NOT NULL,
    provenance varChar(50) NOT NULL,
    wine_year varChar(50) NOT NULL,
    tecnical_note varChar(200) NOT NULL,
    vine_of_origin varChar(50) NOT NULL,
    n_bottles integer,
    price_bottle float NOT NULL,
    fk_supplier_email varChar(50) NOT NULL,
    fk_sales_order_id integer(5) NOT NULL,
    fk_purchase_proposal_id integer(5) NOT NULL,
    foreign key(fk_supplier_email) references supplier(email),
    foreign key(fk_sales_order_id) references sales_order(id),
    foreign key(fk_purchase_proposal_id) references purchase_proposal(id),
    primary key (wine_name)
);

CREATE TABLE report(
    id integer(5) NOT NULL AUTO_INCREMENT,
    income float NOT NULL,
    expenses float NOT NULL,
    n_bottles_sold integer,
    n_bottles_available integer NOT NULL,
    n_bottles_sold_each_wine integer,
    employees_valutation varChar(100) NOT NULL,
    primary key (id)
);

CREATE TABLE sales_order /*Ordine di vendita*/(
    id integer(5) NOT NULL AUTO_INCREMENT,
    fk_user_firstname varChar(50) NOT NULL,
    fk_name_wine varChar(50) NOT NULL,
    n_bottles integer(100) NOT NULL,
    total_price float NOT NULL,
    delivery_address varChar(50) NOT NULL,
    delivery_date date NOT NULL,
    foreign key (fk_user_firstname) references user(firstname),
    foreign key (fk_name_wine) references wine(wine_name),
    primary key (id)
);

CREATE TABLE purchase_order /*Ordine di acquisto*/( /*DA FINIRE PERCHE NEL PDF NON CI SONO SCRITTI GLI ATTRIBUTI*/
    id integer(5) NOT NULL AUTO_INCREMENT,
    fk_user_firstname varChar(50) NOT NULL,
    fk_supplier_email varChar(50) NOT NULL,
    foreign key (fk_user_firstname) references user(firstname),
    foreign key (fk_supplier_email) references supplier(email),
    primary key (id)
);

CREATE TABLE purchase_proposal /*Proposta di acquisto*/(
    id integer(5) NOT NULL AUTO_INCREMENT,
    n_bottles integer(100) NOT NULL,
    user_address varChar(50) NOT NULL,
    fk_wine_name varChar(50) NOT NULL,
    foreign key (fk_wine_name) references wine(wine_name),
    primary key (id)
);