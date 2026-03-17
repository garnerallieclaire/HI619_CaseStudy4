# HI619 Case Study 4 – SQL Development and Database Implementation

## Overview
This project involves the design, implementation, and manipulation of a relational database for a retail system (Queen Anne Curiosity Shop). The case study combines database design concepts with advanced SQL development, including data definition (DDL), data manipulation (DML), user-defined functions, and view creation.

## Objectives
- Define table structures with constraints and keys
- Implement and validate relational database schema in SQL Server
- Perform data manipulation operations (INSERT, UPDATE, DELETE)
- Develop reusable SQL components such as functions and views
- Analyze and modify database relationships to support new business requirements

## Tools Used
- SQL Server Management Studio (SSMS)
- SQL

## Key Features of the Project

### Database Design and Schema Implementation
- Designed tables including CUSTOMER, EMPLOYEE, VENDOR, ITEM, SALE, and SALE_ITEM
- Defined primary keys, foreign keys, and referential integrity constraints
- Implemented surrogate keys and enforced business rules  
- Example: foreign key relationships between SALE and CUSTOMER/EMPLOYEE 

### Data Manipulation (CRUD Operations)
- Executed UPDATE statements to modify existing records
- Inserted new sales and related sale items
- Deleted records while handling cascading relationships (SALE → SALE_ITEM) 

### User-Defined Function
- Created a reusable SQL function (`FullNameFunction`) to combine first and last names
- Demonstrated modular and reusable SQL design

### View Creation and Aggregation
- Developed `CustomerFullNameSaleHistoryView` to summarize sales data
  - Includes total and average item price per sale
- Created `EmployeeSupervisorView` to represent recursive employee relationships
- Applied joins, grouping, and aggregation functions

### Database Relationship Modification
- Redesigned schema to support multiple customers per sale (1:N → N:M)
- Created an intersection table to support many-to-many relationships
- Updated existing schema by removing and replacing foreign key constraints 

### Data and Schema Validation
- Executed instructor-provided DDL and DML scripts to create and populate the database 
- Verified data integrity and query outputs
- Evaluated handling of NULL values in INSERT statements 

## Key Skills Demonstrated
- SQL development (DDL, DML)
- Data manipulation (INSERT, UPDATE, DELETE)
- Joins and aggregations
- View and function creation
- Database schema design and modification
- Referential integrity and constraint management
- Problem-solving using real-world data scenarios

## Files Included
- HI619_CaseStudy4_Deliverable1.pdf – Database design and analysis
- HI619_CaseStudy4_Deliverable2.sql – SQL queries and implementations
- HI619_CaseStudy4_CreateTables_SupportingFile1.sql – Table creation script (instructor-provided)
- HI619_CaseStudy4_InsertData_SupportingFile2.sql – Data population script (instructor-provided)
- HI619_CaseStudy4_Instructions.docx – Assignment instructions (instructor-provided)
