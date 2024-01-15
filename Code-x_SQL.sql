-- [1] Demographic Insights (examples)
-- a. Who prefers energy drink more? (male/female/non-binary?)
Select 
      r.Gender,
      count(s.Respondent_ID) as resp
from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
group by r.Gender 
order by resp desc;

-- b. Which age group prefers energy drinks more?
Select 
       r.age,
       count(s.Respondent_ID) as resp
from fact_survey_responses s
join dim_repondents r
on s.respondent_id = r.respondent_id
group by r.age
order by resp desc;

-- c. Which type of marketing reaches the most Youth (15-30)?
Select 
       s.Marketing_channels,
       count(r.Respondent_ID) as resp
 from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
where r.age in ("15-18","19-30")
group by s.Marketing_channels
order by resp desc;

-- [2] Consumer Preferences
-- a. What are the preferred ingredients of energy drinks among respondents?
Select 
      Ingredients_expected, 
      count(Respondent_ID) as resp
from fact_survey_responses
group by Ingredients_expected
order by resp desc;

-- b. What packaging preferences do respondents have for energy drinks?
Select 
      Packaging_preference,
      count(Respondent_ID) as resp
from fact_survey_responses 
group by Packaging_preference
order by resp desc;

-- [3] Competition Analysis:
-- a. Who are the current market leaders?
Select 
      Current_brands,
      count(Respondent_ID) as resp
from fact_survey_responses
group by Current_brands
order by resp desc;

-- b. What are the primary reasons consumers prefer those brands over ours?
Select 
      Reasons_for_choosing_brands,
      count(Respondent_ID) as resp
from fact_survey_responses
group by Reasons_for_choosing_brands
order by resp desc;

-- [4] Marketing Channels and Brand Awareness:
-- a. Which marketing channel can be used to reach more customers?
select 
      Marketing_channels,
      count(Respondent_ID) as resp
from fact_survey_responses
group by Marketing_channels
order by resp desc;

-- b. How effective are different marketing strategies and channels in reaching our customers?
Select 
      Marketing_channels,
      count(Respondent_ID) as resp
from fact_survey_responses
where Current_brands = "CodeX"
group by Marketing_channels
order by resp desc;

-- [5] Brand Penetration:
-- a. What do people think about our brand? (overall rating)
Select 
      avg(Taste_experience) as overall_ratings
from fact_survey_responses
where Current_brands = "CodeX";

-- b. Which cities do we need to focus more on?
Select 
      c.City,
      count(s.Respondent_ID) as resp
from fact_survey_responses s
join dim_repondents r
on s.Respondent_ID = r.Respondent_ID
join dim_cities c
on r.City_ID = c.City_ID
where Current_brands = "codeX"
group by c.City
order by resp asc
limit 3;

-- [6] Purchase Behavior
-- a. Where do respondents prefer to purchase energy drinks?
select 
      Purchase_location,
      count(Respondent_ID) as resp
from fact_survey_responses
group by Purchase_location
order by resp desc;

-- b. What are the typical consumption situations for energy drinks among respondents
Select 
      Consume_reason,
      count(Respondent_ID) as resp
from fact_survey_responses
group by Consume_reason
order by resp desc;

-- Product Developmen
-- a. Which area of business should we focus more on our product development? (Branding/taste/availability
Select 
      Reasons_for_choosing_brands,
      count(Respondent_ID) as resp
from fact_survey_responses
where Current_brands = "codeX"
group by Reasons_for_choosing_brands
order by resp asc;





