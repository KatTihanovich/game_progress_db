INSERT INTO levels (level_name, boss_on_level, stars_on_level)
VALUES
    ('Forest And Cave', false, 7), 
    ('Anxiety Castle', true, 0) 
ON CONFLICT (level_name) DO NOTHING;

INSERT INTO achievements (achievement_name, achievement_description)
VALUES
    ('First Steps', 'сomplete level 1'), 
    ('Explorer', 'play for 10 minutes'), 
    ('Boss Slayer', 'Defeat boss'), 
    ('Master Adventurer', 'collect 7 stars')
ON CONFLICT (achievement_name) DO NOTHING;
