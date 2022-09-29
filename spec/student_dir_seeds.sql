TRUNCATE TABLE cohorts, students RESTART IDENTITY; 

INSERT INTO cohorts (name, starting_date) VALUES ('January', '2022-01-01');
INSERT INTO cohorts (name, starting_date) VALUES ('February', '2022-02-01');

INSERT INTO students (name, cohort_id) VALUES ('Kate', 1);
INSERT INTO students (name, cohort_id) VALUES ('John', 2);
