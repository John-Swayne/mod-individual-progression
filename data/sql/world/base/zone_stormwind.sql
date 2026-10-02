UPDATE `creature_template` SET `subname` = 'Journeyman Blacksmith'    WHERE `entry` = 957;   -- Dane Lindgren <Apprentice Blacksmith>
UPDATE `creature_template` SET `subname` = 'Journeyman Tailor'        WHERE `entry` = 1300;  -- Lawrence Schneider <Apprentice Tailor>
UPDATE `creature_template` SET `subname` = 'Expert Enchanter'         WHERE `entry` = 1317;  -- Lucan Cordell <Enchanting Trainer>
UPDATE `creature_template` SET `subname` = 'Artisan Tailor'           WHERE `entry` = 1346;  -- Georgio Bolero <Artisan Tailor>
UPDATE `creature_template` SET `subname` = 'Journeyman Engineer'      WHERE `entry` = 11026; -- Sprite Jumpsprocket <Apprentice Engineer>
UPDATE `creature_template` SET `subname` = 'Journeyman Enchanter'     WHERE `entry` = 11068; -- Betty Quin <Apprentice Enchanter>
UPDATE `creature_template` SET `subname` = 'Journeyman Leatherworker' WHERE `entry` = 11096; -- Randal Worth <Apprentice Leatherworker>

UPDATE `creature_template` SET `npcflag` = 81 WHERE `entry` IN (957, 1300, 11026, 11068, 11096); -- `trainer_type` = 2
UPDATE `creature_template` SET `type_flags` = 134217728 WHERE `entry` = 5567; -- Sellandus <Expert Tailor>

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceEntry` = 0 AND `ConditionTypeOrReference` = 7 AND `SourceGroup` IN (581, 4146, 4161, 4201, 4203, 4344, 4353); 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES 
(15, 581,  0, 7, 164, 50,  'Show menu if blacksmithing is 50 or higher'),  -- Therum Deepforge <Expert Blacksmith>
(15, 4146, 0, 7, 202, 50,  'Show menu if engineering is 50 or higher'),    -- Lilliam Sparkspindle <Expert Engineer>
(15, 4161, 0, 7, 333, 50,  'Show menu if enchanting is 50 or higher'),     -- Lucan Cordell <Expert Enchanter>
(15, 4201, 0, 7, 171, 50,  'Show menu if alchemy is 50 or higher'),        -- Lilyssia Nightbreeze <Expert Alchemist>
(15, 4203, 0, 7, 165, 50,  'Show menu if leatherworking is 50 or higher'), -- Simon Tanner <Expert Leatherworker>
(15, 4344, 0, 7, 197, 50,  'Show menu if tailoring is 50 or higher'),      -- Sellandus <Expert Tailor>
(15, 4353, 0, 7, 197, 125, 'Show menu if tailoring is 125 or higher');     -- Georgio Bolero <Artisan Tailor>

UPDATE `creature_template` SET `minlevel` = 63, `maxlevel` = 63, `ScriptName` = 'npc_king_varian_wrynn' WHERE `entry` = 29611; -- King Varian Wrynn
UPDATE `creature_template` SET `ScriptName` = 'npc_ipp_pre_wotlk' WHERE `entry` = 1747; -- Anduin Wrynn

UPDATE `creature_template` SET `subname` = 'Arcane Goods Vendor' WHERE `entry` = 1257; -- Keldric Boucher <Alchemy Supplies & Reagents>
UPDATE `creature_template` SET `subname` = 'Reagent Vendor'      WHERE `entry` = 1275; -- Kyra Boucher <Reagents>
UPDATE `creature_template` SET `subname` = 'Trade Supplier'      WHERE `entry` = 1286; -- Edna Mullby <Trade Supplies>
UPDATE `creature_template` SET `subname` = 'Reagent Vendor'      WHERE `entry` = 1308; -- Owen Vaughn <Reagents>
UPDATE `creature_template` SET `subname` = 'Poison Supplier'     WHERE `entry` = 1326; -- Sloan McCoy <Poison Supplier>
UPDATE `creature_template` SET `subname` = 'Reagent Vendor'      WHERE `entry` = 1351; -- Brother Cassius <Reagents>
UPDATE `creature_template` SET `subname` = 'Weapon Crafter'      WHERE `entry` = 7232; -- Borgus Steelhand <Weapon Crafter>

-- Quest: Alicia's Poem (11451)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 19 AND `SourceEntry` = 11451;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 11451, 0, 0, 8, 0, 66008, 0, 0, 0, 0, 0, '', 'Quest \'Alicia\'s Poem\' only available after the player has reached PROGRESSION_TBC_TIER_1');

UPDATE `gameobject` SET `ScriptName` = 'gobject_ipp_pre_tbc' WHERE `guid` IN (61936, 61940, 61942, 61944, 61945, 61946, 61947, 61949, 61951);

/* NPC Rebecca Laughlin - Remove non-Vanilla Tabards */
DELETE FROM `npc_vendor` WHERE `entry`= 5193 AND `item` IN (15197, 15199, 19031, 19505, 24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);

-- Summon Felsteed (Warlock)
DELETE FROM `quest_offer_reward` WHERE `ID` = 4488;
INSERT INTO `quest_offer_reward` (`ID`, `RewardText`) VALUES 
(4488, 'So, you\'ve decided to grace my presence again. How kind of you.$b$bMy acolytes wondered if you\'d ever show up. I told them there was no doubt. When power is concerned, you are drawn in like a moth to the flame.');

-- A Meal Served Cold
UPDATE `quest_template` SET `Flags` = 9, 
`LogDescription` = 'Kill a Cold Eye Basilisk, get a Chilled Basilisk Haunch, and return it to Angus Stern in the Blue Recluse.$B$B<You must not release your spirit to succeed in this quest.>' 
WHERE `ID` = 212;

-- Chillwind Camp
UPDATE `quest_template` SET `LogTitle` = 'Chillwind Point' WHERE `ID` = 8415;

-- Devourer of Souls (Warlock)
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 1716;

DELETE FROM `creature_text` WHERE `CreatureID` IN (12739);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(12739, 0, 0, '$s becomes enraged!', 16, 0, 100, 0, 0, 0, 10677, 0, 'Onyxias Elite Guard enrage at 30%');

-- smart scripts
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1284, 12739);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (1284, 12739);
DELETE FROM `smart_scripts` WHERE `event_type` = 10 AND `target_type` = 7 AND `entryorguid` = 28347;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--
(1284, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 0, 0, 4, 5883, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                    'Archbishop Benedictus - On Aggro - Play Sound (No Repeat)'),
(1284, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 20697, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                  'Archbishop Benedictus - On Aggro - Cast Power word Shield'),
(1284, 0, 2, 0, 9, 0, 100, 0, 2000, 3500, 2000, 3500, 0, 40, 11, 20695, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,     'Archbishop Benedictus - Within 0-40 Range - Cast Holy Smite'),
(1284, 0, 3, 0, 9, 0, 100, 0, 3400, 4800, 3400, 4800, 0, 10, 11, 23858, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0,     'Archbishop Benedictus - Within 0-10 Range - Cast Holy Nova'),
(1284, 0, 4, 0, 0, 0, 100, 0, 12000, 18000, 12000, 18000, 0, 0, 11, 20697, 32, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Archbishop Benedictus - In Combat - Cast Power Word: Shield'),
--
(12739, 0, 0, 1, 2, 0, 100, 0, 0, 30, 0, 0, 0, 0, 11, 8599, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                 'Onyxias Elite Guard - Between 0-30% Health - Cast Enrage'),
(12739, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,                     'Onyxias Elite Guard - On Enrage - Say Line 0'),
(28347, 0, 1, 0, 10, 0, 100, 0, 1, 20, 30000, 60000, 1, 0, 1, 5, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,            'Miles Sidney - OOC LOS - Say Line 5');
