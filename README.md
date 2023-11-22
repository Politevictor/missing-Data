# Handling Missing Data in SQL Project

## Overview

This project focuses on managing missing data within the Orders table of the database. The Order table contains several columns where each column has a defined approach to handling NULL values.
This README provides guidelines on how missing data is handled for each column within the Order table.

## Table Structure

The Order table consists of the following columns:

- `order_id`: Identifier for each order.
- `customer_id`: Identifier for customers associated with orders.
- `order_date`: Datetime when the order was placed.
- `order_location`: Identifier for where the order was picked from.
- `amount`: this is the amount charged for each order placed.
- `delivery_date`: Datetime when the order was delivered.
- `delivery_location`: Identifier for where the order was delivered to.
- `payment_method`: Identifier for how the delivery was paid.
- `status`: Identifier for delivery status if delivered, pending or cancelled.
- `rider_id`: Identifier for delivery rider

## Handling Missing Data


### `order_id`
- No specific handling for missing values. `order_id` is a mandatory field and must not be NULL.

### `customer_id`
- Missing `customer_id` values are handled by drop orders that do not have customer_id.

### `order_date`
- Missing `order_date` values are filled by considering the most recent available `order_date` in the table.

### `order_location`
-  Missing `order_location` values are filled by use the last order_location of same customer_id.

### `amount`
- Missing `amount` values are filled by assigning the average amount only where amount is not null.

### `delivery_date`
- Missing `delivery_date` values are handled by adding 2hours to order_date to get delivery_date where its null.

### `delivery_location`
- Missing `delivery_location` values are filled by using the last delivery_location of the same customer_id where delivery_location.

### `payment_method`
-  Missing `payment_method` values are filled by  using 'debit card' where payment_method is null.

## Implementation

The handling of missing data is implemented through SQL queries using UPDATE statements and subqueries. 
The provided SQL scripts and queries ensure proper management of NULL values within the Order table according to the defined strategies for each column.

## Conclusion

This README outlines the strategies and approaches adopted to handle missing data within the Order table. 
It provides a comprehensive understanding of how NULL values are managed for each column, ensuring data integrity and consistency in the database.











