-- Quantos pedidos foram feitos por cada cliente?
select concat(c.Fname, ' ', c.Minit, '. ', c.Lname) as Full_Name, count(*) as Quantity
from customer c
join order_buy o on c.idCustomer = o.id_order_customer
group by c.idCustomer;

-- Nome do fornecedor de cada produto e suas quantidades
select s.Razão_Social, p.Product_name, r.Quantity
from supplier s
join relation_product_supplier r on s.idSupplier = r.idSupplier
join product p on r.idProduct = p.idProduct
order by p.Product_name;

-- Qual produto foi teve mais pedidos?
select p.Product_name, count(*) as Quantity
from relation_product_seller r
join product p on p.idProduct = r.idProduct
group by p.idProduct having Quantity > 1;

-- Se o produto tem no estoque
select p.Product_name, h.quantity
from product p, has_storage h where p.idProduct = h.idProduct
order by h.Quantity;

-- Qual é o produto com maior margem de lucro?
select p.Product_name, round(p.Selling_price - p.Buying_price,2) as Profit
from product p
order by Profit desc;