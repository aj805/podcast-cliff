CREATE TABLE slack_github_installs (
    id SERIAL PRIMARY KEY,
    slack_user_id VARCHAR(255) NOT NULL,
    github_user_id VARCHAR(255) NOT NULL,
    install_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);