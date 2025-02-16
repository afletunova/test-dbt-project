SELECT 
    country_code,
    COUNT(DISTINCT user_id) AS active_users
FROM {{ ref('engagement') }}
WHERE is_dach_country = TRUE
    AND platform = 'mobile'
    AND event_date BETWEEN now() - INTERVAL '30 days' AND now()
GROUP BY country_code
ORDER BY active_users DESC
