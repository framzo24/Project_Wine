CREATE DATABASE wine_shop;

USE wine_shop;

/*DOMANDE:
1. l'ordine di acquisto potrebbe essere la stessa cosa della proposta di acquisto. nel file non c'è nessun attributo riferito all'ordine di acquisto.
2. dato che una fk deve fare la referenza ad una pk, nel caso della proposta di acquisto in cui all'interno deve essere l'indirizzo di consegna, esso non deve essere una fk.
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
    foreign key (fk_name_wine) references wine(wine_name)
);

CREATE TABLE purchase_order /*Ordine di acquisto*/(
    id integer(5) NOT NULL AUTO_INCREMENT,
);

CREATE TABLE purchase_proposal /*Proposta di acquisto*/(
    id integer(5) NOT NULL AUTO_INCREMENT,
    n_bottles integer(100) NOT NULL,
    fk_user_address varChar(50) NOT NULL, /*SBAGLIATO DOMANDA 2*/
    fk_wine_name varChar(50) NOT NULL,
    foreign key (fk_wine_name) references wine(wine_name),
    foreign key (fk_user_address) references user(user_address), /*SBAGLIATO DOMANDA 2*/
);