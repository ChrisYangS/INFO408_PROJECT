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

3.  **Open the [data_loader.ipynb](./data_loader.ipynb) Jupyter notebook to run
    the Program**:

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

## Source Data

In this project, we utilize several CSV source data files, each providing
distinct and valuable information:

1. **Listing Property Information**:

    - This section encompasses a wide range of data about the listing
      properties, including:
        - Property descriptions
        - Property images
        - The number of bedrooms, bathrooms, and beds
        - Regional details related to each listing
        - Host information, such as host names, hosting tenure, basic details,
          and host locations
        - Various statistical data, such as:
            - Last search timestamps
            - Pricing information
            - Minimum and maximum nights for bookings
            - Minimum and maximum values for minimum nights
            - Minimum and maximum values for maximum nights
            - Average minimum nights
            - Average maximum nights

2. **Host Information**:

    - This category provides key metrics and details about property hosts,
      including:
        - Host response time
        - Host response rate
        - Host acceptance rate
        - Host superhost status
        - Host listings count
        - Host total listings count

3. **Listing Review Information**:
    - This section contains comprehensive data related to guest reviews for each
      listing property. It includes information such as:
        - The number of reviews received
        - Timestamps for the last scrape, first review, and last review
        - Review scores for various aspects of the listing, including accuracy,
          cleanliness, check-in, communication, location, and overall rating.

Please note that
[calendar.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/calendar.csv.gz)
and
[reviews.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/reviews.csv.gz)
require minimal data structure manipulation, as they primarily serve as records
of availability and reviews. In contrast,
[listings.csv.gz](http://data.insideairbnb.com/new-zealand/2023-09-02/data/listings.csv.gz)
is a comprehensive dataset that provides a wealth of information related to
listing properties and hosts, making it a central focus of this project.

## Destination Database Table Structure

The database comprises several tables, each designed to store specific
categories of data related to Airbnb listings, hosts, reviews, and other
relevant details. `nz_host_detail`, `nz_region_parent `,`nz_listings `,
`nz_reviews` and `nz_calendar ` tables are the main systems tables and they are
created under normalized relationship.

`nz_host_stats`,`nz_listings_review_stats` and `nz_listings_stay_stats` are
analytical tables which the do not have any relationship to each other or other
system tables, and they are update either periodically or manually updated by
system administrators or users.

Below is the graph showing table relations:

![sql table relations](./sql/database_graph.png)

This database is meticulously structured to store a wide range of data related
to Airbnb listings, hosts, reviews, and geographical regions. Below, we provide
a comprehensive overview of the tables, their attributes, and the relationships
that connect them:

### nz_host_detail Table

-   **Description**: This table captures detailed information about Airbnb
    hosts.
-   **Attributes**:
    -   `host_id`: A unique identifier for each host.
    -   `host_url`: The URL associated with the host.
    -   `host_name`: The name of the host.
    -   `host_since`: The date when the host joined Airbnb.
    -   `host_location`: The location of the host.
    -   `host_about`: A brief description of the host.
    -   `host_thumbnail_url` and `host_picture_url`: URLs to the host's profile
        pictures.
    -   `host_neighbourhood`: The neighborhood of the host.
-   **Relationships**:
    -   None.

### nz_host_stats Table

-   **Description**: This table contains statistical metrics and details about
    Airbnb hosts.
-   **Attributes**:
    -   `host_id`: A unique identifier for each host.
    -   `host_response_time`: The response time of the host.
    -   `host_response_rate`: The response rate of the host.
    -   `host_acceptance_rate`: The acceptance rate of booking requests by the
        host.
    -   `host_is_superhost`: Indicates if the host has "superhost" status.
    -   `host_listings_count`: The count of listings hosted by the host.
    -   `host_total_listings_count`: The total count of listings hosted by the
        host.
    -   `host_verifications`: Methods used to verify the host's identity.
    -   `host_has_profile_pic`: Indicates whether the host has a profile
        picture.
    -   `host_identity_verified`: Indicates whether the host's identity has been
        verified.
-   **Relationships**:
    -   None.

### nz_listings_review_stats Table

-   **Description**: This table contains statistical data related to guest
    reviews for Airbnb listings.
-   **Attributes**:
    -   `id`: A unique identifier for each review record.
    -   `number_of_reviews`: The total number of reviews for a listing.
    -   `last_scraped`: The date when the last scrape of review data occurred.
    -   `first_review`: The date of the first review for the listing.
    -   `last_review`: The date of the most recent review.
    -   `review_scores_rating`: The overall rating score based on guest reviews.
    -   `review_scores_accuracy`, `review_scores_cleanliness`,
        `review_scores_checkin`, `review_scores_communication`,
        `review_scores_location`, and `review_scores_value`: Scores for specific
        aspects of the listing as rated by guests.
    -   `reviews_per_month`: The average number of reviews received per month.
-   **Relationships**:
    -   None.

### nz_listings_stay_stats Table

-   **Description**: This table stores statistical details related to stays at
    Airbnb listings.
-   **Attributes**:
    -   `id`: A unique identifier for each stay record.
    -   `last_searched`: Timestamp indicating the last search related to this
        listing.
    -   `price`: The price of the listing.
    -   `minimum_nights`: The minimum number of nights required for booking.
    -   `maximum_nights`: The maximum number of nights allowed for booking.
    -   `minimum_minimum_nights` and `maximum_minimum_nights`: Minimum and
        maximum values for the minimum number of nights required.
    -   `minimum_maximum_nights` and `maximum_maximum_nights`: Minimum and
        maximum values for the maximum number of nights allowed.
    -   `minimum_nights_avg_ntm` and `maximum_nights_avg_ntm`: Average minimum
        and maximum nights for stays.
    -   `has_availability`: Indicates availability status.
    -   `last_scraped`: Timestamp indicating the last data scrape related to
        this listing.
-   **Relationships**:
    -   None.

### nz_region_parent Table

-   **Description**: This table records information about parent geographical
    regions.
-   **Attributes**:
    -   `region_parent_id`: A unique identifier for each region parent.
    -   `region_parent_name`: The name of the region parent.
-   **Relationships**:
    -   None.

### nz_region Table

-   **Description**: This table stores data about geographical regions and their
    parent relationships.
-   **Attributes**:
    -   `region_id`: A unique identifier for each geographical region.
    -   `region_name`: The name of the geographical region.
    -   `region_parent_id`: A reference to the parent region to which this
        region belongs.
-   **Relationships**:
    -   The `region_parent_id` field establishes a foreign key relationship with
        the `nz_region_parent` table, connecting child regions to their parent
        regions.

### nz_listings Table

-   **Description**: This table contains comprehensive information about Airbnb
    listing properties.
-   **Attributes**:
    -   `id`: A unique identifier for each listing.
    -   `listing_url`: The URL associated with the listing.
    -   `scrape_id`: An identifier for the data scrape.
    -   `name`: The name of the listing.
    -   `description`: A detailed description of the listing.
    -   `neighborhood_overview`: An overview of the neighborhood where the
        listing is located.

These database tables collectively form the structured foundation for organizing
and accessing data related to Airbnb listings, hosts, reviews, and geographical
regions.

## Authors

**Shangwen (Chris) Yang**

## Version History

-   0.1
    -   Initial Release
