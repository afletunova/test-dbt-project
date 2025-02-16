SELECT 
    COUNT(*) AS content_completions
FROM public.engagement 
WHERE event_name = 'item-finished'
    AND platform = 'web';