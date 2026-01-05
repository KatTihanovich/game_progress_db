CREATE TABLE IF NOT EXISTS users_achievements (
    user_achievement_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    achievement_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_achievements_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_user_achievements_achievement FOREIGN KEY (achievement_id) REFERENCES achievements(achievement_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT users_achievements_unique UNIQUE (user_id, achievement_id)
);

CREATE INDEX idx_users_achievements_user_achievement ON users_achievements(user_id, achievement_id);
