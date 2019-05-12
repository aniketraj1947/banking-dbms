

--Application Requirements :


--Addition of new accounts in the bank

INSERT INTO Customer VALUES ('Customer_ID' , 'Name' , 'DOB' , 'Income' , 'Address', 'Identification');

INSERT INTO Account1 VALUES ('UniqueAccNo' , 'Customer_ID', 'Type' , 'Passbook' , 'Balance' , 'Withdraw' , 'Deposit');

INSERT INTO Account2_1 VALUES ('UniqueAccNo' , 'Net_ID' , 'Password' , 'Customer_ID' );

INSERT INTO Account_Benefeciary1 VALUES ('Unique_Account_No' , 'Net_ID');

INSERT INTO Account_Benefeciary2 VALUES ('Unique_Account_No' , 'Benfeciary');

INSERT INTO Account_Mobile VALUES ('Unique_Account_No' , 'Mobile_No');

--Addition of new employees in the bank

INSERT INTO Employee VALUES ('Employment_ID' , 'Name' , 'Address' , 'Designation' , 'Department' , 'SPECIALISATION' , 'Branch_IFSC');

INSERT INTO Emp_Mobile VALUES ('Employment_ID' , 'Mobile_No');

--Add mobile number for unique identification

INSERT INTO Account_Mobile VALUES ('Unique_Account_No' , 'Mobile_No');

--Addition of a beneficiary for money transfer

INSERT INTO Account_Benefeciary1 VALUES ('Unique_Account_No' , 'Net_ID' , 'Name', 'Branch_IFSC' );

INSERT INTO Account_Benefeciary2 VALUES ('Unique_Account_No' , 'beneficiary');

-- check eligibility for money transfer requests

	SELECT Status FROM Account_Benefeciary1 WHERE Unique_Account_No='Unique_Account_No TO BE SEARCHED FOR';
	

-- check eligibility of credit/debit card

	SELECT Status FROM Card WHERE Unique_Account_No='Unique_Account_No TO BE SEARCHED FOR';


-- check eligibility for loan applications

	SELECT Status FROM Eligibility WHERE Customer_ID='Customer_ID TO BE SEARCHED FOR';

-- check bouncing of withdrwal requests

	UPDATE Account1 SET bounceback_flag = 'BOUNCING' WHERE Withdraw>balance AND Unique_Account_No='Unique_Account_No';
	UPDATE Account1 SET bounceback_flag = 'NOT BOUNCING' WHERE Withdraw<=balance AND Unique_Account_No='Unique_Account_No';
	SELECT bounceback_flag FROM Account1 WHERE Unique_Account_No='Unique_Account_No';

-- check daily limit of cash withdrawal for an account

	SELECT FORMAT('daily-limit'-SUM(Withdraw),2) LIMIT_LEFT FROM Account1 WHERE Date_of_transaction='DATE';


-- check minimum balance

	SELECT minimum_balance FROM Account1 WHERE Unique_Account_No="Unique_Account_No to be searched for";

-- Issue Credit/Debit Card

INSERT INTO Withdraw1 VALUES ('Credit_ID' , 'Debit_ID');
INSERT INTO Withdraw2 VALUES ('Credit_ID' , 'Credit_Flag' , 'Credit_PIN' , 'Credit_MobileNo' , 'Credit_CVV');
INSERT INTO Withdraw3 VALUES ('Debit_ID' , 'Debit_Flag' , 'Debit_PIN' , 'Debit_MobileNo' , 'Debit_CVV');

--Updating of PIN

UPDATE Withdraw2 SET Credit_PIN = 'PIN_CODE' WHERE Credit_ID = 'Credit_ID';

UPDATE Withdraw3 SET Debit_PIN = 'PIN_CODE' WHERE Debit_ID = 'Debit_ID';

-- Withdrawing money and updating balance accordingly

UPDATE Account1 SET Withdraw = 'withdrwan_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Account1 SET balance= balance - 'withdrwan_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Branch SET Total_Amount = Total_Amount - 'withdrwan_amount' WHERE IFSC = 'Branch_IFSC';

-- Depositing money and updating balance accordingly

UPDATE Account1 SET Deposit = 'deposited_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Account1 SET balance= balance + 'deposited_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Branch SET Total_Amount = Total_Amount + 'deposited_amount' WHERE IFSC = 'Branch_IFSC';
-- Updating of Passbook

--Adding rows in the passbook values
INSERT INTO Account1 VALUES ('UniqueAccNo' ,'Customer_ID', 'Transfer_Type' , 'Passbook' , 'Balance' , 'Withdraw' , 'Deposit');

-- Updating personal details of account owners

UPDATE Customers SET Name = 'Updated Name', Income = 'Updated Income' , Address = 'Updated Address' Identification = 'updated identification' WHERE CustomerID = 'Customer_ID';

-- updating personal details of bank employees

UPDATE Employee SET Name = 'UP Name' , Address = 'Updated Address' , Designation = 'Updated Designation' , Department = 'Updated Department' , SPECIALISATION = 'Updated SPECIALISATION' , Branch_IFSC = "New Branch_IFSC" WHERE Employment_ID = 'Employment_ID';

-- update total cash available with bank

--for all transactions
UPDATE Account1 SET Deposit = 'deposited_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Account1 SET balance= balance + 'deposited_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Branch SET Total_Amount = Total_Amount + 'deposited_amount' WHERE IFSC = 'Branch_IFSC';
UPDATE Account1 SET Withdraw = 'withdrwan_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Account1 SET balance= balance - 'withdrwan_amount' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Branch SET Total_Amount = Total_Amount - 'withdrwan_amount' WHERE IFSC = 'Branch_IFSC';

-- update loan status

UPDATE Eligibility SET status='new status';

--deletion of an account

UPDATE Account1 SET Withdraw = 'balance' WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Account1 SET balance= 0 WHERE Unique_Account_No = 'Unique_Account_No';
UPDATE Branch SET Total_Amount = Total_Amount - 'withdrwan_amount' WHERE IFSC = 'Branch_IFSC';

DELETE FROM Customer WHERE Customer_ID='customer id to be deleted';
DELETE FROM Account1 WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Account2_1 WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Account2_2 WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Account_Mobile WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Account_Benefeciary1 WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Account_Benefeciary2 WHERE Unique_Account_No='Acc no. to be deleted';
DELETE FROM Services WHERE Customer_ID='Customer_ID. to be deleted';
DELETE FROM Access WHERE Customer_ID='Customer_ID. to be deleted';
DELETE FROM Eligibility WHERE Customer_ID='Customer_ID to be deleted';
DELETE FROM Account_Mobile WHERE Unique_Account_No='Acc no. to be deleted';


-- Addition of new customer --already done bro

-- Enlisting all customers details

SELECT * FROM Customer; 

-- Enlisting all accounts in a branch

SELECT * FROM Account1;

-- enlisting all accounts of a customer

SELECT * FROM Account1 WHERE Customer_ID ='customer id of the customer to be searched';


-- application for issuance of debit/credit card
INSERT INTO Card VALUES ('Unique_Account_No' , 'Customer_ID' , 'ISSUING CREDIT/DEBIT CARD' , 'In Process');

--application of loan
INSERT INTO Eligibility VALUES ('Loan_ID' , 'BRANCH_IFSC' , 'Customer_ID' , 'Unique_Account_No');

--status of application for debit/credit car
SELECT Status FROM Card WHERE Unique_Account_No='Unique_Account_No of the account';

--list of all active debit card holders

SELECT * FROM Access WHERE Debit_ID IS NOT NULL;

--list of all active credit card holders

SELECT * FROM Access WHERE Debit_ID IS NOT NULL;

--list of all loan account

SELECT * FROM Eligibility WHERE Loan_ID IS NOT NULL;

--list of all accounts falling below minimum balance

SELECT * FROM Account1 WHERE balance<'min_balance';

-- hot-listing application for debit/credit cards

SELECT * FROM CARD WHERE ApplicationFOR = "HOTLISTING" ; 
DELETE FROM Access WHERE Unique_Account_No='Unique_Account_No found above'; -- delete access from the unique account no retreived above


-- checking hotlisting application status

SELECT Status FROM CARD WHERE Unique_Account_No = "Unique_Account_No of the customer";

-- generating bank statement for a specified duration

SELECT * FROM Account1 WHERE Unique_Account_No="Unique_Account_No TO BE SEARCHED" AND Date_of_transaction >= (start date) AND Date_of_transaction <= (end date);


-- adding online id for each customer requesting for the service
INSERT INTO Account2_1 VALUES('Unique_Account_No' , 'Net_ID' , 'Password' , 'Customer_ID')

-- Enlist all deposits in a duration

SELECT * FROM Account1 WHERE Unique_Account_No="Unique_Account_No TO BE SEARCHED" AND Deposit IS NOT NULL AND Date_of_transaction >= (start date) AND Date_of_transaction <= (end date);


-- Enlist all withdrawals in a duration

SELECT * FROM Account1 WHERE Unique_Account_No="Unique_Account_No TO BE SEARCHED" AND Withdraw IS NOT NULL AND Date_of_transaction >= (start date) AND Date_of_transaction <= (end date);

-- enlist all loans sanctioned in a duration

SELECT * FROM Loan WHERE Date_of_transaction >= (start date) AND Date_of_transaction <= (end date);

-- Enlist all loan fully settled in a duration

SELECT * FROM Payment WHERE Amount_Outstanding = 0 AND Date_of_transaction >= (start_date) AND Date_of_transaction <= (end_date);

--enlist all transactions towards setting loans in a duration

SELECT * FROM Payment WHERE Date_of_transaction >= (start_date) AND Date_of_transaction <= (end_date);
