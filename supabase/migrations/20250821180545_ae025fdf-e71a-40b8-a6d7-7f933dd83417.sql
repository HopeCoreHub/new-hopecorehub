-- Add one like per new forum post from the existing test user
-- Only add likes where they don't already exist

INSERT INTO forum_post_likes (id, post_id, user_id, created_at)
SELECT 
  gen_random_uuid(),
  fp.id,
  '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c',
  fp.created_at + interval '1 hour'
FROM forum_posts fp
WHERE fp.created_at >= '2024-07-01' 
  AND fp.created_at <= '2024-08-21'
  AND fp.content NOT LIKE 'MacJovan testing%'
  AND NOT EXISTS (
    SELECT 1 FROM forum_post_likes fpl 
    WHERE fpl.post_id = fp.id 
    AND fpl.user_id = '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c'
  );