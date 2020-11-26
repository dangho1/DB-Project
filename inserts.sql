
#Department queries
###############
INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(0, "Home page", "Welcome to the store!", NULL);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(1, "Electronics", "Elec", 0);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(2, "Food", "Good Mood", 0);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(3, "Batteries", "Charge", 1);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(4, "Breadboards", "White", 1);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(5, "Computers", "Gaming", 1);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(6, "Sandwiches", "Toasty", 2);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(7, "Tea", "Refreshing", 2);

INSERT INTO DEPARTMENT(Id, Title, Description, ParentId)
VALUES(8, "Dessert", "Sweet",2);
###############


#Product queries
###########
INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(0, 2000, 50.7, 25, "Ballerina", "Delicious", 100, 8, 1);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(1, 200, 59, 35, "Breadboard Mini", "Small", 200, 4, 0);

INSERT INTO PRODUCT(Id, Price, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(2, 1, "Croque Monsiuer", "Cheesy", 10, 6, 1);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(3, 40, 80, 5, "Jasmine Tea", "Flowery", 50, 7, 0);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(4, 1, 50.7, 25, "Alienware NASA 1000X", "Overhyped", 2000, 5, 0);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(5, 2002, 100, 100, "Lithium battery", "Thunder", 100, 3, 0);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(6, 2003, 5, 35, "Conductor", "Conducting", 2010, 4, 0);

INSERT INTO PRODUCT(Id, Price, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(7, 11, "PBJ", "Sweet and savoury", 109, 6, 0);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(8, 41, 80, 5, "Rooibos", "Hearthy", 500, 7, 1);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(9, 10, 50.7, 25, "Alienware NASA 2000X", "More Overhyped", 2000, 5, 0);

INSERT INTO PRODUCT(Id, Price, Tax, Discount, Title, Description, Quantity, DepartmentId, isFeatured)
VALUES(10, 20023, 100, 100, "AAA batteries", "AAA", 105, 3, 0);
########

#Featured queries
########
INSERT INTO FEATURED(ProductId)
VALUES(0);

INSERT INTO FEATURED(ProductId)
VALUES(2);

INSERT INTO FEATURED(ProductId)
VALUES(9);

########

#Customer queries
########
INSERT INTO CUSTOMER(Ssn, Username, Email, CustomerPwd, Adress, Phone, WantsNews)
VALUES(0000000001, "Konny", "konny@gmail.com", "konny123", "Västgatan 83 Staden", "0707123476", FALSE);

INSERT INTO CUSTOMER(Ssn, Username, Email, CustomerPwd, Adress, Phone, WantsNews)
VALUES(0000000002, "Berra", "berra@gmail.com", "berra123", "Långgatan 3 Byn", "0761235818892", TRUE);

#######

#Review queries
########
INSERT INTO REVIEW(UserSsn, ProductId, Stars, Content)
VALUES(0000000001, 4, 2	, "Terrible but good");

########
INSERT INTO REVIEW(UserSsn, ProductId, Stars, Content)
VALUES(0000000002, 4, 4, "Quite a steal");

#######

#Order/Ordercontent queries
#######
INSERT INTO PRODUCTORDER(Id, PaymentRef, DateMade, LastChange, OrderStatus, Tracking, UserSsn)
Values(0, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 25/11/2020, 25/11/1880, 1, "bzzzzzzzzzzzzztrack", 0000000001);

INSERT INTO ORDERCONTENT(ContentId, ProductTitle, Quantity, OriginalCost, ProductId, OrderId)
VALUES(0, "Alienware NASA 1000X", 2, 1, 4, 0);

#######

#Keyword queries
#######
INSERT INTO KEYWORD(Content)
Values("Edible");

INSERT INTO KEYWORD(Content)
Values("Hardware");

INSERT INTO PRODUCTKEYWORD(Content, ProductId)
Values("Edible", 2);

INSERT INTO PRODUCTKEYWORD(Content, ProductId)
Values("Edible", 3);

INSERT INTO PRODUCTKEYWORD(Content, ProductId)
Values("Hardware", 1);
	

















