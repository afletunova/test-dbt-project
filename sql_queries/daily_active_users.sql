SELECT 
    COUNT(DISTINCT user_id) AS daily_active_users,
    event_date AS day
FROM {{ ref('engagement') }}
GROUP BY event_date
ORDER BY event_date DESC
