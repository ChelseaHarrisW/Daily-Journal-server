CREATE TABLE `Mood` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`label` TEXT NOT NULL
);

CREATE TABLE `Entry` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`mood_id`  INTEGER NOT NULL,
	`date` TEXT NOT NULL,
	`concept` TEXT NOT NULL,
	`entry` TEXT NOT NULL,
	FOREIGN KEY(`mood_id`) REFERENCES `Mood`(`id`)
);

INSERT INTO Mood VALUES (null, "Happy");
INSERT INTO Mood VALUES (null, "Sad");
INSERT INTO Mood VALUES (null, "Angry");
INSERT INTO Mood VALUES (null, "Okay");

INSERT INTO Entry VALUES (null, 4, "01/04/2022", "Python basics", "akjdhfajksdhfkjbdasjkf");
INSERT INTO Entry VALUES (null, 1, "01/13/2022", "SQL database setup", "adfgadfhadfhsgbargeadv");

CREATE TABLE `Tag` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`subject` TEXT NOT NULL
);

DELETE FROM `Mood` WHERE id <5

CREATE TABLE `EntryTag` (
	`id`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`entry_id`  INTEGER NOT NULL,
	`tag_id`  INTEGER NOT NULL,
	FOREIGN KEY(`entry_id`) REFERENCES `Entry`(`id`),
	FOREIGN KEY(`tag_id`) REFERENCES `Tag`(`id`)
);

INSERT INTO Tag VALUES (null, "Python");
INSERT INTO Tag VALUES (null, "Django");
INSERT INTO Tag VALUES (null, "SQL");
INSERT INTO Tag VALUES (null, "React");