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

INSERT INTO Mood VALUES (null, "Frustrated");
INSERT INTO Mood VALUES (null, "Exhausted");
INSERT INTO Mood VALUES (null, "Proud");
INSERT INTO Mood VALUES (null, "Excited");

INSERT INTO Entry VALUES (null, 4, "01/04/2022", "Python basics", "akjdhfajksdhfkjbdasjkf");
INSERT INTO Entry VALUES (null, 1, "01/13/2022", "SQL database setup", "adfgadfhadfhsgbargeadv");