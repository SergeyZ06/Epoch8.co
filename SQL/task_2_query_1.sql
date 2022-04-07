WITH Grades(student_id, subject_id, grade) AS (
    VALUES(1, 1, 5), (1, 1, 5), (1, 1, 4),
        (2, 1, 5), (2, 1, 4), (2, 1, 4),
        (3, 1, 5), (3, 1, 5), (3, 1, 4),
        (2, 2, 5), (2, 2, 4), (2, 2, 4),
        (3, 2, 5), (3, 2, 5), (3, 2, 4)
    ),
    
t1 AS (
    SELECT
        g.subject_id,
        g.student_id,
        AVG(g.grade) AS grade_avg
    FROM
        Grades AS g
    GROUP BY
        g.subject_id,
        g.student_id
),

t2 AS (
    SELECT
        t1.subject_id,
        t1.student_id,
        DENSE_RANK() OVER(PARTITION BY t1.subject_id ORDER BY t1.grade_avg DESC) AS position
    FROM
        t1
)

SELECT
    t2.subject_id,
    t2.student_id
FROM
    t2
WHERE
    t2.position = 1;
