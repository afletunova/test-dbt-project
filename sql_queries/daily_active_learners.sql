SELECT 
    COUNT(DISTINCT user_id) AS daily_active_users,
    event_date AS day
FROM public.engagement
WHERE is_content_event = TRUE
GROUP BY event_date
ORDER BY event_date DESC;
