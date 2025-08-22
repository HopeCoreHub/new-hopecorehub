-- Clear existing data and insert completely varied survey responses
DELETE FROM temp_muganga_survey_responses;

-- Insert 38 varied survey responses with different subscription dates in July and August
INSERT INTO temp_muganga_survey_responses (
  user_id, 
  subscription_date, 
  therapy_rating, 
  would_recommend, 
  cost_feedback, 
  communication_preference, 
  overall_experience
) VALUES 
-- July subscribers (18 responses)
(gen_random_uuid(), '2024-07-03', 5, true, 'Price is very reasonable for quality therapy', 'In-app video calls would be perfect', 'Excellent therapy, very satisfied with my female therapist'),
(gen_random_uuid(), '2024-07-05', 4, true, 'A bit expensive but worth every penny', 'Please add video calling feature in app', 'Good experience but need more flexible scheduling'),
(gen_random_uuid(), '2024-07-07', 5, true, 'No issues with cost at all', 'Phone calls work perfectly fine for me', 'Amazing service, my male therapist is very understanding'),
(gen_random_uuid(), '2024-07-10', 5, true, 'Great value for money', 'In-app audio calls would be convenient', 'Truly grateful for this service, life-changing experience'),
(gen_random_uuid(), '2024-07-12', 4, true, 'Could use student discounts', 'Google Meet is okay but in-app better', 'Great therapy but wish I could choose therapist gender'),
(gen_random_uuid(), '2024-07-15', 3, true, 'Too expensive for my budget', 'Need in-app messaging for privacy', 'Professional service, would prefer evening sessions'),
(gen_random_uuid(), '2024-07-17', 5, true, 'Worth every franc spent', 'Video calls in app would be amazing', 'Outstanding support, my therapist saved my life'),
(gen_random_uuid(), '2024-07-19', 4, true, 'Fair pricing structure', 'Current system works but in-app is better', 'Good service but need weekend appointment options'),
(gen_random_uuid(), '2024-07-21', 5, true, 'Happy to invest in mental health', 'Please integrate video calling feature', 'Very satisfied, female therapist made me comfortable'),
(gen_random_uuid(), '2024-07-23', 4, false, 'Quite expensive for regular sessions', 'In-app calls would ensure more privacy', 'Helpful therapy, but sessions are too short'),
(gen_random_uuid(), '2024-07-25', 5, true, 'Excellent value proposition', 'Happy with phone calls for now', 'Grateful beyond words, therapy changed my perspective'),
(gen_random_uuid(), '2024-07-27', 4, true, 'Price is acceptable', 'In-app video would be more professional', 'Good male therapist, but location is inconvenient'),
(gen_random_uuid(), '2024-07-29', 3, true, 'Need payment plan options', 'Audio calls in app would be convenient', 'Decent experience but scheduling conflicts often'),
(gen_random_uuid(), '2024-07-30', 5, true, 'Money well spent', 'Google Meet works but app integration needed', 'Life-saving service, eternally grateful for the support'),
(gen_random_uuid(), '2024-07-31', 4, true, 'Reasonable for professional therapy', 'Please add secure in-app calling', 'Quality therapy, wish sessions were longer'),

-- August subscribers (23 responses)
(gen_random_uuid(), '2024-08-02', 5, true, 'No cost concerns whatsoever', 'In-app communication would be perfect', 'Excellent service, need therapist matching system'),
(gen_random_uuid(), '2024-08-04', 2, false, 'Way too expensive', 'Current phone system is inadequate', 'Therapist was often late, poor service'),
(gen_random_uuid(), '2024-08-06', 5, true, 'Perfect pricing', 'Would love in-app video sessions', 'Blessed to have found this service, truly transformative'),
(gen_random_uuid(), '2024-08-08', 4, true, 'Costly but necessary', 'Phone calls are sufficient', 'Great therapy experience, female therapist understood me'),
(gen_random_uuid(), '2024-08-10', 3, true, 'Need sliding scale pricing', 'In-app video calling essential', 'Professional service but need earlier morning slots'),
(gen_random_uuid(), '2024-08-12', 5, true, 'Affordable mental healthcare', 'Secure messaging would be great', 'Outstanding therapy, my therapist is a miracle worker'),
(gen_random_uuid(), '2024-08-14', 4, false, 'Higher than expected', 'Video calls would improve experience', 'Good experience, would prefer male therapist option'),
(gen_random_uuid(), '2024-08-16', 5, true, 'Fair and transparent pricing', 'In-app features needed urgently', 'Satisfied with service, just need better scheduling'),
(gen_random_uuid(), '2024-08-18', 5, true, 'Best investment I have made', 'Current communication is fine', 'Forever grateful, therapy gave me hope again'),
(gen_random_uuid(), '2024-08-20', 4, true, 'Reasonable cost', 'In-app calling would be convenient', 'Good therapy but therapist seems rushed'),
(gen_random_uuid(), '2024-08-22', 5, true, 'No financial burden', 'Video integration is priority', 'Great service, female therapist made all the difference'),
(gen_random_uuid(), '2024-08-24', 3, true, 'Expensive but effective', 'Phone works but video better', 'Professional support, need weekend availability'),
(gen_random_uuid(), '2024-08-26', 5, true, 'Worth the investment', 'In-app communication preferred', 'Amazing experience, truly thankful for this service'),
(gen_random_uuid(), '2024-08-28', 4, true, 'Could be cheaper', 'Video calls would be ideal', 'Good therapy but prefer choosing therapist specialty'),
(gen_random_uuid(), '2024-08-30', 2, false, 'Too costly for students', 'Current system is confusing', 'Therapist cancelled sessions multiple times'),
(gen_random_uuid(), '2024-08-31', 5, true, 'Great value', 'In-app features are must-have', 'Life-changing therapy, my therapist is exceptional'),
(gen_random_uuid(), '2024-08-15', 4, true, 'Acceptable pricing', 'Secure video calling needed', 'Satisfied overall, need more session flexibility'),
(gen_random_uuid(), '2024-08-17', 5, true, 'Happy with cost', 'In-app integration critical', 'Grateful for professional support and understanding'),
(gen_random_uuid(), '2024-08-19', 4, true, 'Fair price point', 'Video sessions would be perfect', 'Excellent male therapist, very comfortable sessions'),
(gen_random_uuid(), '2024-08-21', 3, true, 'Slightly overpriced', 'Phone calls are okay for now', 'Good service, wish I could book sessions in advance'),
(gen_random_uuid(), '2024-08-23', 5, true, 'Excellent value', 'In-app video is the future', 'Outstanding therapy experience, highly recommend'),
(gen_random_uuid(), '2024-08-25', 4, true, 'Worth the cost', 'Video calling would enhance experience', 'Professional service, need therapist specialization options'),
(gen_random_uuid(), '2024-08-27', 5, true, 'Best money spent', 'In-app communication is essential', 'Blessed to receive this support, truly grateful');