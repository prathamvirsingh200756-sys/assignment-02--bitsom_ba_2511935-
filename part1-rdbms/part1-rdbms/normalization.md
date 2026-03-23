## Anomaly Analysis

### Insert Anomaly
In the flat table, it is not possible to insert a new product unless there is an associated order.

- Columns involved: `product_id`, `product_name`, `category`, `unit_price`
- Example: A new product (e.g., P999) cannot be added independently without assigning it to an `order_id`.

Issue: This prevents maintaining a standalone product catalog.

---

### Update Anomaly
Customer details are stored repeatedly across multiple rows, leading to redundancy.

- Columns involved: `customer_id`, `customer_name`, `customer_email`, `customer_city`
- Example: If customer CUST101 appears in multiple rows and their city changes, all rows must be updated.

Issue: If some rows are not updated, inconsistent data will exist for the same customer.

---

### Delete Anomaly
Deleting a row may result in loss of important information.

- Columns involved: `product_id`, `sales_rep_id`
- Example: If a product or sales representative appears in only one order, deleting that order removes all related information.

Issue: Important data is lost unintentionally when deleting transactional records.
