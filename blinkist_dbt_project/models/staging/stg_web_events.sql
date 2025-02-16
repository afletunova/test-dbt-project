WITH raw_web_events AS (
    SELECT 
        event_name,
        event_timestamp,
        user_id,
        fingerprint,
        arrival_timestamp,
        browser_name,
        browser_version,
        language,
        screen_resolution,
        device_type,
        cookies_enabled,
        session_id,
        user_access_type,
        country_code,
        referrer,
        item_id,
        item_type,
        item_title
    FROM {{ ref('web_events') }}
)
SELECT 
    event_name,
    event_timestamp::timestamp as event_timestamp,
    user_id,
    fingerprint,
    arrival_timestamp::timestamp as arrival_timestamp,
    browser_name,
    browser_version,
    language,
    screen_resolution,
    device_type,
    cookies_enabled,
    session_id,
    user_access_type,
    country_code,
    referrer,
    item_id,
    item_type,
    item_title
FROM raw_web_events
