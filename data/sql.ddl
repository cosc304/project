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
  session_id varchar(32),
  PRIMARY KEY (id),
  FOREIGN KEY (location_id) REFERENCES Location(id) ON DELETE SET NULL
);

CREATE TABLE Product (
  id int AUTO_INCREMENT NOT NULL,
  price double(6,2),
  inventory int,
  name varchar(32),
  category varchar(32),
  description text,
  image longblob,
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
  FOREIGN KEY (order_id) REFERENCES `Order`(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
);

CREATE TABLE Warehouse (
  id int AUTO_INCREMENT NOT NULL,
  location_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (location_id) REFERENCES Location(id) ON DELETE CASCADE
);

CREATE TABLE WarehouseProduct (
  warehouse_id int,
  product_id int,
  inventory int,
  PRIMARY KEY (warehouse_id, product_id),
  FOREIGN KEY (warehouse_id) REFERENCES Warehouse(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
);

CREATE TRIGGER OrderTotalInsert
AFTER INSERT ON OrderProduct
FOR EACH ROW
UPDATE `Order` O
   SET O.total =
    (SELECT SUM(P.price*OP.quantity)
      FROM Product P, OrderProduct OP
      WHERE P.id = OP.product_id AND OP.order_id = O.id)
WHERE O.id = NEW.order_id;

CREATE TRIGGER OrderTotalUpdate
AFTER UPDATE ON OrderProduct
FOR EACH ROW
UPDATE `Order` O
   SET O.total =
    (SELECT SUM(P.price*OP.quantity)
      FROM Product P, OrderProduct OP
      WHERE P.id = OP.product_id AND OP.order_id = O.id)
WHERE O.id = NEW.order_id;

CREATE TRIGGER OrderTotalDelete
AFTER DELETE ON OrderProduct
FOR EACH ROW
UPDATE `Order` O
   SET O.total =
    (SELECT SUM(P.price*OP.quantity)
      FROM Product P, OrderProduct OP
      WHERE P.id = OP.product_id AND OP.order_id = O.id)
WHERE O.id = NEW.order_id;

INSERT INTO Location VALUES
(NULL,'123 Main Street','B4X2T6','Kelowna','BC','Canada'),
(NULL,'554 Name Ave','F3D7H4','Seattle','WA','USA');

INSERT INTO User VALUES
(NULL,1,'johnnyboy','plainpass','john@doe.ca','John','Doe',0,NULL),
(NULL,2,'siteadmin','adminpass','admin@localhost','Mister','Admin',1,NULL),
(NULL,NULL,'vagrant','password','guy@outlook.com','Mysterious','Stanger',0,NULL);

INSERT INTO Product VALUES
(NULL,1000.00,10,'iPhone X','Phone','Pushing monetary boundries.',NULL),
(NULL,500.00,10,'Andriod','Phone','Nothing special.',NULL),
(NULL,0.01,1000,'Blackberry','Phone','Please take it.',NULL),
(NULL,3000,10,'Alienware XXX Turbomaster','Laptop','Great if you have too much money.',NULL),
(NULL,2,100,'Common Mouse','Mouse','Everyone has one.',NULL),
(NULL,20,3,'Rat','Mouse','What do you mean it is not a mouse?',NULL),
(NULL,5,3,'Ancient Relic','Keyboard','Whatever you do do not turn it upside down.',NULL),
(NULL,200,5,'Clicktapper 3000','Keyboard','Hearing your keyboard is more important than using it.',NULL),
(NULL,5,30,'Buds','Headphone','Basic.',NULL),
(NULL,200,5,'Audiophilia','Headphone','For those who think they can hear outside the hearing range.',NULL),
(NULL,2000,3,'GTX 9080','GPU','Simulate the universe.',NULL),
(NULL,0.50,50,'Intel HD Graphics 0.01','GPU','Can render up to a pixel at peak performance.',NULL),
(NULL,0.2,500,'Cardbox Box','Case','Doubles as camoflauge used only by elite soldiers.',NULL),
(NULL,500,5,'Lead Box','Case','Protects againt solar flares, Russian spies, and most apocalyptic scenarios.',NULL);

INSERT INTO `Order` VALUES
(NULL,1,NULL,500.01,1);

INSERT INTO OrderProduct VALUES
(1,2,1),(1,3,1);

INSERT INTO Warehouse VALUES
(NULL,1);

INSERT INTO WarehouseProduct VALUES
(1,1,1);
