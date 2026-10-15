CREATE TABLE exercises (
    exercise_id BIGINT,
    exercise_name VARCHAR,
    set_id BIGINT,
    nr_of_reps BIGINT,
    weight_lifted_in_set DECIMAL,
    PRIMARY KEY (exercise_id)
);

CREATE TABLE workouts (
    workout_id BIGINT,
    exercise_id BIGINT,
    workout_date DATE,
    user_id BIGINT,
    PRIMARY KEY (workout_id)
);

CREATE TABLE "user" (
    user_id BIGINT,
    user_name BIGINT,
    PRIMARY KEY (user_id)
);

ALTER TABLE workouts
    ADD FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id);

ALTER TABLE workouts
    ADD FOREIGN KEY (user_id) REFERENCES "user" (user_id);
