UPDATE `creature_template` SET `subname` = 'Expert Blacksmith'        WHERE `entry` = 1383;  -- Snarl <Expert Blacksmith>
UPDATE `creature_template` SET `subname` = 'Journeyman Tailor'        WHERE `entry` = 2855;  -- Snang <Journeyman Tailor>
UPDATE `creature_template` SET `subname` = 'Journeyman Engineer'      WHERE `entry` = 2857;  -- Thund <Journeyman Engineer>
UPDATE `creature_template` SET `subname` = 'Expert Enchanter'         WHERE `entry` = 3345;  -- Godan <Expert Enchanter>
UPDATE `creature_template` SET `subname` = 'Expert Alchemist'         WHERE `entry` = 3347;  -- Yelmak <Expert Alchemist>
UPDATE `creature_template` SET `subname` = 'Artisan Blacksmith'       WHERE `entry` = 3355;  -- Saru Steelfury <Artisan Blacksmith>
UPDATE `creature_template` SET `subname` = 'Expert Tailor'            WHERE `entry` = 3363;  -- Magar <Expert Tailor>
UPDATE `creature_template` SET `subname` = 'Expert Leatherworker'     WHERE `entry` = 3365;  -- Karolek <Expert Leatherworker>
UPDATE `creature_template` SET `subname` = 'Expert Engineer'          WHERE `entry` = 3412;  -- Nogg <Expert Engineer>
UPDATE `creature_template` SET `subname` = 'Journeyman Leatherworker' WHERE `entry` = 5811;  -- Kamari <Journeyman Leatherworker>
UPDATE `creature_template` SET `subname` = 'Armor Crafter'            WHERE `entry` = 7230;  -- Shayis Steelfury <Armor Crafter>
UPDATE `creature_template` SET `subname` = 'Weapon Crafter'           WHERE `entry` = 7231;  -- Kelgruk Bloodaxe <Weapon Crafter>
UPDATE `creature_template` SET `subname` = 'Journeyman Blacksmith'    WHERE `entry` = 10266; -- Ug'thok <Journeyman Blacksmith>
UPDATE `creature_template` SET `subname` = 'Artisan Engineer'         WHERE `entry` = 11017; -- Roxxik <Artisan Engineer>
UPDATE `creature_template` SET `subname` = 'Journeyman Alchemist'     WHERE `entry` = 11046; -- Whuut <Journeyman Alchemist>
UPDATE `creature_template` SET `subname` = 'Journeyman Enchanter'     WHERE `entry` = 11066; -- Jhag <Journeyman Enchanter>

UPDATE `creature_template` SET `npcflag` = 81 WHERE `entry` IN (1383, 2855, 2857, 3412, 5811, 10266, 11017, 11046, 11066); -- `trainer_type` = 2
UPDATE `creature_template` SET `type_flags` = 134217728 WHERE `entry` IN (1383, 3412, 11017);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceEntry` = 0 AND `ConditionTypeOrReference` = 7 AND `SourceGroup` IN (1012, 2782, 4126, 4148, 4151, 4168, 4209, 4347);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES
(15, 1012, 0, 7, 164, 125, 'Show menu if blacksmithing is 125 or higher'), -- Saru Steelfury <Artisan Blacksmith>
(15, 2782, 0, 7, 164, 50,  'Show menu if blacksmithing is 50 or higher'),  -- Snarl <Expert Blacksmith>
(15, 4126, 0, 7, 171, 50,  'Show menu if alchemy is 50 or higher'),        -- Yelmak <Expert Alchemist>
(15, 4148, 0, 7, 202, 50,  'Show menu if engineering is 50 or higher'),    -- Nogg <Expert Engineer>
(15, 4151, 0, 7, 202, 125, 'Show menu if engineering is 125 or higher'),   -- Roxxik <Artisan Engineer>
(15, 4168, 0, 7, 333, 50,  'Show menu if enchanting is 50 or higher'),     -- Godan <Expert Enchanter>
(15, 4209, 0, 7, 165, 50,  'Show menu if leatherworking is 50 or higher'), -- Karolek <Expert Leatherworker>
(15, 4347, 0, 7, 197, 50,  'Show menu if tailoring is 50 or higher');      -- Magar <Expert Tailor>

DELETE FROM `creature` WHERE `id` = 3230 AND `map`= 1;
DELETE FROM `creature` WHERE `guid` IN (10299, 203492, 203493, 203494, 203495);
DELETE FROM `creature` WHERE `id` IN (3890, 14720, 14942, 15006);
INSERT INTO `creature` (`guid`, `id`, `map`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(603230, 3230,  1, 1, 1938.55, -4133.22, 41.1424, 4.07636, 300), -- Nazgrel <Advisor to Thrall>
(10299,  3296,  1, 1, 1620.45, -4252.84, 47.5273, 3.7001,  300), -- Orgrimmar Grunt
(603890, 3890,  1, 1, 1991.89, -4793.95, 56.0462, 3.27581, 300), -- Brakgul Deathbringer <Warsong Gulch Battlemaster>
(614720, 14720, 1, 1, 1565.79, -4395.27, 6.9866, 3.35103,  600), -- High Overlord Saurfang
(614942, 14942, 1, 1, 1980.9, -4787.78, 55.8796, 5.13127,  600), -- Kartra Bloodsnarl <Alterac Valley Battlemaster>
(615006, 15006, 1, 1, 2002.26, -4796.74, 56.8471, 3.00197, 600); -- Deze Snowbane <Arathis Basin Battlemaster>

-- Master Pyreanor <Paladin Trainer>
UPDATE `creature` SET `position_x`= 1940.23, `position_y`= -4135.53, `position_z`= 41.1522, `orientation`= 3.12425  WHERE `id` = 23128;

-- Knowledge of the Orb of Orahil (Warlock)
DELETE FROM `creature_queststarter` WHERE `id` = 3326 AND `quest` = 4967;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 4967);

-- An Imp's Request (Warlock)
DELETE FROM `creature_queststarter` WHERE `id` IN (3324, 3325, 3326, 4564, 5495, 5496) AND `quest`= 8419;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (3326, 8419);

UPDATE `creature_template` SET `subname` = 'General Goods Merchant'       WHERE `entry` = 3313;  -- Trak'gen <General Goods Merchant>
UPDATE `creature_template` SET `subname` = 'Guns and Ammo Merchant'       WHERE `entry` = 3322;  -- Kaja <Guns and Ammo Merchant>
UPDATE `creature_template` SET `subname` = 'Reagents Vendor'              WHERE `entry` = 3323;  -- Horthus <Reagents Vendor>
UPDATE `creature_template` SET `subname` = 'Poison Vendor'                WHERE `entry` = 3334;  -- Rekkul <Poison Vendor>
UPDATE `creature_template` SET `subname` = 'Reagents Vendor'              WHERE `entry` = 3335;  -- Hagrus <Reagents Vendor>
UPDATE `creature_template` SET `subname` = 'General Goods Vendor'         WHERE `entry` = 3350;  -- Asoran <General Goods Vendor>
UPDATE `creature_template` SET `subname` = 'Reagents Vendor'              WHERE `entry` = 3351;  -- Magenius <Reagents Vendor>
UPDATE `creature_template` SET `subname` = 'Blacksmithing Supplier'       WHERE `entry` = 3356;  -- Sumi <Blacksmithing Supplier>
UPDATE `creature_template` SET `subname` = 'Mining Supplier'              WHERE `entry` = 3358;  -- Gorina <Mining Supplier>
UPDATE `creature_template` SET `subname` = 'General Trade Goods Merchant' WHERE `entry` = 3367;  -- Felika <General Trade Goods Merchant>
UPDATE `creature_template` SET `subname` = 'Cooking Supplier'             WHERE `entry` = 3400;  -- Xen'to <Cooking Supplier>
UPDATE `creature_template` SET `subname` = 'General Trade Goods Merchant' WHERE `entry` = 5817;  -- Shimra <General Trade Goods Merchant>
UPDATE `creature_template` SET `subname` = 'King of Darkspear Trolls'     WHERE `entry` = 10540; -- Vol'jin <King of Darkspear Trolls>
UPDATE `creature_template` SET `subname` = 'Zeppelin Master'              WHERE `entry` = 12136; -- Snurk Bucksquick <Zeppelin Master>

-- Nazgrel <Advisor to Thrall>
UPDATE `creature_template` SET `npcflag` = 2, `faction` = 29, `gossip_menu_id` = 0 WHERE `entry` = 3230;
UPDATE `creature_template_model` SET `DisplayScale` = 0.7 WHERE `CreatureID` = 3230;

-- remove civilian flag
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` IN (14392, 14720); -- Overlord Runthak / High Overlord Saurfang

/* NPC Garyl - Remove non-Vanilla Tabards */
DELETE FROM `npc_vendor` WHERE `entry`= 5188 AND `item` IN (15197, 15199, 19031, 19505, 24004, 31773, 31775, 31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221);

-- Nogg Quest Flags fix
UPDATE `creature_template` SET `npcflag` = `npcflag` | 2 WHERE `entry` = 3412;

-- Quest: Return to Witch Doctor Uzer'i
UPDATE `quest_template` SET `LogDescription`   = "Deliver Neeru's Herb Pouch to Witch Doctor Uzer'i in Feralas." WHERE `ID` = 3122;
UPDATE `creature_queststarter` SET `id` = 3216 WHERE `quest` = 3122;

-- Quest: A Strange Request to use Vanilla NPCs
UPDATE `quest_template` SET 
`LogDescription`   = "Take the Shrunken Head to Neeru Fireblade in Orgrimmar.", 
`QuestDescription` = "Neeru Fireblade in Orgrimmar has what I need to get started here! He has mixed up a concoction that I need for my... well, you'll see.$B$B
                      Off with you now -- to Orgrimmar. Here, take this with you. It's a shrunken head that I promised Neeru in exchange for the herbs. 
                      It's the head of some poor dwarf I ventured across in the forest. I'm sure Neeru will be pleased.$B$B
                      You'll find Neeru in the Cleft of Shadow." WHERE `ID` = 3121;

UPDATE `creature_questender`   SET `id` = 3216 WHERE `quest` = 3121;

-- smart scripts
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (10540, 14720);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (10540, 14720);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, 
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`, 
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, 
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
--
(10540, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 0, 0, 4, 5881, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,            'Vol jin - On Aggro - Play Sound (No Repeat)'),
--
(14720, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 11, 9347, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,           'Saurfang - On Aggro - Cast Mortal Strike trigger'),
(14720, 0, 1, 2, 32, 0, 100, 0, 2000, 9999, 0, 0, 0, 0, 11, 26339, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0,   'Saurfang - On receiving high damage - Cast Saurfang Rage'), -- should be critical damage
(14720, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,              'Saurfang - On Cast Power Saurfang Rage - Say Line 0'),
(14720, 0, 3, 0, 9, 0, 100, 0, 0, 0, 25000, 25000, 8, 25, 11, 15749, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Saurfang - Within 8-25 Range - Cast Shield Charge'),
(14720, 0, 4, 0, 12, 0, 100, 0, 0, 20, 2500, 3500, 0, 0, 11, 7160, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0,   'Saurfang - Target Between 0-20% Health - Cast Execute'),
(14720, 0, 5, 0, 5, 0, 100, 0, 5000, 5000, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,         'Saurfang - On Kill - Say Line 1');

DELETE FROM `creature_text` WHERE `CreatureID` IN (14720);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(14720, 0, 0, '%s\'s eyes glow red for a brief moment.', 16, 0, 100, 0, 0, 0, 11563, 0, 'Saurfang Rage'),
(14720, 1, 0, 'Is that the best you can do?',            16, 0, 100, 0, 0, 0, 11564, 0, 'Saurfang on Kill'); 
