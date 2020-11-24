DROP DATABASE IF EXISTS craiglist;
CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    preferred_region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL

);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    location TEXT,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
);