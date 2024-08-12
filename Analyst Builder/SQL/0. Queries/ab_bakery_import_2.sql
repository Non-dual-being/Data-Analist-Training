SELECT * 
FROM bakery.product_suggestions;

# the / cause the problem to imported as datetime
# if you have a missing id and you imported as int, then it will not import

ALTER TABLE product_suggestions RENAME COLUMN `ï»¿product_suggestion_id` TO `product_suggestion_id`

SE bakery;

CREATE TABLE product_suggestions2 (
    product_suggestion_id INT,
    product_suggestion_name TEXT,
    date_received TEXT,
    PRIMARY KEY (product_suggestion_id)
);
