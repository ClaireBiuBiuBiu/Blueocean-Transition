# These two queries are for end of day processing status
# send them at the end of each day
#1 Brand Navigator queries for session backlog and sessions held back
SELECT b.name "Main Brand", cs.id "Set ID", count(s.sessionKey) "Not Yet Visible"
FROM brand_navigator_client.Brand b, brand_navigator_client.CompetitiveSet cs, brand_navigator_client.Session s
where b.id = cs.hero_brand_id and cs.id = s.competitive_set_id and s.isClientVisible = 0 and s.isVisible = 1
group by s.competitive_set_id order by 3 desc;

SELECT b.name "Main Brand", cs.id "Set ID", count(s.sessionKey) "Held Back"
FROM brand_navigator_client.Brand b, brand_navigator_client.CompetitiveSet cs, brand_navigator_client.Session s
where b.id = cs.hero_brand_id and cs.id = s.competitive_set_id and s.isClientVisible = 0 and s.isVisible = 0 and s.isActive = 1
group by s.competitive_set_id order by 3 desc;


