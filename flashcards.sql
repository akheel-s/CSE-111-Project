-- 1.
SELECT "----------Number of decks in languages collection.----------";
SELECT COUNT(decks.collection_id)
FROM decks
INNER JOIN collections on collections.collection_id = decks.collection_id
WHERE decks.collection_id = "1";

-- 2.
SELECT "----------Name of decks in the languages collection.----------";
SELECT decks.name
FROM decks
INNER JOIN collections on collections.collection_id = decks.collection_id
WHERE decks.collection_id = "1";

-- 3.
SELECT "----------User's first and last name matched with their login information.----------";
SELECT users.username, user_infos.first_name, user_infos.last_name
FROM users
INNER JOIN user_infos on user_infos.user_id = users.user_id;

-- 4.
SELECT "----------All the collections associated with Akheel----------";
SELECT collections.name
FROM users
INNER JOIN user_infos on user_infos.user_id = users.user_id
INNER JOIN collections on collections.user_id = users.user_id
WHERE user_infos.first_name = "Akheel";

-- 5.
SELECT "----------Average accuracy for Akheel----------";
SELECT AVG(scores.accuracy)
FROM scores, users
INNER JOIN user_infos on user_infos.user_id = users.user_id
WHERE user_infos.first_name = "Akheel";

-- 6.
SELECT "----------Adding in a new deck----------";
INSERT INTO decks VALUES(5, NULL, "databases", 1);

-- 7.
SELECT "----------Updating a question----------";
UPDATE flashcards
SET question = "What is the slope intercept form?"
WHERE flashcard_id = 2;

-- 8.
SELECT "----------User with the most attempts.----------";
SELECT user_infos.first_name
FROM user_infos
WHERE user_infos.user_id = (
SELECT users_decks.user_id 
FROM users_decks  
INNER JOIN scores on scores.user_deck_id = users_decks.user_deck_id
GROUP BY users_decks.user_id 
HAVING COUNT (users_decks.user_id)=( 
    SELECT MAX(attempts) 
    FROM ( 
        SELECT users_decks.user_id, COUNT(users_decks.user_id) attempts 
        FROM users_decks 
        GROUP BY users_decks.user_id)));

-- 9.
SELECT "----------User_deck_ids for Akheel----------";
SELECT users_decks.user_deck_id
FROM users_decks
INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
WHERE user_infos.first_name = "Akheel";

-- 10. 
SELECT "----------The accuracy score on Akheel's latest attempt.----------";
SELECT scores.accuracy 
FROM scores
WHERE scores.user_deck_id = (
    SELECT users_decks.user_deck_id
    FROM users_decks
    INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
    WHERE user_infos.first_name = "Akheel"
)
ORDER BY DATETIME(ROUND(scores.attempt / 1000), 'unixepoch') 
DESC LIMIT 1;

-- 11.
SELECT "----------What is AKheel's average confidence?----------";
SELECT AVG(users_flashcards.confidence) 
FROM users_flashcards
INNER JOIN users_decks on users_decks.user_deck_id = users_flashcards.user_deck_id
INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
WHERE user_infos.first_name = "Akheel";

-- 12.
SELECT "----------Akheel's average confidence for phil3?----------";
SELECT AVG(users_flashcards.confidence) 
FROM users_flashcards
INNER JOIN users_decks on users_decks.user_deck_id = users_flashcards.user_deck_id
INNER JOIN decks on decks.deck_id = users_decks.deck_id
INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
WHERE user_infos.first_name = "Akheel"
AND decks.name = "phil3";

-- 13.
DELETE FROM decks
WHERE deck_id = 5;

-- 14.
SELECT "----------Collection with the most decks in it.----------";
SELECT collections.name
FROM collections
WHERE collections.collection_id = (
SELECT decks.collection_id 
FROM decks  
GROUP BY decks.collection_id 
HAVING COUNT (decks.collection_id)=( 
    SELECT MAX(dcount) 
    FROM ( 
        SELECT decks.collection_id, COUNT(decks.collection_id) dcount 
        FROM decks 
        GROUP BY decks.collection_id)));

-- 15.
SELECT "----------Display all the questions for philosophy deck----------";
SELECT flashcards.question
FROM flashcards
INNER JOIN decks on decks.deck_id = flashcards.deck_id
WHERE decks.name = "phil3";

-- 16.
SELECT "----------All decks that are not in a collection.----------";
SELECT decks.name
FROM decks
WHERE decks.collection_id IS NULL;

-- 17.
SELECT "----------The lowest score in an attempt by Rohit.----------";
SELECT MIN(scores.accuracy)
FROM scores
WHERE scores.user_deck_id = (
    SELECT users_decks.user_deck_id
    FROM users_decks
    INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
    WHERE user_infos.first_name = "Rohit");

-- 18.
SELECT "----------Decks created by Karthik.----------";
SELECT decks.name
FROM decks
INNER JOIN user_infos on user_infos.user_id = decks.user_id
WHERE user_infos.first_name = "Karthik";

-- 19.
SELECT "----------Number of attempts Karthik has done for Spanish.----------";
SELECT COUNT(users_decks.deck_id)
FROM users_decks
INNER JOIN user_infos on user_infos.user_id = users_decks.user_id
INNER JOIN decks on decks.deck_id = users_decks.deck_id
WHERE user_infos.first_name = "Karthik"
AND decks.name = "spanish";

-- 20.
SELECT "----------Deck with the most cards----------";
SELECT decks.name
FROM decks
WHERE decks.deck_id = (
    SELECT flashcards.deck_id 
    FROM flashcards  
    GROUP BY flashcards.deck_id 
    HAVING COUNT (flashcards.deck_id)=( 
        SELECT MAX(cardcount) 
        FROM ( 
            SELECT flashcards.deck_id, COUNT(flashcards.deck_id) cardcount 
            FROM flashcards 
            GROUP BY flashcards.deck_id)));

