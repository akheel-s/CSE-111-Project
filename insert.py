import sqlite3

conn = sqlite3.connect("flashcards.sqlite")
cursor = conn.cursor()

# cursor.execute("""CREATE TABLE UserInfo (
#             user_id DECIMAL(9,0) NOT NULL,
#             first_name CHAR(100) NOT NULL,
#             middle_name CHAR(100),
#             last_name CHAR(100) NOT NULL,
#             bio CHAR(150) NOT NULL)""")

# cursor.execute("""CREATE TABLE Users (
#              user_id INTEGER NOT NULL,
#              username VARCHAR(100) NOT NULL,
#              password VARCHAR(100) NOT NULL,
#              friends CHAR(100))""")

# cursor.execute("""CREATE TABLE decks (
#              deck_id INTEGER NOT NULL,
#              user_id INTEGER NOT NULL,
#              deck_name CHAR(100) NOT NULL,
#              flashcards VARCHAR(255))""")

# cursor.execute("""CREATE TABLE scores (
#              deck_id INTEGER NOT NULL,
#              user_id INTEGER NOT NULL,
#              timestamp DATETIME NOT NULL,
#              score DECIMAL(9,0) NOT NULL)""")

# cursor.execute("""CREATE TABLE folders (
#              folder_id INTEGER NOT NULL,
#              user_id INTEGER NOT NULL,
#              folder_name VARCHAR(255) NOT NULL,
#              decks INTEGER NOT NULL)""")

cursor.execute("""CREATE TABLE flashcards (
             flashcard_id INTEGER NOT NULL,
             question VARCHAR(255) NOT NULL,
             answer VARCHAR(255) NOT NULL,
             proficiency DECIMAL(9,0) NOT NULL)""")




populate = [
            (1,"John", "B.", "Doe", "I'm a cool kid."),
            (2,"Bob", "The", "Builder", "I construct things."),
            (3,"Jack", "C", "Bauer", "I save people."),
            (4,"Jack", "The", "Ripper", "I'm scary.")
        ]

conn.executemany("INSERT INTO UserInfo VALUES (?, ?, ?, ?, ?)", populate)


conn.commit()
conn.close()
