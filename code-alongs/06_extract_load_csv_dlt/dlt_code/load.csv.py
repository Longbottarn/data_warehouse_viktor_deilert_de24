import dlt
import pandas as pd
from pathlib import Path # to find path
import os # to change dir 

# Declare data source. dlt resource declarator -> dlt resource object
#used for extracting data from source, in this case a local csv file
@dlt.resource(write_disposition="replace")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df

# 
if __name__ == "__main__":
    #need to change to current working directory as this is where
    # dlt looks for .dlt and when using the play button in vscode
    # it will run from where you are in the terminal, not neccessarily
    # where this script is resided
    working_directory = Path(__file__).parent

    #if you are using files from .dlt, 
    # the working directory should be the direct parent of .dlt folder
    os.chdir(working_directory)
    csv_path = working_directory / "data" / "NetflixOriginals.csv"
    data = load_csv_resource(csv_path, encoding="latin1")
    print(data)
    pipeline = dlt.pipeline(  # dlt pipeline
        pipeline_name='movies1', 
        destination="snowflake", 
        dataset_name='staging' # Schema
        )
    
    load_info = pipeline.run(data, table_name="netflix") # Pipeline.run (data source, table name)

    # pretty print the information on data that was loaded
    print(load_info)