WITH A(id) AS (
    VALUES(1), (2)
    ),

B(id) AS (
    VALUES(1), (3)
    )

SELECT
    *
FROM A
    LEFT JOIN B ON A.id = B.id;
