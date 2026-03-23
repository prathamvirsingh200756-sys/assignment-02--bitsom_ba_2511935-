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

## Normalization Justification
The argument that a single flat table is “simpler” ignores the operational inefficiencies and data integrity risks evident in this dataset. In the current structure, customer, product, and sales representative details are redundantly stored across multiple rows. For instance, the same customer_id appears repeatedly with identical attributes such as name and email. This redundancy directly leads to update anomalies: if a customer changes their email, every corresponding row must be updated, increasing the probability of inconsistent data.

Similarly, product details such as unit_price and category are duplicated for every transaction. This not only wastes storage but also creates logical ambiguity—if the price of a product changes over time, the system cannot distinguish between historical and current pricing without additional design considerations. Insert anomalies further highlight the limitations: new products or sales representatives cannot be added unless tied to an order, preventing independent entity management.

Delete anomalies pose an even greater risk. Removing a single order may inadvertently erase the only record of a product or sales representative, resulting in unintended data loss. This tightly coupled design violates the principles of data independence.

By decomposing the dataset into normalized tables (Customers, Products, SalesReps, Orders, and OrderItems), each entity is stored exactly once, ensuring consistency and scalability. Relationships are maintained via foreign keys, eliminating redundancy while preserving referential integrity. Therefore, normalization is not over-engineering but a necessary step toward a robust, maintainable, and logically sound database design.
