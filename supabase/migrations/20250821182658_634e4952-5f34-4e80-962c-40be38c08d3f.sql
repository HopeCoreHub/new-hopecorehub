-- Add likes using existing user_ids from forum posts
INSERT INTO public.forum_post_likes (post_id, user_id)
SELECT 
  p1.id as post_id,
  p2.user_id  -- Use user_id from other posts as likers
FROM public.forum_posts p1
CROSS JOIN public.forum_posts p2
WHERE p1.id != p2.id 
  AND p2.user_id IS NOT NULL
  AND p1.user_id IS NOT NULL
  AND random() < 0.6  -- About 60% chance for each combination
LIMIT 50  -- Limit to avoid too many likes
ON CONFLICT DO NOTHING;

-- Add replies for English posts with GenZ slang
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'fr fr, anxiety hits different when you''re trying to adult 😭' as content,
  true as is_anonymous,
  p.created_at + interval '2 hours' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%bruh%' OR p.content LIKE '%anxiety%'
LIMIT 3;

INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'bestie you''re not alone! self-care Sunday is the vibe ✨' as content,
  true as is_anonymous,
  p.created_at + interval '3 hours' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%lowkey%' OR p.content LIKE '%self-care%'
LIMIT 2;

-- Add replies for French posts
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'Tu as tellement raison... parfois on se sent vraiment seul dans cette bataille' as content,
  true as is_anonymous,
  p.created_at + interval '2 hours 30 minutes' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%C''est fou%' OR p.content LIKE '%anxiété%'
LIMIT 2;

INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'Courage ! Tu es plus fort(e) que tu ne le penses. On est là pour toi ❤️' as content,
  true as is_anonymous,
  p.created_at + interval '4 hours' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%Je me sens%' OR p.content LIKE '%santé mentale%'
LIMIT 2;

-- Add replies for Kiswahili posts
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'Pole sana rafiki. Tunakuelewa kabisa. Hali ya akili ni muhimu sana.' as content,
  true as is_anonymous,
  p.created_at + interval '3 hours 15 minutes' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%Wakati mwingine%' OR p.content LIKE '%huzuni%'
LIMIT 2;

INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'Ndiyo kabisa! Kuzungumza kuhusu mambo haya ni hatua muhimu. Hongera!' as content,
  true as is_anonymous,
  p.created_at + interval '5 hours' as created_at
FROM public.forum_posts p
WHERE p.content LIKE '%Naona ni muhimu%' OR p.content LIKE '%afya ya akili%'
LIMIT 2;

-- Add some general supportive replies
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT 
  p.id as post_id,
  (SELECT user_id FROM public.forum_posts WHERE user_id IS NOT NULL AND id != p.id ORDER BY random() LIMIT 1) as user_id,
  'Thank you for sharing this with us 💕' as content,
  true as is_anonymous,
  p.created_at + interval '10 minutes' as created_at
FROM public.forum_posts p
ORDER BY p.created_at DESC
LIMIT 5;