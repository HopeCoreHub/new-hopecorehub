-- Add multilingual forum posts with GenZ slang and actual replies

-- First, add some English posts with GenZ slang
INSERT INTO forum_posts (id, user_id, content, is_anonymous, created_at, updated_at, likes_count, replies_count) VALUES
('550e8400-e29b-41d4-a716-446655440001', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'no cap, this mental health journey is actually fire 🔥 been going to therapy and it hits different fr fr', true, '2024-08-15 10:30:00', '2024-08-15 10:30:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440002', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'okay but why is self-care so expensive?? like bestie I just want to be okay without going broke 😭 anyone else feel this?', true, '2024-08-14 15:45:00', '2024-08-14 15:45:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440003', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'periodt. finally started setting boundaries and the relief is unmatched ✨ saying no is actually self-care y''all', true, '2024-08-13 09:20:00', '2024-08-13 09:20:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440004', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'social anxiety really said "let me ruin this for you" today 🤡 but we move! tomorrow is a new day bestie', true, '2024-08-12 20:15:00', '2024-08-12 20:15:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440005', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'lowkey proud of myself for getting out of bed today ngl 💪 depression era but we''re still fighting', true, '2024-08-11 12:00:00', '2024-08-11 12:00:00', 0, 0);

-- Add French forum posts
INSERT INTO forum_posts (id, user_id, content, is_anonymous, created_at, updated_at, likes_count, replies_count) VALUES
('550e8400-e29b-41d4-a716-446655440006', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Salut tout le monde 👋 Je traverse une période difficile en ce moment et j''aimerais parler avec quelqu''un qui comprend. Comment gérez-vous l''anxiété au quotidien?', true, '2024-08-10 14:30:00', '2024-08-10 14:30:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440007', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'La méditation m''aide beaucoup ces derniers temps 🧘‍♀️ Quelqu''un d''autre pratique? J''aimerais échanger nos techniques favorites', true, '2024-08-09 11:15:00', '2024-08-09 11:15:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440008', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Parfois je me sens complètement dépassée par tout... Le travail, la famille, mes propres attentes. Comment trouvez-vous l''équilibre?', true, '2024-08-08 16:45:00', '2024-08-08 16:45:00', 0, 0);

-- Add Kiswahili forum posts
INSERT INTO forum_posts (id, user_id, content, is_anonymous, created_at, updated_at, likes_count, replies_count) VALUES
('550e8400-e29b-41d4-a716-446655440009', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Habari zenu familia 🙏 Nina hali ya wasiwasi na nimegundua kuwa mazungumzo yanasaidia sana. Je, mna njia gani za kupunguza mkazo?', true, '2024-08-07 13:20:00', '2024-08-07 13:20:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440010', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Leo nimejifunza kitu muhimu - ni sawa kutaka msaada 💚 Tusaidiane katika safari hii ya afya ya akili', true, '2024-08-06 10:00:00', '2024-08-06 10:00:00', 0, 0),
('550e8400-e29b-41d4-a716-446655440011', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Maombi yanasaidia sana katika wakati mgumu 🤲 Pia kuzungumza na marafiki wanaoamini. Mnapendekeza nini kingine?', true, '2024-08-05 18:30:00', '2024-08-05 18:30:00', 0, 0);

-- Add replies to the posts
-- Replies for English GenZ posts
INSERT INTO forum_replies (id, post_id, user_id, content, is_anonymous, created_at, updated_at) VALUES
-- Replies for "no cap, this mental health journey is actually fire"
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'this is so real bestie! therapy really be life-changing when you find the right one 💯', true, '2024-08-15 11:00:00', '2024-08-15 11:00:00'),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'proud of you for taking that step! it takes courage fr', true, '2024-08-15 12:15:00', '2024-08-15 12:15:00'),

-- Replies for "self-care so expensive"
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'felt this in my soul 😭 try free apps like Headspace trials or YouTube yoga videos!', true, '2024-08-14 16:00:00', '2024-08-14 16:00:00'),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'literally why mental health is a privilege :( but we gotta work with what we got', true, '2024-08-14 17:30:00', '2024-08-14 17:30:00'),

-- Replies for "setting boundaries"
('660e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'this!! boundaries are everything. still learning but it gets easier', true, '2024-08-13 10:00:00', '2024-08-13 10:00:00'),

-- Replies for French posts
('660e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440006', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Je comprends totalement 💙 Pour moi, la respiration profonde et les promenades aident beaucoup. Tu n''es pas seul(e) dans cette épreuve!', true, '2024-08-10 15:00:00', '2024-08-10 15:00:00'),
('660e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440006', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Courage mon ami(e). Les applications comme Petit BamBou peuvent être un bon début', true, '2024-08-10 16:20:00', '2024-08-10 16:20:00'),

('660e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440007', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Oui! J''utilise Headspace et ça m''aide énormément. On peut s''encourager mutuellement 🌸', true, '2024-08-09 12:00:00', '2024-08-09 12:00:00'),

-- Replies for Kiswahili posts
('660e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440009', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Asante kwa kushiriki 🙏 Mimi huomba na kufanya mazoezi. Pia muziki wa utulivu unasaidia sana', true, '2024-08-07 14:00:00', '2024-08-07 14:00:00'),
('660e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440009', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Tunakuunga mkono! Kuzungumza na familia na marafiki pia kunasaidia', true, '2024-08-07 15:30:00', '2024-08-07 15:30:00'),

('660e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440010', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Ni kweli sana! Hakuna aibu katika kutafuta msaada. Tuko pamoja 💚', true, '2024-08-06 11:15:00', '2024-08-06 11:15:00'),

('660e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440011', '016df5ee-c7d6-4b88-9a20-cb3c7ad0270c', 'Maombi ni nguvu sana 🤲 Pia kusoma vitabu vya kujinasua vimesaidia', true, '2024-08-05 19:00:00', '2024-08-05 19:00:00');

-- Update the reply counts for all posts that have replies
UPDATE forum_posts SET replies_count = 2 WHERE id IN ('550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440009');
UPDATE forum_posts SET replies_count = 1 WHERE id IN ('550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440011');