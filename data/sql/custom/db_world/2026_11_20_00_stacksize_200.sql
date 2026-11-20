-- Every item that stacks to between 10 and 200 stacks to 200.
-- Safe to re-run: items already at 200 stay at 200.
UPDATE `item_template` SET `stackable` = 200 WHERE `stackable` >= 10 AND `stackable` < 201;
