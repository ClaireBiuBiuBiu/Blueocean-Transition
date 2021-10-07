-- Brand table:
SELECT * FROM brand_navigator_client.Brand where 
name like '%mongodb%' or name like '%dgraph%' or name like '%neo4j%';
SELECT * FROM brand_navigator_client.Brand where 
name like '%Stripe%' or name like '%Recurly%' or name like '%Chargify%'or name like '%SaaSOptics%' or name like '%CloudFront%' or name like '%ServiceMax%' or name like '%Unqork%'; -- or name like '%gfk%';
-- or name like '%Hyperflex%' or name like '%HCI%' or name like '%Red Hat%' or name like '%Dell%' or name like '%Hyundai%';

-- Competitive set hero brand
SELECT * FROM brand_navigator_client.CompetitiveSet;
-- Competitive set competitors
SELECT * FROM brand_navigator_client.Competitor_CompetitiveSet where competitiveSet_id = 4;

-- When have sessions run for a particular competitive set
SELECT * FROM brand_navigator_client.Session where competitive_set_id = 53; -- Bloomingdale's

-- Content tile
SELECT * FROM brand_navigator_client.Content_Tile where brand_id = 88 and content_type = 'advertisement' and video_url like '%18b8%';
SELECT * FROM brand_navigator_client.Content_Tile where url like '%ba4be474%' and content_type = 'screenshot'; 

-- Verbatim_Text
SELECT * FROM brand_navigator_client.Verbatim_Text WHERE text LIKE '%Terminal 1 $ redis-cli -h localhost -p 1999 set foo foo OK%';
SELECT id FROM brand_navigator_client.Verbatim_Text WHERE text LIKE '%Terminal 1 $ redis-cli -h localhost -p 1999 set foo foo OK%';

-- Replacing text when there are more than 5 to edit
UPDATE brand_navigator_client.Verbatim_Text
SET text = 'SO MANY PEOPLE ARE EXPERIENCING SEVERE ALLERGIC REACTIONS/BURNS WHY IS THIS PRODUCT STILL AVAILABLE FOR PURCHASE @AVEENO?! You can add me to the endless list of allergic reaction sufferers due to this moisturizer. Unfortunately, it seems like they''ve changed their formula ~quite~ a bit from the original (which I loved, never had a problem with, received amazing glowing skin). I bought this moisturizer a second time, reminiscing on how awesome my face looked the first time I used it 2 years a'
WHERE text LIKE '%F SO MANY PEOPLE ARE EXPERIENCING SEVERE ALLERGIC %';

-- Run these daily
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Read More ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Read More', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Read more ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Read more', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'READ MORE', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'OVERVIEW:', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you like best? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you dislike? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What problems are you solving with the product? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What benefits have you realized? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you like most about the product or service? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Recommendations to others considering the product: ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Describe the project or task the provider helped with: ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, '[This review was collected as part of a promotion.] ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Use Cases and Deployment Scope ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Use Cases and Deployment Type ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Use Cases and Deployment Scope', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Use Cases and Deployment Type', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you dislike most about the product or service? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you dislike most about the product or service?', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Overview About HashiCorp ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'Write a Review Add to Favorites Compare This Software What is Skype? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you like about Skype? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you like about Workplace from Facebook? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you like about Workplace from Facebook?', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you dislike about Workplace from Facebook? ', '');
UPDATE brand_navigator_client.Verbatim_Text SET text = REPLACE(text, 'What do you dislike about Workplace from Facebook?', '');

-- Theme_Verbatim_Text
SELECT * FROM brand_navigator_client.Theme_Verbatim_Text
where verbatim_text_id in
(1700044, 1849839, 1871227, 1923697, 2597331, 2597335, 2615074, 2743099, 2771518, 2789991, 2791571)
order by theme_id;

SELECT * FROM brand_navigator_client.Theme_Verbatim_Text where verbatim_text_id = 2926358;

-- Session_Keyword_Verbatim_Text
select * from brand_navigator_client.Session_Keyword_Verbatim_Text where session_keyword_id in (
SELECT session_keyword_id FROM brand_navigator_client.Session_Keyword_Verbatim_Text where verbatim_text_id in
(1931008, 2062188, 2062925, 2196803, 2284745, 2329248, 2476006, 2476670, 2477427, 2654714, 2746147) 
group by session_keyword_id having count(session_keyword_id) > 1) order by session_keyword_id;

select * from brand_navigator_client.Session_Keyword_Verbatim_Text where verbatim_text_id in 
(1960549, 2099697, 2225672, 2362784, 2513329, 2553794, 2818573, 2962902, 2964630, 2992462, 2994167)
order by session_keyword_id;

SELECT * FROM brand_navigator_client.Session_Keyword_Verbatim_Text where verbatim_text_id = 2706093;