-- Add realistic replies to the forum posts

-- Insert replies for various posts
INSERT INTO forum_replies (id, post_id, user_id, content, is_anonymous, created_at, updated_at)
VALUES 
-- Replies to "Today marks 3 months since I left"
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Today marks 3 months%' LIMIT 1), 
 NULL, 
 'You ARE stronger than you know. 3 months is huge - be proud of how far you''ve come. 💜', 
 true, '2024-07-01 11:30:00+00', '2024-07-01 11:30:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Today marks 3 months%' LIMIT 1), 
 NULL, 
 'Every single day you choose yourself is a victory. Keep going! 🌟', 
 true, '2024-07-02 08:45:00+00', '2024-07-02 08:45:00+00'),

-- Replies to "I finally got the courage to change my locks"
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'I finally got the courage%' LIMIT 1), 
 NULL, 
 'Changing locks was one of my first steps too. Such a powerful symbol. You''re doing amazing.', 
 true, '2024-07-03 16:15:00+00', '2024-07-03 16:15:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'I finally got the courage%' LIMIT 1), 
 NULL, 
 'Yes! These physical changes matter so much. I did the same thing and it felt like reclaiming my space.', 
 true, '2024-07-04 09:20:00+00', '2024-07-04 09:20:00+00'),

-- Replies to "Starting therapy next week"
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Starting therapy next week%' LIMIT 1), 
 NULL, 
 'EMDR changed my life. It''s intense but so worth it. Your therapist will guide you through everything. You''ve got this!', 
 true, '2024-07-08 14:45:00+00', '2024-07-08 14:45:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Starting therapy next week%' LIMIT 1), 
 NULL, 
 'EMDR therapist here - it''s completely normal to feel nervous. Trust the process and be patient with yourself.', 
 true, '2024-07-08 17:30:00+00', '2024-07-08 17:30:00+00'),

-- Replies to "Bad day today"
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Bad day today%' LIMIT 1), 
 NULL, 
 'You''re not going backwards, you''re processing. Healing isn''t linear. Bad days don''t erase your progress. Be gentle with yourself.', 
 true, '2024-07-12 22:30:00+00', '2024-07-12 22:30:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Bad day today%' LIMIT 1), 
 NULL, 
 'Sending you so much love and strength. This community has been my lifeline too.', 
 true, '2024-07-13 10:15:00+00', '2024-07-13 10:15:00+00'),

-- Replies to "Question for the group"
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Question for the group%' LIMIT 1), 
 NULL, 
 'I had to distance myself from some friends who couldn''t understand. It hurts but protecting your peace comes first.', 
 true, '2024-08-14 21:45:00+00', '2024-08-14 21:45:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Question for the group%' LIMIT 1), 
 NULL, 
 'I started saying "I''m still processing what happened and need time." Most people respect that boundary.', 
 true, '2024-08-15 10:30:00+00', '2024-08-15 10:30:00+00'),

-- More replies for active engagement
(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'I laughed today%' LIMIT 1), 
 NULL, 
 'This made me smile! Joy IS still possible. Thank you for the reminder. 🌈', 
 true, '2024-08-10 09:20:00+00', '2024-08-10 09:20:00+00'),

(gen_random_uuid(), 
 (SELECT id FROM forum_posts WHERE content LIKE 'Celebrated a small victory%' LIMIT 1), 
 NULL, 
 'YES! These "small" victories are actually HUGE. So proud of you! 👏', 
 true, '2024-07-19 08:45:00+00', '2024-07-19 08:45:00+00');