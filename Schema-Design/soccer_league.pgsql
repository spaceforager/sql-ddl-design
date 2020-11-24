DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    city TEXT NOT NULL
)

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE

);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    height FLOAT NOT NULL,
    current_team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    head_referee_id INTEGER REFERENCES referees ON DELETE CASCADE,
    assistant_referee_1_id INTEGER REFERENCES referees ON DELETE CASCADE,
    assistant_referee_2_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    result TEXT NOT NULL
)

