INSERT INTO users (nickname, password_hash, age)
VALUES
    ('alice', 'testhash_alice', 21),
    ('bob', 'testhash_bob', 25),
    ('charlie', 'testhash_charlie', 19)
RETURNING user_id;

INSERT INTO progress (user_id, level_id, killed_enemies_number, solved_puzzles_number, time_spent, stars)
VALUES
    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        (SELECT level_id FROM levels WHERE level_name = 'Demo'),
        0, 1, '00:02:15', 2),

    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        (SELECT level_id FROM levels WHERE level_name = 'Demo'),
        1, 0, '00:03:15', 1),
  
    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        (SELECT level_id FROM levels WHERE level_name = 'Forest'),
        5, 2, '00:10:25', 3),

    ((SELECT user_id FROM users WHERE nickname = 'bob'),
        (SELECT level_id FROM levels WHERE level_name = 'Demo'),
        1, 0, '00:03:00', 4),

    ((SELECT user_id FROM users WHERE nickname = 'bob'),
        (SELECT level_id FROM levels WHERE level_name = 'Cave'),
        12, 5, '00:25:40', 4),

    ((SELECT user_id FROM users WHERE nickname = 'charlie'),
        (SELECT level_id FROM levels WHERE level_name = 'Demo'),
        1, 0, '00:03:00', 7),

    ((SELECT user_id FROM users WHERE nickname = 'charlie'),
        (SELECT level_id FROM levels WHERE level_name = 'Anxiety Castle'),
        2, 1, '00:07:55', 0);



INSERT INTO users_achievements (user_id, achievement_id)
VALUES
    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        (SELECT achievement_id FROM achievements WHERE achievement_name = 'First Steps')),
    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        (SELECT achievement_id FROM achievements WHERE achievement_name = 'Explorer')),
  
    ((SELECT user_id FROM users WHERE nickname = 'bob'),
        (SELECT achievement_id FROM achievements WHERE achievement_name = 'First Steps')),

    ((SELECT user_id FROM users WHERE nickname = 'charlie'),
        (SELECT achievement_id FROM achievements WHERE achievement_name = 'Boss Slayer')),

    ((SELECT user_id FROM users WHERE nickname = 'charlie'),
        (SELECT achievement_id FROM achievements WHERE achievement_name = 'First Steps'));


INSERT INTO users_statistics (user_id, total_levels_completed, total_time_played, total_killed_enemies, total_solved_puzzles, total_stars)
VALUES
    ((SELECT user_id FROM users WHERE nickname = 'alice'),
        2, '00:15:55', 6, 3, 6),

    ((SELECT user_id FROM users WHERE nickname = 'bob'),
        2, '00:28:40', 13, 5, 8),

    ((SELECT user_id FROM users WHERE nickname = 'charlie'),
        2, '00:10:55', 3, 1, 7);
