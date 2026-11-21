-- Ana'thek the Cruel (1059) leads a Skullsplitter Spiritchaser (672) and a
-- Skullsplitter Berserker (783) on a patrol in Stranglethorn Vale. Upstream has
-- the three spawns standing still. Route from cMaNGOS classic-db (spawn group
-- 19910); it is linear there, so the way back is written out as points 11-18.
-- Safe to re-run: fixed values, DELETE + INSERT.

SET @LEADER := 1366;
SET @PATH   := @LEADER * 10;

UPDATE `creature` SET `position_x` = -13076.923, `position_y` = -607.44775, `position_z` = 54.38304,
    `orientation` = 5.55, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = @LEADER;
UPDATE `creature_addon` SET `path_id` = @PATH WHERE `guid` = @LEADER;

DELETE FROM `waypoint_data` WHERE `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH,  1, -13076.923, -607.44775, 54.38304,  5.55, 120000),
(@PATH,  2, -13063.518, -616.86176, 54.252487, NULL, 0),
(@PATH,  3, -13052.077, -624.75073, 55.139477, NULL, 0),
(@PATH,  4, -13037.404, -636.6674,  53.165947, NULL, 0),
(@PATH,  5, -13014.783, -646.84485, 53.987156, NULL, 0),
(@PATH,  6, -12992.629, -655.3316,  51.66038,  NULL, 0),
(@PATH,  7, -12951.668, -675.0589,  51.259098, NULL, 0),
(@PATH,  8, -12925.764, -692.5545,  51.184467, NULL, 0),
(@PATH,  9, -12907.744, -720.5589,  51.30147,  NULL, 0),
(@PATH, 10, -12909.848, -751.8694,  51.423267, NULL, 30000),
(@PATH, 11, -12907.744, -720.5589,  51.30147,  NULL, 0),
(@PATH, 12, -12925.764, -692.5545,  51.184467, NULL, 0),
(@PATH, 13, -12951.668, -675.0589,  51.259098, NULL, 0),
(@PATH, 14, -12992.629, -655.3316,  51.66038,  NULL, 0),
(@PATH, 15, -13014.783, -646.84485, 53.987156, NULL, 0),
(@PATH, 16, -13037.404, -636.6674,  53.165947, NULL, 0),
(@PATH, 17, -13052.077, -624.75073, 55.139477, NULL, 0),
(@PATH, 18, -13063.518, -616.86176, 54.252487, NULL, 0);

-- Spiritchaser (1365) and Berserker (1367) follow and assist the leader.
DELETE FROM `creature_formations` WHERE `leaderGUID` = @LEADER OR `memberGUID` IN (1365, 1366, 1367);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
(@LEADER, @LEADER, 0, 0,   3,   0, 0),
(@LEADER, 1365,    3, 90,  515, 0, 0),
(@LEADER, 1367,    3, 270, 515, 0, 0);
