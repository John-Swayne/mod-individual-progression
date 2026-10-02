/* Maelstrom fork: creature levels stay stock 3.3.5. Only the progression gating from this file is kept. */

/* Karazhan Quest NPCs - hidden until TBC */
UPDATE `creature_template` SET `ScriptName`='npc_ipp_tbc' WHERE `entry` IN (17613);
UPDATE `creature_template` SET `ScriptName`='npc_ipp_tbc' WHERE `entry` IN (18253);  # TODO: This is currently overriding some SmartAI and needs a custom fix
UPDATE `creature_template` SET `ScriptName`='npc_ipp_tbc' WHERE `entry` IN (18255);
