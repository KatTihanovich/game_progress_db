CREATE TABLE IF NOT EXISTS levels (
    level_id SERIAL PRIMARY KEY,
    level_name TEXT NOT NULL UNIQUE,
    boss_on_level BOOLEAN NOT NULL DEFAULT false,
    stars_on_level INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT levels_name_not_empty CHECK (LENGTH(TRIM(level_name)) > 0)
);

CREATE UNIQUE INDEX idx_levels_name ON levels(level_name);
