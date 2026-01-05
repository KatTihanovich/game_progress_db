CREATE TABLE IF NOT EXISTS users_statistics (
    statistics_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,
    total_levels_completed INTEGER NOT NULL DEFAULT 0,
    total_time_played VARCHAR(8) NOT NULL DEFAULT '00:00:00',
    total_killed_enemies INTEGER NOT NULL DEFAULT 0,
    total_solved_puzzles INTEGER NOT NULL DEFAULT 0,
    total_stars INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_users_statistics_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT statistics_levels_non_negative CHECK (total_levels_completed >= 0),
    CONSTRAINT statistics_enemies_non_negative CHECK (total_killed_enemies >= 0),
    CONSTRAINT statistics_puzzles_non_negative CHECK (total_solved_puzzles >= 0),
    CONSTRAINT statistics_stars_non_negative CHECK (total_stars >= 0),
    CONSTRAINT statistics_time_format CHECK (total_time_played ~ '^[0-9]{2}:[0-9]{2}:[0-9]{2}$')
);

CREATE UNIQUE INDEX idx_users_statistics_user_id ON users_statistics(user_id);
