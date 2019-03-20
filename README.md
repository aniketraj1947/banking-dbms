# banking-dbms

	 	 	 	


##PHASE - I
##REQUIREMENTS DOCUMENT : MINIWORLD 

Database management systems are created to replace the time consuming, inefficient and disorganised paper-work and completely manage everything by computer systems. This enables us to perform all the operations much faster and efficient than manual work. Banking Systems are an epitome of importance of a database management system. Banks handle huge amounts of data. An organised database system is necessary to store that data, operate on it, fetch it when needed. Moreover, this needs to be done as fast as possible.

Banking system refers to a chain of financial institutions that provide financial services like deposits, loan, and money transfer to individuals and institutions with interest as the determining factor every transaction. Banking system plays the role of an intermediary between the ones saving and the ones who borrow money for investments. The primary functions of a bank include : Accepting Deposits, Saving Deposits - , Fixed Deposits, Current Deposits, Recurring Deposits, Loans ,Cash Credits.


This centralised database of bank systems will be available to any authorised and a reliable person at different hierarchies. There is a database management at a particular branch of a bank with a set of administrators with limited access pertaining to only that particular branch. On top of that, we’ve database management at a zonal level and central level with a different set of authorised people and control.

The database system would store accounts of all the customers of the branch, employees. It’d contain all required fields like UID, eligibility criterial, loan requirements, daily withdrawal limit, debit/credit cards, minimum balance, personal details and functionalities to update them.


DATABASE 	REQUIREMENTS 	:

When a person wants to open an account, he/she has to open an account in the Bank. The account no. will be unique for each person. At the time of opening an account, they will have to raise the available balance to the minimum account balance. The applicant must also provide all the details required in the application form. The Bank stores all the details of the applicants. Mobile no. must be provided for unique identification. After the account creation, client will be given a passbook which will contain the whole transaction history of the account.

Addition of new employees will be done by the manager of the particular branch. There will be separate login system for the employees.

For issuing credit/debit cards, the client must have an account in the bank. He/She must choose the type card they want and then submit the required documents. After certain amount of time, the card will be issued with a random pin which they will have to change in one month. Changes in pin can be done online or from the ATM machines.

Withdrawal will be valid only if the resulted balance is above the minimum limit and less than the daily transaction limit. It can be done via online payments, cards or cash from the bank(by proper procedures).The balance will then have to be updated accordingly.

For loan approval, borrower is required to have an account in the bank. He/She needs to submit the required documents. Loan amount will depend upon the income statement, the type of mortgage and previous debts of the borrower. Interest will depend upon the bank policies. Bank will also update the loan status.
For changing of any personal details of account owners and employees, they will have to submit an application and other associated documents to their respective authorities.

With every transaction, Bank will have to keep track of the total cash available in the bank.
For closing of an account, owner can contact bank employees, complete the formalities and get the remaining balance.






#Constraints:

Every customer of the bank must have a unique account number ID.
Any account number is not nullable i.e., any account cannot take null values.
The customers must have a minimum account balance, say of about Rs.1000
Any customer will not allowed to withdraw the amount from his account, if the withdrawal results in his account balance going below the minimum balance, i.e. it will lead to bouncing.
A person is eligible to get a loan from the bank if and only if he has an account in the bank.
The amount of loan is restricted by the income statement of the customer.
The percentage of interest imposed on the loan depends on the Bank’s policies and thus varies from bank to bank.
The customers are issued cards (ATM or Debit) depending on their eligibilities.
All the card holders have a unique card and therefore unique PIN numbers.
The employees of the bank have Unique identification numbers too.
There is a limit to transaction from a different bank’s ATM in a month, say Rs. 20,000.
The bank must have a daily limit based on the cash it holds on a particular day.
 Every account must be validated by a unique mobile number.
Offers and schemes depends on the policies of the bank.







#APPLICATION 	REQUIREMENTS 	:

There must be provision for:

Addition of new accounts in the bank.
Addition of new employees in the bank.
Add mobile number for unique identification.
Check eligibility for credit/debit card.
Check eligibility for Loan application.
Check bouncing of withdrawal requests.
Check daily limit.
Check minimum balance.
Issue credit/debit card.
Setting and updating of PIN.
Withdrawing money and updating balance accordingly.
Depositing money and updating balance accordingly.
Updating of passbook.
Updating the personal details of account owners.
Updating personal details of bank employees.
Update the total cash available with bank.
Update loan status.
Deletion of account.

