# Personal Best

*Reps, sets, streaks, and personal bests. Gym rats love their stats.*

[Data Modeling · Easy · on DataDriven](https://datadriven.io/problems/personal_best)

## How it went

| | |
|---|---|
| Solved | 2026-10-15 |
| Accepted | on the 2nd submission |
| Hints | none |
| Concepts | Attributes, Data Types, Entities, 1NF, Foreign Keys, Grain Definition, One-to-Many, Primary Keys, 2NF, 3NF |

## The design

```mermaid
erDiagram
    exercises {
        BIGINT exercise_id PK
        VARCHAR exercise_name
        BIGINT set_id
        BIGINT nr_of_reps
        DECIMAL weight_lifted_in_set
    }
    workouts {
        BIGINT workout_id PK
        BIGINT exercise_id FK
        DATE workout_date
        BIGINT user_id FK
    }
    user {
        BIGINT user_id PK
        BIGINT user_name
    }
    exercises only one optionally to one or more workouts : "exercise_id"
    user only one optionally to one or more workouts : "user_id"
```

The accepted design is in [`schema.sql`](./schema.sql) as DDL and in [`schema.json`](./schema.json) as JSON.
