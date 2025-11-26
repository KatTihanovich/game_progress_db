CREATE TABLE IF NOT EXISTS users (
    user_id SERIAL PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    age INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_nickname_not_empty CHECK (LENGTH(TRIM(nickname)) > 0),
    CONSTRAINT users_age_positive CHECK (age > 0 AND age < 100)
);

CREATE UNIQUE INDEX idx_users_nickname ON users(nickname);
CREATE INDEX idx_users_created_at ON users(created_at);
