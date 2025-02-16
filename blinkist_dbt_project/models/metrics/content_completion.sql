SELECT 
    COUNT(*) AS content_completions
FROM {{ ref('engagement') }}
WHERE event_name = 'item-finished'
    AND platform = 'web'