SELECT DISTINCT (term_info)
FROM analytics.uk_school_term_times;

-- Most popular counties in England
SELECT county_id,
       COUNT(county_id) AS cc,
       tc.name
FROM analytics.dx_user AS du
	JOIN twinkl.twinkl_county AS tc
		ON du.county_id = tc.id
WHERE tc.country_id = 244
GROUP BY county_id
ORDER BY cc DESC ;

-- Downloads in England

SELECT du.user_id,
       du.country_id,
       du.county_id,
       gmtdl.datetime
FROM analytics.dx_user AS du
	JOIN analytics.george_meta_temp_download_log AS gmtdl
		ON du.user_id = gmtdl.user_id
WHERE du.country_id = 244;

SELECT COUNT(*)
FROM analytics.george_meta_temp_download_log
WHERE country_id = 244
	AND date = '2024-01-03';
