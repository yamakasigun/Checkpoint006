Use NVLE

go

Create Table Customers
(
Customer_id int identity (1,1) primary key,
Customer_Name varchar (200) not null,
Customer_Tel int  not null,
);

Create Table Products
(
Product_id int identity (1,1) primary key,
Product_name varchar(200) not null,
Category varchar(200) not null,
Price int,
);

Create Table Orders
(
fkOrders_Costumers int foreign key references Customers (Customer_id),
fkOrders_Products int foreign key references Products (Product_id),
Order_date date,
Quantity int not null,
Total_amount int,
);

-----------------------------------------

alter table dbo.Products
alter column Price float not null

------------------------------------------

alter table dbo.Orders
alter column Total_amount float not null

------------------------------------------

Insert into Customers(Customer_Name, Customer_Tel)
values('Fall', 769854512);

Insert into Customers(Customer_Name, Customer_Tel)
values('Moussa', 777415258);

Insert into Customers(Customer_Name, Customer_Tel)
values('Kodou', 788966998);

Insert into Customers(Customer_Name, Customer_Tel)
values('Mariama', 775263554);

Insert into Customers(Customer_Name, Customer_Tel)
values('Souley', 771235984);

Insert into Customers(Customer_Name, Customer_Tel)
values('Justin', 783578694);

Insert into Customers(Customer_Name, Customer_Tel)
values('Penda', 781254215);

Insert into Customers(Customer_Name, Customer_Tel)
values('Roland', 773698545)

Insert into Customers(Customer_Name, Customer_Tel)
values('Maxime', 777778577)

Insert into Customers(Customer_Name, Customer_Tel)
values('Alex', 775896542)

---------------------------------------------------------


Insert into Products(Product_Name, Category, Price )
values('Jouet', 'widget', 25.6)

Insert into Products(Product_Name, Category, Price )
values('Cube', 'gadget', 45.2)

Insert into Products(Product_Name, Category, Price )
values('Porte clé', 'doohickey', 32.1)

Insert into Products(Product_Name, Category, Price )
values('Cube magique', 'doohickey', 55.3)

Insert into Products(Product_Name, Category, Price )
values('peluche', 'widget', 88.6)

Insert into Products(Product_Name, Category, Price )
values('montre connectée', 'gadget', 74.5)

Insert into Products(Product_Name, Category, Price )
values('sifflet', 'gadget', 88.2)

Insert into Products(Product_Name, Category, Price )
values('Nounousse', 'doohickey', 95.1)

Insert into Products(Product_Name, Category, Price )
values('cloud', 'widget', 100.09)

Insert into Products(Product_Name, Category, Price )
values('camera', 'gadget', 500.23)

------------------------------------------------------------

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/11/20', 2, 51.2)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/02/25', 5, 226)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/04/14', 2, 62.2)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/06/23', 3, 165.9)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2021/08/06', 4, 354.4)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2021/01/28', 2, 149)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/07/16', 4, 352.8)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2021/11/15', 2, 190.2)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2021/09/03', 4, 400.36)

Insert into Orders(Order_date, Quantity, Total_amount)
values('2022/10/10', 3, 1500.69)
----------------------------------------------------------------------------------------------
Nouvelles entrées.....

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(7, 5, '2022/10/05', 5, 443)

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(2, 3, '2022/04/12', 6, 192.6)

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(7, 10, '2022/10/13', 8, 4001.84)

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(2, 3, '2022/05/26', 60, 1926)

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(4, 1, '2022/11/25', 7, 179.2)

Insert into Orders(fkOrders_Costumers,fkOrders_Products,Order_date, Quantity, Total_amount)
values(4, 5, '2022/06/29', 12, 1063.2)

---------------------------------------------------------------------


select Customer_Name, Total_amount
from Customers
inner join Orders
on Customers.Customer_id = Orders.fkOrders_Costumers

----------------------------------------------------------------------------------
Ce bout de code m a permis de mettre à jour les clé étrangères dans Orders
----------------------------------------------------------------------------------
UPDATE Orders
SET fkOrders_Products = 1
WHERE Total_amount =51.2
----------------------------------------------------------------------------------

1)Écrivons une requête SQL pour récupérer les noms des clients qui ont commandé au moins un widget et au moins un gadget, 
ainsi que le coût total des widgets et gadgets commandés par chaque client. Le coût de chaque article doit être calculé 
en multipliant la quantité par le prix du produit.
--------------------------------------------------------------
SELECT Customer_Name,Category,(Price*Quantity) AS "Coûts total widget et gadgets"
FROM Customers, Orders, Products
WHERE Customers.Customer_id=Orders.fkOrders_Costumers AND Products.Product_id = Orders.fkOrders_Products AND Products.category IN('widget','gadget')

-------------------------------------------------------------------------------------------------------
2)Écrivons une requête pour récupérer les noms des clients qui ont commandé au moins un widget, 
ainsi que le coût total des widgets commandés par chaque client.
-------------------------------------------------------------------------------------------------------
SELECT Customer_Name,Category,(Price*Quantity) AS "Coûts total widget"
FROM Customers, Orders, Products
WHERE Customers.Customer_id=Orders.fkOrders_Costumers AND Products.Product_id = Orders.fkOrders_Products AND Products.category IN('widget')

------------------------------------------------------------------------------------------------------------
3)Rédigez une requête pour récupérer les noms des clients qui ont passé une commande pour au moins un gadget, 
ainsi que le coût total des gadgets commandés par chaque client.
------------------------------------------------------------------------------------------------------------
SELECT Customer_Name,Category,(Price*Quantity) AS "Coûts total gadgets"
FROM Customers, Orders, Products
WHERE Customers.Customer_id=Orders.fkOrders_Costumers AND Products.Product_id = Orders.fkOrders_Products AND Products.category IN('gadget')

-------------------------------------------------------------------------------------------------------------
4)Écrivez une requête pour récupérer les noms des clients qui ont commandé au moins un doohickey, 
ainsi que le coût total des doohickeys commandés par chaque client.
-------------------------------------------------------------------------------------------------------------
SELECT Customer_Name,Category,(Price*Quantity) AS "Coûts Total des doohickey"
FROM Customers, Orders, Products
WHERE Customers.Customer_id=Orders.fkOrders_Costumers AND Products.Product_id = Orders.fkOrders_Products AND Products.category IN('doohickey')

-------------------------------------------------------------------------------------------------------------
5)Rédigeons une requête pour récupérer le nombre total de widgets et de gadgets commandés par chaque client,
ainsi que le coût total des commandes.
-------------------------------------------------------------------------------------------------------------
SELECT Customer_Name,Category,Quantity,(Price*Quantity) AS "Coûts total widget et gadgets"
FROM Customers, Orders, Products
WHERE Customers.Customer_id=Orders.fkOrders_Costumers AND Products.Product_id = Orders.fkOrders_Products AND Products.category IN('widget','gadget')
GROUP BY Customer_Name, Products.Category, Orders.Quantity,Products.Price

--------------------------------------------------------------------------------------------------------------
6)Écrivons une requête pour récupérer les noms des produits qui ont été commandés par au moins un client, 
ainsi que la quantité totale de chaque produit commandé.
---------------------------------------------------------------------------------------------------------------
SELECT Product_name, Quantity
FROM Products
INNER JOIN Orders
ON Products.Product_id = fkOrders_Products

---------------------------------------------------------------------------------------------------------------
7)Rédigeons une requête pour récupérer les noms des clients qui ont passé le plus de commandes, 
ainsi que le nombre total de commandes passées par chaque client.
---------------------------------------------------------------------------------------------------------------
(J_AI PAS PU ECRIRE CETTE REQUETE)

-----------------------------------------------------------------------------------------------------------------------------------------
8)Rédigeons une requête pour récupérer les noms des produits les plus commandés, ainsi que la quantité totale de chaque produit commandé.
-----------------------------------------------------------------------------------------------------------------------------------------

SELECT Product_name, Quantity
FROM Orders
JOIN Products
ON Orders.fkOrders_Costumers=Products.Product_id
ORDER BY Quantity DESC;

