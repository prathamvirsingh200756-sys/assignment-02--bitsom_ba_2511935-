## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a legal contract search system. Keyword search relies on exact term matching, which means it may fail when the wording in the query differs from the wording in the document. For example, a query like "termination clauses" may not retrieve relevant sections if the contract uses phrases such as "agreement cancellation terms" instead. This limitation makes keyword-based systems unreliable for complex, language-heavy domains like legal documents.

A vector database addresses this limitation by enabling semantic search. Instead of matching exact words, it converts both the query and document text into embeddings — numerical representations that capture meaning and context. This allows the system to retrieve relevant sections even when the wording differs but the intent is similar.

In this system, contracts would first be broken into smaller chunks (e.g., paragraphs) and converted into embeddings using a model like sentence-transformers. These embeddings would then be stored in a vector database. When a lawyer submits a query, it is also embedded, and the system retrieves the most semantically similar chunks using similarity measures such as cosine similarity.

Thus, a vector database plays a critical role in enabling accurate, context-aware retrieval, significantly improving the usability and effectiveness of legal document search systems.
