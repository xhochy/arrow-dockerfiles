import pandas as pd

import pyarrow.parquet as pq
import pyarrow as pa

for i in range(10):
    print(i)
    df = pd.read_csv('/io/yellow_tripdata_2016-01_only_object.csv')
    table = pa.Table.from_pandas(df)
    pq.write_table(table, 'out.parquet')
