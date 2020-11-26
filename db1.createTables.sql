
CREATE TABLE ht20_2_project_group_70.CUSTOMER(
Ssn VARCHAR(30) NOT NULL, 
Username VARCHAR(256) NOT NULL,
Email VARCHAR(256) NOT NULL,
CustomerPwd VARCHAR(256) NOT NULL,
Adress VARCHAR(256) NOT NULL,
Phone VARCHAR(30) NOT NULL,
WantsNews boolean NOT NULL,
PRIMARY KEY(Ssn));

CREATE TABLE ht20_2_project_group_70.PRODUCTORDER(
Id INT NOT NULL,
PaymentRef CHAR(64) NOT NULL,
DateMade date NOT NULL,
LastChange date NOT NULL,
OrderStatus INT NOT NULL,
Tracking VARCHAR(64),
UserSsn VARCHAR(30) NOT NULL,
PRIMARY KEY(Id),
FOREIGN KEY(UserSsn) REFERENCES CUSTOMER(Ssn) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ht20_2_project_group_70.DEPARTMENT(
Id INT NOT NULL,
Title varchar(256) NOT NULL,
Description VARCHAR(256) NOT NULL,
ParentId INT,
PRIMARY KEY(Id),
FOREIGN KEY(ParentId) REFERENCES DEPARTMENT(Id) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE ht20_2_project_group_70.PRODUCT(
Id INT NOT NULL,
Price INT(30) NOT NULL,
Tax FLOAT(30),
Discount FLOAT(30),
Title VARCHAR(256) NOT NULL,
Description VARCHAR(256) NOT NULL,
Quantity INT(30) NOT NULL,
DepartmentId INT(64),
PRIMARY KEY(Id),
FOREIGN KEY(DepartmentId) REFERENCES DEPARTMENT(Id) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE TABLE ht20_2_project_group_70.FEATURED(
ProductId INT NOT NULL,
PRIMARY KEY(ProductId),
FOREIGN KEY(ProductId) REFERENCES PRODUCT(Id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE ht20_2_project_group_70.ORDERCONTENT(
ContentId INT NOT NULL,
ProductTitle VARCHAR(256) NOT NULL,
Quantity INT NOT NULL,
OriginalCost INT NOT NULL,
ProductId INT,
OrderId INT NOT NULL,
PRIMARY KEY(ContentId),
FOREIGN KEY (ProductId) REFERENCES PRODUCT(Id) ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (OrderId) REFERENCES PRODUCTORDER(Id) ON DELETE CASCADE);

CREATE TABLE ht20_2_project_group_70.REVIEW (
UserSsn VARCHAR(30) NOT NULL,
ProductId INT NOT NULL,
Stars TINYINT NOT NULL,
Content VARCHAR(1024) NOT NULL,
PRIMARY KEY (UserSsn, ProductId),
FOREIGN KEY (UserSsn) REFERENCES CUSTOMER(Ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ProductId) REFERENCES PRODUCT(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ht20_2_project_group_70.KEYWORD (
Content VARCHAR(60) NOT NULL,
PRIMARY KEY (Content)
);

CREATE TABLE ht20_2_project_group_70.PRODUCTKEYWORD (
Content VARCHAR(60) NOT NULL,
ProductId INT NOT NULL,
PRIMARY KEY (Content, ProductId),
FOREIGN KEY (Content) REFERENCES KEYWORD(Content) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ProductId) REFERENCES PRODUCT(Id) ON DELETE CASCADE ON UPDATE CASCADE); 