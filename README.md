# INFO 408 Assignment 2 Project

Revised Document Introduction:

This document offers an overview of the New Zealand Airbnb data migration
project, providing essential technical guidance on the following aspects:

1. **Running the Data Migration Application**: Detailed instructions on how to
   execute the data migration application successfully.

2. **New Database Structure**: An explanation of the structure of the new
   database, outlining its components and organization.

3. **Original Dataset Structures vs. New Database Tables**: A comparison between
   the structures of the original datasets sourced from
   [Inside Airbnb](http://insideairbnb.com/new-zealand/) and the corresponding
   tables within the new database.

Please note that this project is a simulated exercise, and all raw data utilized
in this migration have been downloaded from the specified source.

## Description

Project Summary: Airbnb Data Migration and Database Restructuring

Airbnb is embarking on a significant data migration project, transitioning from
its old system to a new one. The initial phase of this project focuses on
migrating data from New Zealand, serving as a crucial testbed before expanding
to other regions. This migration involves the extraction and transformation of
data from the old system into the new system's highly normalized database
structure. Here are the key aspects of this project:

1. **Data Extraction and Sources**:

    - The old system contains a wealth of data, which is divided into three main
      spreadsheets:
      [listings.csv](http://data.insideairbnb.com/new-zealand/2023-09-02/data/listings.csv.gz),
      [calendar.csv](http://data.insideairbnb.com/new-zealand/2023-09-02/data/calendar.csv.gz),
      and
      [reviews.csv](http://data.insideairbnb.com/new-zealand/2023-09-02/data/reviews.csv.gz).
    - [listings.csv](http://data.insideairbnb.com/new-zealand/2023-09-02/data/listings.csv.gz)
      encompasses comprehensive information about Airbnb listings. This includes
      property details, host information, availability, and various statistical
      data related to each listing, such as pricing, stay dates, and review
      ratings.

2. **Data Migration Process**:

    - The migration process involves extracting data from these spreadsheets and
      transforming it to fit the new system's normalized database structure.
    - The normalization process entails breaking down the primary dataset
      (listing information) into multiple subsets, ensuring data integrity and
      efficient query performance in the new system.

3. **Business Intelligence Functionality**:

    - The new system is equipped with robust Business Intelligence (BI)
      capabilities, serving both analysts and customers.
    - Users can query aggregated data at various levels for each listing
      property from the moment it was listed on Airbnb.
    - This BI functionality empowers users to gain insights into property
      performance, pricing trends, availability patterns, and customer reviews.

4. **Data Update Mechanism**:
    - To keep the aggregated data up to date, the database system incorporates a
      dynamic update mechanism.
    - When users or customers perform queries through the BI interface, the
      system recalculates and updates the aggregated data in real-time, ensuring
      that the insights provided are current and accurate.

This project is essential for Airbnb to modernize its data infrastructure,
ensuring that data from the old system is seamlessly integrated into the new
highly normalized database structure. The phased approach, starting with New
Zealand data, allows for thorough testing and validation before rolling out the
migration to other regions. Moreover, the incorporation of BI capabilities and
real-time data updates positions Airbnb to better serve its analysts and
customers with valuable insights into property performance and customer reviews.
Overall, this project represents a critical step in Airbnb's data management and
analytics capabilities.

## Getting Started

### Dependencies

To successfully run this application, please ensure the following prerequisites
are met:

1. **Operating System Compatibility**:

    - This application is compatible with Windows, MacOS, and Linux systems.
    - Python environment should be installed on your system.

2. **Required Python Packages**:

    - Ensure that all the necessary Python packages are installed. Refer to the
      [requirements.txt](./requirements.txt) file for a comprehensive list.

3. **Network Environment**:

    - To access and run this application, you must either be within the Otago
      University network environment or connect to the network via VPN for
      remote access.

4. **SQL Access and Permissions**:

    - You should have both read and write SQL access to the database `info408`
      hosted by `isdb.uod.otago.ac.nz`.
    - Additionally, you need permissions to execute stored procedures within the
      database.

5. **Dataset Downloads**:
    - Download the following datasets and extract them:
        - [listings.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/listings.csv.gz)
        - [calendar.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/calendar.csv.gz)
        - [reviews.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/reviews.csv.gz)
    - Save these extracted files in the [/data](./data/) folder.

Meeting these dependencies is essential for the successful execution of the
application, ensuring that it can access the required data sources and the
database while operating seamlessly on your specific operating system with the
necessary Python packages installed.

### Installing

### Installation Instructions

Follow these steps to set up and run the data extraction application:

1. **Clone or Download the Repository**:

    - Clone or download the required dependencies from
      [INFO408_PROJECT](https://github.com/ChrisYangS/INFO408_PROJECT) on GitHub
      to your local machine.

2. **Download and Extract Datasets**:

    - Download the following datasets and extract them:
        - [listings.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/listings.csv.gz)
        - [calendar.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/calendar.csv.gz)
        - [reviews.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/reviews.csv.gz)
    - Save these extracted files in the `/data` folder within the project
      directory.

3. **Install Required Python Packages**:

    - Navigate to the application's root directory using the terminal.
    - Run the following command to install all the necessary Python packages:
        ```
        pip install -r requirements.txt
        ```

4. **Configure `config.py`**:

    - Create a `config.py` Python file in the project's root directory.
    - Open the `config.py` file using a text editor.
    - Inside the file, provide the following information:
        ```python
        username = "username"  # need your own info408 database user name
        password = "password"  # need your own info408 database password
        ```
        Replace `"username"` with your username and `"password"` with your
        password for authentication.

5. **Run the Data Extraction Application**:
    - Launch Jupyter Notebook.
    - Open the `data_loader.ipynb` Jupyter Notebook file from the project's root
      directory.
    - Execute the notebook to begin the data extraction process.

Following these steps will enable you to set up the data extraction application,
ensuring that it can access the required datasets, install necessary Python
packages, and authenticate your credentials. You can then execute the data
extraction process by running the provided Jupyter Notebook.

### Executing program

To execute the program, follow these steps:

1.  **Open Terminal**:

    -   Navigate to the root directory of the project using your terminal or
        command prompt. This is the directory where you have cloned or
        downloaded the project from GitHub.

2.  **Activate Virtual Environment (if used)** (Optional but recommended):

    -   If you're working within a virtual environment (a recommended practice),
        activate it by running the appropriate command based on your operating
        system:
        -   On Windows:
            ```
            venv\Scripts\activate
            ```
        -   On macOS and Linux:
            ```
            source venv/bin/activate
            ```
    -   Activating the virtual environment isolates the project's dependencies,
        ensuring they don't conflict with other Python packages on your system.

3.  **Open the `data_loader.ipynb` Jupyter notebook to run the Program**:

    -   Open Jupyter Notebook by running:
        ```
        jupyter notebook
        ```
    -   In the Jupyter interface, navigate to the `data_loader.ipynb` notebook
        and execute all the cells from the top to run the data extraction
        process completely.

4.  **Follow On-Screen Instructions**:
    -   When running the Jupyter Notebook, the cells will execute from top to
        bottom. If there are no errors, the process will continue smoothly.
    -   In case an error occurs during execution, the process will halt, and an
        error message will be displayed. You will need to diagnose the error,
        make necessary corrections to the code, and then continue running the
        notebook until completion.
    -   If you wish to skip a specific function or section, you can do so
        selectively if you are familiar with the notebook's structure to avoid
        encountering errors. However, exercise caution when skipping portions of
        the notebook to ensure data integrity and consistency.
5.  **Monitor Progress**:

    -   Keep an eye on the terminal or Jupyter Notebook interface for any
        output, progress updates, or potential errors during program execution.

6.  **Complete Execution**:
    -   Allow the program to finish its execution. The time required for
        completion depends on the complexity of the task and the volume of data
        being processed.
    -   It's important to note that for this data extraction process, the
        execution time may be approximately 20 minutes when connected to the
        database via VPN. While the performance on the university network is not
        tested, it might offer faster execution times.

By following these steps, you will be able to run the program successfully and
execute the specified functionality, whether it's data extraction, analysis, or
any other task associated with the program.

## Help

Any advise for common problems or issues.

```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

-   0.2
    -   Various bug fixes and optimizations
    -   See [commit change]() or See [release history]()
-   0.1
    -   Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file
for details

## Acknowledgments

Inspiration, code snippets, etc.

-   [awesome-readme](https://github.com/matiassingers/awesome-readme)
-   [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
-   [dbader](https://github.com/dbader/readme-template)
-   [zenorocha](https://gist.github.com/zenorocha/4526327)
-   [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)
