-- idCustomer PK , Fname, Minit, Lname, CPF, address, Birthdate, email, phone

insert into customer (Fname, Minit, Lname, CPF, address, Birthdate, email, phone) values
	('Carla', 'M', 'Pereira',32232543234,'Rua João Braz Mathias 1649 - 19014-190', '1998-06-19', 'carlinhap@yahoo.com.br', 37975787525),
    ('Raissa','F', 'Rocha', 72571785001, 'Rua Alaska 1998 - 78058-771', '1994-01-04', 'rah.f.rocha@outlook.com', 11994655360),
    ('Tânia', 'G', 'Dias', 41293032875, 'Rua Formosa 1060 - 12080-370', '2013-12-11','gdiastania@gmail.com', 47938282922),
    ('Nicolash', 'P', 'Castro', 37815968937, 'Avenida Açocê 1018 - 04075-023', '1987-11-23', 'niconico@hotmail.com', 11952932383),
    ('Arthur', 'J', 'Rodrigues', '62506051341', 'Rua das Pinhas 572 - 29104-310', '1945-03-09', 'arthurjrodrigues@gmail.com', 84996815508),
    ('Thiago', 'L', 'Santos', 56129510438, 'Rua Professora M Cristina 1536 - 13800-317', '1983-09-01', 'thiagocostasantos@teleworm.us', 16973706639);
    
    select * from customer;

-- idOrder PK, Order_status enum ('Cancelado', 'Processando', 'Enviado', 'Entregue') default 'Processando', id_order_customer, Freight, type_payment 
insert into order_buy (Order_status, id_order_customer, Freight, type_payment) values
	('Processando',13,0,'Pix'),
    ('Cancelado',16,0,'Cartão de crédito'),
    ('Entregue',17,10.00,'Boleto'),
    ('Entregue',14,25.00,'Dois cartões');
    select * from order_buy;
    
-- idProduct PK, category enum ('Eletronico','Roupa','Sapatos','Brinquedos') not null, Product_name, Detail, Size, Color, Selling_price, Buying_price
insert into product (category, Product_name, Detail, Size, Color, Selling_price, Buying_price) values
	('Roupa', 'Vestido floral','Vestido floral feminino, midi-size', 'M','Azul',89.99,20),
    ('Eletronico', 'Fone de Ouvido Gamer', 'Fone de ouvido gamer xpto alto rendimento', null, 'Preto', 109.99, 50),
    ('Sapatos', 'Tenis de corrida','Tenis de corrida', '40','Vermelho', 79.99, 60),
    ('Roupa', 'Calça Jeans','Calça do tipo skinny, tem elastano','G', 'Azul', 79.90, 50),
    ('Brinquedos', 'Boneca Lol', 'Boneca lol da coleção xpto', null, null, 190.90, 150),
    ('Sapatos', 'Tenis de corrida','Tenis de corrida', '38','Roxo', 79.99, 60),
    ('Brinquedos', 'Hot Wheels', 'Coleção patrulha canina', null, null, 25.99,20);
    select * from product;

-- idSeller PK, Razão_Social,  CNPJ,  CPF, Location, Nome_Fantasia, address, email, phone
insert into seller (Razão_Social,  CNPJ,  CPF, Location, Nome_Fantasia, address, email, phone) values
	('Benedita e Nair Comercio de Roupas ME',48279629000149, null, 2, null,'Rua Ayrton Senna, 614, Joinville', 'contato@beneditaenairme.com.br', 47981828868),
	('Thiago e Manoel Esportes Ltda',33206533000183, null, 3, null, 'Rua Conselheiro Mafra, 3604, Florianópolis','cobranca@thiagoemanoelesportesltda.com.br', 48981875017),
	('Bento e Pietro Comercio Ltda', 65881763000134, null, 3, null, 'Praça Luiz Salatiel de Moraes, 300, Caruaru', 'tesouraria@bentoepietrocomercioltda.com.br', 81997831374);
	select * from seller;

-- idSupplier PK, Razão_Social, CNPJ, Nome_Fantasia, address, email, phone
insert into supplier (Razão_Social, CNPJ, Nome_Fantasia, address, email, phone) values
	('Rodrigo e Daniel Eletrônica Ltda',93963478000106, null,'Rua F. Alves, 614, Campo Limpo Paulista', 'tesouraria@rodrigoedanieleletronicaltda.com.br', 11996564591),
	('Stella e Anderson Confecções Ltda',01248065000113, null, 'Rua João de M. Campos, 3604, Salto','administracao@stellaeandersonconfeccoesltda.com.br', 11989899234),
	('Aurora e Diego Sapataria Ltda', 01273112000189, null, 'Rua Dezoito, 810, São Paulo', 'sac@auroraediegosapatarialtda.com.br', 11987302373);
	select * from supplier;
    
-- storageLocation
insert into storageLocation (storagelocation) values
	('RJ'),
    ('RS'),
    ('PE');
    select * from storageLocation;
    
insert into relation_product_supplier (idProduct, idSupplier, Quantity, Purchase_date) values
	(22, 2, 14, current_date()),
    (23, 1, 15, current_date()),
    (24, 3, 20, '2023-06-15'),
    (27, 3, 13, '2023-08-04');
    
insert into has_storage (idProduct, idStorage, Quantity, Entry_date, Storage_status) values
	(22, 1, 26, '2023-08-15','Disponível'),
    (23, 1, 30, '2023-04-20','Disponível'),
    (24, 3, 60, '2023-05-08','Disponível'),
    (25, 2, 0, '2023-07-06','Sem estoque'),
    (26, 3, 0, '2023-07-15','Sem estoque'),
    (27, 3, 18, '2023-08-01','Disponível');
    
insert into relation_product_seller (idProduct, idSeller, Quantity, Sale_date, Sale_status) values
	(24, 8, 2, '2023-08-31', default),
    (23, 9, 1, '2023-08-25', 'Pagamento'),
    (27, 8, 1, '2023-09-01', default),
    (22, 8, 2, '2023-07-06','Enviado'),
    (22, 7, 3, '2023-07-22','Enviado');
    
insert into relation_product_order (idProduct, idOrder, Quantity, Product_order_status, Order_date) values 
	(22, 1, 2, 'No carrinho', '2023-08-31'),
    (27, 3, 3, 'Pago','2023-08-15'),
    (24, 2, 1, 'No carrinho', '2023-09-01'),
    (23, 3, 4, 'Pago','2023-08-29'),
    (24, 3, 1, 'Pago', '2023-08-31');