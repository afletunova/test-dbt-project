# Technical Task
This technical task involves setting up a dbt project for processing sample event data, designing a data pipeline, and answering specific questions regarding user engagement.

## Main Points

The task consists of two parts: a coding challenge and a theoretical component.

1. **Code Challenge**: This involves setting up a dbt (data build tool) project to process sample data from mobile and web events. The objective is to create a final engagement table for analysis, and/or to prepare report tables for stakeholders.

2. **User Engagement Questions**: There are four specific questions regarding user engagement to address:
   - Daily Active Users (DAU)
   - Daily Active Learners (DAL)
   - Content Completion
   - Regional Activity

The second part of the task focuses on exploring additional data and analyses to gain a deeper understanding of user engagement.

## Step-by-Step Solution
### Part 1: Setting up the dbt Project

I started a dbt project using a simple initial example.

### Part 2: Designing the Data Pipeline

![Linear Graph](/Lineage%20Graph.png)

When designing the data pipeline, I decided to use seeds to load sample data from CSV files into the database. However, in a real-world scenario, I would utilize a DWH like Snowflake or Redshift to load data from various sources.

I transformed the data into the required format using dbt models: 'stg_mobile_events' and 'stg_web_events.' These models are designed to convert raw data into a format suitable for analysis. In a real-world scenario, I would also implement data quality checks and data validation. To ensure the data is not null, I included non-null value tests in the models. Additionally, these models can be updated incrementally in the future, as the data is received regularly and its nature remains unchanged.

I created a model called 'engagement' that combines data from 'stg_mobile_events' and 'stg_web_events', and I made it a table for easier analysis.

The models include specific metrics derived from the task description. These metrics are calculated using SQL functions and can be updated based on various filters. However, to maintain clean and readable code, I have integrated the metrics directly into the models. This approach serves as a single source of truth for the metrics.

**Assumption**: I considered the 'DACH' countries filter and content-related events filter useful for keeping them directly in the 'engagement' model. However, when filters are less relevant, they can and should be removed for better data clarity.

### Part 3: Answering Specific Questions
To address the specific questions, I utilized the metrics from the models. While users of the dbt project can calculate these values themselves, I incorporated them into the models to maintain clean and easy-to-read code. Additionally, I have included sample SQL queries in the auxiliary folder.

## Exploring Additional Data and Analyses
To explore additional data and analyses, I would plan to utilize the dbt project to develop new models that can help answer further questions. Additionally, I would consider using data visualization tools to create reports and dashboards that effectively communicate insights to stakeholders.

For instance, I would follow this framework to build new models.

### Defining Key Metrics
To effectively track engagement, my first step would be to identify the primary goals and metrics. I would focus on three key aspects of engagement:

1. Understanding user behavior by segment
2. Conducting funnel analysis
3. Identifying future improvements and conducting A/B testing

To achieve this, I would monitor the following metrics:

1. **User Segmentation** (excluding user access type):
   - **Daily Active Users (DAU)** and **Monthly Active Users (MAU)**: These metrics help measure the number of unique users engaging with the platform on a daily and monthly basis.
   - **Stickiness Ratio (DAU/MAU)**: This ratio indicates how frequently monthly users engage with the platform on a daily basis.
   - **Sessions per User**: This metric tracks how many times a user returns to the app within a specific period.
   - **Time Spent per Session**: This indicates the depth of user engagement based on the duration of their sessions.
   - **Content Consumption Rate**: This measures the number of summaries read or listened to per user during each session.

Additionally, I would categorize users based on their engagement levels into three segments: Casual Users, Highly Engaged Users, and At-Risk Users.

### Funnel Analysis (post user conversion):

1. **Onboarding Completion Rate** – The percentage of users who complete the onboarding process.
2. **First-Content Engagement Rate** – The percentage of new users who successfully complete their first summary.
3. **Completion Rate by Content Type** (Text vs. Audio) – To determine whether users engage more with text or audio content.
4. **Drop-off Points in Session Flow** – To identify where users exit before completing a summary or reaching a critical action.
5. **Subscription Funnel Conversion Rate** – The percentage of users who transition from a free trial to a paid subscription.

### Future Improvements and A/B Testing:

1. **Experiment Lift (%)** – To measure the improvement in engagement between A/B test variants.
2. **Retention Rate** (Day 1, 7, 30) – To assess how well users remain active after joining.
3. **Feature Adoption Rate** – To track how many users interact with new features (e.g., personalized recommendations, streaks).
4. **Churn Prediction Signals**:
   1. Decreasing session frequency
   2. Decreasing content completion rates
   3. Reduced interaction with new features
   
### Designing DWH
After deciding which metrics to track, I would focus on understanding the data required to measure them and how to integrate it into the data warehouse. My approach would include the following steps:

1. **Raw Data Layer**: Combine data from various sources, such as mobile and web event tracking, user information, subscriptions, and payments.
   
2. **Staging Layer**: Clean and structure the data. This would involve maintaining models in dbt and creating jobs with Airflow to orchestrate the process.

3. **Core Data Layer**: Store structured models for analysis. For example, I would create a model for user engagement called 'fact_user_engagement' and another for user retention named 'fact_user_retention_cohorts'.

4. **Data Marts Layer**: Focus on reporting and analysis to provide a more detailed and insightful view of the data.

### Creating Reports and Dashboards
After designing the data warehouse (DWH), I would create reports and dashboards to communicate insights to stakeholders. I would begin with the main dashboard of the platform, which would display key engagement metrics. Following that, I would develop separate dashboards tailored to each of the three aspects of engagement, as well as additional dashboards for different teams. For example, the product team would have a dashboard focusing on feature adoption and user retention, while the marketing team would have a dashboard centered on user acquisition and engagement.

## Blinkist DBT Project

This project aims to transform and analyze event data from Blinkist to generate key metrics like DAU, MAU, and content completions. It loads raw event data from CSVs, processes them through dbt models, and produces actionable insights for business stakeholders.

### Prerequisites
- Python 3.12+
- dbt (>= 1.9)
- PostgreSQL (>= 17.3)

### Setup Instructions
1. Clone the repository:
 ```bash
     git clone https://github.com/afletunova/test-dbt-project.git
     cd blinkist_dbt_project
 ```
2. Install dependences:
 ```bash
     pip install -r requirements.txt
 ```
3. Set up the dbt profile: 
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
4. Run dbt models: 
 ```bash
     dbt run
 ```

### Usage Instructions
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
