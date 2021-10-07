--------------------------
##Query below designed for website issues
SELECT * FROM brand_navigator_client.Content_Tile where url like '%8a05db3c%' and content_type = 'screenshot'
order by content_date desc; 
--------------------------


------------------------
#Query below designed for screenshots not showing up issues, can refer to Bret for details
#step 1
 SELECT * FROM brand_navigator_client.CompetitiveSet Where friendlyName like '%Captain%';
#id 44 hero brand id 255 competitive set key dbef867e-07f6-4c7f-9d62-ee1f4d883215
#step 2
SELECT * FROM brand_navigator_client.Brand where 
name like '%Captain%';
#step 3
SELECT * FROM brand_navigator_client.Content_Tile where brand_id = 255 and content_type = 'screenshot';
SELECT * FROM brand_navigator_client.Session where competitive_set_id = 44;

#There's a row in content_tile for session 4336, and there should be a row for sessions that are newer than that.(find the latest one in session table and copy that id)
#only the latest session is visible in the UI, so 12481 is the most important row, 12481 will be new session id to add in content tiel, and leave id for blank
------------------------


------------------------
#Query below designed for keyword/theme verbatim issues to find the text in paragraph
SELECT * FROM brand_navigator_client.Verbatim_Text WHERE text LIKE  '%[product:burts-bees-hand-salve] %';
SELECT id FROM brand_navigator_client.Verbatim_Text WHERE text LIKE '%Our clients belong to the energy and utility sector.%';
------------------------


------------------------
#Query below is used to remove duplicates for theme 
SELECT * 
#, count(theme_id)
FROM brand_navigator_client.Theme_Verbatim_Text
where verbatim_text_id in
(685212 ,841373 ,842721 ,852145 ,852147 ,852713 ,900509 ,901074 ,905225 ,907940 ,910381 ,910936 ,1018715 ,1019266 ,1138249 ,1138824 ,1257869 ,1258447 ,1314326 ,1610010 ,1610013 ,1610564 ,1939366 ,1941346 ,2045563 ,2046334 ,2085669 ,2086436 ,2113274 ,2114043 ,2161915 ,2296091 ,2296092 ,2296861 ,2450466 ,2451251 ,2674154 ,3124318 ,3124320 )
#group by theme_id
order by theme_id;
------------------------


------------------------
#Query below can be used to remove duplicates in theme verbatim issues, but need to check before implementation
select * from
(select theme_id, count(theme_id)
from 
(select * from brand_navigator_client.Theme_Verbatim_Text where verbatim_text_id in
(692632 ,766448 ,827603 ,930288 ,930296 ,930698 ,1101195 ,1101442 ,1177280 ,1177660 ,1232931 ,1323500 ,1323510 ,1371564 ,1426767 ,1427147 ,1427625 ,1427635 ,1459785 ,1459807 ,1459810 ,1467972 ,1467979 ,1472144 ,1479091 ,1522828 ,1524103 ,1524970 ,1598319 ,1791747 ,1810477 ,1888253 ,1963063 ,2235746 ,2273515 ,2406643 ,2444292 ,2514793 ,2587204 ,2805442 ,2805450 ,2849445 ,2855410 ,2907053 ,2926680 ,2930767 ,3099286 ,3099291 ,3099294 ,3101747 ,3101753 ,3219989 ,3265615 ,3325101 ,3325112 ,3325113 )
order by theme_id) as derived_table
group by theme_id
having count(theme_id) = 2) as derived_table2
;

------------------------


------------------------
## Query below is used for removing duplicates for session keyword

select * from brand_navigator_client.Session_Keyword_Verbatim_Text where verbatim_text_id in 
(192368 ,192378 ,192944 ,192964 ,193405 ,233547 ,234096 ,234137 ,274321 ,274401 ,292372 ,292915 ,292935 ,293430 ,294188 ,294229 ,324136 ,328174 ,328302 ,332622 ,342846 ,343124 ,409224 ,409244 ,409793 ,409809 ,558147 ,558163 ,558170 ,558729 ,686126 ,686138 ,686146 ,686782 ,686793 ,686795 ,687832 ,687842 ,725143 ,725157 ,725697 ,725702 ,725712 ,725717 ,726166 ,726428 ,726439 ,726983 ,726989 ,726990 ,726993 ,727004 ,727005 ,727697 ,727709 ,728248 ,728254 ,728255 ,728258 ,728274 ,728275 ,728969 ,728972 ,728974 ,728976 ,729516 ,729527 ,729528 ,729532 ,729533 ,730234 ,730238 ,730239 ,730243 ,730258 ,730259 ,730792 ,730798 ,730799 ,731240 ,733139 ,733146 ,733682 ,733687 ,733697 ,733702 ,734150 ,734404 ,734410 ,734412 ,734417 ,734968 ,734974 ,734975 ,734978 ,734989 ,734990 ,735685 ,735689 ,735704 ,735705 ,736233 ,736239 ,736240 ,736243 ,736259 ,736260 ,736950 ,736961 ,737501 ,737512 ,737513 ,737517 ,737518 ,738240 ,738777 ,738783 ,738784 ,739227 ,972828 ,972836 ,972837 ,972849 ,973396 ,973835 ,1017585 ,1018134 ,1018135 ,1018161 ,1018570 ,1018572 ,1139778 ,1140365 ,1140366 ,1140377 ,1140777 ,1140779 ,1275114 ,1275119 ,1275677 ,1275722 ,1275723 ,1275729 ,1312602 ,1313175 ,1313212 ,1313220 ,1313221 ,1313228 ,1350424 ,1350436 ,1350997 ,1351034 ,1351042 ,1351043 ,1351050 ,1473925 ,1473939 ,1474506 ,1474516 ,1474517 ,1474519 ,1475219 ,1475233 ,1475800 ,1475810 ,1475811 ,1475813 ,1500039 ,1500648 ,1500658 ,1500659 ,1501343 ,1501352 ,1501953 ,1501963 ,1501964 ,1502646 ,1503258 ,1503268 ,1503269 ,1503950 ,1504563 ,1504573 ,1504574 ,1505258 ,1505259 ,1505267 ,1505842 ,1505843 ,1505845 ,1506551 ,1506562 ,1507136 ,1507137 ,1507139 ,1507843 ,1507856 ,1508430 ,1508431 ,1508433 ,1509152 ,1509722 ,1509723 ,1509725 ,1511019 ,1511020 ,1511022 ,1512311 ,1512312 ,1512314 ,1513608 ,1513609 ,1513611 ,1590163 ,1590175 ,1590176 ,1819858 ,1820429 ,1820441 ,1820442 ,1977895 ,1978486 ,1978498 ,1978499 ,2110744 ,2111358 ,2111359 ,2111370 ,2111371 ,2111763 ,2111768 ,2260588 ,2260599 ,2261210 ,2261211 ,2310946 ,2311570 ,2311571 ,2314933 ,2315553 ,2315554 ,2443320 ,2443321 ,2634349 ,2634351 ,2634962 ,2634963 ,2804568 ,2804569 ,2804572 ,2886692 ,2887287 ,2887288 ,2887291 ,2920592 ,2920597 ,2920609 ,2920611 ,2920612 ,2921202 ,2921203 ,2921206 ,3043377 ,3043380 ,3043392 ,3043986 ,3043987 ,3043990 ,3055561 ,3056165 ,3056166 ,3056169 ,3058909 ,3059498 ,3059499 ,3059502 ,3064277 ,3064299 ,3064875 ,3064890 ,3096274 ,3096288 ,3096858 ,3096873 ,3178889 ,3179471 ,3179486 ,3247655 ,3248222 ,3248223 ,3248231 ,3312902 ,3313490 ,3313491 ,3313499 ,3314077 ,3314668 ,3314669 ,3314672 ,3314673 ,3314676 ,3392555 ,3392566 ,3392575 ,3393139 ,3393144 ,3393150 ,3393151)
order by session_keyword_id;
------------------------



------------------------
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
------------------------



------------------------
## Used to update the text if you want
update brand_navigator_client.Verbatim_Text
SET text = 'One of the worst companies I''ve ever dealt with A list of problems: They made the closing of our house a nightmare, it added time to our closing, the paperwork was a mess, they repeatedly said they didn''t have things we''d already sent. On top of that, they only release your requirement to pay when they receive the title informatio'
Where text Like '%All Sunrun Inc. reviews 5 stars 47 4 stars 1 3 stars 9 2 stars 14 1 star 268 Sort by: Most recent Oldest Best rated Least rated Zane Stoddard, New Hampshire 08/04/2021%';
------------------------




------------------------
#Used to solve logo issues
-- Brand table:
#step 2
SELECT * FROM brand_navigator_client.Brand where 
name like '%Microsoft%';
------------------------
























#(Optional)
------------------------
#Below is just random queries designed to solve some extra issues
------------------------
#id = 524;
 # get 4c126eae-3f16-4048-8ef3-7efe87997da3 (brandkey)
 #step 1
 SELECT * FROM brand_navigator_client.CompetitiveSet Where friendlyName like '%Microsoft%';
#or name like '%sonne%' or name like '%Medius%';
# get id 82 for microsoft dynamics 365 finance

# step 3 content tile table
SELECT * FROM brand_navigator_client.Content_Tile where brand_id = 524 and content_type = 'screenshot';
SELECT * FROM brand_navigator_client.Session where competitive_set_id = 82;


# step 4 using the id in session table to create a new row in content tile table, rememebr to use the tool to add md5 into the table, that's unique key


-- Competitive set hero brand
SELECT * FROM brand_navigator_client.CompetitiveSet;
-- Competitive set competitors
SELECT * FROM brand_navigator_client.Competitor_CompetitiveSet where competitiveSet_id = 82;

-- When have sessions run for a particular competitive set
SELECT * FROM brand_navigator_client.Session where competitive_set_id = 53; -- Bloomingdale's


SELECT * FROM brand_navigator_client.Verbatim_Text WHERE text LIKE '%into the target table%';
------------------------