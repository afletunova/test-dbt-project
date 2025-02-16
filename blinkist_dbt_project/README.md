# Blinkist DBT Project

This project aims to transform and analyze event data from Blinkist to generate key metrics like DAU, MAU, and content completions. It loads raw event data from CSVs, processes them through dbt models, and produces actionable insights for business stakeholders.

## Prerequisites
- Python 3.12+
- dbt (>= 1.9)
- PostgreSQL (>= 17.3)

## Setup Instructions
1. Clone the repository:
 ```bash
     git clone https://github.com/afletunova/test-dbt-project.git
     cd blinkist_dbt_project
 ```
2. Set up the dbt profile: 
 ```yml
      blinkist_dbt_project:
        target: dev
        outputs:
          dev:
            type: postgres
            host: localhost
            user: your_user
            password: your_password
            dbname: your_db
            schema: public_staging
 ```
3. Run dbt models: 
 ```bash
     dbt run
 ```

## Usage Instructions
- To run all models:
    ```bash
      dbt run
    ```
- To run specific models:
    ```bash
      dbt run --models <model_name>
    ```
- To run tests
    ```bash
      dbt test
    ```
- To generate and serve docs
    ```bash
      dbt docs generate
      dbt docs serve
    ```
