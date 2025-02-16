WITH mobile_events AS (
    SELECT
        user_id,
        event_name,
        event_timestamp,
        device_locale_country AS country_code
    FROM {{ ref('stg_mobile_events') }}
),
web_events AS (
    SELECT
        user_id,
        event_name,
        event_timestamp,
        country_code
    FROM {{ ref('stg_web_events') }}
),
engagement AS (
    SELECT
        user_id,
        event_name,
        event_timestamp,
        'mobile' AS platform,
        country_code
    FROM mobile_events
    UNION ALL
    SELECT
        user_id,
        event_name,
        event_timestamp,
        'web' AS platform,
        country_code
    FROM web_events
)
SELECT
    user_id,
    event_name,
    event_timestamp::date AS event_date,
    platform,
    country_code,
    event_name IN ('item-started', 'item-finished') AS is_content_event,
    country_code IN ('DE', 'AT', 'CH') AS is_dach_country
FROM engagement
