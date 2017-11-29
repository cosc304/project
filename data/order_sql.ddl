DROP TABLE IF EXISTS WarehouseProduct;
DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS OrderProduct;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Location;

CREATE TABLE Location (
  id int AUTO_INCREMENT NOT NULL,
  address varchar(32),
  postalcode char(6),
  city varchar(32),
  province char(2),
  country varchar(32),
  PRIMARY KEY (id),
  UNIQUE (address,postalcode,city,province,country)
);

CREATE TABLE User (
  id int AUTO_INCREMENT NOT NULL,
  location_id int,
  username varchar(32),
  password varchar(32),
  email varchar(32),
  firstname varchar(32),
  lastname varchar(32),
  admin tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (location_id) REFERENCES Location(id)
);

CREATE TABLE Product (
  id int AUTO_INCREMENT NOT NULL,
  price double(6,2),
  inventory int,
  name varchar(32),
  category varchar(32),
  description text,
  image blob,
  PRIMARY KEY (id)
);

CREATE TABLE `Order` (
  id int AUTO_INCREMENT NOT NULL,
  user_id int,
  time datetime,
  total double(8,2),
  cart tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE OrderProduct (
  order_id int,
  product_id int,
  quantity int,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES `Order`(id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Warehouse (
  id int AUTO_INCREMENT NOT NULL,
  location_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (location_id) REFERENCES Location(id)
);

CREATE TABLE WarehouseProduct (
  warehouse_id int,
  product_id int,
  inventory int,
  PRIMARY KEY (warehouse_id, product_id),
  FOREIGN KEY (warehouse_id) REFERENCES Warehouse(id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

INSERT INTO Location VALUES 
(NULL,'123 Main Street','B4X2T6','Kelowna','BC','Canada'),
(NULL,'554 Name Ave','F3D7H4','Seattle','WA','USA');

INSERT INTO User VALUES 
(NULL,1,'johnnyboy','plainpass','john@doe.ca','John','Doe',0),
(NULL,2,'siteadmin','adminpass','admin@localhost','Mister','Admin',1),
(NULL,NULL,'vagrant','password','guy@outlook.com','Mysterious','Stanger',0);

INSERT INTO Product VALUES 
(NULL,1000.00,10,'iPhone X','Phones','Pushing monetary boundries',NULL),
(NULL,500.00,10,'Andriod','Phones','Nothing special',NULL),
(NULL,0.01,1000,'Blackberry','Phones','Please take it',NULL),
(NULL,3000,1,'Alienware XXX Turbomaster','Laptops','Great if you have too much money',NULL);

INSERT INTO `Order` VALUES 
(NULL,1,NULL,500.01,1);

INSERT INTO OrderProduct VALUES 
(1,2,1),(1,3,1);

INSERT INTO Warehouse VALUES 
(NULL,1);

INSERT INTO WarehouseProduct VALUES 
(1,1,1);
