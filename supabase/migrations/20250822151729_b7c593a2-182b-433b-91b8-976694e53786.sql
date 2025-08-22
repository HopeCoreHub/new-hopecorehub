-- Create temporary survey responses table
CREATE TABLE public.temp_muganga_survey_responses (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID NOT NULL,
  subscription_date DATE NOT NULL,
  survey_completed_date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  therapy_rating INTEGER NOT NULL CHECK (therapy_rating >= 1 AND therapy_rating <= 5),
  cost_feedback TEXT NOT NULL,
  communication_preference TEXT NOT NULL,
  overall_experience TEXT NOT NULL,
  would_recommend BOOLEAN NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Insert 38 fake survey responses
INSERT INTO public.temp_muganga_survey_responses (
  user_id, subscription_date, survey_completed_date, therapy_rating, 
  cost_feedback, communication_preference, overall_experience, would_recommend
) VALUES
-- July 2024 subscribers (18 responses)
(gen_random_uuid(), '2024-07-03', '2024-07-10 14:30:00+00', 4, 'The therapy was very helpful but 2000 RWF monthly is quite expensive for me as a student', 'I wish we could have video calls within the app instead of using phone calls', 'Good experience overall, therapist was professional', true),
(gen_random_uuid(), '2024-07-05', '2024-07-12 09:15:00+00', 5, 'Excellent therapy sessions but the cost is a bit high for regular income earners', 'Would prefer in-app audio calls rather than Google Meet links', 'Amazing support, helped me through difficult times', true),
(gen_random_uuid(), '2024-07-08', '2024-07-15 16:45:00+00', 3, 'Good service but too expensive compared to other options', 'Phone calls are inconvenient, need in-app video calling feature', 'Decent experience, could be improved', true),
(gen_random_uuid(), '2024-07-10', '2024-07-17 11:20:00+00', 4, 'Very effective therapy but 2000 RWF monthly is challenging for my budget', 'Please add video call functionality in the app', 'Therapist was understanding and helpful', true),
(gen_random_uuid(), '2024-07-12', '2024-07-19 13:00:00+00', 5, 'Great therapy sessions, worth it but expensive', 'In-app calling would be much better than external phone calls', 'Excellent professional service', true),
(gen_random_uuid(), '2024-07-15', '2024-07-22 10:30:00+00', 4, 'Helpful sessions but cost is a barrier for continued subscription', 'Need integrated video calling instead of using phone', 'Good experience, therapist was knowledgeable', true),
(gen_random_uuid(), '2024-07-17', '2024-07-24 15:45:00+00', 3, 'Therapy helped but too expensive for long-term use', 'Would love in-app audio/video calls instead of Google Meet', 'Okay experience, price is the main issue', true),
(gen_random_uuid(), '2024-07-19', '2024-07-26 12:15:00+00', 4, 'Quality therapy but high cost makes it unsustainable', 'App should have built-in calling feature', 'Good support, financial constraint is the problem', true),
(gen_random_uuid(), '2024-07-21', '2024-07-28 09:45:00+00', 5, 'Excellent therapy, just wish it was more affordable', 'Phone calls are not private enough, need in-app video', 'Outstanding therapist, very professional', true),
(gen_random_uuid(), '2024-07-23', '2024-07-30 14:00:00+00', 4, 'Very good sessions but 2000 RWF is steep for many of us', 'In-app calling would provide better privacy', 'Helpful experience, cost is limiting factor', true),
(gen_random_uuid(), '2024-07-25', '2024-08-01 11:30:00+00', 3, 'Decent therapy but overpriced for the local market', 'External calls are inconvenient, need app integration', 'Average experience, mainly due to cost concerns', true),
(gen_random_uuid(), '2024-07-27', '2024-08-03 16:20:00+00', 4, 'Good therapy but expensive for regular use', 'Would prefer video calls within the app', 'Positive experience despite cost issues', true),
(gen_random_uuid(), '2024-07-29', '2024-08-05 13:45:00+00', 5, 'Excellent service but pricing is challenging', 'App needs integrated calling functionality', 'Great therapist, very supportive', true),
(gen_random_uuid(), '2024-07-30', '2024-08-06 10:15:00+00', 4, 'Helpful therapy sessions, cost is the only downside', 'Phone calls lack the convenience of in-app features', 'Good overall experience', true),
(gen_random_uuid(), '2024-07-31', '2024-08-07 15:00:00+00', 3, 'Therapy was useful but too expensive to continue', 'Need in-app video calling instead of external links', 'Decent service, price needs to be reconsidered', true),
(gen_random_uuid(), '2024-07-28', '2024-08-04 12:30:00+00', 4, 'Quality therapy but high monthly cost is prohibitive', 'In-app audio calls would be more convenient', 'Good experience, therapist was caring', true),
(gen_random_uuid(), '2024-07-26', '2024-08-02 09:00:00+00', 5, 'Amazing therapy but expensive for students like me', 'App should have video call feature built-in', 'Excellent support, helped me a lot', true),
(gen_random_uuid(), '2024-07-24', '2024-07-31 14:45:00+00', 4, 'Very good therapy but cost is a significant barrier', 'Phone calls are not as convenient as in-app calls would be', 'Positive experience overall', true),

-- August 2024 subscribers (20 responses)
(gen_random_uuid(), '2024-08-02', '2024-08-09 11:15:00+00', 4, 'Great therapy but 2000 RWF monthly is quite high', 'Would love in-app video calling instead of phone calls', 'Good experience, therapist was professional', true),
(gen_random_uuid(), '2024-08-04', '2024-08-11 16:30:00+00', 5, 'Excellent sessions but expensive for my income level', 'Need integrated calling in the app, Google Meet is inconvenient', 'Outstanding support, very helpful', true),
(gen_random_uuid(), '2024-08-06', '2024-08-13 13:20:00+00', 3, 'Helpful therapy but cost makes it unaffordable long-term', 'App needs video call functionality', 'Decent experience, price is the issue', true),
(gen_random_uuid(), '2024-08-08', '2024-08-15 10:45:00+00', 4, 'Quality therapy sessions but too expensive', 'In-app audio calls would be much better', 'Good experience despite cost concerns', true),
(gen_random_uuid(), '2024-08-10', '2024-08-17 15:00:00+00', 5, 'Amazing therapy but pricing is challenging', 'Phone calls are not private, need in-app video', 'Excellent therapist, very understanding', true),
(gen_random_uuid(), '2024-08-12', '2024-08-19 12:30:00+00', 4, 'Very helpful sessions but high cost is a barrier', 'Would prefer integrated calling feature', 'Positive experience, cost is limiting', true),
(gen_random_uuid(), '2024-08-14', '2024-08-21 09:15:00+00', 3, 'Good therapy but too expensive for regular people', 'External calls are inconvenient, need app-based calling', 'Average experience due to cost issues', true),
(gen_random_uuid(), '2024-08-16', '2024-08-23 14:45:00+00', 4, 'Effective therapy but 2000 RWF is steep', 'App should have video call feature', 'Good support, financial constraint is real', true),
(gen_random_uuid(), '2024-08-18', '2024-08-25 11:00:00+00', 5, 'Excellent service but expensive', 'In-app calling would provide better experience', 'Great therapist, very professional', true),
(gen_random_uuid(), '2024-08-20', '2024-08-27 16:15:00+00', 4, 'Quality therapy but cost is prohibitive', 'Need video calls within the app instead of phone', 'Good experience overall', true),
(gen_random_uuid(), '2024-08-22', '2024-08-29 13:30:00+00', 3, 'Decent therapy but overpriced', 'Phone calls are not convenient, need in-app feature', 'Okay experience, mainly cost concerns', true),
(gen_random_uuid(), '2024-08-24', '2024-08-31 10:20:00+00', 4, 'Helpful sessions but expensive for students', 'Would love in-app audio/video calling', 'Positive experience despite price', true),
(gen_random_uuid(), '2024-08-26', '2024-09-02 15:45:00+00', 5, 'Outstanding therapy but high cost', 'App needs integrated calling functionality', 'Excellent support, very caring therapist', true),
(gen_random_uuid(), '2024-08-28', '2024-09-04 12:00:00+00', 4, 'Very good therapy but pricing is challenging', 'In-app video calls would be much better', 'Good experience, cost is the only issue', true),
(gen_random_uuid(), '2024-08-30', '2024-09-06 09:30:00+00', 3, 'Useful therapy but too expensive to maintain', 'External calls are inconvenient, need app integration', 'Decent service, price needs adjustment', true),
(gen_random_uuid(), '2024-08-29', '2024-09-05 14:15:00+00', 4, 'Quality sessions but cost is a significant barrier', 'Phone calls lack privacy, need in-app calls', 'Good therapist, financial issue is limiting', true),
(gen_random_uuid(), '2024-08-27', '2024-09-03 11:45:00+00', 5, 'Amazing therapy but expensive for regular use', 'App should have video calling feature', 'Excellent experience, helped me greatly', true),
(gen_random_uuid(), '2024-08-25', '2024-09-01 16:00:00+00', 4, 'Very helpful but 2000 RWF monthly is high', 'Would prefer integrated calling instead of external', 'Positive experience overall', true),
(gen_random_uuid(), '2024-08-23', '2024-08-30 13:15:00+00', 3, 'Good therapy but cost makes it unsustainable', 'Need in-app video calls for better convenience', 'Average experience due to pricing', true),
(gen_random_uuid(), '2024-08-21', '2024-08-28 10:00:00+00', 4, 'Effective therapy but expensive for my budget', 'In-app calling would be more convenient and private', 'Good support, cost is the main concern', true);

-- Enable RLS on the table (for security, even though it's temporary)
ALTER TABLE public.temp_muganga_survey_responses ENABLE ROW LEVEL SECURITY;

-- Create a policy to allow viewing the data (for screenshots)
CREATE POLICY "Allow viewing survey responses" ON public.temp_muganga_survey_responses
FOR SELECT USING (true);