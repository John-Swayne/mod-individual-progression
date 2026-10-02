-- Summon Warhorse - Tome of Nobility (Paladin)
DELETE FROM `creature_queststarter` WHERE `quest` IN (1661, 4485, 4486); 
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (6171, 1661), (6179, 4485), (5149, 4486);

DELETE FROM `creature_questender` WHERE `id` = 6171 AND `quest` IN (1661, 4485, 4486);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (6171, 1661), (6171, 4485), (6171, 4486);

-- Summon Warhorse - The Thalassian Warhorse (Paladin)
DELETE FROM `creature_queststarter` WHERE `quest` IN (9712); 
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (17717, 9712);

DELETE FROM `creature_questender` WHERE `id` = 17717 AND `quest` IN (9712);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (17717, 9712);

-- Re-enable Summon Felsteed (Warlock)
DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (3631, 4487, 4488, 4489, 4490);

DELETE FROM `creature_queststarter` WHERE `quest` IN (3631, 4487, 4488, 4489, 4490); 
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 3631), (5172, 4487), (461, 4488), (4563, 4489), (6251, 4490);

DELETE FROM `creature_questender` WHERE `id` = 6251 AND `quest` IN (3631, 4487, 4488, 4489, 4490);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (6251, 3631), (6251, 4487), (6251, 4488), (6251, 4489), (6251, 4490);

-- Warlock Dreadsteed Quest Line
UPDATE `quest_template` SET `RequiredItemCount1` = 10, `LogDescription` = "Bring 10 Elixirs of Shadow Power to Gorzeeki Wildeyes in the Burning Steppes." WHERE `ID` = 7626; -- Bell of Dethmoora
UPDATE `quest_template` SET `RequiredItemCount1` = 35, `LogDescription` = "Bring 35 Black Dragonscales to Gorzeeki Wildeyes in the Burning Steppes." WHERE `ID` = 7628; -- Doomsday Candle
UPDATE `quest_template` SET `RequiredItemCount1` = 3,  `LogDescription` = "Bring 3 Arcanite Bars to Gorzeeki in the Burning Steppes." WHERE `ID` = 7630; -- Arcanite

-- Hide pre 1.6 epic mounts ater BWL is unlocked - Hide WotLK mounts on vanilla vendors
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` IN (384, 1261, 3362, 3685, 4730, 4731, 7952, 7955);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, 
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(23, 384,  12353, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Katie Hunter will not sell White Stallion Bridle after the player has completed PROGRESSION_ONYXIA'),
(23, 384,  12354, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Katie Hunter will not sell Palomino Bridle after the player has completed PROGRESSION_ONYXIA'),
(23, 1261, 13328, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Veron Emberstill will not sell Black Ram after the player has completed PROGRESSION_ONYXIA'),
(23, 1261, 13329, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Veron Emberstill will not sell Frost Ram after the player has completed PROGRESSION_ONYXIA'),
(23, 3362, 12330, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Ogunaro Wolfrunner will not sell Horn of the Red Wolf after the player has completed PROGRESSION_ONYXIA'),
(23, 3362, 12351, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Ogunaro Wolfrunner will not sell Horn of the Arctic Wolf after the player has completed PROGRESSION_ONYXIA'),
(23, 3362, 46099, 0, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Ogunaro Wolfrunner will not sell Horn of the Black Wolf until the player has reached WotLK'),
(23, 3685, 15292, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Harb Clawfoot will not sell Green Kodo after the player has completed PROGRESSION_ONYXIA'),
(23, 3685, 15293, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Harb Clawfoot will not sell Teal Kodo after the player has completed PROGRESSION_ONYXIA'),
(23, 3685, 46100, 0, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Harb Clawhoof will not sell White Kodo until the player has reached WotLK'),
(23, 4730, 12302, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Lelanai will not sell Reins of the Ancient Frostsaber after the player has completed PROGRESSION_ONYXIA'),
(23, 4730, 12303, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Lelanai will not sell Reins of the Nightsaber after the player has completed PROGRESSION_ONYXIA'),
(23, 4731, 46308, 0, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Zachariah Post will not sell Black Skeletal Horse until the player has reached WotLK'),
(23, 4731, 47101, 0, 0, 8, 0, 66013, 0, 0, 0, 0, 0, '', 'Zachariah Post will not sell Ochre Skeletal Warhorse until the player has reached WotLK'),
(23, 7952, 8586,  0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Zjolnir will not sell Whistle of the Mottled Red Raptor after the player has completed PROGRESSION_ONYXIA'),
(23, 7952, 13317, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Zjolnir will not sell Whistle of the Ivory Raptor after the player has completed PROGRESSION_ONYXIA'),
(23, 7955, 13326, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Milli Featherwhistle will not sell White Mechanostrider Mod A after the player has completed PROGRESSION_ONYXIA'),
(23, 7955, 13327, 0, 0, 8, 0, 66002, 0, 0, 1, 0, 0, '', 'Milli Featherwhistle will not sell Icy Blue Mechanostrider Mod A after the player has completed PROGRESSION_ONYXIA');

DELETE FROM `npc_vendor` WHERE `entry` = 384  AND `item` IN (12353, 12354);
DELETE FROM `npc_vendor` WHERE `entry` = 1261 AND `item` IN (13328, 13329);
DELETE FROM `npc_vendor` WHERE `entry` = 1460 AND `item` IN (12353, 12354, 18776, 18777, 18778);
DELETE FROM `npc_vendor` WHERE `entry` = 2357 AND `item` IN (12353, 12354);
DELETE FROM `npc_vendor` WHERE `entry` = 3362 AND `item` IN (12330, 12351);
DELETE FROM `npc_vendor` WHERE `entry` = 3685 AND `item` IN (15292, 15293);
DELETE FROM `npc_vendor` WHERE `entry` = 4730 AND `item` IN (12302, 12303);
DELETE FROM `npc_vendor` WHERE `entry` = 4885 AND `item` IN (12353, 12354);
DELETE FROM `npc_vendor` WHERE `entry` = 7952 AND `item` IN (8586, 13317);
DELETE FROM `npc_vendor` WHERE `entry` = 7955 AND `item` IN (13326, 13327);

INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
--
(384, 12353, 0, 0),       -- Katie Hunter, White Stallion Bridle
(384, 12354, 0, 0),       -- Katie Hunter, Palomino Bridle
(1261, 13328, 0, 0),      -- Veron Amberstill, Black Ram
(1261, 13329, 0, 0),      -- Veron Amberstill, Frost Ram
(1460, 18776, 0, 0),      -- Unger Statforth, Swift Palomino
(1460, 18777, 0, 0),      -- Unger Statforth, Swift Brown Steed
(1460, 18778, 0, 0),      -- Unger Statforth, Swift White Steed
(1460, 12353, 0, 0),      -- Unger Statforth, White Stallion Bridle
(1460, 12354, 0, 0),      -- Unger Statforth, Palomino Bridle
(2357, 12353, 0, 0),      -- Merideth Carlson, White Stallion Bridle
(2357, 12354, 0, 0),      -- Merideth Carlson, Palomino Bridle
(3362, 12330, 0, 0),      -- Ogunaro Wolfrunner, Horn of the Red Wolf
(3362, 12351, 0, 0),      -- Ogunaro Wolfrunner, Horn of the Arctic Wolf
(3685, 15293, 0, 0),      -- Harb Clawhoof, Teal Kodo
(3685, 15292, 0, 0),      -- Harb Clawhoof, Green Kodo
(4730, 12302, 0, 0),      -- Lelanai, Ancient Frostsaber
(4730, 12303, 0, 0),      -- Lelanai, Reins of the Nightsaber
(4885, 12353, 0, 0),      -- Gregor MacVince, White Stallion Bridle
(4885, 12354, 0, 0),      -- Gregor MacVince, Palomino Bridle
(7952, 8586, 0, 0),       -- Zjolnir, Whistle of the Mottled Red Raptor
(7952, 13317, 0, 0),      -- Zjolnir, Whistle of the Ivory Raptor
(7955, 13326, 0, 0),      -- Milli Featherwhistle, White Mechanostrider Mod B
(7955, 13327, 0, 0);      -- Milli Featherwhistle, Icy Blue Mechanostrider Mod A

