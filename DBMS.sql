CREATE DATABASE BANDKING_DB;
USE BANKING_DB;


DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
  Employment_ID int NOT NULL,
  Name varchar(255) NOT NULL,
  Address varchar(255) NOT NULL,
  Designation varchar(255) NOT NULL,
  Department varchar(255) NOT NULL,
  SPECIALISATION varchar(255),
  BRANCH_IFSC varchar(255) NOT NULL,
  PRIMARY KEY (Employment_ID)
  FOREIGN KEY (IFSC) REFERENCES Branch(IFSC)
);

DROP TABLE IF EXISTS Employee_MGR;

CREATE TABLE Employee_MGR (
  Department varchar(255) NOT NULL,
  MGR_ID int NOT NULL,
  PRIMARY KEY (Department),
  FOREIGN KEY (Department) REFERENCES Employee(Department)
);

DROP TABLE IF EXISTS Emp_Award;

CREATE TABLE Emp_Award (
  Employment_ID int NOT NULL,
  Award varchar(255),
  PRIMARY KEY (Employment_ID, Award),
  FOREIGN KEY (Employment_ID) REFERENCES Employee(Employment_ID)
);

DROP TABLE IF EXISTS Emp_Mobile;

CREATE TABLE Emp_Mobile (
  Employment_ID int NOT NULL,
  Mobile_No int,
  PRIMARY KEY (Employment_ID, Mobile_No),
  FOREIGN KEY (Employment_ID) REFERENCES Employee(Employment_ID)
);

DROP TABLE IF EXISTS Emp_Achievement;

CREATE TABLE Emp_Achievement (
  Employment_ID int NOT NULL,
  Achievement varchar(255),
  PRIMARY KEY (Employment_ID, Achievement),
  FOREIGN KEY (Employment_ID) REFERENCES Employee(Employment_ID)
);

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
  Customer_ID int NOT NULL,
  Name varchar(255) NOT NULL,
  DOB DATE NOT NULL,
  Income real NOT NULL 
  Address varchar(255) NOT NULL,
  Identification varchar(255),
  PRIMARY KEY (Customer_ID)
);

DROP TABLE IF EXISTS Branch;

CREATE TABLE Branch (
  IFSC varchar(255) NOT NULL,
  Total_Amount real,
  PRIMARY KEY (IFSC)
);


DROP TABLE IF EXISTS Account1;

CREATE TABLE Account1 (
  Unique_Account_No int NOT NULL,
  Customer_ID int NOT NULL;
  Deposit_Type varchar(255) ,
  Date_of_transaction DATE NOT NULL,
  Passbook varchar(255),
  Balance real,
  Withdraw real,
  Deposit real,
  bounceback_flag varchar(255);
  PRIMARY KEY (Unique_Account_No),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

DROP TABLE IF EXISTS Account2_1;

CREATE TABLE Account2_1 (
  Unique_Account_No int NOT NULL,
  Net_ID int NOT NULL,
  Password varchar(255) NOT NULL,
  Customer_ID int NOT NULL,
  minimum_balance real,
  PRIMARY KEY (Unique_Account_No, Net_ID),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account1(Unique_Account_No)
);



DROP TABLE IF EXISTS Account2_2;

CREATE TABLE Account2_2 (
  Customer_ID int NOT NULL,
  Withdraw real NOT NULL,
  Deposit real NOT NULL,
  PRIMARY KEY (Customer_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

DROP TABLE IF EXISTS Account_Benefeciary1;

CREATE TABLE Account_Benefeciary1 (
  Unique_Account_No int NOT NULL,
  Net_ID int NOT NULL,
  Name varchar(255) NOT NULL,
  Branch_IFSC varchar(255) NOT NULL,
  Status varchar(255),
  PRIMARY KEY (Unique_Account_No,Net_ID)
);

DROP TABLE IF EXISTS Account_Benefeciary2;

CREATE TABLE Account_Benefeciary2 (
  Unique_Account_No int NOT NULL,
  Benfeciary varchar(255) NOT NULL,
  PRIMARY KEY (Unique_Account_No),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account_Benefeciary1(Unique_Account_No)
);

DROP TABLE IF EXISTS Account_Mobile;

CREATE TABLE Account_Mobile (
  Unique_Account_No int NOT NULL,
  Mobile_No int NOT NULL,
  PRIMARY KEY (Unique_Account_No, Mobile_No),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account1(Unique_Account_No)
);

DROP TABLE IF EXISTS Card;

CREATE TABLE Card (
  Unique_Account_No int NOT NULL,
  Customer_ID int NOT NULL,
  ApplicationFOR varchar NOT NULL,
  Status varchar(255) ,
  PRIMARY KEY (Unique_Account_No),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account1(Unique_Account_No)
);

DROP TABLE IF EXISTS Withdraw1;

CREATE TABLE Withdraw1 (
  Credit_ID int,
  Debit_ID int,
  PRIMARY KEY (Credit_ID,Debit_ID),
  FOREIGN KEY (Credit_ID) REFERENCES Withdraw2(Credit_ID),
  FOREIGN KEY (Debit_ID) REFERENCES Withdraw3(Debit_ID)
);

DROP TABLE IF EXISTS Withdraw2;

CREATE TABLE Withdraw2 (
  Credit_ID int NOT NULL,
  Credit_Flag int NOT NULL,
  Credit_PIN int NOT NULL,
  Credit_MobileNo int NOT NULL,
  Credit_CVV int NOT NULL,
  PRIMARY KEY (Credit_ID)
);

DROP TABLE IF EXISTS Withdraw3;

CREATE TABLE Withdraw3 (
  Debit_ID int NOT NULL,
  Debit_Flag int NOT NULL,
  Debit_PIN int NOT NULL,
  Debit_MobileNo int NOT NULL,
  Debit_CVV int NOT NULL,
  PRIMARY KEY (Debit_ID)
);

DROP TABLE IF EXISTS Loan;

CREATE TABLE Loan (
  Loan_ID int NOT NULL,
  Amount real,
  Interest real,
  PRIMARY KEY (Loan_ID)
);

DROP TABLE IF EXISTS Payment;

CREATE TABLE Payment (
  Payment_ID int NOT NULL,
  Pay_Date DATE NOT NULL,
  Payment_Amount real,
  Amount_Outstanding real,
  Loan_ID int NOT NULL,
  Date_of_transaction DATE NOT NULL,
  PRIMARY KEY (Payment_ID),
  FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);

DROP TABLE IF EXISTS Services;

CREATE TABLE Services (
  Customer_ID int NOT NULL,
  Branch_IFSC varchar(255) NOT NULL,
  PRIMARY KEY (Customer_ID,Branch_IFSC),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Branch_IFSC) REFERENCES Branch(IFSC)
);

DROP TABLE IF EXISTS Access;

CREATE TABLE Access (
  Customer_ID int NOT NULL,
  Unique_Account_No int NOT NULL,
  Credit_ID int,
  Debit_ID int,
  PRIMARY KEY (Customer_ID, Unique_Account_No, Credit_ID,Debit_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account1(Unique_Account_No),
  FOREIGN KEY (Credit_ID) REFERENCES Withdraw1(Credit_ID),
  FOREIGN KEY (Debit_ID) REFERENCES Withdraw1(Debit_ID)
);

DROP TABLE IF EXISTS Eligibility;

CREATE TABLE Eligibility (
  Loan_ID int,
  Branch_IFSC varchar(255) NOT NULL,
  Customer_ID int NOT NULL,
  Status varchar,
  Unique_Account_No int NOT NULL,
  PRIMARY KEY (Loan_ID, Branch_IFSC, Customer_ID,Unique_Account_No),
  FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
  FOREIGN KEY (Branch_IFSC) REFERENCES Branch(IFSC),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  FOREIGN KEY (Unique_Account_No) REFERENCES Account1(Unique_Account_No)
);




