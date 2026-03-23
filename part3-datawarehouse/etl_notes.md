## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY, making it difficult to aggregate data by time periods.
Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) and mapped into a separate date dimension table with attributes like month and year.

### Decision 2 — Category Normalization
Problem: Product categories appeared in inconsistent casing (e.g., "electronics", "ELECTRONICS", "Electronics"), which could lead to incorrect grouping in analysis.
Resolution: All category values were standardized to proper case (e.g., "Electronics", "Clothing", "Groceries") before loading into the product dimension.

### Decision 3 — Handling NULL Values
Problem: Some rows contained NULL values in critical fields such as quantity or revenue, which could distort analysis results.
Resolution: NULL values were either replaced with default values (e.g., 0 for quantity) or excluded during transformation to ensure data integrity in the fact table.
