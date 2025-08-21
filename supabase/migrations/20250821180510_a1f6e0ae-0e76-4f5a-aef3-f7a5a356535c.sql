-- Add realistic likes to the forum posts using the existing test user

INSERT INTO forum_post_likes (id, post_id, user_id, created_at)
SELECT 
  gen_random_uuid(),
  fp.id,
  '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', -- The existing user from the test post
  fp.created_at + (random() * interval '5 days') -- Random time within 5 days of post creation
FROM forum_posts fp
CROSS JOIN generate_series(1, GREATEST(1, LEAST(fp.likes_count, 3))) -- Generate likes based on likes_count, max 3 per user
WHERE fp.created_at >= '2024-07-01' AND fp.created_at <= '2024-08-21'
  AND fp.content NOT LIKE 'MacJovan testing%'; -- Exclude the original test post