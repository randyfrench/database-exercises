
-- Basic Statments Exercises
-- 1. select_exercises.sql

-- 2. Use the albums_db database.
USE albums_db;

-- 3. Explore the structure of the albums table.
SELECT *
FROM albums;

-- 3a. how many rows in albums - 31, 

SELECT * FROM albums;

-- 3b. how many distinct artist names in albums 30 or 31
SELECT 
   id,
   	artist
 FROM albums; 
 
 -- 3c. What is the primary key for the albums table? --Primary key is id
 
 DESCRIBE albums;

-- 3d. What is the oldest release date for any album in the albums table? -- 1967 sgt peppers 
SELECT *
FROM albums
WHERE release_date = (SELECT MIN(release_date) FROM albums);


-- 3d. What is the most recent release date? -- is 2011 adele 21
SELECT *
FROM albums
WHERE release_date = (SELECT MAX(release_date) FROM albums);

-- 4. Write queries to find the following information:
-- 4a. The name of all albums by Pink Floyd
SELECT NAME
FROM albums
WHERE artist = 'Pink Floyd';
-- the dark side of the moom &amp; the wall

-- 4b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

-- 4c. The genre for the album Nevermind
SELECT genre
FROM albums
WHERE NAME = 'Nevermind';
-- gurnge, alternative rock

-- 4d. Which albums were released in the 1990s
SELECT name
FROM albums
WHERE release_date between 1990 AND 1999;

-- 4e. Which albums had less than 20 million certified sales
SELECT name
FROM albums
WHERE SALES < 20;

-- 4f. All the albums with a genre of "Rock".
SELECT name, genre
FROM albums
WHERE genre = "Rock";

-- 4f. Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name, genre
FROM albums
WHERE genre like "%rock%";