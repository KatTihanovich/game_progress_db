CREATE TABLE IF NOT EXISTS users_statistics (
    statistics_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE,
    total_levels_completed INTEGER DEFAULT 0,
    total_time_played VARCHAR(8) DEFAULT '00:00:00',
    total_killed_enemies INTEGER DEFAULT 0,
    total_solved_puzzles INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_users_statistics_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT statistics_levels_non_negative CHECK (total_levels_completed >= 0),
    CONSTRAINT statistics_enemies_non_negative CHECK (total_killed_enemies >= 0),
    CONSTRAINT statistics_puzzles_non_negative CHECK (total_solved_puzzles >= 0),
    CONSTRAINT statistics_time_format CHECK (total_time_played ~ '^[0-9]{2}:[0-9]{2}:[0-9]{2}$')
);

CREATE UNIQUE INDEX idx_users_statistics_user_id ON users_statistics(user_id);
