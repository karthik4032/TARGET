select column_name, data_type
from target.INFORMATION_SCHEMA.COLUMNS
where table_name = "customers"
