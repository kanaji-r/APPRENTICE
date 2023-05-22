CREATE TABLE channels (
  channel_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  channel_name VARCHAR(255)
);

CREATE TABLE program (
  program_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  program_detail TEXT
);

CREATE TABLE seasons (
  series_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  program_id INT NOT NULL,
  season_number INT,
  FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE episodes (
  episode_id BIGINT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  series_id INT NOT NULL,
  episode_number INT,
  title VARCHAR(255),
  episode_detail TEXT,
  video_length INT,
  release_date DATE,
  views BIGINT(20) DEFAULT 0,
  FOREIGN KEY (series_id) REFERENCES seasons(series_id)
);

CREATE TABLE genres (
  genre_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  genre_name VARCHAR(255)
);

CREATE TABLE program_genres (
  program_id INT NOT NULL,
  genre_id INT NOT NULL,
  FOREIGN KEY (program_id) REFERENCES program(program_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE program_slots (
  program_slot_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  channel_id INT NOT NULL,
  start_time DATETIME,
  end_time DATETIME,
  episode_id BIGINT(20) NOT NULL,
  views BIGINT(20),
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
  FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);