
CREATE TABLE cohorts (
  id  SERIAL PRIMARY KEY,
  name text,
  starting_date text
);
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
  cohort_id int,
  constraint fk_cohorts foreign key(cohort_id)
    references cohorts(id)
    on delete cascade
);