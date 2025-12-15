INSERT INTO levels (level_name, boss_on_level, stars_on_level)
VALUES
    ('Demo', false, 7), 
    ('Forest', false, 5), 
    ('Cave', false, 6), 
    ('Anxiety Castle', true, 0) 
ON CONFLICT (level_name) DO NOTHING;

INSERT INTO achievements (achievement_name, achievement_description)
VALUES
    ('First Steps', 'сomplete level 1'), 
    ('Explorer', 'play for 10 minutes'), 
    ('Boss Slayer', 'Defeat boss'), 
    ('Master Adventurer', 'сomplete 3 levels')
ON CONFLICT (achievement_name) DO NOTHING;
