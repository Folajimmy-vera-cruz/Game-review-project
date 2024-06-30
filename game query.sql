# Find the ten best-selling games. 
select *
from game_sales
order by games_sold desc
limit 10;

# Find the ten years with the highest average critic score, where at least four games were released (to ensure a good sample size).
select g.year, u.num_games, round(avg(r.critic_score),2) as avg_critic_score
from game_sales as g
inner join reviews as r
on g.name = r.name
inner join users_avg_year_rating as u
on g.year = u.year
group by g.year, u.num_games
order by avg_critic_score desc
limit 10;

# Find the years where critics and users broadly agreed that the games released were highly rated. 
# with average critic score was over 9 or average user score was over 9. 
select c.year, u.num_games, c.avg_critic_score, u.avg_user_score, round(c.avg_critic_score - u.avg_user_score, 2) as diff
from users_avg_year_rating as u
inner join critics_avg_year_rating as c
on u.year = c.year
where avg_critic_score > 9 or avg_user_score > 9
order by year ;