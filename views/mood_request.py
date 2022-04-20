import sqlite3
import json
from models import Mood


def get_all_moods():
    # Open a connection to the database
    with sqlite3.connect("./dailyjournal.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()
        

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            m.id,
            m.label
        FROM Mood m 
        """)

        # Initialize an empty list to hold all entry representations
        moods = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an entry instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Entry class above.

            mood = Mood(row['id'], row['label'])

            moods.append(mood.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(moods)


def get_single_mood(id):
    with sqlite3.connect("./dailyjournal.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            e.id,
            e.mood_id,
            e.date,
            e.concept,
            e.mood,
            m.label
        FROM Mood e
        JOIN Mood m 
            ON e.mood_id = m.id
        WHERE e.id = ?
        """, (id, ))

        # Load the single result into memory
        row = db_cursor.fetchone()

        # Create an mood instance from the current row
