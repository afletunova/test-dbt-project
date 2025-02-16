WITH raw_mobile_events AS (
    SELECT 
        client_id,
        event_name,
        application_version_code,
        application_version_name,
        arrival_timestamp,
        category,
        event_timestamp,
        user_access_type,
        user_id,
        item_id,
        item_type,
        item_title,
        device_locale_code,
        device_locale_country,
        device_locale_language,
        device_make,
        device_platform_name,
        session_id
    FROM {{ ref('mobile_events') }}
)
SELECT 
    client_id,
    event_name,
    application_version_code,
    application_version_name,
    arrival_timestamp::timestamp as arrival_timestamp,
    category,
    event_timestamp::timestamp as event_timestamp,
    user_access_type,
    user_id,
    item_id,
    item_type,
    item_title,
    device_locale_code,
    device_locale_country,
    device_locale_language,
    device_make,
    device_platform_name,
    session_id
FROM raw_mobile_events
