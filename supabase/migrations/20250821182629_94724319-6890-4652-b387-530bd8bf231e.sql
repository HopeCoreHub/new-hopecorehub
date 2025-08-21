-- Add likes using existing user_ids from forum posts
-- Get all unique user_ids from posts and create cross-likes between users
INSERT INTO public.forum_post_likes (post_id, user_id)
SELECT DISTINCT
  p1.id as post_id,
  p2.user_id  -- Use user_id from other posts as likers
FROM public.forum_posts p1
CROSS JOIN public.forum_posts p2
WHERE p1.id != p2.id 
  AND p2.user_id IS NOT NULL
  AND p1.user_id IS NOT NULL
  AND random() < 0.6  -- About 60% chance for each combination
ON CONFLICT DO NOTHING;

-- Add replies using existing user_ids but mark them as anonymous
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT DISTINCT ON (p.id, u.user_id)
  p.id as post_id,
  u.user_id,  -- Use existing user_ids
  CASE 
    WHEN p.content LIKE '%bruh%' OR p.content LIKE '%anxiety%' THEN 
      (ARRAY[
        'fr fr, anxiety hits different when you''re trying to adult 😭',
        'this is such a mood ngl, we all struggling out here',
        'bestie you''re not alone! sending virtual hugs 💙',
        'periodt! mental health matters so much'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%lowkey%' OR p.content LIKE '%self-care%' THEN
      (ARRAY[
        'bestie you''re not alone! self-care Sunday is the vibe ✨',
        'periodt! we need to normalize taking mental health days',
        'this hits different, thanks for sharing 💚',
        'no cap, self-care is not selfish'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%C''est fou%' OR p.content LIKE '%anxiété%' THEN
      (ARRAY[
        'Tu as tellement raison... parfois on se sent vraiment seul dans cette bataille',
        'Merci de partager ça. Ça fait du bien de savoir qu''on n''est pas les seuls 💙',
        'Courage ! On est tous ensemble dans cette épreuve ❤️',
        'Ta sincérité nous touche beaucoup, merci'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%Je me sens%' OR p.content LIKE '%santé mentale%' THEN
      (ARRAY[
        'Courage ! Tu es plus fort(e) que tu ne le penses. On est là pour toi ❤️',
        'Prendre soin de sa santé mentale, c''est tellement important. Bravo pour ton courage de parler',
        'Tu n''es pas seul(e) dans cette bataille. Nous sommes avec toi 💚',
        'Merci de nous faire confiance pour partager cela'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%Wakati mwingine%' OR p.content LIKE '%huzuni%' THEN
      (ARRAY[
        'Pole sana rafiki. Tunakuelewa kabisa. Hali ya akili ni muhimu sana.',
        'Asante kwa kushiriki. Hakuna aibu katika kutafuta msaada. Tuko pamoja! 💚',
        'Mungu akupe nguvu. Huna peke yako katika mapambano haya',
        'Baraka za Mungu kwa ushujaa wako wa kuzungumza'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%Naona ni muhimu%' OR p.content LIKE '%afya ya akili%' THEN
      (ARRAY[
        'Ndiyo kabisa! Kuzungumza kuhusu mambo haya ni hatua muhimu. Hongera!',
        'Baraka za Mungu rafiki. Umependa sana kushiriki mazingira mazuri haya 🙏',
        'Asante kwa kuwa mfano mzuri kwa wengine wengi',
        'Hongera kwa ushujaa wako wa kushiriki'
      ])[floor(random() * 4) + 1]
    WHEN p.content LIKE '%Jambo wadau%' OR p.content LIKE '%Hujambo%' THEN
      (ARRAY[
        'Karibu sana! Hapa ni mahali salamu pa kuzungumza 😊',
        'Sijambo pia! Furaha kuona mazungumzo mazuri hapa',
        'Ahsante kwa kutuongoza katika mazungumzo haya muhimu',
        'Karibu kwenye jamii yetu ya upendo na msaada'
      ])[floor(random() * 4) + 1]
    ELSE
      (ARRAY[
        'Thank you for sharing this with us 💕',
        'Sending love and positive vibes to everyone here ✨🌟',
        'This community is such a safe space, thank you',
        'Your courage to share helps others feel less alone 💙'
      ])[floor(random() * 4) + 1]
  END as content,
  true as is_anonymous,  -- Mark as anonymous even though it has user_id
  p.created_at + (random() * interval '6 hours') as created_at
FROM public.forum_posts p
CROSS JOIN (SELECT DISTINCT user_id FROM public.forum_posts WHERE user_id IS NOT NULL) u
WHERE p.user_id != u.user_id  -- Don't let users reply to their own posts
  AND random() < 0.7  -- 70% chance for each combination
ORDER BY p.created_at;

-- Add some additional supportive replies
INSERT INTO public.forum_replies (post_id, user_id, content, is_anonymous, created_at)
SELECT DISTINCT ON (p.id, u.user_id)
  p.id as post_id,
  u.user_id,
  (ARRAY[
    'This resonates so deeply with me 🫂',
    'Thank you for being so vulnerable and honest',
    'You''re braver than you know for sharing this',
    'Merci infiniment pour ce partage précieux 💙',
    'Ton message m''a vraiment touché(e)',
    'Asante sana kwa huu ushujaa mkubwa 🙏',
    'Nimesikitishwa na ujasiri wako',
    'We see you, we hear you, we''re with you',
    'Your words matter and your feelings are valid',
    'Sending you so much strength and love ✨'
  ])[floor(random() * 10) + 1] as content,
  true as is_anonymous,
  p.created_at + (random() * interval '12 hours') as created_at
FROM public.forum_posts p
CROSS JOIN (SELECT DISTINCT user_id FROM public.forum_posts WHERE user_id IS NOT NULL LIMIT 3) u
WHERE p.user_id != u.user_id
  AND random() < 0.4  -- 40% chance for additional replies
ORDER BY p.created_at;