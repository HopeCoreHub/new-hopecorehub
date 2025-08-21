-- Add some likes to the posts
-- First, let's get some user IDs (we'll use the auth.users table, but we need to create some test users first)
-- For now, we'll create some sample user IDs and add them to profiles if they don't exist

-- Insert some sample users into profiles (these would typically be created via auth, but for demo purposes)
INSERT INTO public.profiles (id, full_name, anonymous_by_default, uses_avatar)
VALUES 
  ('11111111-1111-1111-1111-111111111111', 'Demo User 1', true, true),
  ('22222222-2222-2222-2222-222222222222', 'Demo User 2', true, true),
  ('33333333-3333-3333-3333-333333333333', 'Demo User 3', true, true),
  ('44444444-4444-4444-4444-444444444444', 'Demo User 4', true, true),
  ('55555555-5555-5555-5555-555555555555', 'Demo User 5', true, true)
ON CONFLICT (id) DO NOTHING;

-- Add likes to posts
INSERT INTO public.forum_post_likes (post_id, user_id)
SELECT 
  p.id as post_id,
  u.user_id
FROM public.forum_posts p
CROSS JOIN (
  VALUES 
    ('11111111-1111-1111-1111-111111111111'),
    ('22222222-2222-2222-2222-222222222222'),
    ('33333333-3333-3333-3333-333333333333'),
    ('44444444-4444-4444-4444-444444444444')
) u(user_id)
WHERE random() < 0.7 -- Randomly like about 70% of post-user combinations
ON CONFLICT DO NOTHING;

-- Add replies to posts
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
VALUES
-- Replies for English posts (GenZ slang)
((SELECT id FROM public.forum_posts WHERE content LIKE '%bruh%' LIMIT 1), '22222222-2222-2222-2222-222222222222', 'fr fr, anxiety hits different when you''re trying to adult 😭', true, now() - interval '2 hours'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%bruh%' LIMIT 1), '33333333-3333-3333-3333-333333333333', 'this is such a mood ngl, we all struggling out here', true, now() - interval '1 hour'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%lowkey%' LIMIT 1), '11111111-1111-1111-1111-111111111111', 'bestie you''re not alone! self-care Sunday is the vibe ✨', true, now() - interval '3 hours'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%lowkey%' LIMIT 1), '44444444-4444-4444-4444-444444444444', 'periodt! we need to normalize taking mental health days', true, now() - interval '30 minutes'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%ngl%' LIMIT 1), '55555555-5555-5555-5555-555555555555', 'this hits different, thanks for sharing bestie 💚', true, now() - interval '45 minutes'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%IYKYK%' LIMIT 1), '22222222-2222-2222-2222-222222222222', 'the struggle is real but we''re all here for each other 🫂', true, now() - interval '20 minutes'),

-- Replies for French posts
((SELECT id FROM public.forum_posts WHERE content LIKE '%C''est fou%' LIMIT 1), '11111111-1111-1111-1111-111111111111', 'Tu as tellement raison... parfois on se sent vraiment seul dans cette bataille', true, now() - interval '2 hours 30 minutes'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%C''est fou%' LIMIT 1), '33333333-3333-3333-3333-333333333333', 'Merci de partager ça. Ça fait du bien de savoir qu''on n''est pas les seuls 💙', true, now() - interval '1 hour 15 minutes'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%Je me sens%' LIMIT 1), '44444444-4444-4444-4444-444444444444', 'Courage ! Tu es plus fort(e) que tu ne le penses. On est là pour toi ❤️', true, now() - interval '4 hours'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%Je me sens%' LIMIT 1), '55555555-5555-5555-5555-555555555555', 'Prendre soin de sa santé mentale, c''est tellement important. Bravo pour ton courage de parler', true, now() - interval '2 hours 45 minutes'),

-- Replies for Kiswahili posts
((SELECT id FROM public.forum_posts WHERE content LIKE '%Wakati mwingine%' LIMIT 1), '22222222-2222-2222-2222-222222222222', 'Pole sana rafiki. Tunakuelewa kabisa. Hali ya akili ni muhimu sana.', true, now() - interval '3 hours 15 minutes'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%Wakati mwingine%' LIMIT 1), '11111111-1111-1111-1111-111111111111', 'Asante kwa kushiriki. Hakuna aibu katika kutafuta msaada. Tuko pamoja! 💚', true, now() - interval '1 hour 30 minutes'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%Naona ni muhimu%' LIMIT 1), '33333333-3333-3333-3333-333333333333', 'Ndiyo kabisa! Kuzungumza kuhusu mambo haya ni hatua muhimu. Hongera!', true, now() - interval '5 hours'),
((SELECT id FROM public.forum_posts WHERE content LIKE '%Naona ni muhimu%' LIMIT 1), '55555555-5555-5555-5555-555555555555', 'Baraka za Mungu rafiki. Umependa sana kushiriki mazingira mazuri haya 🙏', true, now() - interval '40 minutes'),

-- Additional mixed language replies
((SELECT id FROM public.forum_posts WHERE content LIKE '%Jambo wadau%' LIMIT 1), '44444444-4444-4444-4444-444444444444', 'Karibu sana! Hapa ni mahali salama pa kuzungumza 😊', true, now() - interval '6 hours'),

((SELECT id FROM public.forum_posts WHERE content LIKE '%Hujambo%' LIMIT 1), '11111111-1111-1111-1111-111111111111', 'Sijambo pia! Furaha kuona mazungumzo mazuri hapa', true, now() - interval '25 minutes'),

-- Some supportive general replies
((SELECT id FROM public.forum_posts ORDER BY created_at DESC LIMIT 1 OFFSET 1), '22222222-2222-2222-2222-222222222222', 'Thank you for creating this safe space for all of us 💕', true, now() - interval '10 minutes'),
((SELECT id FROM public.forum_posts ORDER BY created_at DESC LIMIT 1 OFFSET 2), '33333333-3333-3333-3333-333333333333', 'Sending love and positive vibes to everyone here ✨🌟', true, now() - interval '35 minutes');