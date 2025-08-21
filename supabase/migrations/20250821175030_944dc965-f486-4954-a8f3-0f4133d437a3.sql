-- Insert realistic forum posts with anonymous users from July 1st to August 21st
-- Generate realistic UUIDs for anonymous users (these won't be real auth users)

INSERT INTO forum_posts (id, user_id, content, is_anonymous, likes_count, replies_count, created_at, updated_at) VALUES
-- July posts
(gen_random_uuid(), gen_random_uuid(), 'Today marks 3 months since I left. Some days are harder than others, but I''m learning to trust myself again. To anyone reading this - you are stronger than you know. 💜', true, 8, 3, '2024-07-01 09:15:00+00', '2024-07-01 09:15:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'I finally got the courage to change my locks today. Such a small thing but it feels like taking my power back. One step at a time.', true, 12, 5, '2024-07-03 14:22:00+00', '2024-07-03 14:22:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Starting therapy next week. I''m nervous but hopeful. Has anyone here tried EMDR? Would love to hear about your experiences.', true, 6, 7, '2024-07-08 11:30:00+00', '2024-07-08 11:30:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Bad day today. Feeling like I''m going backwards. Sometimes I wonder if I''ll ever feel normal again. Just needed to say that somewhere safe.', true, 15, 8, '2024-07-12 20:45:00+00', '2024-07-12 20:45:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Celebrated a small victory today - I went to the grocery store alone without anxiety. 6 months ago this seemed impossible. Healing isn''t linear but it''s happening. ✨', true, 22, 6, '2024-07-18 16:30:00+00', '2024-07-18 16:30:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'For anyone struggling with sleep - chamomile tea and a weighted blanket have been game changers for me. Also, this forum. Knowing I''m not alone helps so much.', true, 9, 4, '2024-07-25 22:18:00+00', '2024-07-25 22:18:00+00'),

-- August posts
(gen_random_uuid(), gen_random_uuid(), 'It''s been a year since I reported. The legal process is draining but I''m glad I spoke up. To anyone considering it - you deserve justice, and you deserve to be believed.', true, 18, 9, '2024-08-02 10:45:00+00', '2024-08-02 10:45:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Trigger warning: mentions of flashbacks. Having a rough week with memories surfacing. My therapist says this is part of healing but it''s exhausting. Sending strength to everyone here.', true, 11, 5, '2024-08-05 13:20:00+00', '2024-08-05 13:20:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'I laughed today. Really laughed. For the first time in months. It was just a silly video but I realized - joy is still possible. Even after everything. Don''t give up on yourself. 🌱', true, 25, 7, '2024-08-09 15:40:00+00', '2024-08-09 15:40:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Question for the group: How do you handle well-meaning friends who don''t understand why you can''t "just move on"? I''m tired of explaining myself but I also don''t want to lose friendships.', true, 14, 12, '2024-08-14 19:30:00+00', '2024-08-14 19:30:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Set a boundary with my family today about not discussing "what happened" at gatherings. It was scary but necessary. They didn''t take it well but I''m proud of myself for speaking up.', true, 16, 6, '2024-08-18 12:15:00+00', '2024-08-18 12:15:00+00'),

(gen_random_uuid(), gen_random_uuid(), 'Reminder: Healing is not about forgetting. It''s about reclaiming your life. It''s about choosing yourself every day, even when it''s hard. Especially when it''s hard. You matter. Your story matters.', true, 31, 4, '2024-08-21 08:00:00+00', '2024-08-21 08:00:00+00');

-- Insert realistic replies to some of the posts
-- Get the post IDs we just created (we'll use the content to match)
WITH post_ids AS (
  SELECT id, content FROM forum_posts 
  WHERE content IN (
    'Today marks 3 months since I left. Some days are harder than others, but I''m learning to trust myself again. To anyone reading this - you are stronger than you know. 💜',
    'I finally got the courage to change my locks today. Such a small thing but it feels like taking my power back. One step at a time.',
    'Starting therapy next week. I''m nervous but hopeful. Has anyone here tried EMDR? Would love to hear about your experiences.',
    'Bad day today. Feeling like I''m going backwards. Sometimes I wonder if I''ll ever feel normal again. Just needed to say that somewhere safe.',
    'Question for the group: How do you handle well-meaning friends who don''t understand why you can''t "just move on"? I''m tired of explaining myself but I also don''t want to lose friendships.'
  )
)
INSERT INTO forum_replies (id, post_id, user_id, content, is_anonymous, created_at, updated_at)
SELECT 
  gen_random_uuid(),
  p.id,
  gen_random_uuid(),
  CASE 
    WHEN p.content LIKE 'Today marks 3 months%' THEN 'You ARE stronger than you know. 3 months is huge - be proud of how far you''ve come. 💜'
    WHEN p.content LIKE 'I finally got the courage%' THEN 'Changing locks was one of my first steps too. Such a powerful symbol. You''re doing amazing.'
    WHEN p.content LIKE 'Starting therapy next week%' THEN 'EMDR changed my life. It''s intense but so worth it. Your therapist will guide you through everything. You''ve got this!'
    WHEN p.content LIKE 'Bad day today%' THEN 'You''re not going backwards, you''re processing. Healing isn''t linear. Bad days don''t erase your progress. Be gentle with yourself.'
    WHEN p.content LIKE 'Question for the group%' THEN 'I had to distance myself from some friends who couldn''t understand. It hurts but protecting your peace comes first.'
  END,
  true,
  p.created_at + interval '2 hours',
  p.created_at + interval '2 hours'
FROM post_ids p;

-- Add more replies to create realistic conversations
INSERT INTO forum_replies (id, post_id, user_id, content, is_anonymous, created_at, updated_at)
SELECT 
  gen_random_uuid(),
  fp.id,
  gen_random_uuid(),
  'Sending you so much love and strength. This community has been my lifeline too.',
  true,
  fp.created_at + interval '1 day',
  fp.created_at + interval '1 day'
FROM forum_posts fp 
WHERE fp.content LIKE 'Bad day today%';

-- Add more diverse replies
INSERT INTO forum_replies (id, post_id, user_id, content, is_anonymous, created_at, updated_at)
SELECT 
  gen_random_uuid(),
  fp.id,
  gen_random_uuid(),
  'EMDR therapist here - it''s completely normal to feel nervous. Trust the process and be patient with yourself.',
  true,
  fp.created_at + interval '6 hours',
  fp.created_at + interval '6 hours'
FROM forum_posts fp 
WHERE fp.content LIKE 'Starting therapy next week%';

-- Insert realistic likes for the posts
-- We'll create multiple like entries for each post based on the likes_count we set
INSERT INTO forum_post_likes (id, post_id, user_id, created_at)
SELECT 
  gen_random_uuid(),
  fp.id,
  gen_random_uuid(),
  fp.created_at + (random() * interval '7 days')
FROM forum_posts fp
CROSS JOIN generate_series(1, LEAST(fp.likes_count, 10)) -- Limit to prevent too many inserts
WHERE fp.created_at >= '2024-07-01';