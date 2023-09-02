create database if not exists ecommerce;

use ecommerce;

create table customer(
	idCustomer int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    constraint unique_cpf_client unique (CPF),
    address varchar(45),
    Birthdate date not null
);
alter table customer auto_increment=1;
alter table customer add email varchar(25);
alter table customer add phone varchar(11);
alter table customer modify column email varchar (90);

desc customer;

create table order_buy(
	idOrder int auto_increment primary key,
    Order_status enum ('Cancelado', 'Processando', 'Enviado', 'Entregue') default 'Processando',
    id_order_customer int not null,
    Freight float,
    type_payment enum ('Cartão de crédito','Boleto','Cartão de débito','Pix','Dois cartões'),
    constraint fk_client foreign key (id_order_customer) references customer(idCustomer)
);
alter table order_buy auto_increment=1;


create table product(
	idProduct int auto_increment primary key,
    category enum ('Eletronico','Roupa','Sapatos','Brinquedos') not null,
    Product_name varchar(20) not null,
    Detail varchar(45),
    Size varchar(2),
    Color varchar(10),
    Selling_price float not null,
    Buying_price float not null
);
alter table product auto_increment=1;
alter table product add storageLocationId int;
alter table product add constraint fk_id_location foreign key (storageLocationId) references storageLocation (idStorage);

create table seller(
	idSeller int auto_increment primary key,
    Razão_Social VARCHAR(45) not null unique,
    CNPJ VARCHAR(15),
    CPF varchar(11),
    Location VARCHAR(45) not null,
    Nome_Fantasia VARCHAR(45),
    address varchar(45),
    constraint unique_seller_CNPJ unique (CNPJ),
    constraint unique_seller_CPF unique (CPF)
);
alter table seller auto_increment=1;
alter table seller add email varchar(25);
alter table seller add phone varchar(11);
alter table seller modify column email varchar (90);
desc seller;

create table supplier(
	idSupplier int auto_increment primary key,
    Razão_Social VARCHAR(45) not null unique,
    CNPJ VARCHAR(15) not null,
    Nome_Fantasia VARCHAR(45),
    address varchar(45),
    constraint unique_supplier_CNPJ unique (CNPJ)
);
alter table supplier auto_increment=1;
alter table supplier add email varchar(25);
alter table supplier add phone varchar(11);
alter table supplier modify column email varchar (90);

create table storageLocation(
	idStorage int auto_increment primary key,
    storageLocation varchar(45)
);
alter table storageLocation auto_increment=1;

create table relation_product_supplier(
	idProduct int,
    idSupplier int,
    Quantity int default 1,
    Purchase_date date not null,
    constraint pk_product_supplier primary key (idProduct, idSupplier),
    constraint fk_relation_product foreign key (idProduct) references product(idProduct),
    constraint fk_relation_supplier foreign key (idSupplier) references supplier(idSupplier)
);

create table has_storage(
	idProduct int,
    idStorage int,
    Quantity int not null,
    Entry_date date not null,
    Storage_status ENUM('Disponível', 'Sem estoque') not null,
    constraint pk_has_storage primary key (idProduct, idStorage),
    constraint fk_has_product foreign key (idProduct) references product(idProduct),
    constraint fk_has_storage foreign key (idStorage) references storageLocation(idStorage)
);

create table relation_product_seller(
	idProduct int,
    idSeller int,
    Quantity int default 1,
    Sale_date date,
    Sale_status ENUM('Faturamento', 'Pagamento', 'Enviado') default 'Faturamento',
    constraint pk_product_seller primary key (idProduct, idSeller),
    constraint fk_relation_productSeller foreign key (idProduct) references product(idProduct),
    constraint fk_relation_seller foreign key (idSeller) references seller(idSeller)
);

create table relation_product_order(
	idProduct int,
    idOrder int,
    Quantity int default 1,
    Product_order_status ENUM('Pago','No carrinho','Disponível') not null,
    Order_date date not null,
    constraint pk_product_order primary key (idProduct,idOrder),
    constraint fk_relation_productOrder foreign key (idProduct) references product(idProduct),
    constraint fk_relation_order foreign key (idOrder) references order_buy(idOrder)
);

