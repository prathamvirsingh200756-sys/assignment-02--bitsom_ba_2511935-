// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E1001",
    name: "Smartphone X Pro",
    category: "Electronics",
    price: 45000,
    brand: "TechNova",
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      battery: "5000mAh",
      processor: "Octa-core"
    },
    features: ["5G", "AMOLED Display", "Fast Charging"],
    stock: 50
  },
  {
    product_id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1500,
    brand: "StyleWear",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    color_options: ["Blue", "White", "Black"],
    stock: 120
  },
  {
    product_id: "G3001",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "FarmFresh",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    storage: {
      temperature: "4°C",
      type: "Refrigerated"
    },
    stock: 200
  }
]);

// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// Reason:
// Indexing the 'category' field improves query performance for frequent
// filtering operations such as retrieving products by category (e.g., Electronics or Groceries).
