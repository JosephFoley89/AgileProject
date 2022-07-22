CREATE SCHEMA agile_schema;

CREATE TABLE agile_schema.Sprint (
	SprintID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    Start DATE NOT NULL,
    End DATE NOT NULL,
	PRIMARY KEY (SprintID)
);

CREATE TABLE agile_schema.Epic (
	EpicID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Description VARCHAR(500) NOT NULL,
    PRIMARY KEY (EpicID)
);

CREATE TABLE agile_schema.UserStory (
	UserStoryID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(100),
    Description VARCHAR(500),
    EpicID INT,
    isReady BOOLEAN,
    Points INT,
    SprintID INT,
    PRIMARY KEY (UserStoryID),
    FOREIGN KEY (EpicID) REFERENCES Epic(EpicID),
    FOREIGN KEY (SprintID) REFERENCES Sprint(SprintID)
);

CREATE TABLE agile_schema.AcceptanceCriteria (
	AcceptanceCriteriaID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    UserStoryID INT NOT NULL,
    PRIMARY KEY (AcceptanceCriteriaID),
    FOREIGN KEY (UserStoryID) REFERENCES UserStory(UserStoryID)
);

CREATE TABLE agile_schema.WorkPackage (
	WorkPackageID INT NOT NULL AUTO_INCREMENT,
	Title VARCHAR(100),
	Description VARCHAR(500),
    UserStoryID INT NOT NULL,
    Points INT NOT NULL,
    PRIMARY KEY (WorkPackageID),
    FOREIGN KEY (UserStoryID) REFERENCES UserStory(UserStoryID)
);

-- DUMMY DATA

INSERT INTO agile_schema.sprint (title, description, start, end)
VALUES (
	"BACKLOG",
	"This sprint covers all stories not currently assigned to a sprint",
	CAST("0001/01/01" as date),
	CAST("9999/12/31" as date)
), 
(
	CONCAT("SPRINT", 2),
	"This sprint covers all work between 7-21-22 - 8-4-22.",
	NOW(),
	DATE_ADD(NOW(), INTERVAL 2 WEEK)
);

INSERT INTO agile_schema.epic (Title, Description)
VALUES (
	"Automation Epic", 
	"This epic is designed to be referenced in all automation stories."
),
(
	"Self Service Epic",
	"This epic is designed to be referenced in all self service stories."
),
(
	"Compliance Epic",
	"This epic is designed to be referenced in all compliance stories"
);

INSERT INTO agile_schema.userstory (Title, Description, EpicID, isReady, Points, SprintID)
VALUES (
	"Automate adding users to group",
	"As a servicenow developer, I need this to be automated so that I can focus my efforts elsewhere. I will know this is done when I no longer have to add users to groups.",
	1,
	true,
	2,
	2
);

INSERT INTO agile_schema.acceptancecriteria (Title, UserStoryID)
VALUES ("Users are able to maintain their user groups without servicenow admin intervention", 1),
("A form is available to users to manipulate user groups", 1),
("A workflow automatically handles the request once the user submits their request", 1);

INSERT INTO agile_schema.workpackage (Title, Description, UserStoryID, Points)
VALUES (
	"Create form GUI", 
	"In order to complete this task I will need to create a GUI for the user to submit their request", 
	1, 1
),
(
	"Create workflow to handle user requests",
	"In order to complete this task I will need to create a workflow to handle the requests",
	1, 1
);