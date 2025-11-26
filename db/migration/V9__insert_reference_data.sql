INSERT INTO levels (level_name, boss_on_level)
VALUES
    ('Demo', false), 
    ('Forest', false), 
    ('Cave', false), 
    ('Anxiety Castle', true) 
ON CONFLICT (level_name) DO NOTHING;

INSERT INTO achievements (achievement_name, achievement_description)
VALUES
    ('First Steps', 'Complete one level'), 
    ('Explorer', 'Visit 3 unique locations'), 
    ('Boss Slayer', 'Defeat boss'), 
    ('Master Adventurer', 'Complete all levels'),
    ('Collector', 'Collect all stars') 
ON CONFLICT (achievement_name) DO NOTHING;
