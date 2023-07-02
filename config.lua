config = {}

-----------------------------------------------------------------------------------------
--                          Basic Script Configuration                                 --
-----------------------------------------------------------------------------------------

config.PvP = true -- FALSE = No PvP | TRUE = PVP (meaning Friendly Fire is ON)

config.ragdoll = true -- FALSE = NO RAGDOLLING
-- KEYBIND IS IN THE FIVEM/GTA 5 SETTINGS!

config.afkKicker = false -- 10 minute afk timer. 
config.adviseAfkStatus = true

config.highPingKicker = true 
config.maxPingLimit = 150

-----------------------------------------------------------------------------------------

config.disabledCommandMessage = '^1^*BE ADVISED: ^7^* The command you tried to enter is not enabled!'

-----------------------------------------------------------------------------------------
--                        Chat Commands Configuration                                  --
-----------------------------------------------------------------------------------------
config.advertStyle = 2 -- DEFAULT: 2 - 3 DIFF STYLES

config.enableDiscordCommand = true -- Enable/Disable the /discord command!
config.enableCadCommand = true -- Enable/Disable the /cad command!
config.enableWebsiteCommand = true -- Enable/Disable the /website command!

 -- ^^  If you do not want to use these commands, You can now disable them!! ^^
config.discordLink = "https://discord.gg/kSCgxB3Ucz"
config.activecadLink = "https://YourCadLink.com"
config.websiteLink = "https://YourWebsiteLink.com"

-- 3D Me Configuration --
config.meTextSize = 0.55
config.meTextColor = { r = 230, g = 255, b = 255, a = 255 } 
config.meDisplayTime = 5 -- Duration to display the text (in seconds)

config.meShowDistance = 250 -- You can ignore this. (UNLESS YOU WANT TO CHANGE IT, BUT I ADVISE AGAINST IT.)

-----------------------------------------------------------------------------------------
--                           Advanced 911 Configuration                                --
-----------------------------------------------------------------------------------------


config.dispatchWebhook = 'WEBHOOK-LINK' -- Webhook to your channel [IMPORTANT]

config.webhookUsername = '[SACD] Dispatcher' -- Webhook Username.

config.webhookIcon = 'WEBHOOK-ICON-LINK' -- Image Link.
	
config.embedColor = 16711680 -- Use DECIMAL NUMBERS for the Color.
										
--

config.disableChatCalls = false -- Setting this to TRUE will not log the 911 call in the Game Chat, only on the webhook!

config.ondutymode = false  -- True = Must use onduty command, in order to see 911 calls in chat. | False = 911 calls will post in chat, for all to see.
config.ondutycmd = 'onduty-leo' -- IF onduty mode is false, ignore this. 

config.passwordmode = false -- Setting this to TRUE means you need a password in order to go on duty!
config.ondutypassword = 'CHANGE-ME' -- If Password mode is on, set this up. | IGNORE if you do not use password mode.

config.showCallerArea = true -- true =  Display 911 Caller General Area | False = no general area on the map.

config.GeneralAreaDisplayTime = 25 -- How long to Display 911 Caller Area in SECONDS! | IGNORE - If you set showCallerArea to FALSE

----------------------------------------------------------------------------------------- 

config.blipSprite = 41 -- Leave this be, UNLESS you know what you're doing! - https://docs.fivem.net/docs/game-references/blips/
config.blipSpriteSize = 0.7 -- Leave this be, UNLESS you know what you're doing! Min-Max (0.1-1.0) any higher will be too big.

config.generalAreaColor = 79 -- THIS IS IS THE COLOR OF THE CIRCLE THAT POPS UP ON THE MAP FOR THE CALLERS "GENERAL AREA"!
-- DO you want to change the color of this, view this website for the COLOR Values!
-- https://docs.fivem.net/docs/game-references/blips/

-----------------------------------------------------------------------------------------
--                           Advanced Jailing Configuration                            --
-----------------------------------------------------------------------------------------


config.allowToJailMyself = true -- Setting to FALSE will disable the /jailmyself command | TRUE = Will allow anyone to use the /jailmyself command!

config.jailPassword = "CHANGE-ME"

config.maxJailTime = 300 -- In Seconds.
config.defaultJailTime = 50 -- In Seconds.

config.assignJailPed = true -- Give Ped upon entering Jail | FALSE = NO PED.
config.jailPedHash = 0x5F2113A1 -- HASH KEY FOR PED. | IGNORE  if you set assignJailPed false.

config.messageInJail = '~o~You were searched and cleared before you got released to the yard!' -- This is the message you get sent, upon entering the prison courtyard.

-- Jail Coords --

-- Coords in Jail --
config.x = 1638.14 
config.y = 2527.56
config.z = 45.56

-- Release Coords --
config.rx = 1855.807
config.ry = 2601.949
config.rz = 45.323

-----------------------------------------------------------------------------------------
--            YOU MAY IGNORE THIS SECTION, IT IS STILL UNDER DEVELOPMENT!              --
-----------------------------------------------------------------------------------------

config.hideDisabledCommandsInChat = true -- IGNORE! | Messing with this will just make things dumb, don't touch.
