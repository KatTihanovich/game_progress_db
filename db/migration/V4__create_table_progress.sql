CREATE TABLE IF NOT EXISTS progress (
    progress_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    level_id INTEGER NOT NULL,
    killed_enemies_number INTEGER NOT NULL DEFAULT 0,
    solved_puzzles_number INTEGER NOT NULL DEFAULT 0,
    time_spent TEXT NOT NULL DEFAULT '00:00:00',
    stars INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_progress_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_progress_level FOREIGN KEY (level_id) REFERENCES levels(level_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT levels_killed_enemies_non_negative CHECK (killed_enemies_number >= 0),
    CONSTRAINT levels_solved_puzzles_non_negative CHECK (solved_puzzles_number >= 0),
    CONSTRAINT levels_stars_non_negative CHECK (stars >= 0),
    CONSTRAINT levels_time_format CHECK (time_spent ~ '^[0-9]{2}:[0-9]{2}:[0-9]{2}$')
);

CREATE INDEX idx_progress_user_level ON progress(user_id, level_id);
