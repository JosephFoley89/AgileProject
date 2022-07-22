# AgileProject
# Hello, I'm joe and I set out to create an Agile Development tracking tool for personal use.
# This is currently a work in progress and the contents will likely change quite a bit over the
# course of the project.

----------------------------------Rough Database Schema Diagram---------------------------------------

+---------------Sprint------------------+
| ID [Integer] PRIMARY KEY              |
| Start [Date]                          |
| End [Date]                            |
| Title [String]                        |
| Description [String]                  |
+---------------------------------------+
                   | O
                   |
                   |
                   | M
+--------------User  Story--------------+                     +-------------Work Package--------------+
| ID ID [Integer] PRIMARY KEY           |                     | ID [Integer] PRIMARY KEY              |
| Title [String]                        |                     | Title [String]                        |
| Description [String]                  | O                 M | Story [Reference to User Story]       |
| Acceptance Criteria [List of Strings] |---------------------| Points [Integer]                      |              
| Epic [Reference to Epic table]        |                     +---------------------------------------+
| Ready Status [Boolean]                |                     
| Points [Integer]                      | O                 M +----------Acceptance Criteria----------+
| Sprint [Reference to Sprint]          |---------------------| ID [Integer] PRIMARY KEY              |
+---------------------------------------+                     | Title [String]                        |
                   | O                                        | Story [Reference to User Story]       |
                   |                                          +---------------------------------------+
                   |                                          
                   | M
+------------------Epic-----------------+
| ID [Integer] PRIMARY KEY              |
| Title [String]                        |
| Description [String]                  |
+---------------------------------------+
