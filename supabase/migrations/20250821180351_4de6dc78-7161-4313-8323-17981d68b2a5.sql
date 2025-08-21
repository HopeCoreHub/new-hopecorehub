-- Insert realistic forum posts with anonymous users from July 1st to August 21st

INSERT INTO forum_posts (id, user_id, content, is_anonymous, likes_count, replies_count, created_at, updated_at) VALUES
-- July posts  
(gen_random_uuid(), NULL, 'Today marks 3 months since I left. Some days are harder than others, but I''m learning to trust myself again. To anyone reading this - you are stronger than you know. 💜', true, 8, 3, '2024-07-01 09:15:00+00', '2024-07-01 09:15:00+00'),

(gen_random_uuid(), NULL, 'I finally got the courage to change my locks today. Such a small thing but it feels like taking my power back. One step at a time.', true, 12, 5, '2024-07-03 14:22:00+00', '2024-07-03 14:22:00+00'),

(gen_random_uuid(), NULL, 'Starting therapy next week. I''m nervous but hopeful. Has anyone here tried EMDR? Would love to hear about your experiences.', true, 6, 7, '2024-07-08 11:30:00+00', '2024-07-08 11:30:00+00'),

(gen_random_uuid(), NULL, 'Bad day today. Feeling like I''m going backwards. Sometimes I wonder if I''ll ever feel normal again. Just needed to say that somewhere safe.', true, 15, 8, '2024-07-12 20:45:00+00', '2024-07-12 20:45:00+00'),

(gen_random_uuid(), NULL, 'Celebrated a small victory today - I went to the grocery store alone without anxiety. 6 months ago this seemed impossible. Healing isn''t linear but it''s happening. ✨', true, 22, 6, '2024-07-18 16:30:00+00', '2024-07-18 16:30:00+00'),

(gen_random_uuid(), NULL, 'For anyone struggling with sleep - chamomile tea and a weighted blanket have been game changers for me. Also, this forum. Knowing I''m not alone helps so much.', true, 9, 4, '2024-07-25 22:18:00+00', '2024-07-25 22:18:00+00'),

-- August posts
(gen_random_uuid(), NULL, 'It''s been a year since I reported. The legal process is draining but I''m glad I spoke up. To anyone considering it - you deserve justice, and you deserve to be believed.', true, 18, 9, '2024-08-02 10:45:00+00', '2024-08-02 10:45:00+00'),

(gen_random_uuid(), NULL, 'Trigger warning: mentions of flashbacks. Having a rough week with memories surfacing. My therapist says this is part of healing but it''s exhausting. Sending strength to everyone here.', true, 11, 5, '2024-08-05 13:20:00+00', '2024-08-05 13:20:00+00'),

(gen_random_uuid(), NULL, 'I laughed today. Really laughed. For the first time in months. It was just a silly video but I realized - joy is still possible. Even after everything. Don''t give up on yourself. 🌱', true, 25, 7, '2024-08-09 15:40:00+00', '2024-08-09 15:40:00+00'),

(gen_random_uuid(), NULL, 'Question for the group: How do you handle well-meaning friends who don''t understand why you can''t "just move on"? I''m tired of explaining myself but I also don''t want to lose friendships.', true, 14, 12, '2024-08-14 19:30:00+00', '2024-08-14 19:30:00+00'),

(gen_random_uuid(), NULL, 'Set a boundary with my family today about not discussing "what happened" at gatherings. It was scary but necessary. They didn''t take it well but I''m proud of myself for speaking up.', true, 16, 6, '2024-08-18 12:15:00+00', '2024-08-18 12:15:00+00'),

(gen_random_uuid(), NULL, 'Reminder: Healing is not about forgetting. It''s about reclaiming your life. It''s about choosing yourself every day, even when it''s hard. Especially when it''s hard. You matter. Your story matters.', true, 31, 4, '2024-08-21 08:00:00+00', '2024-08-21 08:00:00+00');