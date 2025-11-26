CREATE TABLE IF NOT EXISTS achievements (
    achievement_id SERIAL PRIMARY KEY,
    achievement_name TEXT NOT NULL UNIQUE,
    achievement_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT achievements_name_not_empty CHECK (LENGTH(TRIM(achievement_name)) > 0)
);

CREATE UNIQUE INDEX idx_achievements_name ON achievements(achievement_name);
