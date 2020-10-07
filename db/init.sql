CREATE TABLE users(
    ID SERIAL PRIMARY KEY,
    username VARCHAR(200) NOT NULL,
    pass VARCHAR(200) NOT NULL
);

CREATE TABLE profiles(
    ID INTEGER REFERENCES users(ID),
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    address VARCHAR(2000) NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zipcode VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(500) NOT NULL
);

CREATE TABLE products(
    ID SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description VARCHAR(10000) NOT NULL,
    price MONEY NOT NULL
);

CREATE TABLE carts (
    ID SERIAL PRIMARY KEY,
    customerID INTEGER REFERENCES users(ID),
    creationDate TIMESTAMP
);

CREATE TABLE cartDetails(
    ID SERIAL PRIMARY KEY,
    cartID INTEGER,
    productID INTEGER,
    qty INTEGER,
    addDate TIMESTAMP
);
