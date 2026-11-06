

task.spawn(function()
	local ok, result = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/HomerSimpson88354/EternoSploitAssets/refs/heads/main/start.lua"))()
	end)

	if not ok then
		warn("failed to load external loadstrings", result)
	end
end)

local tbl = {
	Services = {},
	Refs = {},
	Theme = {},
	State = { Flags = {} },
	Runtime = {},
	Remotes = {},
	Constants = {},
	Assets = {},
	UI = { pageContainer = nil },
	Functions = {},
}

rawset(_G, "S", tbl)
tbl.Flags = tbl.State.Flags
tbl.Helpers = tbl.Functions
tbl.Services.Players = game:GetService("Players")
tbl.Services.UserInputService = game:GetService("UserInputService")
tbl.Services.TweenService = game:GetService("TweenService")
tbl.Services.ReplicatedStorage = game:GetService("ReplicatedStorage")
tbl.Services.RunService = game:GetService("RunService")
tbl.Services.Debris = game:GetService("Debris")
local players = tbl.Services.Players
local userInputService = tbl.Services.UserInputService
local replicatedStorage = tbl.Services.ReplicatedStorage
local runService = tbl.Services.RunService
local debris = tbl.Services.Debris
tbl.Refs.LocalPlayer = players.LocalPlayer or players.PlayerAdded:Wait()
tbl.Refs.PlayerGui = tbl.Refs.LocalPlayer:WaitForChild("PlayerGui")
tbl.Refs.Mouse = tbl.Refs.LocalPlayer:GetMouse()
local localPlayer = tbl.Refs.LocalPlayer
local mouse = tbl.Refs.Mouse

tbl.Theme = {
	background = Color3.fromRGB(17, 8, 10),
	panel = Color3.fromRGB(28, 12, 15),
	panelAlt = Color3.fromRGB(36, 15, 19),
	topbar = Color3.fromRGB(47, 16, 21),
	stroke = Color3.fromRGB(111, 43, 55),
	text = Color3.fromRGB(245, 228, 231),
	mutedText = Color3.fromRGB(189, 159, 165),
	accent = Color3.fromRGB(191, 54, 74),
	accentDark = Color3.fromRGB(126, 31, 44),
	tabIdle = Color3.fromRGB(45, 19, 24),
	tabHover = Color3.fromRGB(58, 24, 31),
	pageCard = Color3.fromRGB(34, 14, 18),
}

local theme = tbl.Theme

tbl.State.Flags = setmetatable({}, {
	__index = function(arg, arg2)
		return rawget(_G, arg2)
	end,
	__newindex = function(arg, arg2, arg3)
		rawset(_G, arg2, arg3)
	end,
})

local flags = tbl.State.Flags

for k, v in pairs({
	SuperFlingEnabled = false,
	FlingStrength = 850,
	Poison_Grab = false,
	Poison_Aura = false,
	AttractionAura = false,
	DeathAura = false,
	KickAura = false,
	UnstickAura = false,
	KickAuraRadius = 30,
	KickGrab = false,
	Burn_Grab = false,
	Death_Grab = false,
	MasslessGrab = false,
	FutherExtend = false,
	AntiInputLag = false,
	AntiKick = true,
	AntiKickToyOption = "Shuriken",
	PCLDBreakAntiKick = false,
	AntiBananna = false,
	AntiBlobman = false,
	AutoReset = true,
	AntiGrab = true,
	AntiLag = true,
	noclip = false,
	NoclipToggle = false,
	infinjump = false,
	thirdPerson = true,
	SuperSpeed = false,
	LoopKill = false,
	LoopKillPerm = false,
	KillAll = false,
	BringAll = false,
	SpeedValue = 16,
	HoldingObjectGrabPart = nil,
	RealGrabParts = nil,
}) do
	if rawget(_G, k) == nil then
		flags[k] = v
	end
end

tbl.State.TeleportPriority = rawget(_G, "TP_Priority") or 0
rawset(_G, "TP_Priority", tbl.State.TeleportPriority)

tbl.Runtime.Combat = {
	increaseLineExtend = 3,
	minimumExtendDistance = 3,
	multiplier = 0.15,
	pcDistance = 0,
	activeExtendGrabModel = nil,
	activeExtendDragPart = nil,
	activeExtendBaseDragPart = nil,
	extendFollowConnection = nil,
	masslessCharacterConnection = nil,
	masslessGrabChildConnection = nil,
	antiGrabHeartbeatConnection = nil,
	antiGrabRagdollUntil = 0,
	antiGrabRagdollDuration = 1.5,
	antiExplodeConnection = nil,
	antiBurnConnection = nil,
	antiInputLagRunId = 0,
	antiInputDelayStep = 0,
}

local combat = tbl.Runtime.Combat

tbl.Runtime.Input = {
	moveForward = false,
	moveBackward = false,
	moveLeft = false,
	moveRight = false,
	spaceHeld = false,
	infiniteJumpMoveSpeed = 6.9,
	infiniteJumpLift = 27,
}

local input = tbl.Runtime.Input

tbl.Runtime.Target = {
	playerList = {},
	selectedTargetName = nil,
	loopSpamKickTarget = nil,
	loopSpamKickEnabled = false,
	loopRemoveGucciEnabled = false,
	selectedKillOnly = false,
	targetKillRunId = 0,
	loopSpamKickRagdollEnabled = false,
	loopSpamKickRagdollPallet = nil,
	loopSpamKickPalletDestroyConn = nil,
	targetKillCounts = {},
	targetKillCharConn = {},
	safeZoneAlertCooldown = 0,
	targetSelectionListRef = nil,
	targetLoopKillPermToggleRef = nil,
	targetRagdollToggleRef = nil,
	targetKickToggleRef = nil,
	targetKillToggleRef = nil,
	targetRemoveGucciToggleRef = nil,
	targetToggleSyncing = false,
	departedTargets = {},
	loopKillCameraAnchorPart = nil,
	loopKillCameraOriginalSubject = nil,
	loopKillHiddenCharacterParts = nil,
	snowballLoopEnabled = false,
}

local target = tbl.Runtime.Target

tbl.Runtime.Keybind = {
	walkspeedKey = nil,
	thirdPersonKey = nil,
	loopTpKey = nil,
	quickBlobKey = nil,
	blobmanKickKey = nil,
}

local keybind = tbl.Runtime.Keybind

tbl.Runtime.Aura = {
	paintPart = nil,
	loopConnection = nil,
	tickInterval = 0.08,
	lastTick = 0,
	kickTracked = {},
	unstickEnabled = false,
	unstickRadius = 30,
}

local aura = tbl.Runtime.Aura
tbl.Runtime.Whitelist = { autoWhitelistFriends = true, friendStates = {}, selectionListRef = nil }
local whitelist = tbl.Runtime.Whitelist

tbl.Runtime.ESP = {
	enabled = false,
	showNames = false,
	rainbow = false,
	pcldEnabled = false,
	color = Color3.fromRGB(0, 255, 100),
	entries = {},
	pcldEntries = {},
	playerConnections = {},
	playerAddedConnection = nil,
	playerRemovingConnection = nil,
	workspaceChildAddedConnection = nil,
	loopConnection = nil,
	hue = 0,
	lastUpdate = 0,
	updateInterval = 0.05,
}

local esp = tbl.Runtime.ESP

tbl.Runtime.AntiKick = {
	runId = 0,
	trackedToy = nil,
	pcldBreakRunId = 0,
	pcldBreakDeathConnection = nil,
	pcldBreakAwaitingExternalDeath = false,
	pcldBreakPendingExternalTrigger = false,
	pcldBreakPendingRespawnKill = false,
	pcldBreakManagedHumanoid = nil,
	pcldBreakPlayerConnections = {},
	pcldBreakPlayerAddedConnection = nil,
	pcldBreakPlayerRemovingConnection = nil,
	pcldBreakLocalDeathConnection = nil,
}

local antiKick = tbl.Runtime.AntiKick

tbl.Runtime.Protection = {
	antiInputDestroyGrabHookInstalled = false,
	antiInputEndGrabEarlyBypassInstalled = false,
	antiInputEndGrabEarlyWatcherConnection = nil,
	autoResetConnection = nil,
	antiBanannaLoopToken = 0,
	antiBlobmanConnection = nil,
	antiBarrierConnection = nil,
	antiInputLagToggleRef = nil,
	antiLagToggleRef = nil,
	antiInputLagDropCFrame = nil,
	antiInputLagTrackedToy = nil,
	antiExplodeEnabled = false,
	floatSteppedConnection = nil,
	loopTpEnabled = false,
	loopTpRunId = 0,
	loopTpOrigin = nil,
	loopHouseTpEnabled = false,
	loopHouseTpRunId = 0,
	loopHouseTpOrigin = nil,
	loopHouseTpIndex = 0,
	antiBarrierEnabled = false,
	antiVoidConnection = nil,
	thirdPersonRunId = 0,
	walkOnWaterEnabled = false,
	waterParts = {},
}

local protection = tbl.Runtime.Protection
tbl.Runtime.Jerk = { enabled = false, track = nil, gui = nil, label = nil, loopToken = 0 }
local jerk = tbl.Runtime.Jerk

tbl.Runtime.Server = {
	lineLagEnabled = false,
	monsterLineLagEnabled = false,
	packetLagEnabled = false,
	antiDetect = false,
	linesPerSecond = 400,
	monsterLinesPerSecond = 200,
	packets = 400,
	lineLagRunId = 0,
	packetLagRunId = 0,
	killAllRunId = 0,
	bringAllRunId = 0,
	freezeCamPart = nil,
}

local server = tbl.Runtime.Server
tbl.Runtime.KillAllWhitelist = {}
local killAllWhitelist = tbl.Runtime.KillAllWhitelist
tbl.Remotes.MenuToysFolder = replicatedStorage:WaitForChild("MenuToys", 5)
tbl.Remotes.SpawnToyRF = tbl.Remotes.MenuToysFolder and tbl.Remotes.MenuToysFolder:FindFirstChild("SpawnToyRemoteFunction")
tbl.Remotes.DeleteToyRE = tbl.Remotes.MenuToysFolder and tbl.Remotes.MenuToysFolder:FindFirstChild("DestroyToy")
tbl.Remotes.BuyToy = tbl.Remotes.MenuToysFolder and tbl.Remotes.MenuToysFolder:FindFirstChild("BuyToyRemoteFunction")
tbl.Remotes.PlayerEvents = replicatedStorage:WaitForChild("PlayerEvents", 5)
tbl.Remotes.GameCorrectionEvents = replicatedStorage:WaitForChild("GameCorrectionEvents", 5)
tbl.Remotes.GrabEvents = replicatedStorage:WaitForChild("GrabEvents", 5)
tbl.Remotes.GameCorrectionsNotifyEvent = tbl.Remotes.GameCorrectionEvents and tbl.Remotes.GameCorrectionEvents:FindFirstChild("GameCorrectionsNotify")
tbl.Remotes.SetNetworkOwnerEvent = tbl.Remotes.GrabEvents and tbl.Remotes.GrabEvents:FindFirstChild("SetNetworkOwner")
tbl.Remotes.DestroyGrabLineEvent = tbl.Remotes.GrabEvents and tbl.Remotes.GrabEvents:FindFirstChild("DestroyGrabLine")
tbl.Remotes.CreateGrabLineEvent = tbl.Remotes.GrabEvents and tbl.Remotes.GrabEvents:FindFirstChild("CreateGrabLine")
tbl.Remotes.ExtendGrabLineEvent = tbl.Remotes.GrabEvents and tbl.Remotes.GrabEvents:FindFirstChild("ExtendGrabLine")
tbl.Remotes.StickyPartEvent = tbl.Remotes.PlayerEvents and tbl.Remotes.PlayerEvents:FindFirstChild("StickyPartEvent")
tbl.Remotes.CharacterEvents = replicatedStorage:WaitForChild("CharacterEvents", 5)
tbl.Remotes.RagdollRemoteEvent = tbl.Remotes.CharacterEvents and tbl.Remotes.CharacterEvents:FindFirstChild("RagdollRemote")
tbl.Remotes.StruggleEvent = tbl.Remotes.CharacterEvents and tbl.Remotes.CharacterEvents:FindFirstChild("Struggle")
local spawnToyRF = tbl.Remotes.SpawnToyRF
local deleteToyRE = tbl.Remotes.DeleteToyRE
local buyToy = tbl.Remotes.BuyToy
local grabEvents = tbl.Remotes.GrabEvents
local gameCorrectionsNotifyEvent = tbl.Remotes.GameCorrectionsNotifyEvent
local setNetworkOwnerEvent = tbl.Remotes.SetNetworkOwnerEvent
local destroyGrabLineEvent = tbl.Remotes.DestroyGrabLineEvent
local createGrabLineEvent = tbl.Remotes.CreateGrabLineEvent
local extendGrabLineEvent = tbl.Remotes.ExtendGrabLineEvent
local stickyPartEvent = tbl.Remotes.StickyPartEvent
local ragdollRemoteEvent = tbl.Remotes.RagdollRemoteEvent
local struggleEvent = tbl.Remotes.StruggleEvent
tbl.Refs.IsHeldValue = localPlayer:FindFirstChild("IsHeld") or localPlayer:WaitForChild("IsHeld", 5)
tbl.Refs.CanSpawnToyValue = localPlayer:FindFirstChild("CanSpawnToy") or localPlayer:WaitForChild("CanSpawnToy", 10)
local isHeldValue = tbl.Refs.IsHeldValue
local canSpawnToyValue = tbl.Refs.CanSpawnToyValue
tbl.Constants.FLING_VELOCITY_NAME = "FlingVelocity"
local flingVelocityName = tbl.Constants.FLING_VELOCITY_NAME
tbl.Assets.JerkAnimation = Instance.new("Animation")
local jerkAnimation = tbl.Assets.JerkAnimation
jerkAnimation.AnimationId = "rbxassetid://168268306"
local lookAt = nil
local forceReleaseHeldInventoryAndGrab = nil
local isPlayerInsideSafeZone = nil

tbl.Constants.AntiInputLagToyList = {
	["Post Horn"] = "InstrumentBrassBugle",
	Trumpet = "InstrumentBrassTrumpet",
	Vuvuzela = "InstrumentBrassVuvuzela",
	Bongos = "InstrumentDrumBongos",
	["Snare Drum"] = "InstrumentDrumSnare",
	["Acoustic Guitar"] = "InstrumentGuitarAcoustic",
	Banjo = "InstrumentGuitarBanjo",
	Lyre = "InstrumentGuitarLyre",
	Ukulele = "InstrumentGuitarUkulele",
	Violin = "InstrumentGuitarViolin",
	["Midi Keyboard"] = "InstrumentPianoKeyboard",
	Melodica = "InstrumentPianoMelodica",
	Microphone = "InstrumentVoiceMicrophone",
	Ocarina = "InstrumentWoodwindOcarina",
	Saxophone = "InstrumentWoodwindSaxophone",
	["Mug 1"] = "CupMugBrown",
	["Mug 2"] = "CupMugWhite",
	Banana = "FoodBanana",
	["Slice of Bread"] = "FoodBread",
	Broccoli = "FoodBroccoli",
	["Slice of Cake"] = "FoodCakePink",
	Coconut = "FoodCoconut",
	["Sunny-side Up Egg"] = "FoodDippyEgg",
	Donut = "FoodDonut",
	["French Fries"] = "FoodFrenchFries",
	Hamburger = "FoodHamburger",
	Hotdog = "FoodHotdog",
	["Hot Sauce"] = "FoodHotSauce",
	Mayonnaise = "FoodMayonnaise",
	Meat = "FoodMeatStick",
	["Mysterious Mushroom"] = "FoodMushroomPoison",
	["Cheese Pizza"] = "FoodPizzaCheese",
	["Pepperoni Pizza"] = "FoodPizzaPepperoni",
	Plate = "FoodPlate",
	Soda = "FoodSodaCan",
	["Poop!"] = "PoopPile",
	["Sparkling Poop!"] = "PoopPileSparkle",
}

tbl.Constants.AntiInputLagDropdownValues = {
	"Post Horn",
	"Trumpet",
	"Vuvuzela",
	"Bongos",
	"Snare Drum",
	"Acoustic Guitar",
	"Banjo",
	"Lyre",
	"Ukulele",
	"Violin",
	"Midi Keyboard",
	"Melodica",
	"Microphone",
	"Ocarina",
	"Saxophone",
	"Mug 1",
	"Mug 2",
	"Banana",
	"Slice of Bread",
	"Broccoli",
	"Slice of Cake",
	"Coconut",
	"Sunny-side Up Egg",
	"Donut",
	"French Fries",
	"Hamburger",
	"Hotdog",
	"Hot Sauce",
	"Mayonnaise",
	"Meat",
	"Mysterious Mushroom",
	"Cheese Pizza",
	"Pepperoni Pizza",
	"Plate",
	"Soda",
	"Poop",
	"Sparkling Poop",
}

tbl.Constants.DefaultAntiInputLagOption = "Hamburger"
tbl.Constants.AntiKickToyOptions = { Shuriken = "NinjaShuriken", Cleaver = "ToolCleaver", Kunai = "NinjaKunai" }
tbl.Constants.AntiKickToyDropdownValues = { "Shuriken", "Cleaver", "Kunai" }
tbl.Constants.DefaultAntiKickToyOption = "Shuriken"
tbl.State.SelectedAntiKickToyOption = rawget(_G, "AntiKickToyOption") or tbl.Constants.DefaultAntiKickToyOption
tbl.State.SelectedAntiKickToyName = tbl.Constants.AntiKickToyOptions[tbl.State.SelectedAntiKickToyOption] or "NinjaShuriken"
tbl.State.SelectedAntiInputLagOption = tbl.Constants.DefaultAntiInputLagOption
tbl.State.SelectedAntiInputLagToy = tbl.Constants.AntiInputLagToyList[tbl.Constants.DefaultAntiInputLagOption]

tbl.Functions.clampAntiInputDelayStep = function(arg)
	if type(arg) ~= "number" then
		return math.clamp(tbl.Runtime.Combat and tbl.Runtime.Combat.antiInputDelayStep or 0, 0, 10)
	end
	return math.clamp(math.floor(arg + 0.5), 0, 10)
end

tbl.Functions.setSelectedAntiInputLagOption = function(selectedAntiInputLagOption)
	if type(selectedAntiInputLagOption) ~= "string" then
		return false
	end
	local v = tbl.Constants.AntiInputLagToyList[selectedAntiInputLagOption]
	if not v then
		return false
	end
	tbl.State.SelectedAntiInputLagOption = selectedAntiInputLagOption
	tbl.State.SelectedAntiInputLagToy = v
	return true
end

local functions = tbl.Functions

functions.safeFireRemote = function(arg, ...)
	if not arg then
		return
	end
	local v = table.pack(...)

	pcall(function()
		arg:FireServer(table.unpack(v, 1, v.n))
	end)
end

local safeFireRemote = functions.safeFireRemote

functions.safeInvokeRemote = function(arg, ...)
	if not arg then
		return nil
	end
	local v = table.pack(...)

	local ok, result = pcall(function()
		return arg:InvokeServer(table.unpack(v, 1, v.n))
	end)

	if ok then
		return result
	end
	return nil
end

local safeInvokeRemote = functions.safeInvokeRemote

functions.notify = function(arg, arg2)
	warn((arg or "Info") .. ": " .. tostring(arg2))
end

local notify = functions.notify

functions.refreshFriendWhitelistEntry = function(obj)
	if not (obj and obj:IsA("Player") and obj ~= localPlayer) then
		return false
	end
	local flag = false

	whitelist.friendStates[obj.Name] = pcall(function()
		flag = localPlayer:IsFriendsWith(obj.UserId)
	end) and flag or false

	return whitelist.friendStates[obj.Name]
end

local refreshFriendWhitelistEntry = functions.refreshFriendWhitelistEntry

functions.refreshFriendWhitelist = function()
	for _, player in ipairs(players:GetPlayers()) do
		refreshFriendWhitelistEntry(player)
	end
end

local refreshFriendWhitelist = functions.refreshFriendWhitelist

functions.isPlayerWhitelisted = function(obj)
	if not (obj and obj:IsA("Player")) then
		return false
	end

	if killAllWhitelist[obj.Name] then
		return true
	end

	if whitelist.autoWhitelistFriends then
		local v = whitelist.friendStates[obj.Name]

		if v == nil then
			v = refreshFriendWhitelistEntry(obj)
		end

		return v == true
	end

	return false
end

local isPlayerWhitelisted = functions.isPlayerWhitelisted

functions.setPlayerWhitelisted = function(arg, arg2)
	if not arg or arg == localPlayer.Name then
		return
	end

	if arg2 then
		killAllWhitelist[arg] = true
	else
		killAllWhitelist[arg] = nil
	end

	if whitelist.selectionListRef and whitelist.selectionListRef.Refresh then
		whitelist.selectionListRef.Refresh()
	end
end

functions.CheckPlayer = function(obj)
	return obj and obj.Character and obj.Character:FindFirstChild("HumanoidRootPart") and obj ~= localPlayer
end

local checkPlayer = functions.CheckPlayer

functions.CheckPlayerKill = function(obj)
	if checkPlayer(obj) and not isPlayerInsideSafeZone(obj) then
		if isPlayerWhitelisted(obj) then
			return false
		end

		if target.selectedKillOnly then
			local flag = false

			for _, v in ipairs(target.playerList) do
				if v == obj.Name then
					flag = true
					break
				end
			end

			if not flag then
				return false
			end
		end

		return true
	end

	return false
end

local checkPlayerKill = functions.CheckPlayerKill

functions.CheckPlayerVelocity = function(obj)
	if obj and obj.Character and obj.Character:FindFirstChild("HumanoidRootPart") then
		return obj.Character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude
	end
	return math.huge
end

local checkPlayerVelocity = functions.CheckPlayerVelocity

functions.CheckPlayerBring = function(arg)
	if checkPlayer(arg) and not isPlayerInsideSafeZone(arg) and not isPlayerWhitelisted(arg) and checkPlayerVelocity(arg) < 20 then
		return true
	end
	return false
end

local checkPlayerBring = functions.CheckPlayerBring

functions.IsPlayerInsideSafeZone = function(obj)
	return typeof(obj) == "Instance" and obj:IsA("Player") and obj:FindFirstChild("InPlot") and obj.InPlot.Value
end

isPlayerInsideSafeZone = functions.IsPlayerInsideSafeZone

functions.SNOWship = function(obj)
	if obj and typeof(obj) == "Instance" then
		local v = localPlayer:DistanceFromCharacter(obj.Position)
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character and v <= 30 then
			safeFireRemote(setNetworkOwnerEvent, obj, lookAt(character.Position, obj.Position))
		end
	end
end

local snoWship = functions.SNOWship

functions.SNOWshipForce = function(obj)
	if obj and typeof(obj) == "Instance" then
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			safeFireRemote(setNetworkOwnerEvent, obj, lookAt(character.Position, obj.Position))
		end
	end
end

local snoWshipForce = functions.SNOWshipForce

functions.CreateSkyVelocity = function(parent)
	if parent and not parent:FindFirstChild("SkyVelocity") then
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Name = "SkyVelocity"
		bodyVelocity.Velocity = Vector3.new(0, 1e14, 0)
		bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyVelocity.Parent = parent
	end
end

local createSkyVelocity = functions.CreateSkyVelocity

functions.ChangeActivityPriority = function(teleportPriority)
	if tbl.State.TeleportPriority <= teleportPriority then
		tbl.State.TeleportPriority = teleportPriority
		rawset(_G, "TP_Priority", teleportPriority)
		return true
	end

	if teleportPriority == 0 then
		tbl.State.TeleportPriority = teleportPriority
		rawset(_G, "TP_Priority", teleportPriority)
		return true
	end

	return false
end

local changeActivityPriority = functions.ChangeActivityPriority

functions.TeleportPlayer = function(obj, arg2)
	if (arg2 or 0) ~= tbl.State.TeleportPriority then
		return
	end
	local character = localPlayer.Character

	if character and typeof(obj) == "CFrame" then
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart and humanoid then
			humanoidRootPart.CFrame = humanoidRootPart.CFrame.Rotation + obj.Position

			if humanoid.SeatPart == nil or tostring(humanoid.SeatPart.Parent) ~= "CreatureBlobman" then
				humanoid.Sit = false
			end
		end
	end
end

local teleportPlayer = functions.TeleportPlayer

local function fn(arg)
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	character = character and character:FindFirstChild("HumanoidRootPart")

	if humanoid then
		humanoid.AutoRotate = true
		humanoid.PlatformStand = false
		humanoid.Sit = false
		humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		humanoid:ChangeState(Enum.HumanoidStateType.Running)
	end

	if character then
		character.Anchored = false
		character.AssemblyAngularVelocity = Vector3.zero

		if arg then
			character.AssemblyLinearVelocity = Vector3.zero
		end
	end

	changeActivityPriority(0)
end

local function fn2()
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	character = character and character:FindFirstChild("HumanoidRootPart")

	if humanoid then
		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
		humanoid.AutoRotate = true
		humanoid.PlatformStand = false
		humanoid.Sit = false
	end

	if character then
		character.Anchored = false
		character.AssemblyLinearVelocity = Vector3.zero
		character.AssemblyAngularVelocity = Vector3.zero
	end

	fn(true)
	forceReleaseHeldInventoryAndGrab()
end

local function fn3()
	local tbl2 = {}

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl2, player.DisplayName ~= player.Name and player.DisplayName .. " (" .. player.Name .. ")" or player.Name)
		end
	end

	table.sort(tbl2)
	return tbl2
end

local function fn4(arg)
	if not arg then
		return nil
	end
	return arg:match("%((.-)%)$") or arg
end

local function fn5()
	for _, v in ipairs(target.playerList) do
		local v2 = players:FindFirstChild(v)
		if v2 and v2 ~= localPlayer and not isPlayerWhitelisted(v2) then
			return v2
		end
	end

	return nil
end

local function createPart()
	if server.freezeCamPart and server.freezeCamPart.Parent then
		return server.freezeCamPart
	end
	local part = Instance.new("Part")
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.CanQuery = false
	part.Size = Vector3.new()
	part.Parent = workspace
	server.freezeCamPart = part
	return part
end

local function fn6(cFrame)
	local v = createPart()
	v.CFrame = cFrame
	workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
	workspace.CurrentCamera.CameraSubject = v
end

local function fn7()
	workspace.CurrentCamera.CameraSubject = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") or workspace.CurrentCamera.CameraSubject
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

local function fn8()
	if target.targetSelectionListRef and target.targetSelectionListRef.Refresh then
		target.targetSelectionListRef.Refresh()
	end

	if targetPlayerDropdown and targetPlayerDropdown.SetOptions then
		targetPlayerDropdown:SetOptions(buildLoopPlayerDropdownOptions(), true)

		if targetPlayerDropdown.Set then
			targetPlayerDropdown:Set(buildLoopSelectedDropdownValues(), true)
		end
	end
end

local function fn9()
end

local function fn10(arg)
	if not arg then
		return
	end
	local safeZoneAlertCooldown = target.safeZoneAlertCooldown
	if tick() - safeZoneAlertCooldown < 3 then
		return
	end

	if isPlayerInsideSafeZone(arg) then
		target.safeZoneAlertCooldown = tick()
	end
end

local function fn11()
	local v = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	if not v then
		return nil
	end
	return v:FindFirstChild("PalletForRagdoll") or v:FindFirstChild("PalletLightBrown")
end

local function fn12()
	if target.loopSpamKickPalletDestroyConn then
		target.loopSpamKickPalletDestroyConn:Disconnect()
		target.loopSpamKickPalletDestroyConn = nil
	end
end

local function fn13()
	fn12()
	local loopSpamKickRagdollPallet = target.loopSpamKickRagdollPallet or fn11()

	if loopSpamKickRagdollPallet and loopSpamKickRagdollPallet.Parent then
		safeFireRemote(deleteToyRE, loopSpamKickRagdollPallet)
	end

	target.loopSpamKickRagdollPallet = nil
end

local fn14 = nil

fn14 = function()
	local character = localPlayer.Character
	if not (character and character:FindFirstChild("HumanoidRootPart")) then
		return nil
	end

	if not pcall(function()
		spawnToyRF:InvokeServer("PalletLightBrown", CFrame.new(0, 800000, 0), Vector3.zero)
		buyToy:InvokeServer("PalletLightBrown")
	end) then
		return nil
	end

	local now = tick()
	local v, soundPart

	while true do
		v = fn11()
		soundPart = v and v:FindFirstChild("SoundPart")

		if not (v and soundPart) then
			task.wait(0.03)
			if not (not target.loopSpamKickRagdollEnabled or tick() - now > 2) then
				continue
			end
		end

		break
	end

	if not (v and soundPart) then
		return nil
	end

	pcall(function()
		setNetworkOwnerEvent:FireServer(soundPart, soundPart.CFrame)
		destroyGrabLineEvent:FireServer(soundPart)
	end)

	soundPart.AssemblyLinearVelocity = Vector3.new(0, 1e9, 0)

	for _, descendant in ipairs(v:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.CanCollide = false
			descendant.CanQuery = false
			descendant.Transparency = 1
		end
	end

	v.Name = "PalletForRagdoll"
	target.loopSpamKickRagdollPallet = v
	fn12()

	target.loopSpamKickPalletDestroyConn = v.Destroying:Connect(function()
		target.loopSpamKickRagdollPallet = nil

		if target.loopSpamKickRagdollEnabled then
			task.spawn(fn14)
		end
	end)

	return v
end

local function fn15()
	if not target.loopSpamKickRagdollEnabled then
		return nil
	end
	local loopSpamKickRagdollPallet = target.loopSpamKickRagdollPallet
	if loopSpamKickRagdollPallet and loopSpamKickRagdollPallet.Parent and loopSpamKickRagdollPallet:FindFirstChild("SoundPart") then
		return loopSpamKickRagdollPallet
	end
	local v = fn11()

	if v and v.Parent and v:FindFirstChild("SoundPart") then
		v.Name = "PalletForRagdoll"
		target.loopSpamKickRagdollPallet = v
		return v
	end

	return fn14()
end

local function fn16(arg)
	if target.targetKillCharConn[arg] then
		pcall(function()
			target.targetKillCharConn[arg]:Disconnect()
		end)

		target.targetKillCharConn[arg] = nil
	end

	local v = players:FindFirstChild(arg)
	if not v then
		return
	end

	target.targetKillCharConn[arg] = v.CharacterAdded:Connect(function()
		if not (_G.LoopKill or _G.LoopKillPerm) then
			return
		end
		target.targetKillCounts[arg] = (target.targetKillCounts[arg] or 0) + 1
		fn9()
	end)
end

local function fn17()
	if target.loopKillCameraAnchorPart and target.loopKillCameraAnchorPart.Parent then
		target.loopKillCameraAnchorPart:Destroy()
	end

	target.loopKillCameraAnchorPart = nil
	local currentCamera = workspace.CurrentCamera

	if currentCamera then
		currentCamera.CameraSubject = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") or target.loopKillCameraOriginalSubject
	end

	if target.loopKillHiddenCharacterParts then
		for k, loopKillHiddenCharacterPart in pairs(target.loopKillHiddenCharacterParts) do
			if k and k.Parent then
				k.LocalTransparencyModifier = loopKillHiddenCharacterPart
			end
		end
	end

	target.loopKillHiddenCharacterParts = nil
	target.loopKillCameraOriginalSubject = nil
end

local function fn18(arg)
	if not arg then
		return
	end
	arg.AssemblyLinearVelocity = Vector3.zero
	arg.AssemblyAngularVelocity = Vector3.zero
	arg.Velocity = Vector3.zero
	arg.RotVelocity = Vector3.zero
end

functions.runBreakBarrier = function()
	local character = localPlayer.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local waypoints = workspace:FindFirstChild("Waypoints")
	local tudorHouse = waypoints and waypoints:FindFirstChild("TudorHouse")
	if not (character and humanoidRootPart and tudorHouse and deleteToyRE) then
		notify("krampus", "required character, waypoint, or remote is missing")
		return
	end
	forceReleaseHeldInventoryAndGrab()
	task.wait(0.2)
	local v = nil

	local function fn19()
		if not v or not v.Parent then
			return false
		end
		local v2 = antiKick.getPlot()
		return v2 and v2:IsAncestorOf(v)
	end

	local function fn20()
		humanoidRootPart.CFrame = CFrame.new(3, -7, -2)
		fn18(humanoidRootPart)
		task.wait(0.1)
	end

	local function fn21()
		local FoodHamburger = antiKick.spawnToyExact("FoodHamburger", humanoidRootPart.CFrame * CFrame.new(5, 5, 20), antiKick.getPlot())
		if not FoodHamburger then
			return nil, nil
		end
		local holdPart = FoodHamburger:FindFirstChild("HoldPart") or FoodHamburger:WaitForChild("HoldPart", 3)
		if not holdPart then
			return nil, nil
		end
		local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction") or holdPart:WaitForChild("HoldItemRemoteFunction", 2)
		if not holdItemRemoteFunction then
			return nil, nil
		end
		task.wait(0.2)

		pcall(function()
			safeInvokeRemote(holdItemRemoteFunction, FoodHamburger, character)
		end)

		task.wait(0.2)
		return FoodHamburger, holdItemRemoteFunction
	end

	notify("krampus", "Starting plot barrier breaking...")
	local n = 0
	local flag, v2

	while true do
		flag = false
		v2 = nil

		if n < 10 then
			n += 1

			if v and v.Parent then
				pcall(function()
					safeFireRemote(deleteToyRE, v)
				end)
			end

			fn20()
			task.wait(0.3)
			local v3, v4 = fn21()

			if not v3 then
				notify("krampus", "Failed to spawn/grab burger on attempt " .. n)
				task.wait(0.5)
			else
				v = v3

				pcall(function()
					if v4 then
						safeInvokeRemote(v4, v, character)
					end
				end)

				task.wait(0.15)

				pcall(function()
					humanoidRootPart.CFrame = tudorHouse.CFrame
					fn18(humanoidRootPart)
				end)

				task.wait(0.3)

				if fn19() then
					v2 = v
					notify("krampus", "✓ Barrier broken! Burger survived in plot on attempt " .. n)
					flag = true
					break
				else
					notify("krampus", "Attempt " .. n .. " failed, burger was deleted. Retrying...")
				end
			end
		else
			break
		end
	end

	if not flag then
		pcall(function()
			if v and v.Parent then
				safeFireRemote(deleteToyRE, v)
			end
		end)

		fn20()
		notify("krampus", "Failed after " .. "10 attempts")
		return false
	end

	return true, v2
end

local function fn19(arg, arg2)
	local n = 0

	pcall(function()
		n = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
	end)

	arg.CFrame = CFrame.new(arg2.Position + arg2.Velocity * n * 5)
end

local function fn20()
	task.spawn(function()
		local name = target.loopSpamKickTarget and target.loopSpamKickTarget.Name or nil
		local n = 60

		local connection = runService.RenderStepped:Connect(function(deltaTime)
			if deltaTime > 0 then
				n = 1 / deltaTime
			end
		end)

		local alignPosition = nil
		local alignOrientation = nil

		local function fn21()
			pcall(function()
				if alignPosition then
					alignPosition:Destroy()
					alignPosition = nil
				end

				if alignOrientation then
					alignOrientation:Destroy()
					alignOrientation = nil
				end
			end)
		end

		local function fn22(parent, position)
			fn21()

			for _, child in pairs(parent:GetChildren()) do
				if child:IsA("AlignPosition") or child:IsA("AlignOrientation") then
					child:Destroy()
				end
			end

			local attachment = Instance.new("Attachment")
			attachment.Position = Vector3.zero
			attachment.Orientation = Vector3.zero
			attachment.Parent = parent
			local attachment2 = Instance.new("Attachment")
			attachment2.Position = position
			attachment2.Orientation = Vector3.zero
			attachment2.Parent = workspace.Terrain
			alignPosition = Instance.new("AlignPosition")
			alignPosition.Attachment0 = attachment
			alignPosition.Attachment1 = attachment2
			alignPosition.RigidityEnabled = true
			alignPosition.MaxForce = 9e9
			alignPosition.MaxVelocity = 9e9
			alignPosition.ReactionForceEnabled = false
			alignPosition.Responsiveness = 9e9
			alignPosition.Parent = parent
			alignOrientation = Instance.new("AlignOrientation")
			alignOrientation.Attachment0 = attachment
			alignOrientation.Attachment1 = attachment2
			alignOrientation.MaxTorque = 9e9
			alignOrientation.MaxAngularVelocity = 9e9
			alignOrientation.ReactionTorqueEnabled = false
			alignOrientation.Responsiveness = 9e9
			alignOrientation.Parent = parent
			return attachment, attachment2
		end

		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character.CFrame or CFrame.new()
		local x = character.Position.X
		local y = character.Position.Y
		local z = character.Position.Z
		local flag = false
		local n2 = 0
		local n3 = 0
		local flag2 = false

		while target.loopSpamKickEnabled do
			runService.Heartbeat:Wait()
			local loopSpamKickTarget = target.loopSpamKickTarget
			local character2, humanoidRootPart, v, character3, humanoidRootPart2, humanoid, flag3, flag4, n4, n5, attachment1, creatureBlobman, fn23, vehicleSeat, flag5, creatureGrab, creatureRelease, flag6, n6, attachment12, attachment13, flag7

			if not loopSpamKickTarget or not loopSpamKickTarget.Parent then
				if name then
					loopSpamKickTarget = players:FindFirstChild(name)
				end

				loopSpamKickTarget = loopSpamKickTarget or fn5()
				target.loopSpamKickTarget = loopSpamKickTarget

				if not loopSpamKickTarget then
					continue
				else
					name = loopSpamKickTarget.Name

					if isPlayerInsideSafeZone(loopSpamKickTarget) then
						fn21()
						fn10(loopSpamKickTarget)
						flag = false
						n2 = 0
						n3 = 0
						flag2 = false
						continue
					else
						character2 = localPlayer.Character
						humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
						character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
						v = humanoidRootPart and character2

						if not v then
							continue
						else
							character3 = loopSpamKickTarget.Character
							humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
							humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")
							flag3 = humanoidRootPart2 and humanoid and humanoid.Health > 0

							if not flag3 then
								fn21()
								flag = false
								n2 = 0
								n3 = 0
								flag2 = false
								continue
							else
								flag4 = flag and not flag2

								if flag4 then
									n4 = humanoidRootPart2.Position - humanoidRootPart.CFrame.Position
									humanoidRootPart.CFrame = CFrame.new(x, y, z)
									humanoidRootPart2.CFrame = CFrame.new(Vector3.new(x, y + 12, z) + Vector3.new(n4.X, 0, n4.Z))
									n5 = humanoidRootPart.CFrame * CFrame.new(0, 20, 0)
									attachment1 = alignPosition and alignPosition.Attachment1

									if attachment1 then
										alignPosition.Attachment1.Position = n5.Position
										flag2 = true
									else
										fn22(humanoidRootPart2, n5.Position, humanoidRootPart2.CFrame.Rotation)
										flag2 = true
									end
								end

								if character3.Parent ~= workspace then
									fn21()
									creatureBlobman = bgk_getSeatedParent()

									if not creatureBlobman then
										fn23 = function()
											local v2 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
											return v2 and v2:FindFirstChild("CreatureBlobman") or nil
										end

										creatureBlobman = fn23()
									end

									creatureBlobman = creatureBlobman or safeInvokeRemote(spawnToyRF, "CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(5, 5, 20), Vector3.new(0, 97.69, 0))

									while true do
										task.wait()
										vehicleSeat = not target.loopSpamKickEnabled or creatureBlobman and creatureBlobman:FindFirstChild("RightDetector") and creatureBlobman:FindFirstChild("VehicleSeat")
										if not vehicleSeat then
											continue
										end
										break
									end

									flag = false
									n2 = 0
									n3 = 0
									flag2 = false

									if target.loopSpamKickEnabled then
										if creatureBlobman then
											while true do
												task.wait()
												creatureBlobman.VehicleSeat:Sit(character2)
												flag5 = not target.loopSpamKickEnabled or character2.SeatPart == creatureBlobman.VehicleSeat
												if not flag5 then
													continue
												end
												break
											end

											if target.loopSpamKickEnabled then
												creatureGrab = creatureBlobman.BlobmanSeatAndOwnerScript and creatureBlobman.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
												creatureRelease = creatureBlobman.BlobmanSeatAndOwnerScript and creatureBlobman.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

												while true do
													task.wait()
													creatureBlobman.HumanoidRootPart.CFrame = humanoidRootPart2.CFrame
													task.wait(0.1)

													if creatureGrab then
														creatureGrab:FireServer(creatureBlobman.RightDetector, humanoidRootPart2, creatureBlobman.RightDetector.RightWeld)
													end

													if creatureRelease then
														creatureRelease:FireServer(creatureBlobman.RightDetector.RightWeld)
													end

													flag6 = not target.loopSpamKickEnabled or CheckNetworkOwnerShipOnPlayer(loopSpamKickTarget)
													if not flag6 then
														continue
													end
													break
												end

												if target.loopSpamKickEnabled then
													task.wait(0.2)
													safeFireRemote(deleteToyRE, creatureBlobman)
													humanoidRootPart.CFrame = CFrame.new(x, y, z)
													task.wait(0.1)
													humanoidRootPart2.CFrame = CFrame.new(x, y + 12, z + 10)
													task.wait(0.5)
													continue
												end
											end
										else
											continue
										end
									end
								else
									if not flag then
										humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -20, 0)
										fn21()

										pcall(function()
											humanoid.PlatformStand = true
											humanoid.Sit = true
										end)

										if target.selectedKickMethod == target.KickMethods.FASTER_CAN_LAG then
											pcall(function()
												if n > 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												elseif n >= 155 and n <= 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													runService.HeartBeat:Wait()
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												else
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												end
											end)
										else
											pcall(function()
												if n > 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
												elseif n >= 155 and n <= 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
												else
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												end
											end)
										end

										if n2 == 0 then
											n2 = tick()
										end

										n3 = 0
										flag2 = false

										if tick() - n2 > 0.35 then
											n3 = tick()
											fn22(humanoidRootPart2, (humanoidRootPart.CFrame * CFrame.new(0, 20, 0)).Position, humanoidRootPart2.CFrame.Rotation)
											flag = true
											n2 = 0
										end
									else
										n6 = humanoidRootPart.CFrame * CFrame.new(0, 20, 0)
										attachment12 = alignPosition and alignPosition.Attachment1

										if attachment12 then
											alignPosition.Attachment1.Position = n6.Position
											attachment13 = alignOrientation and alignOrientation.Attachment1

											if attachment13 then
												alignOrientation.Attachment1.Position = n6.Position
											end
										else
											fn22(humanoidRootPart2, n6.Position, humanoidRootPart2.CFrame.Rotation)
										end

										humanoid.PlatformStand = true

										if target.selectedKickMethod == target.KickMethods.FASTER_CAN_LAG then
											pcall(function()
												if n > 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												elseif n >= 155 and n <= 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
												else
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												end
											end)
										else
											pcall(function()
												if n > 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
												elseif n >= 155 and n <= 200 then
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
												else
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
													runService.HeartBeat:Wait()
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
													safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
												end
											end)
										end

										task.spawn(function()
											if target.loopSpamKickRagdollEnabled then
												local soundPart = fn15()
												soundPart = soundPart and soundPart:FindFirstChild("SoundPart")

												if soundPart then
													soundPart.AssemblyLinearVelocity = Vector3.new(0, 1000, 0)
													soundPart.CFrame = humanoidRootPart2.CFrame
													task.wait(0.05)

													if soundPart.Parent then
														soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 1000, 0)
													end
												end
											end
										end)

										flag7 = n3 > 0 and tick() - n3 > 0.4

										if flag7 then
											if (humanoidRootPart2.Position - n6.Position).Magnitude > 45 then
												fn21()
												flag = false
												n2 = 0
												n3 = 0
												flag2 = false
											else
												n3 = tick()
											end
										end
									end

									continue
								end
							end
						end
					end
				end
			elseif isPlayerInsideSafeZone(loopSpamKickTarget) then
				fn21()
				fn10(loopSpamKickTarget)
				flag = false
				n2 = 0
				n3 = 0
				flag2 = false
				continue
			else
				character2 = localPlayer.Character
				humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
				character2 = character2 and character2:FindFirstChildOfClass("Humanoid")
				v = humanoidRootPart and character2

				if not v then
					continue
				else
					character3 = loopSpamKickTarget.Character
					humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
					humanoid = character3 and character3:FindFirstChildOfClass("Humanoid")
					flag3 = humanoidRootPart2 and humanoid and humanoid.Health > 0

					if not flag3 then
						fn21()
						flag = false
						n2 = 0
						n3 = 0
						flag2 = false
						continue
					else
						flag4 = flag and not flag2

						if flag4 then
							n4 = humanoidRootPart2.Position - humanoidRootPart.CFrame.Position
							humanoidRootPart.CFrame = CFrame.new(x, y, z)
							humanoidRootPart2.CFrame = CFrame.new(Vector3.new(x, y + 12, z) + Vector3.new(n4.X, 0, n4.Z))
							n5 = humanoidRootPart.CFrame * CFrame.new(0, 20, 0)
							attachment1 = alignPosition and alignPosition.Attachment1

							if attachment1 then
								alignPosition.Attachment1.Position = n5.Position
								flag2 = true
							else
								fn22(humanoidRootPart2, n5.Position, humanoidRootPart2.CFrame.Rotation)
								flag2 = true
							end
						end

						if character3.Parent ~= workspace then
							fn21()
							creatureBlobman = bgk_getSeatedParent()

							if not creatureBlobman then
								fn23 = function()
									local v2 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									return v2 and v2:FindFirstChild("CreatureBlobman") or nil
								end

								creatureBlobman = fn23()
							end

							creatureBlobman = creatureBlobman or safeInvokeRemote(spawnToyRF, "CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(5, 5, 20), Vector3.new(0, 97.69, 0))

							while true do
								task.wait()
								vehicleSeat = not target.loopSpamKickEnabled or creatureBlobman and creatureBlobman:FindFirstChild("RightDetector") and creatureBlobman:FindFirstChild("VehicleSeat")
								if not vehicleSeat then
									continue
								end
								break
							end

							flag = false
							n2 = 0
							n3 = 0
							flag2 = false

							if target.loopSpamKickEnabled then
								if creatureBlobman then
									while true do
										task.wait()
										creatureBlobman.VehicleSeat:Sit(character2)
										flag5 = not target.loopSpamKickEnabled or character2.SeatPart == creatureBlobman.VehicleSeat
										if not flag5 then
											continue
										end
										break
									end

									if target.loopSpamKickEnabled then
										creatureGrab = creatureBlobman.BlobmanSeatAndOwnerScript and creatureBlobman.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
										creatureRelease = creatureBlobman.BlobmanSeatAndOwnerScript and creatureBlobman.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

										while true do
											task.wait()
											creatureBlobman.HumanoidRootPart.CFrame = humanoidRootPart2.CFrame
											task.wait(0.1)

											if creatureGrab then
												creatureGrab:FireServer(creatureBlobman.RightDetector, humanoidRootPart2, creatureBlobman.RightDetector.RightWeld)
											end

											if creatureRelease then
												creatureRelease:FireServer(creatureBlobman.RightDetector.RightWeld)
											end

											flag6 = not target.loopSpamKickEnabled or CheckNetworkOwnerShipOnPlayer(loopSpamKickTarget)
											if not flag6 then
												continue
											end
											break
										end

										if target.loopSpamKickEnabled then
											task.wait(0.2)
											safeFireRemote(deleteToyRE, creatureBlobman)
											humanoidRootPart.CFrame = CFrame.new(x, y, z)
											task.wait(0.1)
											humanoidRootPart2.CFrame = CFrame.new(x, y + 12, z + 10)
											task.wait(0.5)
											continue
										end
									end
								else
									continue
								end
							end
						else
							if not flag then
								humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -20, 0)
								fn21()

								pcall(function()
									humanoid.PlatformStand = true
									humanoid.Sit = true
								end)
								-- more leaks: https://discord.gg/x7YbZeezpm

								if target.selectedKickMethod == target.KickMethods.FASTER_CAN_LAG then
									pcall(function()
										if n > 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										elseif n >= 155 and n <= 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											runService.HeartBeat:Wait()
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										else
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										end
									end)
								else
									pcall(function()
										if n > 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
										elseif n >= 155 and n <= 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
										else
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										end
									end)
								end

								if n2 == 0 then
									n2 = tick()
								end

								n3 = 0
								flag2 = false

								if tick() - n2 > 0.35 then
									n3 = tick()
									fn22(humanoidRootPart2, (humanoidRootPart.CFrame * CFrame.new(0, 20, 0)).Position, humanoidRootPart2.CFrame.Rotation)
									flag = true
									n2 = 0
								end
							else
								n6 = humanoidRootPart.CFrame * CFrame.new(0, 20, 0)
								attachment12 = alignPosition and alignPosition.Attachment1

								if attachment12 then
									alignPosition.Attachment1.Position = n6.Position
									attachment13 = alignOrientation and alignOrientation.Attachment1

									if attachment13 then
										alignOrientation.Attachment1.Position = n6.Position
									end
								else
									fn22(humanoidRootPart2, n6.Position, humanoidRootPart2.CFrame.Rotation)
								end

								humanoid.PlatformStand = true

								if target.selectedKickMethod == target.KickMethods.FASTER_CAN_LAG then
									pcall(function()
										if n > 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										elseif n >= 155 and n <= 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
										else
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, humanoidRootPart2.CFrame)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										end
									end)
								else
									pcall(function()
										if n > 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
										elseif n >= 155 and n <= 200 then
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
										else
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
											runService.HeartBeat:Wait()
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(setNetworkOwnerEvent, humanoidRootPart2, n6)
											safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
										end
									end)
								end

								task.spawn(function()
									if target.loopSpamKickRagdollEnabled then
										local soundPart = fn15()
										soundPart = soundPart and soundPart:FindFirstChild("SoundPart")

										if soundPart then
											soundPart.AssemblyLinearVelocity = Vector3.new(0, 1000, 0)
											soundPart.CFrame = humanoidRootPart2.CFrame
											task.wait(0.05)

											if soundPart.Parent then
												soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 1000, 0)
											end
										end
									end
								end)

								flag7 = n3 > 0 and tick() - n3 > 0.4

								if flag7 then
									if (humanoidRootPart2.Position - n6.Position).Magnitude > 45 then
										fn21()
										flag = false
										n2 = 0
										n3 = 0
										flag2 = false
									else
										n3 = tick()
									end
								end
							end

							continue
						end
					end
				end
			end

			break
		end

		connection:Disconnect()
		fn21()
		local character2 = localPlayer.Character
		character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

		if character2 then
			character2.CFrame = CFrame.new(x, y, z)
		end

		target.loopSpamKickEnabled = false

		if target.targetKickToggleRef then
			target.targetToggleSyncing = true
			target.targetKickToggleRef.Set(false)
			target.targetToggleSyncing = false
		end

		fn9()
	end)
end

players.PlayerAdded:Connect(function()
	task.wait(1)
	refreshFriendWhitelist()
end)

players.PlayerRemoving:Connect(function(player)
	whitelist.friendStates[player.Name] = nil

	if whitelist.selectionListRef and whitelist.selectionListRef.Refresh then
		whitelist.selectionListRef.Refresh()
	end
end)

players.PlayerRemoving:Connect(function(player)
	local name = player.Name
	local flag = false

	for _, v in ipairs(target.playerList) do
		if v == name then
			flag = true
			break
		end
	end

	if flag then
		target.departedTargets[name] = { displayName = player.DisplayName, wasSelected = target.selectedTargetName == name }
	end

	if target.loopSpamKickTarget == player then
		target.loopSpamKickTarget = nil
	end

	for i = #target.playerList, 1, -1 do
		if target.playerList[i] == name then
			table.remove(target.playerList, i)
		end
	end

	if target.targetKillCharConn[name] then
		pcall(function()
			target.targetKillCharConn[name]:Disconnect()
		end)

		target.targetKillCharConn[name] = nil
	end

	if target.selectedTargetName == name then
		local v = fn5()
		target.selectedTargetName = v and v.Name or nil
	end
end)

functions.lookAt = function(arg, arg2)
	local unit = (arg2 - arg).Unit
	local v = unit:Cross(Vector3.new(0, 1, 0))
	local v2 = v:Cross(unit)
	return CFrame.fromMatrix(arg, v, v2)
end

lookAt = functions.lookAt

local function createPart2(name)
	local part = Instance.new("Part")
	part.Name = name
	part.Anchored = true
	part.CanCollide = false
	part.Transparency = 1
	part.Size = Vector3.new(2, 2, 2)
	part.Position = Vector3.new(0, -50, 0)
	part.Parent = workspace
	return part
end

local map = workspace:FindFirstChild("Map")
local hole = map and map:FindFirstChild("Hole")
local poisonBigHole = hole and hole:FindFirstChild("PoisonBigHole")
hole = hole and hole:FindFirstChild("PoisonSmallHole")
local factoryIsland = map and map:FindFirstChild("FactoryIsland")
factoryIsland = factoryIsland and factoryIsland:FindFirstChild("PoisonContainer")
local poisonHurtPart = poisonBigHole and poisonBigHole:FindFirstChild("PoisonHurtPart") or createPart2("FallbackPoisonBig")
local poisonHurtPart2 = hole and hole:FindFirstChild("PoisonHurtPart") or createPart2("FallbackPoisonSmall")
local poisonHurtPart3 = factoryIsland and factoryIsland:FindFirstChild("PoisonHurtPart") or createPart2("FallbackPoisonFactory")
local v = nil
poisonHurtPart3.Size = Vector3.new(2, 2, 2)
poisonHurtPart2.Size = Vector3.new(2, 2, 2)
poisonHurtPart.Size = Vector3.new(2, 2, 2)
poisonHurtPart3.Position = Vector3.new(0, -50, 0)
poisonHurtPart2.Position = Vector3.new(0, -50, 0)
poisonHurtPart.Position = Vector3.new(0, -50, 0)

functions.GetPlayerCharacter = function()
	local character = localPlayer.Character
	if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChildOfClass("Humanoid") then
		return character
	end
	return nil
end

local getPlayerCharacter = functions.GetPlayerCharacter

functions.GetPlayerCFrame = function()
	local playerCharacter = getPlayerCharacter()
	if playerCharacter then
		return playerCharacter.HumanoidRootPart.CFrame
	end
	return nil
end

local getPlayerCFrame = functions.GetPlayerCFrame

local function fn21(arg)
	return localPlayer:DistanceFromCharacter(arg)
end

local function fn22(arg)
	if arg then
		local position = arg.Position
		local z = position.Z
		return CFrame.new(position.X, math.max(position.Y + 250, 350), z)
	end

	return CFrame.new(0, 350, 0)
end

local function fn23()
	protection.antiInputLagDropCFrame = nil
	protection.antiInputLagTrackedToy = nil
end

local function fn24(antiInputLagTrackedToy, arg)
	if protection.antiInputLagTrackedToy ~= antiInputLagTrackedToy then
		protection.antiInputLagTrackedToy = antiInputLagTrackedToy
		protection.antiInputLagDropCFrame = fn22(arg)
	end

	if not protection.antiInputLagDropCFrame then
		protection.antiInputLagDropCFrame = fn22(arg)
	end

	return protection.antiInputLagDropCFrame
end

functions.forceReleaseHeldInventoryAndGrab = function()
	local v2 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

	if v2 and humanoidRootPart then
		for _, child in ipairs(v2:GetChildren()) do
			local holdPart = child:FindFirstChild("HoldPart")
			local holdingPlayer = holdPart and holdPart:FindFirstChild("HoldingPlayer")

			if holdPart and holdingPlayer and holdingPlayer.Value == localPlayer then
				pcall(function()
					holdPart.DropItemRemoteFunction:InvokeServer(child, fn22(humanoidRootPart), Vector3.zero)
				end)
			end
		end
	end

	if _G.HoldingObjectGrabPart then
		pcall(function()
			safeFireRemote(destroyGrabLineEvent, _G.HoldingObjectGrabPart)
		end)
	end

	if _G.RealGrabParts and _G.RealGrabParts.Parent then
		pcall(function()
			_G.RealGrabParts:Destroy()
		end)
	end

	_G.HoldingObjectGrabPart = nil
	_G.RealGrabParts = nil
	fn23()
end

forceReleaseHeldInventoryAndGrab = functions.forceReleaseHeldInventoryAndGrab

local function fn25(arg)
	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.CanCollide = false
		end
	end
end

local function fn26(arg)
	if arg and typeof(arg) == "Instance" then
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if character then
			safeFireRemote(setNetworkOwnerEvent, arg, lookAt(character.Position, arg.Position))
			return true
		end
	end

	return false
end

local function fn27()
	poisonHurtPart3.Position = Vector3.new(0, -50, 0)
	poisonHurtPart2.Position = Vector3.new(0, -50, 0)
	poisonHurtPart.Position = Vector3.new(0, -50, 0)
end

local function fn28()
	local playerCFrame = getPlayerCFrame()
	local value2 = nil

	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name == "Campfire" and child.PrimaryPart and child:FindFirstChild("FirePlayerPart") and child.FirePlayerPart:FindFirstChild("CanBurn") and fn21(child.PrimaryPart.Position) < 30 and child.FirePlayerPart.CanBurn.Value then
			value2 = child
			break
		end
	end

	if not value2 and playerCFrame and spawnToyRF and buyToy then
		safeInvokeRemote(spawnToyRF, "Campfire", CFrame.new(playerCFrame.Position.X, playerCFrame.Position.Y, playerCFrame.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-09, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893), Vector3.new(0, 97.69, 0))
		safeInvokeRemote(buyToy, "Campfire")
	end

	if value2 and value2:FindFirstChild("FirePlayerPart") and value2.FirePlayerPart:FindFirstChild("CanBurn") and not value2:GetAttribute("Connected2") then
		local connection = value2.DescendantAdded:Connect(function(descendant)
			if descendant.Name == "PartOwner" and descendant.Value ~= localPlayer.Name then
				value2:SetAttribute("AlreadySetOwnerShip", false)
			end
		end)

		task.spawn(function()
			local firePlayerPart = value2 and value2:FindFirstChild("FirePlayerPart")

			while value2 and value2.Parent do
				if not value2:GetAttribute("AlreadySetOwnerShip") then
					if fn26(firePlayerPart) then
						value2:SetAttribute("AlreadySetOwnerShip", true)
					elseif fn21(firePlayerPart.Position) > 30 and deleteToyRE then
						safeFireRemote(deleteToyRE, value2)
					end
				end

				task.wait(0.1)
			end

			connection:Disconnect()
		end)

		value2:SetAttribute("Connected2", true)
	end

	v = value2
	return v
end

local function fn29()
	if v and v.Parent then
		return v
	end
	return fn28()
end

local function fn30(arg)
	local result3 = fn29()
	local primaryPart = result3 and result3.PrimaryPart or nil
	local head = localPlayer.Character and localPlayer.Character:FindFirstChild("Head") or nil
	if not (result3 and primaryPart and head) then
		return
	end
	local firePlayerPart = result3:FindFirstChild("FirePlayerPart")
	local campfirePosRemove = primaryPart:FindFirstChild("CampfirePosRemove")

	if firePlayerPart then
		firePlayerPart.Size = Vector3.new(2, 2, 2)
	end

	if not campfirePosRemove and result3:GetAttribute("AlreadySetOwnerShip") then
		fn25(result3)
		local bodyPosition = Instance.new("BodyPosition")
		bodyPosition.Name = "CampfirePosRemove"
		bodyPosition.MaxForce = Vector3.new(12500, 12500, 12500)
		bodyPosition.Parent = primaryPart

		task.spawn(function()
			while result3.Parent and bodyPosition.Parent do
				bodyPosition.Position = head.Position + Vector3.new(5, 500, 0)
				task.wait()
			end
		end)
	end

	if firePlayerPart and arg and result3:GetAttribute("AlreadySetOwnerShip") then
		firePlayerPart.Position = arg.Position
		task.wait()
		firePlayerPart.Position = primaryPart.Position
	end
end

local function fn31(arg)
	if typeof(arg) == "Instance" and arg:IsA("Player") and arg.Character then
		local head = arg.Character:FindFirstChild("Head")
		head = head and head:FindFirstChild("PartOwner")
		if head and head.Value == localPlayer.Name then
			return true
		end
		local humanoidRootPart = arg.Character:FindFirstChild("HumanoidRootPart")
		humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("FirePlayerPart")
		humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("PartOwner")
		if humanoidRootPart and humanoidRootPart.Value == localPlayer.Name then
			return true
		end
	end

	local owner = _G.RealGrabParts and _G.RealGrabParts:FindFirstChild("Owner")
	if owner and owner.Value == localPlayer.Name then
		return true
	end
	return false
end

aura.CheckPlayerAuras = function(arg)
	if checkPlayer(arg) and not isPlayerInsideSafeZone(arg) and not isPlayerWhitelisted(arg) then
		return true
	end
	return false
end

aura.resetPoisonParts = function()
	poisonHurtPart3.Position = Vector3.new(0, -50, 0)
	poisonHurtPart.Position = Vector3.new(0, -50, 0)
end

aura.getPaintPart = function()
	if aura.paintPart and aura.paintPart.Parent then
		return aura.paintPart
	end

	local ok, paintPart = pcall(function()
		local alwaysHereTweenedObjects = map and map:FindFirstChild("AlwaysHereTweenedObjects")
		alwaysHereTweenedObjects = alwaysHereTweenedObjects and alwaysHereTweenedObjects:FindFirstChild("OuterUFO")

		if alwaysHereTweenedObjects then
			alwaysHereTweenedObjects:FindFirstChild("Object")
		end

		local paintPlayerPart = objectModel and objectModel:FindFirstChild("PaintPlayerPart")

		if paintPlayerPart and paintPlayerPart:IsA("BasePart") then
			local weldConstraint = paintPlayerPart:FindFirstChild("WeldConstraint")

			if weldConstraint then
				weldConstraint.Enabled = false
			end

			paintPlayerPart.Anchored = true
			paintPlayerPart.Transparency = 1
			paintPlayerPart.Size = Vector3.new(0.5, 0.5, 0.5)
			paintPlayerPart.Position = Vector3.new(0, -50, 0)
			return paintPlayerPart
		end

		return nil
	end)

	if ok then
		aura.paintPart = paintPart
	else
		aura.paintPart = nil
	end

	return aura.paintPart
end

aura.loopEnabled = function()
	return _G.Poison_Aura or _G.AttractionAura or _G.DeathAura or _G.KickAura or _G.UnstickAura
end

aura.stopLoop = function()
	if aura.loopConnection then
		aura.loopConnection:Disconnect()
		aura.loopConnection = nil
	end

	aura.resetPoisonParts()
	table.clear(aura.kickTracked)
	aura.lastTick = 0

	if aura.paintPart and aura.paintPart.Parent then
		aura.paintPart.Position = Vector3.new(0, -50, 0)
	end
end

aura.startLoop = function()
	if aura.loopConnection then
		return
	end

	aura.loopConnection = runService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - aura.lastTick < aura.tickInterval then
			return
		end
		aura.lastTick = now
		if not aura.loopEnabled() then
			aura.stopLoop()
			return
		end
		aura.resetPoisonParts()
		local humanoidRootPart = getPlayerCharacter()
		humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")

		for _, player in ipairs(players:GetPlayers()) do
			if aura.CheckPlayerAuras(player) then
				local character = player.Character
				local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
				local head = character and character:FindFirstChild("Head")
				character = character and character:FindFirstChildOfClass("Humanoid")

				if _G.Poison_Aura and head then
					snoWship(head)
					poisonHurtPart.CFrame = head.CFrame
					poisonHurtPart2.CFrame = head.CFrame
					poisonHurtPart3.CFrame = head.CFrame
				end

				if _G.AttractionAura and humanoidRootPart2 and character and humanoidRootPart then
					local v2 = aura.getPaintPart()
					snoWship(humanoidRootPart2)
					character.Sit = false
					character.WalkSpeed = 25
					character:MoveTo(humanoidRootPart.Position)

					if v2 and v2.Parent then
						v2.CFrame = humanoidRootPart2.CFrame
					end
				end

				if _G.DeathAura and humanoidRootPart2 and character then
					local magnitude = humanoidRootPart and (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude or math.huge
					local dead = Enum.HumanoidStateType.Dead

					if character:GetState() ~= dead and magnitude < 30 then
						snoWship(humanoidRootPart2)
						character:ChangeState(Enum.HumanoidStateType.Dead)
						safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
					end
				end

				if _G.KickAura and humanoidRootPart2 and humanoidRootPart then
					if (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= (_G.KickAuraRadius or 30) then
						aura.kickTracked[player] = true
					end

					if aura.kickTracked[player] then
						snoWship(humanoidRootPart2)
						safeFireRemote(destroyGrabLineEvent, humanoidRootPart2)
						local n = humanoidRootPart.Position + humanoidRootPart.CFrame.RightVector * 1.5 + Vector3.new(0, 8, 0)
						safeFireRemote(createGrabLineEvent, humanoidRootPart2, Vector3.zero, n, false)
						humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
						humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

						if character then
							character:MoveTo(n)
						end

						if fn31(player) then
							humanoidRootPart2.CFrame = CFrame.new(n)
						end
					end
				end

				if _G.UnstickAura and humanoidRootPart2 and humanoidRootPart then
					if (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= (aura.unstickRadius or 30) then
						local function fn32(arg)
							return arg == "NinjaShuriken" or arg == "NinjaKunai" or arg == "ToolCleaver" or arg:find("_AntiKick")
						end

						local function fn33(arg)
							for _, descendant in ipairs(arg:GetDescendants()) do
								if descendant:IsA("BasePart") then
									if descendant ~= _G.HoldingObjectGrabPart then
										if not (_G.RealGrabParts and descendant:IsDescendantOf(_G.RealGrabParts)) then
											local partOwner = descendant:FindFirstChild("PartOwner")

											if partOwner and partOwner.Value ~= "" and partOwner.Value ~= localPlayer.Name then
												pcall(function()
													safeFireRemote(setNetworkOwnerEvent, descendant, descendant.CFrame)
												end)

												task.defer(function()
													local partOwner2 = descendant:FindFirstChild("PartOwner")

													if partOwner2 and partOwner2.Value == localPlayer.Name then
														descendant.CFrame = CFrame.new(0, 1000, 0)
													end
												end)
											end
										end
									end
								end
							end
						end

						local v2 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")

						if v2 then
							for _, child in ipairs(v2:GetChildren()) do
								if fn32(child.Name) then
									fn33(child)
								end
							end
						end

						local plotItems = workspace:FindFirstChild("PlotItems")

						if plotItems then
							for _, child in ipairs(plotItems:GetChildren()) do
								for _, child2 in ipairs(child:GetChildren()) do
									if fn32(child2.Name) then
										fn33(child2)
									end
								end
							end
						end
					end
				end
			end
		end
	end)
end

aura.updateLoopState = function()
	if aura.loopEnabled() then
		aura.startLoop()
	else
		aura.stopLoop()
	end
end
-- 𝖲𝗈𝗎𝗋𝖼𝖾 𝖫𝖾𝖺𝗄 (𝖲𝖫) | https://discord.gg/x7YbZeezpm

esp.getDisplayLabel = function(obj)
	if not obj then
		return "Unknown"
	end
	local displayName = obj.DisplayName
	local name = obj.Name or "Unknown"

	if typeof(displayName) ~= "string" or displayName == "" then
		displayName = name
	end

	return displayName .. "\n@" .. name
end

esp.getTrackedCount = function()
	local n = 0

	for k in pairs(esp.entries) do
		n += 1
	end

	return n
end

esp.getCurrentColor = function()
	if esp.rainbow then
		return Color3.fromHSV(esp.hue % 1, 0.7, 1)
	end
	return esp.color
end

esp.syncEnabled = function()
	esp.enabled = esp.showNames or esp.rainbow
end

esp.clearEntry = function(arg)
	local v2 = esp.entries[arg]
	if not v2 then
		return
	end

	if v2.highlight and v2.highlight.Parent then
		v2.highlight:Destroy()
	end

	if v2.billboard and v2.billboard.Parent then
		v2.billboard:Destroy()
	end

	esp.entries[arg] = nil
end

esp.clearPCLDEntry = function(arg)
	local v2 = esp.pcldEntries[arg]
	if not v2 then
		return
	end

	if v2.box and v2.box.Parent then
		v2.box:Destroy()
	end

	esp.pcldEntries[arg] = nil
end

esp.updateEntry = function(arg)
	local v2 = esp.entries[arg]
	if not v2 then
		return
	end
	local v3 = esp.getCurrentColor()

	if v2.highlight and v2.highlight.Parent then
		v2.highlight.Enabled = esp.enabled
		v2.highlight.FillColor = v3
		v2.highlight.OutlineColor = v3
	end

	if v2.billboard and v2.billboard.Parent then
		v2.billboard.Enabled = esp.enabled and esp.showNames
	end

	if v2.label and v2.label.Parent then
		v2.label.Text = esp.getDisplayLabel(arg)
		v2.label.TextColor3 = v3
	end
end

esp.updatePCLDEntry = function(arg)
	local v2 = esp.pcldEntries[arg]
	if not v2 then
		return
	end
	local v3 = esp.getCurrentColor()

	if v2.box and v2.box.Parent then
		v2.box.Visible = esp.pcldEnabled
		v2.box.Color3 = v3
	end
end

esp.applyCharacter = function(obj, parent)
	if obj == localPlayer or not parent then
		return
	end

	task.spawn(function()
		local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart") or parent:WaitForChild("HumanoidRootPart", 10)
		local head = parent:FindFirstChild("Head") or parent:WaitForChild("Head", 10)
		if not (humanoidRootPart and head and parent.Parent and obj.Parent) then
			return
		end
		esp.clearEntry(obj)
		local jakaEsp = parent:FindFirstChild("jaka_ESP")

		if jakaEsp then
			jakaEsp:Destroy()
		end

		local jakaNameTag = parent:FindFirstChild("jaka_NameTag")

		if jakaNameTag then
			jakaNameTag:Destroy()
		end

		local highlight = Instance.new("Highlight")
		highlight.Name = "jaka_ESP"
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = parent
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "jaka_NameTag"
		billboardGui.AlwaysOnTop = true
		billboardGui.Size = UDim2.new(0, 120, 0, 88)
		billboardGui.StudsOffset = Vector3.new(0, 4, 0)
		billboardGui.Adornee = head
		billboardGui.Parent = parent
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.BackgroundTransparency = 1
		imageLabel.Size = UDim2.new(0, 40, 0, 40)
		imageLabel.Position = UDim2.new(0.5, -20, 0, 0)
		imageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=" .. obj.UserId .. "&w=150&h=150"
		imageLabel.Parent = billboardGui
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(1, 0)
		uiCorner.Parent = imageLabel
		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.new(0, 0, 0, 45)
		textLabel.Size = UDim2.new(1, 0, 0, 38)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 12
		textLabel.TextStrokeTransparency = 0
		textLabel.TextWrapped = true
		textLabel.TextYAlignment = Enum.TextYAlignment.Top
		textLabel.Text = esp.getDisplayLabel(obj)
		textLabel.Parent = billboardGui
		esp.entries[obj] = { character = parent, highlight = highlight, billboard = billboardGui, label = textLabel }
		esp.updateEntry(obj)
	end)
end

esp.trackPCLD = function(adornee)
	if not (adornee and adornee.Parent and adornee.Name == "PlayerCharacterLocationDetector" and adornee:IsA("BasePart")) then
		return
	end

	if not esp.pcldEntries[adornee] then
		local jakaPcldEsp = adornee:FindFirstChild("jaka_PCLD_ESP")

		if jakaPcldEsp then
			jakaPcldEsp:Destroy()
		end

		local selectionBox = Instance.new("SelectionBox")
		selectionBox.Name = "jaka_PCLD_ESP"
		selectionBox.Adornee = adornee
		selectionBox.LineThickness = 0.05
		selectionBox.SurfaceTransparency = 1
		selectionBox.Parent = adornee
		esp.pcldEntries[adornee] = { box = selectionBox }
	end

	esp.updatePCLDEntry(adornee)
end

esp.trackPlayer = function(obj)
	if not obj or obj == localPlayer then
		return
	end

	if esp.playerConnections[obj] then
		esp.playerConnections[obj]:Disconnect()
		esp.playerConnections[obj] = nil
	end

	esp.playerConnections[obj] = obj.CharacterAdded:Connect(function(character)
		esp.applyCharacter(obj, character)
	end)

	if obj.Character then
		esp.applyCharacter(obj, obj.Character)
	end
end

esp.untrackPlayer = function(arg)
	local v2 = esp.playerConnections[arg]

	if v2 then
		v2:Disconnect()
		esp.playerConnections[arg] = nil
	end

	esp.clearEntry(arg)
end

esp.refreshAll = function()
	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			esp.trackPlayer(player)
		end
	end

	for k in pairs(esp.entries) do
		if not k.Parent then
			esp.clearEntry(k)
		end
	end

	for _, child in ipairs(workspace:GetChildren()) do
		esp.trackPCLD(child)
	end

	for k in pairs(esp.pcldEntries) do
		if not k.Parent then
			esp.clearPCLDEntry(k)
		end
	end
end

esp.initialize = function()
	if esp.playerAddedConnection then
		return
	end

	for _, player in ipairs(players:GetPlayers()) do
		esp.trackPlayer(player)
	end

	esp.playerAddedConnection = players.PlayerAdded:Connect(function(player)
		esp.trackPlayer(player)
	end)

	esp.playerRemovingConnection = players.PlayerRemoving:Connect(function(player)
		esp.untrackPlayer(player)
	end)

	esp.workspaceChildAddedConnection = workspace.ChildAdded:Connect(function(child)
		esp.trackPCLD(child)
	end)

	esp.loopConnection = runService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - esp.lastUpdate < esp.updateInterval then
			return
		end
		esp.lastUpdate = now
		esp.hue = (esp.hue + 0.01) % 1

		for k, entry in pairs(esp.entries) do
			if not (k.Parent and entry.character and entry.character.Parent) then
				esp.clearEntry(k)
			else
				esp.updateEntry(k)
			end
		end

		for k in pairs(esp.pcldEntries) do
			if not k.Parent then
				esp.clearPCLDEntry(k)
			else
				esp.updatePCLDEntry(k)
			end
		end
	end)
end

esp.initialize()

antiKick.getToyFolder = function()
	return workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
end

antiKick.claimOwnership = function(obj)
	if obj and obj.Parent then
		safeFireRemote(setNetworkOwnerEvent, obj, obj.CFrame)
	end
end

antiKick.applyLocalToyStealth = function(obj)
	if not (obj and obj.Parent) then
		return
	end

	for _, descendant in ipairs(obj:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.LocalTransparencyModifier = 0.55
			descendant.CastShadow = false
			descendant.CanQuery = false
			descendant.CanTouch = false
		elseif descendant:IsA("ProximityPrompt") then
			descendant.Enabled = false
		end
	end
end

antiKick.getPlot = function()
	local plots = workspace:FindFirstChild("Plots")
	if not plots then
		return nil
	end

	for i = 1, 5 do
		local v2 = plots:FindFirstChild("Plot" .. i)
		local plotSign = v2 and v2:FindFirstChild("PlotSign")
		plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")
		plotSign = plotSign and plotSign:FindFirstChild("Value")
		if v2 and plotSign and tostring(plotSign.Value):find(localPlayer.Name, 1, true) then
			return v2
		end
	end

	return nil
end

antiKick.spawnToyExact = function(arg, arg2, arg3)
	if canSpawnToyValue and not canSpawnToyValue.Value then
		canSpawnToyValue.Changed:Wait()
	end

	local v2 = antiKick.getToyFolder()
	local value3 = nil
	local connection = nil

	if v2 then
		connection = v2.ChildAdded:Connect(function(child)
			if child.Name == arg then
				value3 = child
				connection:Disconnect()
			end
		end)
	end

	task.spawn(function()
		safeInvokeRemote(spawnToyRF, arg, arg2, Vector3.zero)
	end)

	local n = tick() + 1

	while true do
		task.wait()
		if not (value3 or tick() > n) then
			continue
		end
		break
	end

	if connection then
		connection:Disconnect()
	end

	if value3 then
		antiKick.applyLocalToyStealth(value3)
		return value3
	end
	arg3 = arg3 or antiKick.getPlot()
	local plotItems = workspace:FindFirstChild("PlotItems")

	if arg3 and plotItems and plotItems:FindFirstChild(arg3.Name) then
		local v4 = plotItems[arg3.Name]:FindFirstChild(arg) or plotItems[arg3.Name]:WaitForChild(arg, 0.5)
		antiKick.applyLocalToyStealth(v4)
		return v4
	end

	return nil
end

antiKick.getTrackedToyName = function()
	return (tbl.State.SelectedAntiKickToyName or "NinjaShuriken") .. "_AntiKick"
end

antiKick.getCurrentToy = function()
	local v2 = antiKick.getToyFolder()
	local plotItems = workspace:FindFirstChild("PlotItems")
	local v3 = antiKick.getTrackedToyName()
	return v2 and v2:FindFirstChild(v3) or plotItems and plotItems:FindFirstChild(v3, true)
end

antiKick.destroyCurrentToy = function()
	local v2 = antiKick.getToyFolder()
	local v3 = antiKick.getTrackedToyName()
	v2 = v2 and v2:FindFirstChild(v3)

	if v2 then
		safeFireRemote(deleteToyRE, v2)
	end

	antiKick.trackedToy = nil
end

antiKick.start = function()
	antiKick.runId = antiKick.runId + 1
	local runId = antiKick.runId
	_G.AntiKick = true

	task.spawn(function()
		task.wait(0.1)

		if canSpawnToyValue then
			while true do
				task.wait()
				if not (not _G.AntiKick or runId ~= antiKick.runId or canSpawnToyValue.Value) then
					continue
				end
				break
			end
		end

		local v2 = antiKick.getTrackedToyName()
		local v3 = antiKick.getCurrentToy()

		if v3 then
			v3.Name = v2
			antiKick.applyLocalToyStealth(v3)
		end

		local stickyPart = v3 and (v3:FindFirstChild("StickyPart") or v3:WaitForChild("StickyPart", 0.3)) or nil
		local v4 = antiKick.getPlot()

		while _G.AntiKick and runId == antiKick.runId and task.wait() do
			pcall(function()
				local selectedAntiKickToyName = tbl.State.SelectedAntiKickToyName or "NinjaShuriken"
				v2 = antiKick.getTrackedToyName()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local firePlayerPart = humanoidRootPart and humanoidRootPart:FindFirstChild("FirePlayerPart")
				local v5 = antiKick.getToyFolder()
				local plotItems = workspace:FindFirstChild("PlotItems")
				if not (character and humanoidRootPart and firePlayerPart) then
					return
				end

				if not v3 or not v3.Parent then
					v3 = antiKick.getCurrentToy()

					if v3 then
						v3.Name = v2
						antiKick.applyLocalToyStealth(v3)
						stickyPart = v3:FindFirstChild("StickyPart") or v3:WaitForChild("StickyPart", 0.3)
					end
				end

				local flag = not v3

				if not flag then
					flag = not (v5 and v5:FindFirstChild(v2))

					if flag then
						flag = not (plotItems and plotItems:FindFirstChild(v2, true))
					end
				end

				if flag then
					v3 = antiKick.spawnToyExact(selectedAntiKickToyName, humanoidRootPart.CFrame * CFrame.new(5, 10, 20), v4)
					if not v3 then
						return
					end
					v3.Name = v2
					antiKick.applyLocalToyStealth(v3)
					stickyPart = v3:WaitForChild("StickyPart", 0.3)
					antiKick.claimOwnership(stickyPart)
				end

				if v3 and (not stickyPart or not stickyPart.Parent) then
					stickyPart = v3:FindFirstChild("StickyPart") or v3:WaitForChild("StickyPart", 0.3)
				end

				antiKick.applyLocalToyStealth(v3)

				if v3 and v3:FindFirstChild("StickyPart") and v3.StickyPart:FindFirstChild("PartOwner") and v3.StickyPart.PartOwner.Value ~= localPlayer.Name then
					antiKick.claimOwnership(stickyPart)
				end

				if stickyPart and stickyPart:FindFirstChild("StickyWeld") and stickyPart.StickyWeld.Part1 ~= firePlayerPart then
					antiKick.claimOwnership(stickyPart)
					safeFireRemote(stickyPartEvent, stickyPart, firePlayerPart, CFrame.new(0, 0, 0, 1, 0, 0, 0, 0, -1, 0, 1, 0))
				end

				task.wait(0.2)

				if v3 and v3:FindFirstChild("StickyPart") and stickyPart and (stickyPart.Position - humanoidRootPart.Position).Magnitude > 30 then
					if v5 and v5:FindFirstChild(v2) then
						safeFireRemote(deleteToyRE, v5[v2])
					end

					task.spawn(function()
						v3 = antiKick.spawnToyExact(selectedAntiKickToyName, humanoidRootPart.CFrame * CFrame.new(5, 10, 20), v4)
						if not v3 then
							return
						end
						v3.Name = v2
						antiKick.applyLocalToyStealth(v3)
						stickyPart = v3:WaitForChild("StickyPart", 0.3)
						antiKick.claimOwnership(stickyPart)
					end)
				end
			end)
		end
	end)
end

antiKick.stop = function()
	_G.AntiKick = false
	antiKick.runId = antiKick.runId + 1
	antiKick.destroyCurrentToy()
end

antiKick.disconnectPCLDBreakDeathConnection = function()
	if antiKick.pcldBreakDeathConnection then
		antiKick.pcldBreakDeathConnection:Disconnect()
		antiKick.pcldBreakDeathConnection = nil
	end
end

antiKick.disconnectPCLDBreakLocalDeathConnection = function()
	if antiKick.pcldBreakLocalDeathConnection then
		antiKick.pcldBreakLocalDeathConnection:Disconnect()
		antiKick.pcldBreakLocalDeathConnection = nil
	end
end

antiKick.monitorPCLDBreakLocalCharacter = function(instance)
	antiKick.disconnectPCLDBreakLocalDeathConnection()

	task.spawn(function()
		local pcldBreakRunId = antiKick.pcldBreakRunId
		local humanoid = instance

		if instance then
			humanoid = instance:FindFirstChild("Humanoid") or instance:WaitForChild("Humanoid", 5)
		end

		if not humanoid or not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
			return
		end

		antiKick.pcldBreakLocalDeathConnection = humanoid.Died:Connect(function()
			if not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
				return
			end

			if antiKick.pcldBreakManagedHumanoid == humanoid then
				return
			end
			antiKick.pcldBreakAwaitingExternalDeath = false
			antiKick.pcldBreakPendingExternalTrigger = false
			antiKick.pcldBreakPendingRespawnKill = true
			protection.setLoopHouseTpEnabled(true)
		end)
	end)
end

antiKick.needsPCLDBreakRecovery = function()
	local character = localPlayer.Character
	if not (character and character.Parent) then
		return true
	end
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return true
	end

	if humanoid.Health <= 0 then
		return true
	end

	local ok, result = pcall(function()
		return humanoid:GetState()
	end)

	if ok and result == Enum.HumanoidStateType.Dead then
		return true
	end
	return character:FindFirstChild("HumanoidRootPart") == nil
end

antiKick.triggerPCLDBreakFromExternalDeath = function()
	if not (_G.PCLDBreakAntiKick and antiKick.pcldBreakAwaitingExternalDeath) then
		return
	end
	local pcldBreakRunId = antiKick.pcldBreakRunId
	if not antiKick.needsPCLDBreakRecovery() then
		antiKick.pcldBreakPendingExternalTrigger = false
		return
	end
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChild("Humanoid")
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

	if humanoid and humanoid.Health > 0 and humanoidRootPart then
		antiKick.pcldBreakAwaitingExternalDeath = false
		antiKick.pcldBreakPendingExternalTrigger = false
		antiKick.pcldBreakPendingRespawnKill = false
		antiKick.armPCLDBreakForCharacter(character, 0)
	else
		antiKick.pcldBreakPendingExternalTrigger = true

		task.spawn(function()
			while _G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId and antiKick.pcldBreakPendingExternalTrigger do
				local character2 = localPlayer.Character
				local humanoid2 = character2 and character2:FindFirstChild("Humanoid")
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if humanoid2 and humanoid2.Health > 0 and humanoidRootPart2 then
					antiKick.pcldBreakAwaitingExternalDeath = false
					antiKick.pcldBreakPendingExternalTrigger = false
					antiKick.pcldBreakPendingRespawnKill = false
					antiKick.armPCLDBreakForCharacter(character2, 0)
					return
				end

				task.wait()
			end
		end)
	end
end

antiKick.stop = function()
	_G.AntiKick = false
	antiKick.runId = antiKick.runId + 1
	antiKick.destroyCurrentToy()
end

antiKick.disconnectPCLDBreakDeathConnection = function()
	if antiKick.pcldBreakDeathConnection then
		antiKick.pcldBreakDeathConnection:Disconnect()
		antiKick.pcldBreakDeathConnection = nil
	end
end

antiKick.disconnectPCLDBreakLocalDeathConnection = function()
	if antiKick.pcldBreakLocalDeathConnection then
		antiKick.pcldBreakLocalDeathConnection:Disconnect()
		antiKick.pcldBreakLocalDeathConnection = nil
	end
end

antiKick.monitorPCLDBreakLocalCharacter = function(instance2)
	antiKick.disconnectPCLDBreakLocalDeathConnection()

	task.spawn(function()
		local pcldBreakRunId = antiKick.pcldBreakRunId
		local humanoid = instance2

		if instance2 then
			humanoid = instance2:FindFirstChild("Humanoid") or instance2:WaitForChild("Humanoid", 5)
		end

		if not humanoid or not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
			return
		end

		antiKick.pcldBreakLocalDeathConnection = humanoid.Died:Connect(function()
			if not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
				return
			end

			if antiKick.pcldBreakManagedHumanoid == humanoid then
				return
			end
			local character = localPlayer.Character

			if character then
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					for i = 1, 5 do
						pcall(function()
							safeFireRemote(setNetworkOwnerEvent, humanoidRootPart, humanoidRootPart.CFrame)
						end)
					end

					pcall(function()
						safeFireRemote(struggleEvent, localPlayer)
					end)
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							safeFireRemote(setNetworkOwnerEvent, descendant, descendant.CFrame)
						end)
					end
				end

				pcall(function()
					safeFireRemote(struggleEvent, localPlayer)
				end)
			end

			antiKick.pcldBreakAwaitingExternalDeath = false
			antiKick.pcldBreakPendingExternalTrigger = false
			antiKick.pcldBreakPendingRespawnKill = true
			notify("krampus", "death detected, breaking pcld on respawn...", 4)
		end)
	end)
end

antiKick.needsPCLDBreakRecovery = function()
	local character = localPlayer.Character
	if not (character and character.Parent) then
		return true
	end
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return true
	end

	if humanoid.Health <= 0 then
		return true
	end

	local ok, result = pcall(function()
		return humanoid:GetState()
	end)

	if ok and result == Enum.HumanoidStateType.Dead then
		return true
	end
	return character:FindFirstChild("HumanoidRootPart") == nil
end

antiKick.triggerPCLDBreakFromExternalDeath = function()
	if not (_G.PCLDBreakAntiKick and antiKick.pcldBreakAwaitingExternalDeath) then
		return
	end
	local pcldBreakRunId = antiKick.pcldBreakRunId
	if not antiKick.needsPCLDBreakRecovery() then
		antiKick.pcldBreakPendingExternalTrigger = false
		return
	end
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChild("Humanoid")
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

	if humanoid and humanoid.Health > 0 and humanoidRootPart then
		antiKick.pcldBreakAwaitingExternalDeath = false
		antiKick.pcldBreakPendingExternalTrigger = false
		antiKick.pcldBreakPendingRespawnKill = false
		antiKick.armPCLDBreakForCharacter(character, 0)
	else
		antiKick.pcldBreakPendingExternalTrigger = true

		task.spawn(function()
			while _G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId and antiKick.pcldBreakPendingExternalTrigger do
				local character2 = localPlayer.Character
				local humanoid2 = character2 and character2:FindFirstChild("Humanoid")
				local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if humanoid2 and humanoid2.Health > 0 and humanoidRootPart2 then
					antiKick.pcldBreakAwaitingExternalDeath = false
					antiKick.pcldBreakPendingExternalTrigger = false
					antiKick.pcldBreakPendingRespawnKill = false
					antiKick.armPCLDBreakForCharacter(character2, 0)
					return
				end

				task.wait()
			end
		end)
	end
end

antiKick.watchPCLDBreakCharacter = function(instance3)
	task.spawn(function()
		local pcldBreakRunId = antiKick.pcldBreakRunId
		local humanoid = instance3 and (instance3:FindFirstChild("Humanoid") or instance3:WaitForChild("Humanoid", 5))
		if not humanoid or not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
			return
		end

		humanoid.Died:Connect(function()
			if not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
				return
			end
			antiKick.triggerPCLDBreakFromExternalDeath()
		end)
	end)
end

antiKick.disconnectPCLDBreakObserverConnections = function()
	if antiKick.pcldBreakPlayerAddedConnection then
		antiKick.pcldBreakPlayerAddedConnection:Disconnect()
		antiKick.pcldBreakPlayerAddedConnection = nil
	end

	if antiKick.pcldBreakPlayerRemovingConnection then
		antiKick.pcldBreakPlayerRemovingConnection:Disconnect()
		antiKick.pcldBreakPlayerRemovingConnection = nil
	end

	for k, pcldBreakPlayerConnection in pairs(antiKick.pcldBreakPlayerConnections) do
		if pcldBreakPlayerConnection then
			pcldBreakPlayerConnection:Disconnect()
		end

		antiKick.pcldBreakPlayerConnections[k] = nil
	end
end

antiKick.startPCLDBreakObserverConnections = function()
	antiKick.disconnectPCLDBreakObserverConnections()

	local function fn32(player)
		if not (player and player ~= localPlayer) then
			return
		end

		antiKick.pcldBreakPlayerConnections[player] = player.CharacterAdded:Connect(function(character)
			antiKick.watchPCLDBreakCharacter(character)
		end)

		if player.Character then
			antiKick.watchPCLDBreakCharacter(player.Character)
		end
	end

	for _, player in ipairs(players:GetPlayers()) do
		fn32(player)
	end

	antiKick.pcldBreakPlayerAddedConnection = players.PlayerAdded:Connect(fn32)

	antiKick.pcldBreakPlayerRemovingConnection = players.PlayerRemoving:Connect(function(player)
		local v2 = antiKick.pcldBreakPlayerConnections[player]

		if v2 then
			v2:Disconnect()
			antiKick.pcldBreakPlayerConnections[player] = nil
		end
	end)
end

antiKick.armPCLDBreakForCharacter = function(arg, arg2)
	local pcldBreakRunId = antiKick.pcldBreakRunId

	task.spawn(function()
		local character = arg or localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 5)
		if not humanoid or not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
			return
		end
		antiKick.disconnectPCLDBreakDeathConnection()

		antiKick.pcldBreakDeathConnection = humanoid.Died:Connect(function()
			if not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
				return
			end

			if antiKick.pcldBreakPendingRespawnKill then
				antiKick.pcldBreakPendingRespawnKill = false
				antiKick.pcldBreakAwaitingExternalDeath = true
				antiKick.pcldBreakPendingExternalTrigger = false

				if antiKick.notify then
					antiKick.notify("krampus", "death detected, breaking pcld", 4)
				end
			else
				antiKick.pcldBreakPendingRespawnKill = true
			end

			task.defer(function()
				if antiKick.pcldBreakManagedHumanoid == humanoid then
					antiKick.pcldBreakManagedHumanoid = nil
				end
			end)
		end)

		if type(arg2) == "number" and arg2 > 0 then
			task.wait(arg2)
			if not _G.PCLDBreakAntiKick or pcldBreakRunId ~= antiKick.pcldBreakRunId then
				return
			end
		end

		if humanoid.Parent and humanoid.Health > 0 then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 2)
			if not humanoidRootPart then
				return
			end
			task.wait(0)
			antiKick.pcldBreakManagedHumanoid = humanoid
			pcall(forceReleaseHeldInventoryAndGrab)

			pcall(function()
				safeFireRemote(destroyGrabLineEvent, humanoidRootPart)
			end)

			pcall(function()
				safeFireRemote(setNetworkOwnerEvent, humanoidRootPart, humanoidRootPart.CFrame)
			end)

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant.Name == "PartOwner" and descendant:IsA("StringValue") then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end

			for _, child in ipairs(character:GetChildren()) do
				if child:IsA("BasePart") then
					child.Anchored = false
					child.AssemblyLinearVelocity = Vector3.zero
					child.AssemblyAngularVelocity = Vector3.zero
				end
			end

			pcall(function()
				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)

			pcall(function()
				safeFireRemote(ragdollRemoteEvent, humanoidRootPart, 0)
			end)

			pcall(function()
				safeFireRemote(struggleEvent, localPlayer)
			end)

			if isHeldValue then
				pcall(function()
					isHeldValue.Value = false
				end)
			end

			local n = tick() + 0.35

			repeat
				if not (_G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId) then
					return
				end
				humanoid.BreakJointsOnDeath = true
				humanoid.Health = 0

				pcall(function()
					humanoid:TakeDamage(math.max(humanoid.MaxHealth, 100))
				end)
				-- https://discord.gg/x7YbZeezpm | SL | SOURCE LEAK

				if humanoid.Health <= 0 then
					break
				end
				task.wait()
			until tick() >= n or not humanoid.Parent
		end
	end)
end

antiKick.startPCLDBreak = function()
	_G.PCLDBreakAntiKick = true
	antiKick.pcldBreakRunId = antiKick.pcldBreakRunId + 1
	antiKick.pcldBreakAwaitingExternalDeath = false
	antiKick.pcldBreakPendingExternalTrigger = false
	antiKick.pcldBreakPendingRespawnKill = false
	antiKick.pcldBreakManagedHumanoid = nil
	antiKick.startPCLDBreakObserverConnections()
	antiKick.monitorPCLDBreakLocalCharacter(localPlayer.Character)
	antiKick.armPCLDBreakForCharacter(localPlayer.Character, 0)
end

antiKick.stopPCLDBreak = function()
	_G.PCLDBreakAntiKick = false
	antiKick.pcldBreakRunId = antiKick.pcldBreakRunId + 1
	antiKick.pcldBreakAwaitingExternalDeath = false
	antiKick.pcldBreakPendingExternalTrigger = false
	antiKick.pcldBreakPendingRespawnKill = false
	antiKick.pcldBreakManagedHumanoid = nil
	antiKick.disconnectPCLDBreakDeathConnection()
	antiKick.disconnectPCLDBreakLocalDeathConnection()
	antiKick.disconnectPCLDBreakObserverConnections()
	notify("krampus", "PCLD break has ended.", 3)
end

local function fn32(arg)
	if not (arg and arg.Name == "GrabParts") then
		return
	end
	local dragPart = arg:FindFirstChild("DragPart") or arg:FindFirstChild("DragPart", true)
	if not dragPart then
		return
	end
	local alignOrientation = dragPart:FindFirstChild("AlignOrientation")
	local alignPosition = dragPart:FindFirstChild("AlignPosition")
	if not (alignOrientation and alignPosition) then
		return
	end
	alignOrientation.MaxTorque = math.huge
	alignOrientation.Responsiveness = 200
	alignPosition.MaxForce = math.huge
	alignPosition.Responsiveness = 200
end

local function fn33()
	if combat.masslessGrabChildConnection then
		combat.masslessGrabChildConnection:Disconnect()
		combat.masslessGrabChildConnection = nil
	end

	if not _G.MasslessGrab then
		return
	end

	combat.masslessGrabChildConnection = workspace.ChildAdded:Connect(function(child)
		if child.Name == "GrabParts" then
			fn32(child)
		end
	end)

	local grabParts = workspace:FindFirstChild("GrabParts")

	if grabParts then
		task.spawn(function()
			fn32(grabParts)
		end)
	end
end

local function fn34(arg)
	if combat.masslessCharacterConnection then
		combat.masslessCharacterConnection:Disconnect()
		combat.masslessCharacterConnection = nil
	end

	local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	combat.masslessCharacterConnection = humanoidRootPart:GetPropertyChangedSignal("Massless"):Connect(function()
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("BasePart") then
				child.Massless = false
			end
		end
	end)

	task.spawn(function()
		local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg:WaitForChild("HumanoidRootPart", 10)

		while humanoidRootPart2 and humanoidRootPart2.Parent and humanoidRootPart2.Massless do
			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("BasePart") then
					child.Massless = false
					child.Velocity = Vector3.zero
				end

				task.wait()
			end
		end
	end)
end

local function fn35()
	if combat.antiGrabHeartbeatConnection then
		combat.antiGrabHeartbeatConnection:Disconnect()
		combat.antiGrabHeartbeatConnection = nil
	end

	combat.antiGrabRagdollUntil = 0
	local character = localPlayer.Character
	character = character and character:FindFirstChild("HumanoidRootPart")

	if character then
		character.Velocity = Vector3.new()
		character.Anchored = false
	end
end

local function fn36()
	fn35()

	combat.antiGrabHeartbeatConnection = runService.Heartbeat:Connect(function()
		if not (_G.AntiGrab and isHeldValue and isHeldValue.Value) then
			fn35()
			return
		end
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			character.Velocity = Vector3.new()
			local antiGrabRagdollUntil = combat.antiGrabRagdollUntil
			if time() < antiGrabRagdollUntil then
				character.Anchored = false
				return
			end
			character.Anchored = true
			safeFireRemote(struggleEvent, localPlayer)
		end
	end)
end

if isHeldValue then
	isHeldValue.Changed:Connect(function(newValue)
		if newValue == true and _G.AntiGrab then
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if character then
				local antiGrabRagdollDuration = combat.antiGrabRagdollDuration or 2
				combat.antiGrabRagdollUntil = time() + antiGrabRagdollDuration
				character.Anchored = false
				character.Velocity = Vector3.zero
				safeFireRemote(ragdollRemoteEvent, character, antiGrabRagdollDuration)

				if struggleEvent then
					task.delay(0.1, function()
						if _G.AntiGrab and isHeldValue and isHeldValue.Value then
							safeFireRemote(struggleEvent, localPlayer)
						end
					end)
				end
			end

			fn36()
		else
			fn35()
		end
	end)
end

local function fn37()
	protection.antiExplodeEnabled = false

	if combat.antiExplodeConnection then
		combat.antiExplodeConnection:Disconnect()
		combat.antiExplodeConnection = nil
	end
end

local function fn38(arg)
	local extinguishPart = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Hole") and workspace.Map.Hole.PoisonBigHole.ExtinguishPart
	if not extinguishPart then
		return
	end

	if combat.antiBurnConnection then
		combat.antiBurnConnection:Disconnect()
		combat.antiBurnConnection = nil
	end

	local position = extinguishPart.Position
	extinguishPart.Transparency = 1

	if extinguishPart:FindFirstChild("Tex") then
		extinguishPart.Tex.Transparency = 1
	end

	if arg then
		combat.antiBurnConnection = runService.Heartbeat:Connect(function()
			local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and (humanoidRootPart:FindFirstChild("FireLight") or humanoidRootPart:FindFirstChild("FireParticleEmitter")) then
				if firetouchinterest then
					firetouchinterest(humanoidRootPart.FirePlayerPart, extinguishPart, 0)
					task.wait()
					firetouchinterest(humanoidRootPart.FirePlayerPart, extinguishPart, 1)
				else
					local random = math.random
					extinguishPart.CFrame = humanoidRootPart.FirePlayerPart.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), random(-1, 1))
					task.wait()
					extinguishPart.Position = Vector3.new(0, -100, 0)
				end
			else
				extinguishPart.CFrame = CFrame.new(position)
			end
		end)
	else
		extinguishPart.CFrame = CFrame.new(position)
	end
end

local function fn39()
	local character = localPlayer.Character
	if not character then
		return
	end
	protection.antiBanannaLoopToken = protection.antiBanannaLoopToken + 1
	local antiBanannaLoopToken = protection.antiBanannaLoopToken

	task.spawn(function()
		local exitTo = nil

		while true do
			if antiBanannaLoopToken == protection.antiBanannaLoopToken and _G.AntiBananna then
				if localPlayer.Character ~= character or not character.Parent then
					exitTo = 2
					break
				else
					local leftLeg = character:FindFirstChild("Left Leg")
					local rightLeg = character:FindFirstChild("Right Leg")

					if not leftLeg and not rightLeg then
						exitTo = 1
						break
					else
						local torso = character:FindFirstChild("Torso")
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

						if torso and humanoid and humanoidRootPart then
							local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
							local cFrame = torso.CFrame
							workspace.FallenPartsDestroyHeight = -100
							safeFireRemote(ragdollRemoteEvent, humanoidRootPart, 2)
							task.wait(0.5)
							local leftLeg2 = character:FindFirstChild("Left Leg")
							local rightLeg2 = character:FindFirstChild("Right Leg")

							if rightLeg2 then
								rightLeg2.CFrame = CFrame.new(0, -10000, 0)
							end

							if leftLeg2 then
								leftLeg2.CFrame = CFrame.new(0, -10000, 0)
							end

							task.wait(0.3)

							if torso.Parent then
								torso.CFrame = CFrame.new(0, -9970, 0)
							end

							task.wait(0.5)

							if torso.Parent then
								torso.CFrame = cFrame
							end

							task.wait(0.5)
							workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
							local leftLeg3 = character:FindFirstChild("Left Leg")
							local rightLeg3 = character:FindFirstChild("Right Leg")

							if leftLeg3 or rightLeg3 then
								task.wait(0.3)
							end

							continue
						end
					end
				end
			else
				exitTo = 1
				break
			end

			break
		end

		if exitTo == 1 then
			while true do
				if antiBanannaLoopToken == protection.antiBanannaLoopToken and character.Parent and not character:FindFirstChild("Left Leg") and not character:FindFirstChild("Right Leg") then
					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						local flag = false

						pcall(function()
							flag = localPlayer.PlayerGui.ControlsGui.PCFrame.Stand.Visible == false
						end)

						humanoid.HipHeight = flag and 2 or 0
						task.wait()
						continue
					end
				end

				break
			end

			return
		end

		if exitTo == 2 then
			return
		end
	end)
end

local function fn40(antiBananna)
	_G.AntiBananna = antiBananna

	if not antiBananna then
		protection.antiBanannaLoopToken = protection.antiBanannaLoopToken + 1
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if character then
			character.HipHeight = 0
		end

		return
	end

	fn39()
end

local function fn41(arg)
	local v2 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	if not arg or arg.Name ~= "CreatureBlobman" or v2 and arg:IsDescendantOf(v2) then
		return
	end
	local rightDetector = arg:FindFirstChild("RightDetector") or arg:WaitForChild("RightDetector", 3)
	local leftDetector = arg:FindFirstChild("LeftDetector") or arg:WaitForChild("LeftDetector", 3)

	if rightDetector and leftDetector then
		local rightAlignOrientation = rightDetector:FindFirstChild("RightAlignOrientation") or rightDetector:WaitForChild("RightAlignOrientation", 1)
		local rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:WaitForChild("RightWeld", 1)
		local leftAlignOrientation = leftDetector:FindFirstChild("LeftAlignOrientation") or leftDetector:WaitForChild("LeftAlignOrientation", 1)
		local leftWeld = leftDetector:FindFirstChild("LeftWeld") or leftDetector:WaitForChild("LeftWeld", 1)

		if rightAlignOrientation then
			rightAlignOrientation.Enabled = false
		end

		if rightWeld then
			rightWeld.Enabled = false
		end

		if leftAlignOrientation then
			leftAlignOrientation.Enabled = false
		end

		if leftWeld then
			leftWeld.Enabled = false
		end
	end
end

local function fn42(antiBlobman)
	_G.AntiBlobman = antiBlobman

	if protection.antiBlobmanConnection then
		protection.antiBlobmanConnection:Disconnect()
		protection.antiBlobmanConnection = nil
	end

	if not antiBlobman then
		return
	end

	for _, descendant in ipairs(workspace:GetDescendants()) do
		if descendant.Name == "CreatureBlobman" then
			fn41(descendant)
		end
	end

	protection.antiBlobmanConnection = workspace.DescendantAdded:Connect(function(descendant)
		if descendant.Name == "CreatureBlobman" then
			fn41(descendant)
		end
	end)
end

local function fn43(antiLag)
	_G.AntiLag = antiLag
	local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
	playerScripts = playerScripts and playerScripts:FindFirstChild("CharacterAndBeamMove")

	if playerScripts then
		playerScripts.Disabled = antiLag
	end
end

local function setLineLagEnabled(lineLagEnabled)
	server.lineLagEnabled = lineLagEnabled
	server.lineLagRunId = server.lineLagRunId + 1
	if not lineLagEnabled then
		return
	end
	local lineLagRunId = server.lineLagRunId

	task.spawn(function()
		while server.lineLagEnabled and lineLagRunId == server.lineLagRunId do
			local linesPerSecond = server.linesPerSecond or 180
			local n = math.floor(linesPerSecond / 10)

			if n < 1 then
				n = 1
			end

			local spawnLocation = workspace:FindFirstChild("SpawnLocation")

			if spawnLocation and createGrabLineEvent then
				for i = 1, n do
					pcall(function()
						safeFireRemote(createGrabLineEvent, spawnLocation, CFrame.new(0, 2e9, 0))
					end)
				end
			end

			task.wait(1 / linesPerSecond * n)
		end
	end)
end

local function setMonsterLineLagEnabled(monsterLineLagEnabled)
	server.monsterLineLagEnabled = monsterLineLagEnabled
	server.monsterLineLagRunId = server.lineLagRunId + 1
	if not monsterLineLagEnabled then
		return
	end
	local monsterLineLagRunId = server.monsterLineLagRunId

	task.spawn(function()
		while server.monsterLineLagEnabled and monsterLineLagRunId == server.monsterLineLagRunId do
			local monsterLinesPerSecond = server.monsterLinesPerSecond or 180
			local n = math.floor(monsterLinesPerSecond / 10)

			if n < 1 then
				n = 1
			end

			local spawnLocation = workspace:FindFirstChild("SpawnLocation")

			if spawnLocation and createGrabLineEvent then
				for i = 1, n do
					pcall(function()
						safeFireRemote(createGrabLineEvent, spawnLocation, CFrame.new(2e9, 0, 2e9))
					end)
				end
			end

			task.wait(1 / monsterLinesPerSecond * n)
		end
	end)
end

local function setPacketLagEnabled(packetLagEnabled)
	server.packetLagEnabled = packetLagEnabled
	server.packetLagRunId = server.packetLagRunId + 1
	if not packetLagEnabled then
		return
	end
	local packetLagRunId = server.packetLagRunId

	task.spawn(function()
		while true do
			if server.packetLagEnabled and packetLagRunId == server.packetLagRunId then
				task.wait(0.5)

				if server.packetLagEnabled and packetLagRunId == server.packetLagRunId then
					local str = string.rep("a", 10000 * server.packets)

					if server.antiDetect then
						safeFireRemote(createGrabLineEvent, str)
					else
						safeFireRemote(extendGrabLineEvent, str)
					end

					continue
				end
			end

			break
		end
	end)
end

local function setKillAllEnabled(killAll)
	_G.KillAll = killAll
	server.killAllRunId = server.killAllRunId + 1

	if not killAll then
		fn7()
		dialogueFunction1()
		return
	end

	local killAllRunId = server.killAllRunId

	task.spawn(function()
		local value4 = nil
		local cFrame = nil

		while _G.KillAll and killAllRunId == server.killAllRunId do
			value4 = getPlayerCFrame()

			if target.selectedKillOnly and workspace.CurrentCamera then
				cFrame = workspace.CurrentCamera.CFrame
			end

			if target.selectedKillOnly then
				local flag = false

				for _, item in ipairs(target.playerList) do
					if _G.KillAll and killAllRunId == server.killAllRunId then
						local v4 = players:FindFirstChild(item)

						if checkPlayerKill(v4) then
							local humanoidRootPart = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart")
							local humanoid = v4.Character and v4.Character:FindFirstChildOfClass("Humanoid")
							humanoid = humanoidRootPart and humanoid
							flag = true

							if humanoid then
								if cFrame then
									fn6(cFrame)
								end

								while true do
									if _G.KillAll and killAllRunId == server.killAllRunId and checkPlayerKill(v4) then
										local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
										local humanoidRootPart3 = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart")
										local humanoid2 = v4.Character and v4.Character:FindFirstChildOfClass("Humanoid")

										if humanoidRootPart3 and humanoid2 then
											if cFrame then
												fn6(cFrame)
											end

											dialogueFunction2()

											if humanoidRootPart2 then
												fn19(humanoidRootPart2, humanoidRootPart3)
											end

											fn26(humanoidRootPart3)

											if not fn31(v4) then
												snoWshipForce(humanoidRootPart3)
											end

											snoWship(humanoidRootPart3)

											if not checkPlayerKill(v4) or not _G.KillAll or killAllRunId ~= server.killAllRunId or fn31(v4) or humanoidRootPart3.AssemblyLinearVelocity.Magnitude > 500 then
												createSkyVelocity(humanoidRootPart3)
												safeFireRemote(destroyGrabLineEvent, humanoidRootPart3)
												break
											else
												if humanoidRootPart3.Position.Y <= -12 then
													teleportPlayer(CFrame.new(humanoidRootPart3.Position + Vector3.new(0, 5, -15)))
												elseif humanoidRootPart2 and (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude > 8 then
													teleportPlayer(CFrame.new(humanoidRootPart3.Position))
												else
													teleportPlayer(CFrame.new(humanoidRootPart3.Position + Vector3.new(0, -6, -6)))
												end

												humanoid2.BreakJointsOnDeath = false
												humanoid2:ChangeState(Enum.HumanoidStateType.Dead)
												humanoid2.Jump = true
												humanoid2.Sit = false
												runService.Heartbeat:Wait()
												continue
											end
										end
									end

									break
								end

								fn7()

								if value4 then
									teleportPlayer(value4)
								end

								fn(false)
								value4 = getPlayerCFrame()
								local cFrame2 = workspace.CurrentCamera and workspace.CurrentCamera.CFrame
								local flag2 = true

								if cFrame2 then
									cFrame = cFrame2
								else
									flag = flag2
								end
							end
						end

						continue
					end

					break
				end

				if not flag then
					fn7()
					fn(false)
				end
			else
				for _, player in ipairs(players:GetPlayers()) do
					if _G.KillAll and killAllRunId == server.killAllRunId then
						if checkPlayerKill(player) then
							local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
							local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

							if humanoidRootPart and humanoid then
								for i = 0, 50 do
									dialogueFunction2()
									snoWship(humanoidRootPart)

									if not checkPlayerKill(player) or not _G.KillAll or killAllRunId ~= server.killAllRunId or fn31(player) or humanoidRootPart.AssemblyLinearVelocity.Magnitude > 500 then
										createSkyVelocity(humanoidRootPart)
										safeFireRemote(destroyGrabLineEvent, humanoidRootPart)
										break
									else
										if humanoidRootPart.Position.Y <= -12 then
											teleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, -15)))
										else
											teleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, -10, -10)))
										end

										humanoid.BreakJointsOnDeath = false
										humanoid:ChangeState(Enum.HumanoidStateType.Dead)
										humanoid.Jump = true
										humanoid.Sit = false
										runService.Heartbeat:Wait()
									end
								end
							end
						end

						continue
					end

					break
				end
			end

			if not target.selectedKillOnly then
				teleportPlayer(value4)
			end

			task.wait(target.selectedKillOnly and 0.01 or 0.05)
		end

		fn7()
		fn(true)
		dialogueFunction1()
		teleportPlayer(value4)
	end)
end

local function setBringAllEnabled(bringAll)
	_G.BringAll = bringAll
	server.bringAllRunId = server.bringAllRunId + 1

	if not bringAll then
		fn7()
		dialogueFunction1()
		return
	end

	if not getPlayerCFrame() then
		_G.BringAll = false
		return
	end
	local bringAllRunId = server.bringAllRunId

	task.spawn(function()
		local tbl2 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if checkPlayerBring(player) then
				table.insert(tbl2, player)
			end
		end

		if #tbl2 == 0 then
			_G.BringAll = false
			refreshServerPanel()
			return
		end

		local n = #tbl2
		local n2 = math.max(n * 1.5, 15)
		local n3 = 6.2831853071795862 / n
		local tbl3 = {}

		for i, item2 in ipairs(tbl2) do
			local n4 = n3 * (i - 1)
			tbl3[item2] = Vector3.new(3 + math.cos(n4) * n2, 8, -2 + math.sin(n4) * n2)
		end

		print("Setting network ownership...")
		local tbl4 = {}

		for _, item3 in ipairs(tbl2) do
			if _G.BringAll and bringAllRunId == server.bringAllRunId then
				local humanoidRootPart = item3.Character and item3.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					teleportPlayer(CFrame.new(humanoidRootPart.Position))
					task.wait(0.1)
					local flag = false
					local n4 = 0

					while not flag and n4 < 10 and _G.BringAll and bringAllRunId == server.bringAllRunId do
						snoWshipForce(humanoidRootPart)
						task.wait(0.1)

						if fn31(item3) then
							table.insert(tbl4, item3)
							print("Owned:", item3.Name)
							flag = true
						end
						-- 𝗦𝗟 | 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸 // discord.gg/x7YbZeezpm

						n4 += 1
					end
				end

				continue
			end

			break
		end

		if #tbl4 ~= #tbl2 then
			print("Failed to get ownership of all players.")
			_G.BringAll = false
			refreshServerPanel()
			return
		end

		print("Successfully owned all players!")
		print("Positioning players in circle...")

		for _, item4 in ipairs(tbl4) do
			local humanoidRootPart = item4.Character and item4.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				local entry2 = tbl3[item4]
				humanoidRootPart.CFrame = CFrame.new(entry2)
				humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.Position = entry2
				bodyPosition.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bodyPosition.D = 5000
				bodyPosition.P = 500000
				bodyPosition.Parent = humanoidRootPart
				print("Positioned:", item4.Name)
			end
		end

		task.wait(1)
		print("Firing destroyGrabLine to ALL players simultaneously...")
		local tbl5 = {}

		for _, item5 in ipairs(tbl4) do
			local humanoidRootPart = item5.Character and item5.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				table.insert(tbl5, humanoidRootPart)
			end
		end

		for _, item6 in ipairs(tbl5) do
			safeFireRemote(destroyGrabLineEvent, item6)
		end

		print("Fired breakline to all", #tbl5, "players simultaneously!")
		print("Holding players for 2 seconds after breakline...")
		local now = os.clock()

		while os.clock() - now < 2 and _G.BringAll and bringAllRunId == server.bringAllRunId do
			for _, item7 in ipairs(tbl4) do
				local humanoidRootPart = item7.Character and item7.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					local entry3 = tbl3[item7]

					if entry3 then
						local bodyPosition = humanoidRootPart:FindFirstChild("BodyPosition")

						if bodyPosition then
							bodyPosition.Position = entry3
						end

						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					end
				end
			end

			task.wait(0.05)
		end

		print("Dropping players...")

		for _, item8 in ipairs(tbl4) do
			local humanoidRootPart = item8.Character and item8.Character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				local bodyPosition = humanoidRootPart:FindFirstChild("BodyPosition")

				if bodyPosition then
					bodyPosition:Destroy()
				end
			end
		end

		print("Done!")
		_G.BringAll = false
		refreshServerPanel()
	end)
end

local function fn44(arg, arg2)
	arg = arg or workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	if not arg then
		return
	end

	if arg2 then
		for _, value5 in pairs(tbl.Constants.AntiInputLagToyList) do
			local v3 = arg:FindFirstChild(value5)

			if v3 then
				safeFireRemote(deleteToyRE, v3)
			end
		end
	else
		local v2 = arg:FindFirstChild(tbl.State.SelectedAntiInputLagToy)

		if v2 then
			safeFireRemote(deleteToyRE, v2)
		end
	end
end

local function fn45()
	if protection.antiInputDestroyGrabHookInstalled then
		return
	end

	if typeof(hookmetamethod) ~= "function" or typeof(getnamecallmethod) ~= "function" or typeof(checkcaller) ~= "function" then
		return
	end
	protection.antiInputDestroyGrabHookInstalled = true
	local value6 = nil

	local function fn46(arg, ...)
		local result4 = getnamecallmethod()

		if not checkcaller() and result4 == "FireServer" and _G.AntiInputLag then
			if _G.HoldingObjectGrabPart and _G.HoldingObjectGrabPart.Parent and (arg == destroyGrabLineEvent or typeof(arg) == "Instance" and arg.Name == "DestroyGrabLine") then
				return nil
			end
		end

		return value6(arg, ...)
	end

	value6 = hookmetamethod
	value6 = value6(game, "__namecall", fn46)
end

local function fn46()
	local ok, result = pcall(function()
		return runService.Heartbeat:Wait()
	end)

	if not ok then
		return 1
	end
	local flag = type(result) == "number" and result > 0
	local n = 60

	if flag then
		n = math.floor(1 / result + 0.5)
	end

	if n >= 360 then
		return 6
	end
	return math.clamp(math.floor(n / 60 + 0.5), 1, 6)
end

local function fn47()
	local result5 = fn46()

	for i = 2, result5 do
		runService.Heartbeat:Wait()
	end

	return result5
end

tbl.Functions.antiInputDelayStepToCycles = function(arg)
	local v2 = tbl.Functions.clampAntiInputDelayStep(arg)
	local n = math.max(fn46(), 1)
	if v2 <= 0 then
		return 1
	end
	return math.max(1 + v2 * n, 1)
end

local function fn48(arg)
	for i = 1, tbl.Functions.antiInputDelayStepToCycles(arg) do
		runService.Heartbeat:Wait()
	end
end

local function fn49()
	local result6 = fn46()
	local v3 = tbl.Functions.clampAntiInputDelayStep(combat.antiInputDelayStep)
	if v3 <= 0 then
		return math.clamp(result6 * 4 + 4, 10, 28)
	end

	if v3 <= 2 then
		return math.clamp(result6 * 3 + 2, 6, 18)
	end

	if v3 >= 8 then
		return math.clamp(result6, 1, 4)
	end
	return math.clamp(result6 + 1, 2, 8)
end

local function fn50(arg)
	if tbl.Functions.clampAntiInputDelayStep(arg) <= 0 then
		runService.Heartbeat:Wait()
		return
	end
	fn47()
end

local function fn51()
	if not grabEvents then
		return
	end

	local function fn52()
		pcall(function()
			local endGrabEarly = game:GetService("ReplicatedStorage").GrabEvents:FindFirstChild("EndGrabEarly")

			if endGrabEarly then
				endGrabEarly:Destroy()
			end

			local remoteEvent = Instance.new("RemoteEvent")
			remoteEvent.Name = "EndGrabEarly"
			remoteEvent.Parent = game:GetService("ReplicatedStorage").GrabEvents

			remoteEvent.OnClientEvent:Connect(function()
				return true
			end)
		end)
	end

	fn52()

	if protection.antiInputEndGrabEarlyWatcherConnection then
		protection.antiInputEndGrabEarlyWatcherConnection:Disconnect()
		protection.antiInputEndGrabEarlyWatcherConnection = nil
	end

	protection.antiInputEndGrabEarlyWatcherConnection = grabEvents.ChildAdded:Connect(function(child)
		if not _G.AntiInputLag then
			return
		end

		if child and child.Name == "EndGrabEarly" then
			task.defer(fn52)
		end
	end)

	protection.antiInputEndGrabEarlyBypassInstalled = true
end

local function fn52()
	local plotItems = workspace:FindFirstChild("PlotItems")
	if not plotItems then
		return false, nil
	end
	local playersInPlots = plotItems:FindFirstChild("PlayersInPlots")
	if not (playersInPlots and playersInPlots:FindFirstChild(localPlayer.Name)) then
		return false, nil
	end
	local plots = workspace:FindFirstChild("Plots")
	if not plots then
		return false, nil
	end

	for _, child in ipairs(plots:GetChildren()) do
		local plotSign = child:FindFirstChild("PlotSign")
		plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

		if plotSign then
			for _, child2 in ipairs(plotSign:GetChildren()) do
				if child2.Value ~= localPlayer.Name then
					continue
				end
				local v2 = plotItems:FindFirstChild(child.Name)
				if v2 then
					return true, v2
				end
			end
		end
	end

	return false, nil
end

local function fn53()
	fn44(nil, true)
	local v2, v3 = fn52()

	if v2 and v3 then
		fn44(v3, true)
	end
end

local function fn54()
	local v2, v3 = fn52()

	if v2 and v3 then
		local v4 = v3:FindFirstChild(tbl.State.SelectedAntiInputLagToy)
		if v4 then
			return v4
		end
	end

	local v4 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

	if v4 then
		local v5 = v4:FindFirstChild(tbl.State.SelectedAntiInputLagToy)
		if v5 then
			return v5
		end
	end

	return nil
end

local function fn55(arg)
	if not (arg and arg.Parent) then
		return false
	end

	local function fn56(arg2)
		return arg2 == localPlayer or arg2 == localPlayer.Name
	end

	local holdPart = arg:FindFirstChild("HoldPart")
	holdPart = holdPart and holdPart:FindFirstChild("HoldingPlayer")
	if holdPart and fn56(holdPart.Value) then
		return true
	end
	local partOwner = arg:FindFirstChild("PartOwner", true)

	if partOwner then
		if fn56(partOwner.Value) then
			return true
		end
	end

	return false
end

local function fn56(arg)
	if not (arg and arg.Parent) then
		return false
	end

	local function fn57(arg2)
		return arg2 == localPlayer or arg2 == localPlayer.Name
	end

	local holdPart = arg:FindFirstChild("HoldPart")
	holdPart = holdPart and holdPart:FindFirstChild("HoldingPlayer")
	if holdPart and holdPart.Value and not fn57(holdPart.Value) then
		return true
	end
	local partOwner = arg:FindFirstChild("PartOwner", true)
	if partOwner and partOwner.Value and not fn57(partOwner.Value) then
		return true
	end
	return false
end

local function fn57(arg)
	if arg and arg.Parent then
		safeFireRemote(deleteToyRE, arg)

		pcall(function()
			arg:Destroy()
		end)
	end

	fn23()
end

local function fn58(arg)
	while _G.AntiInputLag and arg == combat.antiInputLagRunId do
		local result7 = fn54()
		if result7 then
			return result7
		end

		if canSpawnToyValue then
			while _G.AntiInputLag and arg == combat.antiInputLagRunId and not canSpawnToyValue.Value do
				task.wait(0.1)
			end
		end

		if not (_G.AntiInputLag and arg == combat.antiInputLagRunId) then
			return nil
		end
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			task.wait(0.1)
			continue
		end

		if spawnToyRF then
			task.spawn(function()
				safeInvokeRemote(spawnToyRF, tbl.State.SelectedAntiInputLagToy, humanoidRootPart.CFrame * CFrame.new(0, 3, 0), Vector3.zero)
			end)

			local now = tick()

			while _G.AntiInputLag and arg == combat.antiInputLagRunId and tick() - now < 3 do
				runService.Heartbeat:Wait()
				local result8 = fn54()
				if result8 then
					return result8
				end
			end

			continue
		end

		task.wait(0.1)
	end

	return nil
end

local function fn59(arg)
	task.spawn(function()
		while _G.AntiInputLag and arg == combat.antiInputLagRunId do
			runService.Heartbeat:Wait()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if character and humanoid and humanoid.Health > 0 then
				local v2 = fn58(arg)

				if not v2 or not _G.AntiInputLag then
					if not v2 then
						fn23()
					end
				else
					fn24(v2, character and character:FindFirstChild("HumanoidRootPart"))

					pcall(function()
						for _, descendant in ipairs(v2:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.Transparency < 1 then
								descendant.Transparency = 1
							end
						end
					end)

					local v3 = v2

					task.spawn(function()
						task.wait(1.2)

						if _G.AntiInputLag and v3 and v3.Parent then
							pcall(function()
								for _, descendant in ipairs(v3:GetDescendants()) do
									if descendant:IsA("BasePart") and descendant.Transparency < 1 then
										descendant.Transparency = 1
									end
								end
							end)
						end
					end)

					local n = 0
					local now = tick()
					local n2 = 0

					while true do
						local character2 = localPlayer.Character
						local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
						local exitTo = nil
						local flag

						while true do
							if character2 and humanoidRootPart and v2 and v2.Parent then
								if fn56(v2) then
									exitTo = 2
									break
								else
									local holdPart = v2:FindFirstChild("HoldPart")

									if holdPart then
										local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer")
										holdingPlayer = holdingPlayer and holdingPlayer.Value
										local now2 = tick()
										local flag2, v4, v5, v6

										if not (now2 - n2 >= 0.35) then
											flag2 = holdingPlayer and holdingPlayer ~= localPlayer and holdingPlayer ~= localPlayer.Name

											if flag2 then
												exitTo = 6
												break
											elseif n < fn49() then
												n += 1
												v4 = v2
												v5 = character2
												v6 = fn24(v4, humanoidRootPart)
												now = tick()

												task.spawn(function()
													safeInvokeRemote(holdPart.HoldItemRemoteFunction, v4, v5)
													fn48(combat.antiInputDelayStep)

													if _G.AntiInputLag and arg == combat.antiInputLagRunId and v4 and v4.Parent then
														safeInvokeRemote(holdPart.DropItemRemoteFunction, v4, v6, Vector3.zero)
													end

													n = math.max(n - 1, 0)
												end)

												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											else
												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											end
										elseif fn55(v2) then
											n2 = now2
											now = now2
											flag2 = holdingPlayer and holdingPlayer ~= localPlayer and holdingPlayer ~= localPlayer.Name

											if flag2 then
												exitTo = 5
												break
											elseif n < fn49() then
												n += 1
												v4 = v2
												v5 = character2
												v6 = fn24(v4, humanoidRootPart)
												now = tick()

												task.spawn(function()
													safeInvokeRemote(holdPart.HoldItemRemoteFunction, v4, v5)
													fn48(combat.antiInputDelayStep)

													if _G.AntiInputLag and arg == combat.antiInputLagRunId and v4 and v4.Parent then
														safeInvokeRemote(holdPart.DropItemRemoteFunction, v4, v6, Vector3.zero)
													end

													n = math.max(n - 1, 0)
												end)

												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											else
												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											end
										elseif now2 - now > 1.25 and now2 - 0 > 1.25 then
											exitTo = 3
											break
										else
											n2 = now2
											flag2 = holdingPlayer and holdingPlayer ~= localPlayer and holdingPlayer ~= localPlayer.Name

											if flag2 then
												exitTo = 4
												break
											elseif n < fn49() then
												n += 1
												v4 = v2
												v5 = character2
												v6 = fn24(v4, humanoidRootPart)
												now = tick()

												task.spawn(function()
													safeInvokeRemote(holdPart.HoldItemRemoteFunction, v4, v5)
													fn48(combat.antiInputDelayStep)

													if _G.AntiInputLag and arg == combat.antiInputLagRunId and v4 and v4.Parent then
														safeInvokeRemote(holdPart.DropItemRemoteFunction, v4, v6, Vector3.zero)
													end

													n = math.max(n - 1, 0)
												end)

												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											else
												fn50(combat.antiInputDelayStep)
												flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

												if not flag then
													character2 = localPlayer.Character
													humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
													continue
												end
											end
										end
									else
										fn50(combat.antiInputDelayStep)
										flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId

										if not flag then
											character2 = localPlayer.Character
											humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
											continue
										end
									end
								end
							else
								exitTo = 1
								break
							end

							break
						end

						if exitTo == 1 then
							fn50(combat.antiInputDelayStep)
							flag = not _G.AntiInputLag or not v2 or not v2.Parent or arg ~= combat.antiInputLagRunId
							if not flag then
								continue
							end
						else
							if exitTo == 2 then
								tick()
								fn57(v2)
								v2 = nil
							elseif exitTo == 3 then
								fn57(v2)
								v2 = nil
							elseif exitTo == 4 then
								fn57(v2)
								v2 = nil
							elseif exitTo == 5 then
								fn57(v2)
								v2 = nil
							elseif exitTo == 6 then
								fn57(v2)
								v2 = nil
							end

							break
						end

						break
					end
				end
			end
		end
	end)
end

local function fn60(arg)
	if not _G.AntiInputLag then
		return
	end
	combat.antiInputLagRunId = combat.antiInputLagRunId + 1

	if arg then
		fn53()
		fn23()
	end

	fn59(combat.antiInputLagRunId)
end

local function setAntiInputLagEnabled(antiInputLag)
	_G.AntiInputLag = antiInputLag
	combat.antiInputLagRunId = combat.antiInputLagRunId + 1

	if not antiInputLag then
		fn53()
		fn23()

		if protection.antiInputEndGrabEarlyWatcherConnection then
			protection.antiInputEndGrabEarlyWatcherConnection:Disconnect()
			protection.antiInputEndGrabEarlyWatcherConnection = nil
		end

		return
	end

	fn45()
	fn51()
	fn59(combat.antiInputLagRunId)
end

local n = 0
local n2 = 0.5
local tbl2 = { Flying = true, Falling = true, Position = true, Velocity = true }

local function setAutoResetEnabled(autoReset)
	_G.AutoReset = autoReset

	if protection.autoResetConnection then
		protection.autoResetConnection:Disconnect()
		protection.autoResetConnection = nil
	end

	if not autoReset or not gameCorrectionsNotifyEvent then
		return
	end

	protection.autoResetConnection = gameCorrectionsNotifyEvent.OnClientEvent:Connect(function(arg)
		warn("[krampus] GameCorrectionsNotify | reason: " .. tostring(arg))
		if not tbl2[arg] then
			return
		end
		local now = tick()
		if now - n < n2 then
			return
		end

		n = now
		;(tbl.notify or notify)("krampus", "kick frame detected... resetting!", 4)
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		pcall(forceReleaseHeldInventoryAndGrab)

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(destroyGrabLineEvent, humanoidRootPart)
			end)
		end

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(setNetworkOwnerEvent, humanoidRootPart, humanoidRootPart.CFrame)
			end)
		end

		if character then
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant.Name == "PartOwner" and descendant:IsA("StringValue") then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		if character then
			for _, child in ipairs(character:GetChildren()) do
				if child:IsA("BasePart") then
					child.Anchored = false
					child.AssemblyLinearVelocity = Vector3.zero
					child.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end

		if humanoid then
			pcall(function()
				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)

			pcall(function()
				safeFireRemote(ragdollRemoteEvent, humanoidRootPart, 0)
			end)
		end

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(struggleEvent, localPlayer)
			end)
		end

		if isHeldValue then
			pcall(function()
				isHeldValue.Value = false
			end)
		end

		local character2 = localPlayer.Character
		character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

		if character2 then
			character2.Health = 0
		end
	end)
end

local function fn61()
	if protection.floatSteppedConnection then
		return
	end

	protection.floatSteppedConnection = runService.Stepped:Connect(function()
		local ok, result = pcall(function()
			local character = localPlayer.Character
			if not character then
				return
			end

			for _, child in pairs(character:GetChildren()) do
				if child:IsA("BasePart") and child.CanCollide then
					child.CanCollide = false
				end
			end
		end)

		if not ok then
			warn("Noclip stepped error:", result)
		end
	end)
end

local function fn62()
	if protection.floatSteppedConnection then
		protection.floatSteppedConnection:Disconnect()
		protection.floatSteppedConnection = nil
	end
end

local function clickTeleport()
	local localPlayer2 = game.Players.LocalPlayer
	local character = localPlayer2.Character or localPlayer2.CharacterAdded
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	local currentCamera = workspace.CurrentCamera
	if not (character and humanoidRootPart and currentCamera) then
		return
	end
	local v2, v3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(currentCamera.CFrame.Position, currentCamera.CFrame.LookVector * 5000), { character })

	if v2 and v3 then
		local cframe = CFrame.new(v3 + Vector3.new(0, 5, 0))

		if not slide_tp_en then
			humanoidRootPart.CFrame = cframe
		else
			local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
			game:GetService("TweenService"):Create(humanoidRootPart, tweenInfo, { CFrame = cframe }):Play()
		end

		task.spawn(function()
			for i = 1, 5 do
				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.Velocity = Vector3.zero
						descendant.RotVelocity = Vector3.zero
					end
				end

				task.wait()
			end
		end)
	end
end

protection.applyAntiBarrierState = function(arg)
	local plots = workspace:FindFirstChild("Plots")
	if not plots then
		return
	end

	for _, child in ipairs(plots:GetChildren()) do
		local barrier = child:FindFirstChild("Barrier")

		if barrier then
			for _, child2 in ipairs(barrier:GetChildren()) do
				if child2:IsA("BasePart") then
					child2.CanCollide = not arg
				end
			end
		end
	end
end

protection.setAntiBarrierEnabled = function(antiBarrierEnabled)
	if protection.antiBarrierConnection then
		protection.antiBarrierConnection:Disconnect()
		protection.antiBarrierConnection = nil
	end

	protection.antiBarrierEnabled = antiBarrierEnabled
	protection.applyAntiBarrierState(antiBarrierEnabled)
	if not antiBarrierEnabled then
		return
	end

	protection.antiBarrierConnection = workspace.DescendantAdded:Connect(function(descendant)
		if not protection.antiBarrierEnabled then
			return
		end

		if descendant:IsA("BasePart") and descendant.Parent and descendant.Parent.Name == "Barrier" then
			descendant.CanCollide = false
		end
	end)
end

protection.setLoopTpEnabled = function(loopTpEnabled)
	protection.loopTpEnabled = loopTpEnabled
	protection.loopTpRunId = protection.loopTpRunId + 1
	local loopTpRunId = protection.loopTpRunId
	local character = localPlayer.Character
	character = character and character:FindFirstChild("HumanoidRootPart")

	if loopTpEnabled then
		local v2 = protection
		character = character and character.CFrame or protection.loopTpOrigin
		v2.loopTpOrigin = character

		task.delay(0.1, function()
			while protection.loopTpEnabled and loopTpRunId == protection.loopTpRunId do
				local character2 = localPlayer.Character
				character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
				local loopTpOrigin = protection.loopTpOrigin

				if character2 and loopTpOrigin then
					local random = math.random
					character2.CFrame = loopTpOrigin * CFrame.new(math.random(-1000, 1000), 0, random(-1000, 1000))
					fn18(character2)
				end

				task.wait(0.05)
			end
		end)
	elseif character and protection.loopTpOrigin then
		fn18(character)

		task.defer(function()
			local character2 = localPlayer.Character
			character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

			if character2 and protection.loopTpOrigin then
				character2.CFrame = protection.loopTpOrigin
				fn18(character2)
			end
		end)
	end
end

protection.setLoopHouseTpEnabled = function(loopHouseTpEnabled)
	protection.loopHouseTpEnabled = loopHouseTpEnabled
	protection.loopHouseTpRunId = protection.loopHouseTpRunId + 1
	local loopHouseTpRunId = protection.loopHouseTpRunId

	local tbl3 = {
		Vector3.new(541, 96, -390),
		Vector3.new(605, 140, -124),
		Vector3.new(282, 1, 517),
		Vector3.new(-592, 11, 114),
		Vector3.new(-551, 12, -151),
	}

	local character = localPlayer.Character
	character = character and character:FindFirstChild("HumanoidRootPart")

	if loopHouseTpEnabled then
		local v2 = protection
		character = character and character.CFrame or protection.loopHouseTpOrigin
		v2.loopHouseTpOrigin = character

		task.spawn(function()
			while protection.loopHouseTpEnabled and loopHouseTpRunId == protection.loopHouseTpRunId do
				local character2 = localPlayer.Character
				character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if character2 then
					protection.loopHouseTpIndex = protection.loopHouseTpIndex % #tbl3 + 1
					character2.CFrame = CFrame.new(tbl3[protection.loopHouseTpIndex])
					fn18(character2)
				end

				task.wait()
			end
		end)
	elseif character and protection.loopHouseTpOrigin then
		fn18(character)

		task.defer(function()
			local character2 = localPlayer.Character
			character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

			if character2 and protection.loopHouseTpOrigin then
				character2.CFrame = protection.loopHouseTpOrigin
				fn18(character2)
			end
		end)
	end
end

dialogueFunction2 = function()
	fn61()
end

dialogueFunction1 = function()
	if not _G.NoclipToggle and not _G.noclip then
		fn62()
	end
end

local function enableAntiVoid()
	if protection.antiVoidConnection then
		protection.antiVoidConnection:Disconnect()
	end

	protection.antiVoidConnection = runService.Heartbeat:Connect(function()
		local character = localPlayer.Character

		if character and character.PrimaryPart then
			local position = character.PrimaryPart.Position

			if position.Y > 700 or position.Y < -200 or position.X > 8000 or position.X < -8000 or position.Z > 8000 or position.Z < -8000 then
				character:SetPrimaryPartCFrame(CFrame.new(0, 5, 0))
				character.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

local function disableAntiVoid()
	if protection.antiVoidConnection then
		protection.antiVoidConnection:Disconnect()
		protection.antiVoidConnection = nil
	end
end

local function setWaterWalk(arg)
	protection.waterParts = {}

	local ok, result = pcall(function()
		return workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel
	end)

	if ok and result then
		for _, child in pairs(result:GetChildren()) do
			if child:IsA("BasePart") then
				table.insert(protection.waterParts, { part = child, originalCollide = child.CanCollide })
			end
		end
	end

	for _, waterPart in pairs(protection.waterParts) do
		if waterPart.part and waterPart.part.Parent then
			waterPart.part.CanCollide = arg and true or waterPart.originalCollide
		end
	end
end

local function fn63()
	if flags.SuperSpeed then
		combat.multiplier = (_G.SpeedValue or 16) * 0.01
	else
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if character then
			character.WalkSpeed = 16
		end

		combat.multiplier = 0.16
	end

	if refreshLocalPlayerPanel then
		pcall(refreshLocalPlayerPanel)
	end
end

protection.revealThirdPersonCharacter = function(instance4)
	if not instance4 then
		return
	end

	for _, child in ipairs(instance4:GetChildren()) do
		if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" and child.Name ~= "CamPart" then
			pcall(function()
				child.Transparency = 0
			end)
		elseif child:IsA("Accessory") and child.Name ~= "TypingKeyboardMyWorld" then
			local basePart = child:FindFirstChildWhichIsA("BasePart")

			if basePart then
				pcall(function()
					basePart.Transparency = 0
				end)
			end
		end
	end
end

local function fn64()
	local character = localPlayer.Character
	local currentCamera = workspace.CurrentCamera
	if not (character and currentCamera) then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 3)
	if not humanoid then
		return
	end
	protection.thirdPersonRunId = protection.thirdPersonRunId + 1
	local thirdPersonRunId = protection.thirdPersonRunId
	protection.revealThirdPersonCharacter(character)
	localPlayer.CameraMode = Enum.CameraMode.Classic
	currentCamera.CameraType = Enum.CameraType.Custom
	currentCamera.CameraSubject = humanoid
	localPlayer.CameraMaxZoomDistance = 100000
	localPlayer.CameraMinZoomDistance = 0.5

	task.spawn(function()
		while flags.thirdPerson and thirdPersonRunId == protection.thirdPersonRunId do
			protection.revealThirdPersonCharacter(localPlayer.Character)
			task.wait(0.1)
		end
	end)
end

local function fn65()
	protection.thirdPersonRunId = protection.thirdPersonRunId + 1
	localPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	localPlayer.CameraMaxZoomDistance = 0
	localPlayer.CameraMinZoomDistance = 0
	local character = localPlayer.Character
	local currentCamera = workspace.CurrentCamera
	if not (character and currentCamera) then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid") or character:WaitForChild("Humanoid", 3)
	if not humanoid then
		return
	end
	currentCamera.CameraType = Enum.CameraType.Custom
	currentCamera.CameraSubject = humanoid
end

local function applyThirdPersonState()
	if flags.thirdPerson then
		fn64()
	else
		fn65()
	end
end

local function fn66()
	if jerk.label and jerk.label.Parent then
		return true
	end
	local playerGui = localPlayer:FindFirstChild("PlayerGui")
	if not playerGui then
		return false
	end
	jerk.gui = playerGui:FindFirstChild("JerkOffGui")

	if not jerk.gui then
		jerk.gui = Instance.new("ScreenGui")
		jerk.gui.Name = "JerkOffGui"
		jerk.gui.ResetOnSpawn = false
		jerk.gui.Parent = playerGui
	end

	jerk.label = jerk.gui:FindFirstChild("JerkLabel")

	if not jerk.label then
		jerk.label = Instance.new("TextLabel")
		jerk.label.Name = "JerkLabel"
		jerk.label.Parent = jerk.gui
		jerk.label.Size = UDim2.new(0.1, 0, 0.015, 0)
		jerk.label.Position = UDim2.new(0.458, 0, 0.477, 0)
		jerk.label.Text = "Jerk"
		jerk.label.TextStrokeColor3 = Color3.new(0, 0, 0)
		jerk.label.BackgroundTransparency = 1
		jerk.label.TextScaled = true
		jerk.label.TextColor3 = Color3.fromRGB(255, 255, 255)
		jerk.label.TextStrokeTransparency = 0
	end

	jerk.label.Visible = false
	return true
end

local function fn67()
	if jerk.track then
		pcall(function()
			jerk.track:Stop()
		end)
	end
end
-- Source Leak (SL) | https://discord.gg/x7YbZeezpm

local function fn68()
	local character = localPlayer.Character
	if not character then
		return
	end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return
	end
	local animator = humanoid:FindFirstChildOfClass("Animator")

	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = humanoid
	end

	fn67()
	jerk.track = animator:LoadAnimation(jerkAnimation)
	jerk.track:Play()
end

local function fn69()
	jerk.loopToken = jerk.loopToken + 1
	local loopToken = jerk.loopToken

	task.spawn(function()
		while jerk.enabled and loopToken == jerk.loopToken do
			if jerk.track and jerk.track.IsPlaying then
				jerk.track.TimePosition = 0.3
			end

			task.wait(0.1)
		end
	end)
end

local function fn70()
	if jerk.enabled then
		return
	end
	jerk.enabled = true

	if fn66() and jerk.label then
		jerk.label.Visible = true
	end

	fn68()
	fn69()
end

local function fn71()
	if not jerk.enabled then
		return
	end
	jerk.enabled = false
	jerk.loopToken = jerk.loopToken + 1

	if jerk.label then
		jerk.label.Visible = false
	end

	fn67()
end

local function toggleJerk()
	if jerk.enabled then
		fn71()
	else
		fn70()
	end
end

runService.Heartbeat:Connect(function()
	if flags.SuperSpeed then
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildOfClass("Humanoid")

		if humanoidRootPart and character then
			humanoidRootPart.CFrame = humanoidRootPart.CFrame + character.MoveDirection * combat.multiplier
		end
	end
end)

mouse.KeyDown:Connect(function(arg)
	local lowered = string.lower(arg):byte()

	if lowered == 32 then
		input.spaceHeld = true
	elseif lowered == 119 then
		input.moveForward = true
	elseif lowered == 115 then
		input.moveBackward = true
	elseif lowered == 97 then
		input.moveLeft = true
	elseif lowered == 100 then
		input.moveRight = true
	end
end)

mouse.KeyUp:Connect(function(arg)
	local lowered2 = string.lower(arg):byte()

	if lowered2 == 32 then
		input.spaceHeld = false
	elseif lowered2 == 119 then
		input.moveForward = false
	elseif lowered2 == 115 then
		input.moveBackward = false
	elseif lowered2 == 97 then
		input.moveLeft = false
	elseif lowered2 == 100 then
		input.moveRight = false
	end
end)

runService.RenderStepped:Connect(function()
	if flags.infinjump and input.spaceHeld then
		local character = localPlayer.Character

		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				local cFrame = workspace.CurrentCamera.CFrame
				local unit = Vector3.new(cFrame.LookVector.X, 0, cFrame.LookVector.Z).Unit
				local unit2 = Vector3.new(cFrame.RightVector.X, 0, cFrame.RightVector.Z).Unit
				local infiniteJumpMoveSpeed = input.infiniteJumpMoveSpeed
				local vector = Vector3.zero

				if input.moveForward then
					vector = Vector3.zero + unit * infiniteJumpMoveSpeed
				end

				if input.moveBackward then
					vector -= unit * infiniteJumpMoveSpeed
				end

				if input.moveLeft then
					vector -= unit2 * infiniteJumpMoveSpeed
				end

				if input.moveRight then
					vector += unit2 * infiniteJumpMoveSpeed
				end

				local z = vector.Z
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, math.max(humanoidRootPart.AssemblyLinearVelocity.Y, input.infiniteJumpLift), z)
			end
		end
	end
end)

if localPlayer.Character then
	applyThirdPersonState()

	if flags.noclip then
		fn61()
	end

	if flags.PCLDBreakAntiKick then
		task.spawn(antiKick.startPCLDBreak)
	end

	if flags.AntiKick then
		task.spawn(antiKick.start)
	end
end

localPlayer.CharacterAdded:Connect(function(character)
	protection.antiBanannaLoopToken = protection.antiBanannaLoopToken + 1
	local pcldBreakPendingRespawnKill = flags.PCLDBreakAntiKick and antiKick.pcldBreakPendingRespawnKill
	task.wait(0.1)

	if not pcldBreakPendingRespawnKill then
		if flags.AntiBananna then
			task.delay(0.2, function()
				local antiBananna = flags.AntiBananna

				if antiBananna then
					antiBananna = not (flags.PCLDBreakAntiKick and antiKick.pcldBreakPendingRespawnKill)
				end

				if antiBananna then
					fn39()
				end
			end)
		end

		applyThirdPersonState()

		if flags.SuperSpeed then
			task.wait(0.5)
			fn63()
		end

		if protection.antiVoidConnection then
			task.spawn(enableAntiVoid)
		end

		if protection.walkOnWaterEnabled then
			task.delay(0.5, function()
				setWaterWalk(true)
			end)
		end

		if flags.noclip then
			fn62()
			fn61()
		end
	else
		applyThirdPersonState()
	end

	if flags.PCLDBreakAntiKick then
		if antiKick.pcldBreakAwaitingExternalDeath and antiKick.notify then
			antiKick.notify("krampus", "pcld broken successfully!", 3)
		end

		task.spawn(function()
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 3)

			if humanoidRootPart then
				for i = 1, 5 do
					pcall(function()
						safeFireRemote(setNetworkOwnerEvent, humanoidRootPart, humanoidRootPart.CFrame)
					end)
				end

				pcall(function()
					safeFireRemote(struggleEvent, localPlayer)
				end)

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							safeFireRemote(setNetworkOwnerEvent, descendant, descendant.CFrame)
						end)
					end
				end

				pcall(function()
					safeFireRemote(struggleEvent, localPlayer)
				end)
			end
		end)

		antiKick.monitorPCLDBreakLocalCharacter(character)

		if antiKick.pcldBreakPendingRespawnKill then
			antiKick.armPCLDBreakForCharacter(character, 0)
		elseif antiKick.pcldBreakPendingExternalTrigger then
			antiKick.triggerPCLDBreakFromExternalDeath()
		end
	end

	if flags.AntiKick then
		task.delay(0.2, function()
			if flags.AntiKick then
				antiKick.start()
			end
		end)
	end

	if jerk.enabled then
		task.wait(0.1)
		fn68()
	end
end)

userInputService.InputBegan:Connect(function(input2, gameProcessed)
	if gameProcessed then
		return
	end

	if input2.UserInputType ~= Enum.UserInputType.Keyboard then
		return
	end
	local keyCode = input2.KeyCode

	if keybind.walkspeedKey and keyCode == keybind.walkspeedKey then
		_G.SuperSpeed = not _G.SuperSpeed
		fn63()
	end

	if keybind.thirdPersonKey and keyCode == keybind.thirdPersonKey then
		_G.thirdPerson = not _G.thirdPerson
		applyThirdPersonState()
	end

	if keybind.loopTpKey and keyCode == keybind.loopTpKey then
		protection.setLoopTpEnabled(not protection.loopTpEnabled)
	end

	if keybind.quickBlobKey and keyCode == keybind.quickBlobKey then
		task.spawn(function()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			character = character and character:FindFirstChildOfClass("Humanoid")
			if not (humanoidRootPart and character) then
				return
			end
			local CreatureBlobman = antiKick.spawnToyExact("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 0, -5), antiKick.getPlot())
			if not CreatureBlobman then
				return
			end
			local vehicleSeat = CreatureBlobman:WaitForChild("VehicleSeat", 5)
			if not vehicleSeat then
				return
			end
			vehicleSeat:Sit(character)
		end)
	end

	if keyCode == Enum.KeyCode.Q then
		toggleJerk()
	elseif keyCode == Enum.KeyCode.Z then
		clickTeleport()
	end
end)

local function teardownFurtherExtend()
	if combat.extendFollowConnection then
		combat.extendFollowConnection:Disconnect()
		combat.extendFollowConnection = nil
	end

	if combat.activeExtendBaseDragPart and combat.activeExtendBaseDragPart.Parent then
		local alignPosition = combat.activeExtendBaseDragPart:FindFirstChild("AlignPosition")

		if alignPosition then
			alignPosition.Enabled = true
		end
	end

	if combat.activeExtendDragPart and combat.activeExtendDragPart.Parent and combat.activeExtendDragPart.Name == "DragPart1" then
		combat.activeExtendDragPart:Destroy()
	end

	combat.activeExtendGrabModel = nil
	combat.activeExtendDragPart = nil
	combat.activeExtendBaseDragPart = nil
	combat.pcDistance = 0
end

local function fn72(arg)
	if not arg then
		return nil
	end
	local grabPart = arg:FindFirstChild("GrabPart") or arg:WaitForChild("GrabPart", 2)
	grabPart = grabPart and grabPart:FindFirstChild("WeldConstraint")
	return grabPart and grabPart.Part1 or nil
end

local function fn73()
	if not (_G.FutherExtend and combat.activeExtendDragPart and combat.activeExtendDragPart.Parent) then
		return
	end
	local currentCamera = workspace.CurrentCamera
	if not currentCamera then
		return
	end
	combat.activeExtendDragPart.Position = currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * math.max(combat.pcDistance, combat.minimumExtendDistance)
end

local function setupFurtherExtend(activeExtendGrabModel)
	if not activeExtendGrabModel or not userInputService.MouseEnabled then
		return
	end
	teardownFurtherExtend()
	combat.activeExtendGrabModel = activeExtendGrabModel
	combat.activeExtendBaseDragPart = activeExtendGrabModel:FindFirstChild("DragPart") or activeExtendGrabModel:WaitForChild("DragPart", 2)
	_G.RealGrabParts = activeExtendGrabModel
	_G.HoldingObjectGrabPart = fn72(activeExtendGrabModel)
	if not combat.activeExtendBaseDragPart then
		return
	end
	combat.activeExtendDragPart = combat.activeExtendBaseDragPart:Clone()
	combat.activeExtendDragPart.Name = "DragPart1"

	if combat.activeExtendDragPart:FindFirstChild("AlignPosition") and combat.activeExtendDragPart:FindFirstChild("DragAttach") then
		combat.activeExtendDragPart.AlignPosition.Attachment1 = combat.activeExtendDragPart.DragAttach
	end

	combat.activeExtendDragPart.Parent = activeExtendGrabModel

	if workspace.CurrentCamera then
		combat.pcDistance = (combat.activeExtendDragPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
	else
		combat.pcDistance = combat.minimumExtendDistance
	end

	combat.pcDistance = math.max(combat.pcDistance, combat.minimumExtendDistance)
	local alignOrientation = combat.activeExtendDragPart:FindFirstChild("AlignOrientation")

	if alignOrientation then
		alignOrientation.Enabled = false
	end

	local alignPosition = combat.activeExtendBaseDragPart:FindFirstChild("AlignPosition")

	if alignPosition then
		alignPosition.Enabled = false
	end

	combat.extendFollowConnection = runService.Heartbeat:Connect(function()
		if not _G.FutherExtend then
			teardownFurtherExtend()
			return
		end

		if not (combat.activeExtendGrabModel and combat.activeExtendGrabModel.Parent) then
			teardownFurtherExtend()
			return
		end
		fn73()
	end)
end

local function handleNewGrabModel(realGrabParts)
	if realGrabParts.Name ~= "GrabParts" then
		return
	end
	local v2 = fn72(realGrabParts)
	local dragPart = realGrabParts:FindFirstChild("DragPart") or realGrabParts:WaitForChild("DragPart", 2)

	if not realGrabParts:GetAttribute("Fake") then
		_G.RealGrabParts = realGrabParts
	end

	_G.HoldingObjectGrabPart = v2
	if not v2 then
		return
	end

	if _G.FutherExtend then
		setupFurtherExtend(realGrabParts)
	end

	if _G.SuperFlingEnabled and v2 then
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Name = flingVelocityName
		bodyVelocity.MaxForce = Vector3.zero
		bodyVelocity.Velocity = Vector3.zero
		bodyVelocity.Parent = v2

		task.spawn(function()
			if not bodyVelocity or not bodyVelocity.Parent then
				return
			end
			local contextActionGui = localPlayer.PlayerGui:FindFirstChild("ContextActionGui")
			if not contextActionGui then
				return
			end
			local connection = nil
			local parent = nil

			while parent == nil and realGrabParts.Parent do
				for _, descendant in ipairs(contextActionGui:GetDescendants()) do
					if descendant:IsA("ImageLabel") and descendant.Image == "http://www.roblox.com/asset/?id=9603678090" then
						parent = descendant.Parent
						break
					end
				end

				task.wait()
			end

			if not parent then
				return
			end
			parent.Active = true

			local connection2 = parent.MouseButton1Down:Connect(function()
				local currentCamera = workspace.CurrentCamera
				if not currentCamera then
					return
				end
				bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyVelocity.Velocity = currentCamera.CFrame.LookVector * _G.FlingStrength
			end)

			connection = realGrabParts:GetPropertyChangedSignal("Parent"):Connect(function()
				if not realGrabParts.Parent then
					debris:AddItem(bodyVelocity, 1)

					if connection2 then
						connection2:Disconnect()
					end

					if connection then
						connection:Disconnect()
					end
				end
			end)
		end)

		task.spawn(function()
			if not bodyVelocity then
				return
			end
			local connection = nil

			connection = realGrabParts:GetPropertyChangedSignal("Parent"):Connect(function()
				if not realGrabParts.Parent then
					local currentCamera = workspace.CurrentCamera
					local flag

					if currentCamera then
						local mouseButton2 = Enum.UserInputType.MouseButton2
						flag = userInputService:GetLastInputType() == mouseButton2
					else
						flag = currentCamera
					end

					if flag and _G.SuperFlingEnabled then
						bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						bodyVelocity.Velocity = currentCamera.CFrame.LookVector * _G.FlingStrength
						debris:AddItem(bodyVelocity, 1)
					elseif bodyVelocity.Parent then
						bodyVelocity:Destroy()
					end

					connection:Disconnect()
				end
			end)
		end)
	end

	if _G.MasslessGrab and dragPart then
		task.spawn(function()
			local alignOrientation = dragPart:FindFirstChild("AlignOrientation")
			local alignPosition = dragPart:FindFirstChild("AlignPosition")
			if not (alignOrientation and alignPosition) then
				return
			end
			alignOrientation.MaxTorque = math.huge
			alignOrientation.Responsiveness = 200
			alignPosition.MaxForce = math.huge
			alignPosition.Responsiveness = 200
		end)
	end

	if _G.Poison_Grab and v2 then
		task.spawn(function()
			local parent = v2.Parent
			local head = parent and parent:FindFirstChild("Head")
			parent = parent and parent:FindFirstChildOfClass("Humanoid")

			if head and parent then
				while realGrabParts.Parent and _G.Poison_Grab do
					poisonHurtPart.CFrame = head.CFrame
					poisonHurtPart2.CFrame = head.CFrame
					poisonHurtPart3.CFrame = head.CFrame
					task.wait()
					fn27()
				end
			end

			fn27()
		end)
	end

	if _G.Burn_Grab and v2 then
		task.spawn(function()
			while realGrabParts.Parent and _G.Burn_Grab do
				local parent = v2.Parent

				if parent and parent:FindFirstChildOfClass("Humanoid") and parent:FindFirstChild("HumanoidRootPart") then
					fn30(parent.HumanoidRootPart)
				elseif parent and parent:FindFirstChild("FireDetector") then
					fn30(parent.FireDetector)
				else
					fn30(v2)
				end

				task.wait()
			end
		end)
	end

	if _G.Death_Grab and v2 then
		task.spawn(function()
			local parent = v2.Parent
			parent = parent and parent:FindFirstChildOfClass("Humanoid")
			if not parent then
				return
			end

			while v2.Parent do
				local playerFromCharacter = players:GetPlayerFromCharacter(v2.Parent)

				if playerFromCharacter and fn31(playerFromCharacter) then
					parent.BreakJointsOnDeath = false
					parent:ChangeState(Enum.HumanoidStateType.Dead)
					parent.Jump = true
					parent.Sit = false

					if parent:GetStateEnabled(Enum.HumanoidStateType.Dead) then
						safeFireRemote(destroyGrabLineEvent, v2)
					end
				end

				task.wait()
			end
		end)
	end

	if _G.KickGrab and v2 and destroyGrabLineEvent and setNetworkOwnerEvent then
		task.spawn(function()
			if not players:GetPlayerFromCharacter(v2.Parent) then
				return
			end

			while realGrabParts.Parent and v2.Parent and _G.KickGrab do
				for i = 1, 8 do
					if realGrabParts.Parent and v2.Parent and _G.KickGrab then
						safeFireRemote(destroyGrabLineEvent, v2)
						runService.RenderStepped:Wait()
						if realGrabParts.Parent and v2.Parent and _G.KickGrab then
							safeFireRemote(setNetworkOwnerEvent, v2, v2.CFrame)
							continue
						end
					end

					break
				end
			end
		end)
	end
end

if localPlayer.Character then
	fn34(localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(function(character)
	fn34(character)
end)

workspace.ChildAdded:Connect(function(child)
	handleNewGrabModel(child)
end)

workspace.ChildRemoved:Connect(function(child)
	if child.Name == "GrabParts" and not child:GetAttribute("Fake") then
		_G.RealGrabParts = nil
		_G.HoldingObjectGrabPart = nil
		fn27()
		teardownFurtherExtend()
	end
end)

userInputService.InputChanged:Connect(function(input2)
	if not _G.FutherExtend or input2.UserInputType ~= Enum.UserInputType.MouseWheel then
		return
	end
	local holdingObjectGrabPart = _G.HoldingObjectGrabPart
	if not holdingObjectGrabPart or not holdingObjectGrabPart.Parent then
		return
	end

	if combat.pcDistance <= 0 and workspace.CurrentCamera then
		combat.pcDistance = (holdingObjectGrabPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
	end

	combat.pcDistance = math.max(combat.pcDistance, combat.minimumExtendDistance)

	if input2.Position.Z < 0 then
		combat.pcDistance = math.max(combat.minimumExtendDistance, combat.pcDistance - combat.increaseLineExtend)
	elseif input2.Position.Z > 0 then
		combat.pcDistance = combat.pcDistance + combat.increaseLineExtend
	end

	if not combat.activeExtendDragPart then
		safeFireRemote(extendGrabLineEvent, combat.pcDistance)
	end

	fn73()
end)

task.spawn(function()
	local grabParts = workspace:FindFirstChild("GrabParts")

	if grabParts then
		handleNewGrabModel(grabParts)
	end
end)

local function fn74(arg)
	if type(arg) ~= "string" then
		return arg
	end

	if arg:find("function data:SetOptions", 1, true) then
		return arg
	end

	local str, v2 = arg:gsub("(SetDropdownOptions%(%))(%s-)end(%s-)(%-%-@@Colorpicker)", "%1%2" .. [[				local function CopySelectedOrder()
					local copy = {}
					for _, option in ipairs(SelectedOrder) do
						table.insert(copy, option)
					end
					return copy
				end

				local function ClearSelectedContainer()
					local selectedContainer = dropdown.dropholder.drop.selectContainer.ScrollingFrame
					for _, child in ipairs(selectedContainer:GetChildren()) do
						if child:IsA("Frame") and child ~= selectedContainer.result then
							child:Destroy()
						end
					end
				end

				local function RefreshOptionVisuals()
					for _, optionFrame in ipairs(dropdown.dropholder.drop.Container:GetChildren()) do
						if optionFrame:IsA("Frame") and optionFrame ~= OptionButton and optionFrame:FindFirstChild("Title") then
							local isSelected = SelectedOptions[optionFrame.Name] == true
							optionFrame.Visible = true
							tweenservice:Create(optionFrame, TweenInfo.new(0.3), {
								BackgroundColor3 = isSelected and Color3.fromRGB(39, 39, 39) or Color3.fromRGB(33, 33, 33)
							}):Play()
							if optionFrame:FindFirstChild("Title") then
								tweenservice:Create(optionFrame.Title, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
							end
							if optionFrame:FindFirstChild("UIStroke") then
								tweenservice:Create(optionFrame.UIStroke, TweenInfo.new(0.3), {Transparency = isSelected and 1 or 0.5}):Play()
							end
							if optionFrame:FindFirstChild("ImageLabel") then
								tweenservice:Create(optionFrame.ImageLabel, TweenInfo.new(0.3), {ImageTransparency = isSelected and 0 or 0.9}):Play()
							end
						end
					end
					UpdateCustomLayout()
				end

				function data:Get()
					if data.Multi then
						return CopySelectedOrder()
					end
					return SelectedOrder[1]
				end

				function data:Set(value, suppressCallback)
					local requested = {}
					local requestedLookup = {}
					if data.Multi then
						if type(value) == "table" then
							for _, option in ipairs(value) do
								if type(option) == "string" and table.find(data.Options, option) and not requestedLookup[option] then
									requestedLookup[option] = true
									table.insert(requested, option)
								end
							end
						elseif type(value) == "string" and table.find(data.Options, value) then
							requestedLookup[value] = true
							table.insert(requested, value)
						end
					else
						local option = type(value) == "table" and value[1] or value
						if type(option) == "string" and table.find(data.Options, option) then
							requested = {option}
						end
					end

					SelectedOptions = {}
					SelectedOrder = {}
					for _, option in ipairs(requested) do
						if not SelectedOptions[option] then
							SelectedOptions[option] = true
							table.insert(SelectedOrder, option)
						end
					end

					ClearSelectedContainer()
					UpdateSelectedText()
					RefreshOptionVisuals()

					if dropdown.dropholder.drop.search.TextBox.Text ~= "" then
						dropdown.dropholder.drop.search.TextBox.Text = ""
					end

					if not suppressCallback and data.CallBack then
						if data.Multi then
							data.CallBack(CopySelectedOrder())
						else
							data.CallBack(SelectedOrder[1])
						end
					end
				end

				function data:SetOptions(newOptions, suppressCallback)
					local previousSelection = CopySelectedOrder()
					data.Options = newOptions or {}

					for _, child in ipairs(dropdown.dropholder.drop.Container:GetChildren()) do
						if child:IsA("Frame") and child ~= OptionButton then
							child:Destroy()
						end
					end

					ClearSelectedContainer()
					SelectedOptions = {}
					SelectedOrder = {}
					SetDropdownOptions()

					local selectionToRestore = previousSelection
					if #selectionToRestore == 0 then
						selectionToRestore = CopySelectedOrder()
					end
					data:Set(data.Multi and selectionToRestore or selectionToRestore[1], true)

					if not suppressCallback and data.CallBack then
						if data.Multi then
							data.CallBack(CopySelectedOrder())
						else
							data.CallBack(SelectedOrder[1])
						end
					end
				end

				return data
%2end%3%4]], 1)

	if v2 == 0 then
		warn("[Syde] Failed to patch dropdown support; using unmodified source.")
		return arg
	end
	return str
end

local ntfsnd = game:GetService("CoreGui"):FindFirstChild("ntfsnd") or Instance.new("Sound", game:GetService("CoreGui"))
ntfsnd.Name = "ntfsnd"
ntfsnd.Volume = 1
local HttpService = game:GetService("HttpService")
local byName = {}
local tbl4 = {}

for _, item9 in ipairs({
	{ Name = "default", Id = 104854281705720 },
	{ Name = "gta v", Id = 134607004949887 },
	{ Name = "steam achivement", Id = 78959439349986 },
	{ Name = "steam message", Id = 139308638407157 },
	{ Name = "ULTRAKILL coin", Id = 132653076390131 },
	{ Name = "discord", Id = 126873089809799 },
	{ Name = "rust headshot", Id = 128633263668964 },
	{ Name = "resonance start", Id = 71450094482101 },
	{ Name = "gmod interact", Id = 139240458938746 },
	{ Name = "gmod button", Id = 18755588842 },
	rl,
}) do
	byName[item9.Name] = item9.Id
	table.insert(tbl4, item9.Name)
end

local str = "krampus/config.json"
local str2 = "default"
local n3 = 50
combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(combat.antiInputDelayStep)

local function fn75()
	if not isfolder("krampus") then
		makefolder("krampus")
	end
end

local function fn76(arg)
	if type(arg) ~= "number" then
		return math.clamp(n3, 0, 100)
	end
	return math.clamp(arg, 0, 100)
end

local function fn77()
	fn75()

	local ok, result = pcall(function()
		writefile(str, HttpService:JSONEncode({
			notifsnd = str2,
			notifvol = n3,
			antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(combat.antiInputDelayStep),
			antiInputHoldable = tbl.State.SelectedAntiInputLagOption,
			antiKickToy = tbl.State.SelectedAntiKickToyOption,
			flingStrength = _G.FlingStrength,
			speedValue = _G.SpeedValue,
			increaseLineExtend = combat.increaseLineExtend,
			antiGrabDuration = combat.antiGrabRagdollDuration,
			kickAuraRadius = _G.KickAuraRadius,
			unstickRadius = aura.unstickRadius,
			antiGrab = _G.AntiGrab,
			antiKick = _G.AntiKick,
			antiBananna = _G.AntiBananna,
			antiBlobman = _G.AntiBlobman,
			antiInputLag = _G.AntiInputLag,
			antiLag = _G.AntiLag,
			autoReset = _G.AutoReset,
			antiVoid = protection.antiVoidConnection ~= nil,
			waterWalk = protection.walkOnWaterEnabled,
			gucci = _G.GucciEnabled,
			superFling = _G.SuperFlingEnabled,
			furtherExtend = _G.FutherExtend,
			poisonGrab = _G.Poison_Grab,
			burnGrab = _G.Burn_Grab,
			deathGrab = _G.Death_Grab,
			kickGrab = _G.KickGrab,
			masslessGrab = _G.MasslessGrab,
			antiBarrier = protection.antiBarrierEnabled,
			poisonAura = _G.Poison_Aura,
			attractionAura = _G.AttractionAura,
			deathAura = _G.DeathAura,
			kickAura = _G.KickAura,
			unstickAura = _G.UnstickAura,
			noclip = _G.noclip,
			infiniteJump = _G.infinjump,
			superSpeed = _G.SuperSpeed,
			thirdPerson = _G.thirdPerson,
			espNames = esp.showNames,
			espRainbow = esp.rainbow,
			pcldESP = esp.pcldEnabled,
			antiKickESP = esp.antiKickESPEnabled,
		}))
	end)

	if not ok then
		warn("failed to save config:", result)
	end
end

local function fn78()
	fn75()
	if not isfile(str) then
		fn77()
		return
	end
	local ok, result = pcall(readfile, str)

	if not ok or not result then
		warn("failed to read config")
		fn77()
		return
	end

	local ok2, result2 = pcall(function()
		return HttpService:JSONDecode(result)
	end)

	if not ok2 or type(result2) ~= "table" then
		warn("failed to parse config")
		fn77()
		return
	end

	if type(result2.notifsnd) == "string" and byName[result2.notifsnd] then
		str2 = result2.notifsnd
	end

	if type(result2.notifvol) == "number" then
		n3 = fn76(result2.notifvol)
	elseif type(result2.notifvol) == "string" then
		local num = tonumber(result2.notifvol)

		if num then
			n3 = fn76(num)
		end
	end

	if type(result2.antiInputDelayStep) == "number" then
		combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(result2.antiInputDelayStep)
	elseif type(result2.antiInputDelayStep) == "string" then
		local num = tonumber(result2.antiInputDelayStep)

		if num then
			combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(num)
		end
	elseif type(result2.antiInputDelayMs) == "number" then
		combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(math.floor(result2.antiInputDelayMs / 10 + 0.5))
	elseif type(result2.antiInputDelayMs) == "string" then
		local num = tonumber(result2.antiInputDelayMs)

		if num then
			combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(math.floor(num / 10 + 0.5))
		end
	end

	if type(result2.antiInputHoldable) == "string" then
		tbl.Functions.setSelectedAntiInputLagOption(result2.antiInputHoldable)
	end

	if type(result2.antiKickToy) == "string" then
		local v2 = tbl.Constants.AntiKickToyOptions[result2.antiKickToy]

		if v2 then
			tbl.State.SelectedAntiKickToyOption = result2.antiKickToy
			tbl.State.SelectedAntiKickToyName = v2
			_G.AntiKickToyOption = result2.antiKickToy
		end
	end

	local function fn79(arg, arg2)
		if type(result2[arg]) == "number" then
			arg2(result2[arg])
		end
	end

	fn79("flingStrength", function(flingStrength)
		_G.FlingStrength = flingStrength
	end)

	fn79("speedValue", function(speedValue)
		_G.SpeedValue = speedValue
		combat.multiplier = speedValue * 0.01
	end)

	fn79("increaseLineExtend", function(increaseLineExtend)
		combat.increaseLineExtend = increaseLineExtend
	end)

	fn79("antiGrabDuration", function(antiGrabRagdollDuration)
		combat.antiGrabRagdollDuration = antiGrabRagdollDuration
	end)

	fn79("kickAuraRadius", function(kickAuraRadius)
		_G.KickAuraRadius = kickAuraRadius
	end)

	fn79("unstickRadius", function(unstickRadius)
		aura.unstickRadius = unstickRadius
	end)
	--[[ 𝐒𝐋 :: discord.gg/x7YbZeezpm ]]

	local function fn80(arg, arg2)
		if type(result2[arg]) == "boolean" then
			return result2[arg]
		end
		return arg2
	end

	_G.AntiGrab = fn80("antiGrab", _G.AntiGrab)
	_G.AntiKick = fn80("antiKick", _G.AntiKick)
	_G.AntiBananna = fn80("antiBananna", _G.AntiBananna)
	_G.AntiBlobman = fn80("antiBlobman", _G.AntiBlobman)
	_G.AntiInputLag = fn80("antiInputLag", _G.AntiInputLag)
	_G.AntiLag = fn80("antiLag", _G.AntiLag)
	_G.AutoReset = fn80("autoReset", _G.AutoReset)
	_G.GucciEnabled = fn80("gucci", false)
	gucciToggleValue = _G.GucciEnabled
	_G.SuperFlingEnabled = fn80("superFling", _G.SuperFlingEnabled)
	_G.FutherExtend = fn80("furtherExtend", _G.FutherExtend)
	_G.Poison_Grab = fn80("poisonGrab", _G.Poison_Grab)
	_G.Burn_Grab = fn80("burnGrab", _G.Burn_Grab)
	_G.Death_Grab = fn80("deathGrab", _G.Death_Grab)
	_G.KickGrab = fn80("kickGrab", _G.KickGrab)
	_G.MasslessGrab = fn80("masslessGrab", _G.MasslessGrab)
	_G.Poison_Aura = fn80("poisonAura", _G.Poison_Aura)
	_G.AttractionAura = fn80("attractionAura", _G.AttractionAura)
	_G.DeathAura = fn80("deathAura", _G.DeathAura)
	_G.KickAura = fn80("kickAura", _G.KickAura)
	_G.UnstickAura = fn80("unstickAura", _G.UnstickAura)
	_G.noclip = fn80("noclip", _G.noclip)
	_G.NoclipToggle = _G.noclip
	_G.infinjump = fn80("infiniteJump", _G.infinjump)
	_G.SuperSpeed = fn80("superSpeed", _G.SuperSpeed)
	_G.thirdPerson = fn80("thirdPerson", _G.thirdPerson)
	esp.showNames = fn80("espNames", esp.showNames)
	esp.rainbow = fn80("espRainbow", esp.rainbow)
	esp.pcldEnabled = fn80("pcldESP", esp.pcldEnabled)
	esp.antiKickESPEnabled = fn80("antiKickESP", false)

	if _G.AntiKick then
		task.spawn(antiKick.start)
	end

	if _G.AntiGrab then
		if isHeldValue and isHeldValue.Value then
			fn36()
		end

		safeFireRemote(struggleEvent, localPlayer)
	end

	if _G.AntiBananna then
		task.spawn(function()
			fn40(true)
		end)
	end

	if _G.AntiBlobman then
		task.spawn(function()
			fn42(true)
		end)
	end

	if _G.AntiInputLag then
		task.spawn(function()
			setAntiInputLagEnabled(true)
		end)
	end

	if _G.AntiLag then
		task.spawn(function()
			fn43(true)
		end)
	end

	if _G.AutoReset then
		task.spawn(function()
			setAutoResetEnabled(true)
		end)
	end

	if result2.antiVoid then
		task.spawn(enableAntiVoid)
	end

	if result2.waterWalk then
		protection.walkOnWaterEnabled = true

		task.spawn(function()
			setWaterWalk(true)
		end)
	end

	if result2.antiBarrier then
		task.spawn(function()
			protection.setAntiBarrierEnabled(true)
		end)
	end

	if _G.noclip then
		task.spawn(fn61)
	end

	if _G.MasslessGrab then
		fn33()
	end

	if esp.antiKickESPEnabled then
		task.spawn(esp.refreshAntiKickToys)
	end

	if _G.GucciEnabled then
		task.spawn(function()
			task.wait(1.5)

			if GiveGucci() then
				StartHeadMaintenance()
				StartRestoreMonitor()
			end
		end)
	end
	-- join us: https://discord.gg/x7YbZeezpm

	aura.updateLoopState()
	fn77()
end

fn78()
ntfsnd.SoundId = "rbxassetid://" .. byName[str2]
ntfsnd.Volume = n3 / 100

local function build()
	local ok, result = pcall(function()
		local response = game:HttpGet("https://raw.githubusercontent.com/essencejs/syde/refs/heads/main/source", true)
		local v2 = fn74(response)
		return loadstring(v2)()
	end)

	if not ok or type(result) ~= "table" then
		warn("Failed to load Syde UI:", result)
		return
	end
	local v2 = result

	pcall(function()
		local new = ColorSequenceKeypoint.new
		local color = Color3.new

		v2:UpdateTheme({
			Accent = theme.accent,
			HitBox = theme.accent,
			DropShadow = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), new(1, color(0, 0, 0)) }),
		})
	end)

	local v3 = v2:Init({
		Title = "krampus private",
		SubText = "♥ kick the almost ♥",
		Home = { Enabled = false },
		QuickActions = false,
	})

	if not v3 then
		return
	end

	local function notify2(arg, arg2, arg3)
		v2:Notify({ Title = arg, Content = arg2, Duration = arg3 or 3 })
		ntfsnd:Play()
	end

	tbl.notify = notify2
	local tbl5 = {}

	antiKick.notify = function(arg, arg2, arg3)
		local now = tick()
		if now - (tbl5[arg] or 0) < 1 then
			return
		end
		tbl5[arg] = now
		notify2(arg, arg2, arg3)
	end

	_G.alreadymarked = {}

	game:GetService("Workspace").ChildAdded:Connect(function(child)
		if child.Name == "BlackHoleKick" then
			local v4 = pairs
			local Players = game:GetService("Players")

			for _, player in v4(Players:GetPlayers()) do
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					if player.Character:FindFirstChild("HumanoidRootPart").Anchored then
						if not _G.alreadymarked[player] and player ~= localPlayer then
							_G.alreadymarked[player] = true
							notify2("krampus", string.format("%s (%s) has been kicked. shitty ass nigga", player.DisplayName, player.Name), 5)
						end
					end
				end
			end
		end
	end)

	game:GetService("Players").PlayerRemoving:Connect(function(player)
		_G.alreadymarked[player] = nil
	end)

	local function fn79()
	end

	local function fn80()
	end

	local function fn81()
	end

	local function fn82()
	end

	local function fn83()
	end

	local function fn84()
	end

	local function fn85()
	end

	local function refresh()
	end

	local function fn87(arg)
		return {
			Get = function()
				return arg and arg.V or false
			end,
			Set = function(arg2)
				if arg and arg.Set then
					arg:Set(arg2)
				end
			end,
			Raw = arg,
		}
	end

	local function fn88(arg)
		if type(arg) ~= "string" then
			return ""
		end
		return arg:match("^%s*(.-)%s*$") or ""
	end

	local function fn89(arg)
		return #arg > 0 and table.concat(arg, ", ") or "None"
	end

	local function fn90(arg)
		local v4 = fn88(arg)
		if v4 == "" then
			return nil
		end
		local str3 = v4:lower()

		for _, player in ipairs(players:GetPlayers()) do
			if player == localPlayer then
				continue
			end
			local name = player.DisplayName ~= player.Name and player.DisplayName .. " (" .. player.Name .. ")" or player.Name
			if player.Name:lower() == str3 or player.DisplayName:lower() == str3 or name:lower() == str3 then
				return player
			end
		end

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				if player.Name:lower():find(str3, 1, true) or player.DisplayName:lower():find(str3, 1, true) then
					return player
				end
			end
		end

		return nil
	end

	local function fn91(arg)
		for _, item10 in ipairs(target.playerList) do
			if item10 == arg then
				return true
			end
		end

		return false
	end

	local function fn92(arg)
		if typeof(arg) ~= "Instance" then
			arg = fn90(arg)
		end

		if not (arg and arg:IsA("Player") and arg ~= localPlayer) then
			notify2("krampus", "player not found.")
			return false
		end
		target.selectedTargetName = arg.Name

		if not fn91(arg.Name) then
			table.insert(target.playerList, arg.Name)
		end

		fn16(arg.Name)
		fn8()
		fn9()
		return true
	end

	local function fn93()
		target.playerList = {}
		target.selectedTargetName = nil
		target.loopSpamKickTarget = nil

		for k, value7 in pairs(target.targetKillCharConn) do
			pcall(function()
				value7:Disconnect()
			end)

			target.targetKillCharConn[k] = nil
		end

		fn8()
		fn9()
	end

	local function fn94(arg, arg2, arg3)
		if arg and arg.Set then
			arg:Set(table.concat(arg3, "\n"), arg2)
		end
	end

	local function fn95(arg)
		if not (arg and arg:IsA("Player") and arg ~= localPlayer) then
			return nil
		end
		return arg.DisplayName ~= arg.Name and arg.DisplayName .. " (" .. arg.Name .. ")" or arg.Name
	end

	local function fn96(arg)
		local v4 = players:FindFirstChild(arg)
		if v4 then
			return fn95(v4)
		end
		return arg
	end

	local function fn97(arg)
		if type(arg) == "table" then
			return arg
		end

		if type(arg) == "string" and arg ~= "" then
			return { arg }
		end
		return {}
	end

	local function fn98()
		local result9 = fn3()
		local tbl6 = {}

		for _, item11 in ipairs(result9) do
			tbl6[fn4(item11)] = true
		end

		for _, item12 in ipairs(target.playerList) do
			if not tbl6[item12] then
				table.insert(result9, fn96(item12))
				tbl6[item12] = true
			end
		end

		table.sort(result9)
		return result9
	end

	local function fn99()
		local tbl6 = {}

		for _, item13 in ipairs(target.playerList) do
			table.insert(tbl6, fn96(item13))
		end

		return tbl6
	end

	local function fn100()
		local tbl6 = {}
		local byName2 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				local v4 = fn95(player)

				if v4 then
					table.insert(tbl6, v4)
					byName2[player.Name] = true
				end
			end
		end

		for k in pairs(killAllWhitelist) do
			if not byName2[k] then
				table.insert(tbl6, fn96(k))
				byName2[k] = true
			end
		end

		table.sort(tbl6)
		return tbl6
	end

	local function fn101()
		local tbl6 = {}

		for k in pairs(killAllWhitelist) do
			table.insert(tbl6, fn96(k))
		end

		table.sort(tbl6)
		return tbl6
	end

	local function fn102(arg)
		local playerList = {}
		local tbl6 = {}

		for _, item14 in ipairs(fn97(arg)) do
			local v5 = fn4(item14)

			if v5 and v5 ~= localPlayer.Name and not tbl6[v5] then
				tbl6[v5] = true
				table.insert(playerList, v5)
			end
		end

		local selectedTargetName = target.selectedTargetName

		for k, value8 in pairs(target.targetKillCharConn) do
			if not tbl6[k] then
				pcall(function()
					value8:Disconnect()
				end)

				target.targetKillCharConn[k] = nil
			end
		end

		for _, item15 in ipairs(playerList) do
			fn16(item15)
		end

		target.playerList = playerList

		if selectedTargetName and tbl6[selectedTargetName] then
			target.selectedTargetName = selectedTargetName
		else
			target.selectedTargetName = playerList[#playerList] or nil
		end

		target.loopSpamKickTarget = fn5()
		fn85()
	end

	local function fn103(arg)
		local tbl6 = {}

		for _, item16 in ipairs(fn97(arg)) do
			local v5 = fn4(item16)

			if v5 and v5 ~= localPlayer.Name then
				tbl6[v5] = true
			end
		end

		for k in pairs(killAllWhitelist) do
			if not tbl6[k] then
				killAllWhitelist[k] = nil
			end
		end

		for k in pairs(tbl6) do
			killAllWhitelist[k] = true
		end

		refresh()
	end

	local v4 = v3:InitTab({ Title = "main" })
	v4:Section("reset")

	local function fn104()
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		pcall(forceReleaseHeldInventoryAndGrab)

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(destroyGrabLineEvent, humanoidRootPart)
			end)
		end

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(setNetworkOwnerEvent, humanoidRootPart, humanoidRootPart.CFrame)
			end)
		end

		if character then
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant.Name == "PartOwner" and descendant:IsA("StringValue") then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		if character then
			for _, child in ipairs(character:GetChildren()) do
				if child:IsA("BasePart") then
					child.Anchored = false
					child.AssemblyLinearVelocity = Vector3.zero
					child.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end

		if humanoid then
			pcall(function()
				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)

			pcall(function()
				safeFireRemote(ragdollRemoteEvent, humanoidRootPart, 0)
			end)
		end

		if humanoidRootPart then
			pcall(function()
				safeFireRemote(struggleEvent, localPlayer)
			end)
		end

		if isHeldValue then
			pcall(function()
				isHeldValue.Value = false
			end)
		end

		task.wait(0.1)
		local character2 = localPlayer.Character
		character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

		if character2 then
			character2.Health = 0
		end
	end

	v4:Button({
		Title = "force reset",
		Description = "escape perm death",
		CallBack = function()
			task.spawn(fn104)
			notify2("krampus", "fixing state, resetting.")
		end,
	})

	local n4 = 0

	v4:Toggle({
		Title = "loop reset",
		Value = false,
		CallBack = function(loopResetEnabled)
			n4 += 1
			local v5 = n4
			_G.LoopResetEnabled = loopResetEnabled

			if loopResetEnabled then
				task.spawn(function()
					while _G.LoopResetEnabled and n4 == v5 do
						fn104()
						local n5 = 0

						while true do
							task.wait(0.5)
							n5 += 0.1
							if not (localPlayer.Character ~= nil or n5 > 3) then
								continue
							end
							break
						end

						task.wait(0.3)
					end
				end)
			end
		end,
	})

	v4:Section("server")

	v4:Button({
		Title = "server hop",
		Description = "joins a random different server",
		CallBack = function()
			local TeleportService = game:GetService("TeleportService")
			local HttpService2 = game:GetService("HttpService")
			local placeId = game.PlaceId
			local notify3 = tbl.notify or notify2
			notify3("krampus", "searching for a server...", 3)

			task.spawn(function()
				local ok2, result2 = pcall(function()
					local tbl6 = {}
					local n5 = 0
					local str3 = ""

					while true do
						n5 += 1
						local str4 = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100"):format(placeId)

						if str3 ~= "" then
							str4 ..= "&cursor=" .. HttpService2:UrlEncode(str3)
						end

						local data = HttpService2:JSONDecode(game:HttpGet(str4))
						local v5 = ipairs
						local data2 = data.data or {}

						for _, value9 in v5(data2) do
							if value9.id ~= game.JobId and typeof(value9.id) == "string" and value9.playing and value9.maxPlayers and value9.playing > 0 and value9.playing < value9.maxPlayers then
								table.insert(tbl6, value9.id)
							end
						end

						str3 = data.nextPageCursor or ""
						if not (str3 == "" or str3 == nil or n5 >= 3) then
							continue
						end
						break
					end

					if #tbl6 == 0 then
						notify3("krampus", "no available servers found", 3)
						return
					end
					local entry4 = tbl6[math.random(1, #tbl6)]
					notify3("krampus", "teleporting... (" .. #tbl6 .. " servers found)", 3)
					local flag = false

					for i = 1, 3 do
						local ok2, result2 = pcall(function()
							TeleportService:TeleportToPlaceInstance(placeId, entry4, localPlayer)
						end)

						if ok2 then
							flag = true
							break
						else
							warn("[krampus] server hop attempt " .. i .. " failed: " .. tostring(result2))
							task.wait(1)
						end
					end

					if not flag then
						notify3("krampus", "teleport failed after 3 attempts", 3)
					end
				end)

				if not ok2 then
					notify3("krampus", "error: " .. tostring(result2), 3)
				end
			end)
		end,
	})

	v4:Button({
		Title = "rejoin server",
		Description = "rejoins this exact server",
		CallBack = function()
			local TeleportService = game:GetService("TeleportService")
			local notify3 = tbl.notify or notify2
			notify3("krampus", "rejoining current server...", 3)

			task.spawn(function()
				local ok2, result2 = pcall(function()
					TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
				end)

				if not ok2 then
					notify3("krampus", "failed: " .. tostring(result2), 3)
				end
			end)
		end,
	})

	local v5 = v3:InitTab({ Title = "combat" })
	v5:Section("line mods")

	v5:Toggle({
		Title = "super fling",
		Value = _G.SuperFlingEnabled,
		CallBack = function(superFlingEnabled)
			_G.SuperFlingEnabled = superFlingEnabled
			fn77()
			fn79()
		end,
	})

	v5:Slider({
		Title = "fling strength",
		Sliders = {
			{
				Title = "strength",
				Range = { 100, 10000 },
				Increment = 50,
				StarterValue = _G.FlingStrength,
				CallBack = function(flingStrength)
					_G.FlingStrength = flingStrength
					fn79()
				end,
			},
		},
	})

	v5:Toggle({
		Title = "further extend",
		Value = _G.FutherExtend,
		CallBack = function(futherExtend)
			_G.FutherExtend = futherExtend

			if futherExtend then
				local realGrabParts = _G.RealGrabParts or workspace:FindFirstChild("GrabParts")

				if realGrabParts and realGrabParts:IsA("Model") then
					setupFurtherExtend(realGrabParts)
				end
			else
				teardownFurtherExtend()
			end

			fn77()
			fn79()
		end,
	})

	v5:Slider({
		Title = "increase extend",
		Sliders = {
			{
				Title = "range",
				Range = { 3, 25 },
				Increment = 1,
				StarterValue = combat.increaseLineExtend,
				CallBack = function(increaseLineExtend)
					combat.increaseLineExtend = increaseLineExtend
					fn79()
				end,
			},
		},
	})

	v5:Section("grab mods")

	v5:Toggle({
		Title = "poison grab",
		Value = _G.Poison_Grab,
		CallBack = function(poisonGrab)
			_G.Poison_Grab = poisonGrab

			if not poisonGrab then
				fn27()
			end

			fn77()
			fn79()
		end,
	})

	v5:Toggle({
		Title = "burn grab",
		Value = _G.Burn_Grab,
		CallBack = function(burnGrab)
			_G.Burn_Grab = burnGrab
			fn77()
			fn79()
		end,
	})

	v5:Toggle({
		Title = "death grab",
		Value = _G.Death_Grab,
		CallBack = function(deathGrab)
			_G.Death_Grab = deathGrab
			fn77()
			fn79()
		end,
	})

	local tbl6 = {}
	local tbl7 = {}
	local thread = nil

	local function fn105(arg, arg2)
		local parent = arg.Parent

		while parent do
			if parent == arg2 then
				return true
			end
			parent = parent.Parent
		end

		return false
	end

	local function fn106(parent, position, cFrame)
		local bodyPosition = Instance.new("BodyPosition")
		local bodyGyro = Instance.new("BodyGyro")
		bodyPosition.P = 15000
		bodyPosition.D = 200
		bodyPosition.MaxForce = Vector3.new(5000000, 5000000, 5000000)
		bodyPosition.Position = position
		bodyPosition.Parent = parent
		bodyGyro.P = 15000
		bodyGyro.D = 200
		bodyGyro.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
		bodyGyro.CFrame = cFrame
		bodyGyro.Parent = parent
	end

	local function fn107()
		for _, item17 in ipairs(tbl6) do
			if item17 then
				if item17:FindFirstChild("BodyPosition") then
					item17.BodyPosition:Destroy()
				end

				if item17:FindFirstChild("BodyGyro") then
					item17.BodyGyro:Destroy()
				end
			end
		end

		for _, item18 in ipairs(tbl7) do
			item18:Disconnect()
		end

		tbl7 = {}
		tbl6 = {}
	end

	local function fn108()
		while true do
			pcall(function()
				local grabParts = workspace:FindFirstChild("GrabParts")
				if not grabParts then
					return
				end
				local grabPart = grabParts:FindFirstChild("GrabPart")
				if not grabPart then
					return
				end
				local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
				if not weldConstraint or not weldConstraint.Part1 then
					return
				end
				local primaryPart = weldConstraint.Part1.Parent and weldConstraint.Part1.Parent.PrimaryPart
				if not primaryPart then
					return
				end

				if fn105(primaryPart, workspace.Map) then
					return
				end

				for _, child in pairs(players:GetChildren()) do
					if fn105(primaryPart, child.Character) then
						return
					end
				end

				if not table.find(tbl6, primaryPart) then
					table.insert(tbl6, primaryPart)
				end

				for _, child in ipairs(primaryPart:GetChildren()) do
					if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
						child:Destroy()
					end
				end

				while workspace:FindFirstChild("GrabParts") do
					wait()
				end

				fn106(primaryPart, primaryPart.Position, primaryPart.CFrame)
			end)

			wait()
		end
	end

	v5:Toggle({
		Title = "anchor objects grab",
		Value = false,
		CallBack = function(arg)
			if arg then
				if not thread or coroutine.status(thread) == "dead" then
					thread = coroutine.create(fn108)
					coroutine.resume(thread)
				end
			elseif thread and coroutine.status(thread) ~= "dead" then
				coroutine.close(thread)
				thread = nil
				fn107()
			end
		end,
	})

	v5:Toggle({
		Title = "kick grab",
		Value = _G.KickGrab,
		CallBack = function(kickGrab)
			_G.KickGrab = kickGrab
			fn77()
			fn79()
		end,
	})

	v5:Toggle({
		Title = "massless grab",
		Value = _G.MasslessGrab,
		CallBack = function(masslessGrab)
			_G.MasslessGrab = masslessGrab
			fn33()
			fn77()
			fn79()
		end,
	})

	v5:Section("utility")

	v5:Toggle({
		Title = "break barrier",
		CallBack = function()
			functions.runBreakBarrier()
			fn77()
			fn79()
		end,
	})

	v5:Toggle({
		Title = "anti barrier",
		Value = protection.antiBarrierEnabled,
		CallBack = function(arg)
			protection.setAntiBarrierEnabled(arg)
			fn77()
			fn79()
		end,
	})

	local v6 = v3:InitTab({ Title = "invincibility" })
	v6:Section("anti")

	v6:Toggle({
		Title = "anti grab",
		Value = _G.AntiGrab,
		CallBack = function(antiGrab)
			_G.AntiGrab = antiGrab

			if antiGrab then
				if isHeldValue and isHeldValue.Value then
					fn36()
				end

				safeFireRemote(struggleEvent, localPlayer)
			else
				fn35()
			end

			fn77()
			fn80()
		end,
	})

	local UserInputService = game:GetService("UserInputService")

	local function fn109(arg, arg2, arg3)
		local v7 = arg:FindFirstChild(arg2)

		if not v7 then
			v7 = arg:WaitForChild(arg2, arg3 or 3)
		end

		return v7
	end

	local function fn110(arg)
		replicatedStorage.GrabEvents.SetNetworkOwner:FireServer(arg, arg.CFrame)
	end

	local function fn111(arg)
		if arg and arg:IsA("Model") then
			local vehicleSeat = arg:FindFirstChild("VehicleSeat")

			if vehicleSeat then
				pcall(function()
					vehicleSeat:Destroy()
				end)
			end
		end
	end

	local function fn112()
		local v7 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if v7 then
			for _, child in pairs(v7:GetChildren()) do
				if child.Name == "Gucci" or child.Name == "CreatureBlobman" then
					fn111(child)
					break
				end
			end
		end
	end

	local function fn113(arg, arg2, arg3)
		local spawnToyRemoteFunction = replicatedStorage.MenuToys.SpawnToyRemoteFunction
		local inPlot = localPlayer.InPlot
		local inOwnedPlot = localPlayer.InOwnedPlot
		local canSpawnToy = localPlayer.CanSpawnToy

		while true do
			local value = inPlot and inPlot.Value

			if value then
				value = not (inOwnedPlot and inOwnedPlot.Value)
			end

			if value then
				value = not (canSpawnToy and canSpawnToy.Value)
			end

			if value then
				task.wait(0.01)
				continue
			end
			break
		end

		task.spawn(function()
			pcall(function()
				spawnToyRemoteFunction:InvokeServer(arg, arg2, arg3 or Vector3.new())
			end)
		end)

		local v7 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		local value10 = nil
		local connection = nil

		if v7 then
			connection = v7.ChildAdded:Connect(function(child)
				if child.Name == arg and child:IsA("Model") then
					value10 = child
					connection:Disconnect()
				end
			end)
		end

		local now = tick()

		while not value10 and tick() - now < 3 do
			task.wait(0.01)
		end

		if connection then
			connection:Disconnect()
		end

		return value10
	end

	local flag = false
	local value11 = nil
	local value12 = nil
	local thread2 = nil
	local thread3 = nil
	local flag2 = false
	local flag3 = false

	local function fn114()
		local v9 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if v9 then
			for _, child in pairs(v9:GetChildren()) do
				if child.Name == "Gucci" or child.Name == "CreatureBlobman" then
					pcall(function()
						safeFireRemote(deleteToyRE, child)
					end)
				end
			end
		end
	end

	local function fn115()
		local v9 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if v9 then
			for _, child in pairs(v9:GetChildren()) do
				if child.Name == "Gucci" then
					return true, child
				end
			end
		end

		return false, nil
	end

	local function fn116()
		if thread3 then
			task.cancel(thread3)
		end

		thread3 = task.spawn(function()
			while flag2 and value11 and value11.Parent do
				if value12 and value12.Parent then
					value12.CFrame = CFrame.new(value12.Position.X, 100000, value12.Position.Z)
				end

				task.wait(0.01)
			end
		end)
	end

	local fn117 = nil

	fn117 = function()
		local character = localPlayer.Character
		if not character then
			return false
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if not humanoid then
			humanoid = character:WaitForChild("Humanoid", 5)
			if not humanoid then
				return false
			end
		end

		if humanoid.Health <= 0 then
			return false
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		local cFrame = humanoidRootPart.CFrame
		humanoid.Sit = true
		task.wait(0.1)
		humanoid.Sit = false
		task.wait(0.1)

		task.spawn(function()
			local now = tick()

			while tick() - now < 0.3 do
				for _, child in pairs(character:GetChildren()) do
					if child:IsA("BasePart") then
						child.Velocity = Vector3.new()
					end
				end

				task.wait(0.1)
			end
		end)

		local flag4 = true
		local flag5 = false
		local CreatureBlobman = nil
		local head = nil

		task.spawn(function()
			while not CreatureBlobman do
				task.wait(0)
			end

			head = fn109(CreatureBlobman, "Head")
			value12 = head
			local grabbableHitbox = fn109(CreatureBlobman, "GrabbableHitbox")

			while head and (not head:FindFirstChild("PartOwner") or head.PartOwner.Value ~= localPlayer.Name) do
				fn110(grabbableHitbox)
				task.wait(0)
			end
		end)
		--[=[ SL ]=] -- discord.gg/x7YbZeezpm

		CreatureBlobman = fn113("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 10000, 0), Vector3.new(0, -15.716, 0))
		if not CreatureBlobman then
			return false
		end
		value11 = CreatureBlobman
		local vehicleSeat = fn109(CreatureBlobman, "VehicleSeat")

		CreatureBlobman.Destroying:Connect(function()
			if not flag2 then
				return
			end
			flag = false
			value11 = nil
			value12 = nil

			task.spawn(function()
				local character2 = localPlayer.Character
				character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

				if character2 then
					character2.Sit = true
					task.wait(0.1)
					character2.Sit = false
				end

				if flag2 then
					if fn117() then
						fn116()
					end
				end
			end)
		end)

		if vehicleSeat then
			vehicleSeat:GetPropertyChangedSignal("Occupant"):Connect(function()
				if not flag2 then
					return
				end
				local occupant = vehicleSeat.Occupant

				if occupant and occupant ~= humanoid then
					flag = false
					value11 = nil
					value12 = nil

					task.spawn(function()
						humanoid.Sit = true
						task.wait(0.1)
						humanoid.Sit = false

						if flag2 then
							if fn117() then
								fn116()
							end
						end
					end)
				end
			end)
		end

		task.defer(function()
			if not (character or humanoid) then
				return
			end
			local now = tick()

			while flag4 and tick() - now < 0.2 do
				if CreatureBlobman and CreatureBlobman.Parent then
					if vehicleSeat and vehicleSeat.Parent and vehicleSeat.Occupant ~= humanoid then
						vehicleSeat:Sit(humanoid)
					end
				end

				task.wait(0.01)

				if character and humanoid and humanoid.Parent then
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end

				task.wait(0.01)
			end

			flag4 = false
			flag5 = false
		end)

		flag5 = true

		task.defer(function()
			while flag5 do
				if character and humanoidRootPart and humanoidRootPart.Parent then
					replicatedStorage.CharacterEvents.RagdollRemote:FireServer(humanoidRootPart, 0.095)
				end

				task.wait(0.01)
			end
		end)

		task.wait(0)
		humanoid.Sit = false
		task.wait(0.01)
		humanoid:ChangeState(Enum.HumanoidStateType.Running)
		CreatureBlobman.Name = "Gucci"
		task.wait(0)
		fn112()

		if humanoidRootPart and humanoidRootPart.Parent then
			humanoidRootPart.CFrame = cFrame

			task.spawn(function()
				for i = 1, 5 do
					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.Velocity = Vector3.zero
							descendant.RotVelocity = Vector3.zero
						end
					end

					task.wait()
				end
			end)
		end

		local v9 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		local value13 = nil

		if v9 then
			value13 = nil

			for k, child in pairs(v9:GetChildren()) do
				if child.Name == "Gucci" then
					value13 = k
					break
				else
					value13 = nil
				end
			end
		end

		for _, child in pairs(CreatureBlobman:GetChildren()) do
			if child:IsA("BasePart") then
				child.CanCollide = false
				child.CanTouch = false
				child.CanQuery = false
			end
		end

		local ok2, result2 = pcall(function()
			return localPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
		end)

		if ok2 and result2 and value13 then
			for i, child in ipairs(result2:GetChildren()) do
				if child.Name == "CreatureBlobman" and i == value13 then
					local viewItemButton = child.ViewItemButton
					viewItemButton.Text = "GUCCI"
					viewItemButton.TextScaled = true
					viewItemButton.LowResImage.Image = ""
				end
			end
		end

		local grabbingScript = character:FindFirstChild("GrabbingScript")

		if grabbingScript then
			grabbingScript.Enabled = false
			task.wait(0)
			grabbingScript.Enabled = true
		end

		flag = true
		return true
	end

	local function fn118()
		if thread2 then
			thread2:Disconnect()
		end

		thread2 = task.spawn(function()
			while flag2 do
				if flag then
					if not fn115() then
						flag = false
						value11 = nil
						value12 = nil

						if fn117() then
							fn116()
						end
					end
				end

				task.wait(0)
			end
		end)
	end

	local function fn119()
		if thread3 then
			task.cancel(thread3)
			thread3 = nil
		end

		if thread2 then
			task.cancel(thread2)
			thread2 = nil
		end

		flag = false
		local v9 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		local value14 = nil

		if v9 then
			for _, child in pairs(v9:GetChildren()) do
				if child.Name == "Gucci" or child.Name == "CreatureBlobman" then
					value14 = child
					break
				end
			end
		end

		if value14 then
			pcall(function()
				for _, child in pairs(value14:GetChildren()) do
					if child:IsA("BasePart") then
						replicatedStorage.GrabEvents.SetNetworkOwner:FireServer(child, child.CFrame)
					end
				end
			end)

			pcall(function()
				for _, child in pairs(value14:GetChildren()) do
					if child:IsA("BasePart") then
						child.CFrame = CFrame.new(0, 100000, 0)
						child.AssemblyLinearVelocity = Vector3.zero
						child.AssemblyAngularVelocity = Vector3.zero
					end
				end
			end)

			pcall(function()
				safeFireRemote(deleteToyRE, value14)
			end)
		end

		fn114()
		value11 = nil
		value12 = nil
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if character then
			character.Sit = true
			task.wait(0.1)
			character.Sit = false
			character:ChangeState(Enum.HumanoidStateType.Running)
		end
	end

	local function fn120()
		flag2 = true
		fn114()
		flag = false
		value11 = nil
		value12 = nil

		if fn117() then
			fn116()
			fn118()
		else
			task.wait(0)

			if flag2 then
				if fn117() then
					fn116()
					fn118()
				else
					flag2 = false
				end
			end
		end
	end

	local function fn121()
		flag2 = false
		fn119()
	end

	local flag4 = false
	local flag5 = false
	local fn122 = nil

	fn122 = function(humanoid3, instance5)
		if flag4 then
			return
		end

		if not humanoid3 or not humanoid3.Parent or humanoid3.Health <= 0 then
			return
		end

		if not instance5 or not instance5.Parent then
			return
		end
		local state = humanoid3:GetState()
		if not (state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.RunningNoPhysics or state == Enum.HumanoidStateType.Landed) then
			return
		end
		flag4 = true
		instance5.AssemblyLinearVelocity = Vector3.new(instance5.AssemblyLinearVelocity.X, 24, instance5.AssemblyLinearVelocity.Z)
		humanoid3:ChangeState(Enum.HumanoidStateType.Jumping)

		task.spawn(function()
			local flag6 = false

			while true do
				if humanoid3 and humanoid3.Parent then
					local state2 = humanoid3:GetState()

					if state2 == Enum.HumanoidStateType.Freefall or state2 == Enum.HumanoidStateType.Jumping then
						flag6 = true
					end

					if flag6 and (state2 == Enum.HumanoidStateType.Running or state2 == Enum.HumanoidStateType.RunningNoPhysics or state2 == Enum.HumanoidStateType.Landed) then
						flag4 = false

						if flag5 then
							fn122(humanoid3, instance5)
						end

						break
					else
						task.wait(0)
						continue
					end
				end

				break
			end
		end)
	end

	UserInputService.InputBegan:Connect(function(input2, gameProcessed)
		if gameProcessed then
			return
		end

		if input2.KeyCode == Enum.KeyCode.Space then
			flag5 = true
			local character = localPlayer.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			fn122(character:FindFirstChildOfClass("Humanoid"), humanoidRootPart)
		end

		if input2.KeyCode == Enum.KeyCode.G then
			if flag2 then
				fn121()
			else
				task.spawn(fn120)
			end
		end
	end)

	UserInputService.InputEnded:Connect(function(input2)
		if input2.KeyCode == Enum.KeyCode.Space then
			flag5 = false
		end
	end)

	local function fn123()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not (humanoidRootPart and character) then
			return
		end
		local cFrame = humanoidRootPart.CFrame

		local ok2, result2 = pcall(function()
			return workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel
		end)

		if not ok2 or not result2 then
			return
		end
		local seat2 = result2:FindFirstChild("Seat2") or result2:FindFirstChild("Seat")
		if not seat2 then
			return
		end
		seat2:Sit(character)

		task.spawn(function()
			local n5 = tick() + 3

			while tick() < n5 do
				safeFireRemote(ragdollRemoteEvent, humanoidRootPart, 0)
				task.wait()
			end
		end)

		task.wait(0)
		character:ChangeState(Enum.HumanoidStateType.Jumping)
		task.wait(0)
		humanoidRootPart.CFrame = cFrame
	end

	local function fn124()
		local pcldBreakPendingRespawnKill = _G.PCLDBreakAntiKick and antiKick.pcldBreakPendingRespawnKill
		task.wait(0)

		if flag3 then
			if not _G.PCLDBreakAntiKick or not pcldBreakPendingRespawnKill then
				task.spawn(function()
					task.wait(0)
					fn123()
				end)
			end
		end

		if flag2 then
			fn114()
			flag = false
			value11 = nil
			value12 = nil

			if fn117() then
				fn116()
				fn118()
			else
				task.wait(0.2)

				if flag2 then
					if fn117() then
						fn116()
						fn118()
					end
				end
			end
		end
	end

	_G.GucciEnabled = false
	localPlayer.CharacterAdded:Connect(fn124)

	v6:Toggle({
		Title = "blobman gucci",
		Value = false,
		CallBack = function(gucciEnabled)
			flag2 = gucciEnabled
			_G.GucciEnabled = gucciEnabled

			if gucciEnabled then
				fn114()
				task.wait(0.2)

				task.spawn(function()
					if fn117() then
						fn116()
						fn118()
					end
				end)
			else
				fn119()
			end

			fn80()
		end,
	})

	v6:Toggle({
		Title = "gucci train",
		Value = false,
		CallBack = function(arg)
			flag3 = arg

			if arg then
				task.spawn(fn123)
			else
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					for i = 1, 30 do
						character.Sit = true
						task.wait()
						character.Sit = false
					end
				end
			end

			fn80()
		end,
	})

	local flag6 = false
	local n5 = 0
	local connection = nil

	local function fn125()
		local v9 = n5
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not (humanoidRootPart and character) then
			return
		end
		humanoidRootPart.CFrame = CFrame.new(0, 1e29, 0)
		task.wait(0)
		humanoidRootPart.CFrame = CFrame.new(0, 1e30, 0)
		local n6 = 50000
		local n7 = 2.5
		local n8 = 1e30
		local n9 = 0
		local now = tick()

		if connection then
			connection:Disconnect()
			connection = nil
		end

		connection = runService.Heartbeat:Connect(function()
			if not flag6 or n5 ~= v9 then
				if connection then
					connection:Disconnect()
					connection = nil
				end

				return
			end

			local character2 = localPlayer.Character
			character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

			if character2 then
				local now2 = tick()
				local n10 = math.min(now2 - now, 0.1)
				now = now2
				n9 += n7 * n10
				local n11 = math.cos(n9) * n6
				local n12 = math.sin(n9) * n6
				character2.CFrame = CFrame.new(n11, n8 + math.sin(n9 * 3.7) * 500, n12)
				character2.AssemblyLinearVelocity = Vector3.zero
				character2.AssemblyAngularVelocity = Vector3.zero
			end
		end)
	end

	local function fn126()
		flag6 = false
		n5 += 1

		if connection then
			connection:Disconnect()
			connection = nil
		end

		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")

		if character then
			character.CFrame = CFrame.new(0, 5, 0)
		end
	end

	v6:Toggle({
		Title = "nan zone anti",
		Value = false,
		CallBack = function(arg)
			flag6 = arg

			if arg then
				n5 += 1
				task.spawn(fn125)
			else
				fn126()
			end

			fn80()
		end,
	})

	localPlayer.CharacterAdded:Connect(function()
		if flag6 then
			task.wait(0.3)
			n5 += 1
			task.spawn(fn125)
		end
	end)

	v6:Toggle({
		Title = "anti paint",
		Value = false,
		CallBack = function(arg)
			if arg then
				antipcon = workspace.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "PaintPlayerPart" then
						task.wait(0.1)
						descendant:Destroy()
					end
				end)

				for _, descendant in pairs(workspace:GetDescendants()) do
					if descendant.Name == "PainPlayerPart" then
						descendant:Destroy()
					end
				end
			elseif antipcon then
				antipcon:Disconnect()
			end
		end,
	})

	v6:Toggle({
		Title = "anti explode",
		Value = protection.antiExplodeEnabled,
		CallBack = function(arg)
			if arg then
				local function fn127()
					local character = localPlayer.Character
					if not character then
						return nil, nil, nil
					end
					local findFirstChildOfClass = character.FindFirstChildOfClass
					return character, character:FindFirstChild("HumanoidRootPart"), findFirstChildOfClass(character, "Humanoid")
				end

				fn127()

				cons.antiexp = workspace.ChildAdded:Connect(function(child)
					if child.Name == "Part" then
						local character = localPlayer.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						character = character and character:FindFirstChildOfClass("Humanoid")

						if humanoidRootPart and character then
							local ragdolled = character:FindFirstChild("Ragdolled")

							if ragdolled and ragdolled.Value == true then
								if (child.Position - humanoidRootPart.Position).Magnitude < 40 then
									humanoidRootPart.Anchored = true
									task.wait(0.01)
									humanoidRootPart.Anchored = false
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
									character:ChangeState(Enum.HumanoidStateType.Running)
								end
							end
						end
					end
				end)
			elseif cons.antiexp then
				cons.antiexp:Disconnect()
				cons.antiexp = nil
			end

			fn80()
		end,
	})

	v6:Toggle({
		Title = "anti burn",
		Value = combat.antiBurnConnection ~= nil,
		CallBack = function(arg)
			fn38(arg)
			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "anti kick (shuriken)",
		Value = _G.AntiKick,
		CallBack = function(arg)
			if arg then
				antiKick.start()
			else
				antiKick.stop()
			end

			fn77()
			fn80()
		end,
	})

	local tbl8 = nil

	local function fn127()
		tbl8 = {
			antiGrab = _G.AntiGrab,
			antiExplode = protection.antiExplodeEnabled,
			antiBurn = combat.antiBurnConnection ~= nil,
			antiKick = _G.AntiKick,
			antiBananna = _G.AntiBananna,
			antiBlobman = _G.AntiBlobman,
			antiInputLag = _G.AntiInputLag,
			autoReset = _G.AutoReset,
			antiVoid = protection.antiVoidConnection ~= nil,
			waterWalk = protection.walkOnWaterEnabled,
			loopTp = protection.loopTpEnabled,
			loopHouseTp = protection.loopHouseTpEnabled,
			gucci = _G.GucciEnabled,
		}

		if tbl8.antiGrab then
			_G.AntiGrab = false
			fn35()
		end

		if tbl8.antiExplode then
			fn37()
		end

		if tbl8.antiBurn then
			fn38(false)
		end

		if tbl8.antiKick then
			antiKick.stop()
		end

		if tbl8.antiBananna then
			fn40(false)
		end

		if tbl8.antiBlobman then
			fn42(false)
		end

		if tbl8.antiInputLag then
			setAntiInputLagEnabled(false)
		end

		if tbl8.autoReset then
			setAutoResetEnabled(false)
		end

		if tbl8.antiVoid then
			disableAntiVoid()
		end

		if tbl8.waterWalk then
			setWaterWalk(false)
			protection.walkOnWaterEnabled = false
		end

		if tbl8.loopTp then
			protection.setLoopTpEnabled(false)
		end

		if tbl8.loopHouseTp then
			protection.setLoopHouseTpEnabled(false)
		end

		if tbl8.gucci then
			_G.GucciEnabled = false
			flag2 = false
		end
	end

	local function fn128()
		local v9 = tbl8
		tbl8 = nil
		if not v9 then
			return
		end

		if v9.antiGrab then
			_G.AntiGrab = true

			if isHeldValue and isHeldValue.Value then
				fn36()
			end

			safeFireRemote(struggleEvent, localPlayer)
		end

		if v9.antiExplode then
			startAntiExplode()
		end

		if v9.antiBurn then
			fn38(true)
		end

		if v9.antiKick then
			antiKick.start()
		end

		if v9.antiBananna then
			fn40(true)
		end

		if v9.antiBlobman then
			fn42(true)
		end

		if v9.antiInputLag then
			setAntiInputLagEnabled(true)
		end

		if v9.autoReset then
			setAutoResetEnabled(true)
		end

		if v9.antiVoid then
			enableAntiVoid()
		end

		if v9.waterWalk then
			protection.walkOnWaterEnabled = true
			setWaterWalk(true)
		end

		if v9.loopTp then
			protection.setLoopTpEnabled(true)
		end

		if v9.loopHouseTp then
			protection.setLoopHouseTpEnabled(true)
		end

		if v9.gucci then
			_G.GucciEnabled = true
			flag2 = true
		end

		fn80()
	end

	v6:Toggle({
		Title = "anti kick (pcld break)",
		Value = _G.PCLDBreakAntiKick,
		CallBack = function(arg)
			if arg then
				fn127()
				antiKick.startPCLDBreak()
				notify2("krampus", "breaking pcld (dont get permdeathed son)", 7)
				local pcldBreakRunId = antiKick.pcldBreakRunId

				task.spawn(function()
					while true do
						if _G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId then
							if not antiKick.pcldBreakAwaitingExternalDeath then
								task.wait(0.05)
								continue
							end
						end

						break
					end

					if not (_G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId) then
						return
					end

					while _G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId do
						local flag7 = false
						local connection2 = nil

						connection2 = localPlayer.CharacterAdded:Connect(function()
							connection2:Disconnect()
							connection2 = nil
							flag7 = true
						end)

						while not flag7 and _G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId do
							task.wait(0.05)
						end

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if not (_G.PCLDBreakAntiKick and pcldBreakRunId == antiKick.pcldBreakRunId) then
							return
						end

						task.defer(function()
						end)

						task.wait()
						if not antiKick.pcldBreakPendingRespawnKill then
							fn128()
							return
						end
					end
				end)
			else
				antiKick.stopPCLDBreak()
				fn128()
			end

			fn80()
		end,
	})

	v6:Toggle({
		Title = "anti bananna",
		Value = _G.AntiBananna,
		CallBack = function(arg)
			fn40(arg)
			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "anti blobman",
		Value = _G.AntiBlobman,
		CallBack = function(arg)
			fn42(arg)
			fn77()
			fn80()
		end,
	})

	protection.antiInputLagToggleRef = fn87(v6:Toggle({
		Title = "anti net-owner",
		Value = _G.AntiInputLag,
		CallBack = function(arg)
			setAntiInputLagEnabled(arg)
			fn77()
			fn80()
		end,
	}))

	protection.antiLagToggleRef = fn87(v6:Toggle({
		Title = "anti lag",
		Value = _G.AntiLag,
		CallBack = function(arg)
			fn43(arg)
			fn77()
			fn80()
		end,
	}))

	v6:Toggle({
		Title = "auto reset (anti kick)",
		Value = _G.AutoReset,
		CallBack = function(arg)
			setAutoResetEnabled(arg)
			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "anti void",
		Value = protection.antiVoidConnection ~= nil,
		CallBack = function(arg)
			if arg then
				enableAntiVoid()
			else
				disableAntiVoid()
			end

			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "jesus (water walk)",
		Value = protection.walkOnWaterEnabled,
		CallBack = function(walkOnWaterEnabled)
			protection.walkOnWaterEnabled = walkOnWaterEnabled
			setWaterWalk(walkOnWaterEnabled)
			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "loop tp",
		Value = protection.loopTpEnabled,
		CallBack = function(arg)
			protection.setLoopTpEnabled(arg)
			fn77()
			fn80()
		end,
	})

	v6:Toggle({
		Title = "loop house tp",
		Value = protection.loopHouseTpEnabled,
		CallBack = function(arg)
			protection.setLoopHouseTpEnabled(arg)
			fn77()
			fn80()
		end,
	})

	v6:Section("config")

	v6:Dropdown({
		Title = "anti kick toy",
		Options = tbl.Constants.AntiKickToyDropdownValues,
		PlaceHolder = tbl.State.SelectedAntiKickToyOption,
		Multi = false,
		CallBack = function(arg)
			local selectedAntiKickToyOption = type(arg) == "table" and arg[1] or arg
			local v9 = selectedAntiKickToyOption and tbl.Constants.AntiKickToyOptions[selectedAntiKickToyOption]

			if v9 then
				tbl.State.SelectedAntiKickToyOption = selectedAntiKickToyOption
				tbl.State.SelectedAntiKickToyName = v9
				_G.AntiKickToyOption = selectedAntiKickToyOption

				if _G.AntiKick then
					antiKick.stop()
					task.wait(0.1)
					antiKick.start()
				end
			end
		end,
	})

	v6:Dropdown({
		Title = "anti net-owner holdable",
		Options = tbl.Constants.AntiInputLagDropdownValues,
		PlaceHolder = tbl.State.SelectedAntiInputLagOption,
		Multi = false,
		CallBack = function(arg)
			if tbl.Functions.setSelectedAntiInputLagOption(type(arg) == "table" and arg[1] or arg) then
				fn60(true)
				fn77()
			end
		end,
	})

	v6:Slider({
		Title = "anti net-owner delay",
		Sliders = {
			{
				Title = "delay",
				Range = { 0, 10 },
				Increment = 1,
				StarterValue = tbl.Functions.clampAntiInputDelayStep(combat.antiInputDelayStep),
				CallBack = function(arg)
					combat.antiInputDelayStep = tbl.Functions.clampAntiInputDelayStep(arg)
					fn60(false)
					fn77()
				end,
			},
		},
	})

	v6:Slider({
		Title = "anti grab ragdoll duration",
		Sliders = {
			{
				Title = "seconds",
				Range = { 0, 10 },
				Increment = 0.1,
				StarterValue = combat.antiGrabRagdollDuration,
				CallBack = function(antiGrabRagdollDuration)
					combat.antiGrabRagdollDuration = antiGrabRagdollDuration
					combat.antiGrabRagdollDurationUser = antiGrabRagdollDuration
				end,
			},
		},
	})

	local v9 = v3:InitTab({ Title = "fun" })
	v9:Section("bomb nearby players ")
	v9:Section(" R key to spawn bombs to nearby, and U key to explode them")
	v9:Section("toggle must be enabled")
	local tbl9 = {}
	local flag7 = false
	local flag8 = false
	local connection2 = nil

	local function fn129()
		local character = localPlayer.Character
		if not character or not character:FindFirstChild("HumanoidRootPart") then
			return nil
		end
		local humanoidRootPart = character.HumanoidRootPart
		local huge = math.huge
		local value15 = nil

		for _, player in pairs(players:GetPlayers()) do
			if player ~= localPlayer then
				local character2 = player.Character

				if character2 and character2:FindFirstChild("HumanoidRootPart") then
					local magnitude = (humanoidRootPart.Position - character2.HumanoidRootPart.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						value15 = player
					end
				end
			end
		end

		return value15
	end

	local function fn130(arg)
		return arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Torso") or arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("Head")
	end

	local function fn131(arg, arg2, arg3)
		if not arg or not arg.Parent then
			return false
		end

		return (pcall(function()
			local bombEvents = replicatedStorage:FindFirstChild("BombEvents")
			if not bombEvents then
				return
			end
			local bombExplode = bombEvents:FindFirstChild("BombExplode")
			if not bombExplode then
				return
			end
			local partHitDetector = arg3 or arg:FindFirstChild("PartHitDetector") or arg:FindFirstChild("Body")

			bombExplode:FireServer(unpack({
				{
					Radius = 17.5,
					TimeLength = 2,
					Hitbox = arg:FindFirstChild("PartHitDetector"),
					ExplodesByFire = false,
					MaxForcePerStudSquared = 225,
					Model = arg,
					ImpactSpeed = 100,
					ExplodesByPointy = false,
					DestroysModel = false,
					PositionPart = partHitDetector,
				},
				arg2,
			}))
		end))
	end

	local function fn132()
		if not flag8 then
			notify2("krampus", "disabled", 2)
			return false
		end

		if flag7 then
			return false
		end
		local byName3 = {}

		pcall(function()
			local v10 = pairs
			local contents = localPlayer:WaitForChild("PlayerGui"):WaitForChild("MenuGui"):WaitForChild("Menu"):WaitForChild("TabContents"):WaitForChild("Toys"):WaitForChild("Contents")

			for _, child in v10(contents:GetChildren()) do
				if child.Name ~= "UIGridLayout" then
					byName3[child.Name] = true
				end
			end
		end)

		if not byName3.BombMissile then
			notify2("krampus", "you dont own the BombMissile tool, buy it first", 3)
			return false
		end
		local folder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if not folder then
			folder = Instance.new("Folder")
			folder.Name = localPlayer.Name .. "SpawnedInToys"
			folder.Parent = workspace
		end

		if not folder:FindFirstChild("ToyNumber") then
			local numberValue = Instance.new("NumberValue")
			numberValue.Name = "ToyNumber"
			numberValue.Value = 0
			numberValue.Parent = folder
		end

		local connection3 = nil

		connection3 = folder.ChildAdded:Connect(function(child)
			if child.Name == "BombMissile" then
				if child:WaitForChild("ThisToysNumber", 1) then
					if child.ThisToysNumber.Value == folder.ToyNumber.Value - 1 then
						flag7 = true
						connection3:Disconnect()
						local setNetworkOwner = replicatedStorage:FindFirstChild("GrabEvents") and replicatedStorage.GrabEvents:FindFirstChild("SetNetworkOwner")

						if setNetworkOwner then
							setNetworkOwner:FireServer(child.Body, child.Body.CFrame)
						end

						local partOwner = child.Body:WaitForChild("PartOwner", 1)
						if not partOwner or partOwner.Value ~= localPlayer.Name then
							flag7 = false
							return
						end

						for _, child2 in pairs(child:GetChildren()) do
							if child2:IsA("BasePart") then
								child2.CanCollide = false
							end
						end

						child:SetPrimaryPartCFrame(CFrame.new(-72.9304581, -5.96906614, -265.543732))

						for _, child2 in pairs(child:GetChildren()) do
							if child2:IsA("BasePart") then
								child2.Anchored = true
							end
						end

						table.insert(tbl9, child)

						child.AncestryChanged:Connect(function()
							if not child.Parent then
								for i, item19 in ipairs(tbl9) do
									if item19 == child then
										table.remove(tbl9, i)
										break
									end
								end
							end
						end)

						flag7 = false
					end
				end
			end
		end)

		local character = localPlayer.Character
		local cFrame = character.Head and character.Head.CFrame or character.HumanoidRootPart and character.HumanoidRootPart.CFrame or CFrame.new(0, 10, 0)

		local function fn133(arg, arg2)
			return replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, arg2, Vector3.zero)
		end

		pcall(function()
			fn133("BombMissile", cFrame)
		end)

		return true
	end

	local function fn133(arg, arg2)
		if not arg or not arg.Character then
			return false
		end
		local character4 = fn130(arg.Character)
		if not character4 then
			return false
		end

		if #tbl9 == 0 then
			return false
		end
		print("[BombCache] Exploding " .. (arg2 and "ALL " .. #tbl9 or "1") .. " bomb(s) on " .. arg.Name)
		local n6

		if arg2 then
			local tbl10 = {}

			for i = #tbl9, 1, -1 do
				table.insert(tbl10, tbl9[i])
				table.remove(tbl9, i)
			end

			n6 = 0

			for _, value16 in pairs(tbl10) do
				if value16 and value16.Parent then
					if fn131(value16, character4.Position, character4) then
						n6 += 1
					end

					task.wait(0.03)
				end
			end
		else
			local v11 = table.remove(tbl9, 1)
			local parent = v11 and v11.Parent
			n6 = 0

			if parent then
				if fn131(v11, character4.Position, character4) then
					n6 = 1
				end
			end
		end

		return n6 > 0
	end

	local textLabel = nil

	local function fn134()
		if textLabel then
			textLabel.Text = "📦 Cached Bombs: " .. #tbl9
		end
	end

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -20, 0, 30)
	frame.Position = UDim2.new(0, 10, 0, 0)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
	frame.BackgroundTransparency = 0.3
	frame.BorderSizePixel = 0
	frame.Parent = nil
	textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.Text = "Cached Bombs: 0"
	textLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.TextSize = 14
	textLabel.Parent = frame

	v9:Toggle({
		Title = "spawn bombs to nearby (toggle to use the keybind)",
		Value = false,
		CallBack = function(arg)
			flag8 = arg

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if arg then
				connection2 = UserInputService.InputBegan:Connect(function(input2, gameProcessed)
					if gameProcessed then
						return
					end

					if not flag8 then
						return
					end

					if input2.KeyCode == Enum.KeyCode.R then
						task.spawn(fn132)
						task.wait(0.05)
						fn134()
					elseif input2.KeyCode == Enum.KeyCode.T then
						task.spawn(function()
							if #tbl9 > 0 then
								local character = localPlayer.Character
								--[[ S​L :: discord.gg/x7YbZeezpm ]]

								if character then
									local v10 = fn130(character)

									if v10 then
										local position = v10.Position
										fn131(table.remove(tbl9, 1), position, v10)
										fn134()
									end
								end
							end
						end)
					elseif input2.KeyCode == Enum.KeyCode.U then
						task.spawn(function()
							if #tbl9 > 0 then
								local result10 = fn129()

								if result10 then
									fn133(result10, true)
									fn134()
								end
							end
						end)
					end
				end)
			end
		end,
	})

	local v10 = v3:InitTab({ Title = "humanoid" })
	v10:Section("movement")

	v10:Toggle({
		Title = "no clip",
		Value = _G.noclip,
		CallBack = function(noclip)
			_G.noclip = noclip
			_G.NoclipToggle = noclip

			if noclip then
				fn61()
			else
				fn62()
			end

			fn77()
			fn83()
		end,
	})

	v10:Toggle({
		Title = "infinite jump",
		Value = _G.infinjump,
		CallBack = function(infinjump)
			_G.infinjump = infinjump
			fn77()
			fn83()
		end,
	})

	v10:Toggle({
		Title = "walkspeed",
		Value = _G.SuperSpeed,
		CallBack = function(superSpeed)
			_G.SuperSpeed = superSpeed
			fn63()
			fn77()
			fn83()
		end,
	})

	v10:Slider({
		Title = "speed",
		Sliders = {
			{
				Title = "walkspeed",
				Range = { 15, 500 },
				Increment = 1,
				StarterValue = _G.SpeedValue,
				CallBack = function(speedValue)
					combat.multiplier = speedValue * 0.01
					_G.SpeedValue = speedValue
					fn83()
				end,
			},
		},
	})

	v10:Section("gamepass")
	v10:Section("extend line")
	local flag9 = false
	local connection3 = nil
	local n6 = 0

	local function fn135()
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		n6 += 1
		local v11 = n6
		local gamepassEvents = replicatedStorage:FindFirstChild("GamepassEvents")
		gamepassEvents = gamepassEvents and gamepassEvents:FindFirstChild("FurtherReachBoughtNotifier")

		if gamepassEvents then
			for _, getconnection in ipairs(getconnections(gamepassEvents.OnClientEvent)) do
				pcall(getconnection.Function)
			end

			print("[krampus] FurtherReach gamepass simulated")
		end

		connection3 = runService.Heartbeat:Connect(function()
			if not flag9 or v11 ~= n6 then
				return
			end
			local character = localPlayer.Character

			if character then
				local fartherReach = character:FindFirstChild("FartherReach")

				if not fartherReach then
					local boolValue = Instance.new("BoolValue")
					boolValue.Name = "FartherReach"
					boolValue.Value = true
					boolValue.Parent = character
					print("[krampus] FartherReach enabled")
				elseif not fartherReach.Value then
					fartherReach.Value = true
				end
			end
		end)
	end

	local function fn136()
		flag9 = false
		n6 += 1

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		local character = localPlayer.Character

		if character then
			local fartherReach = character:FindFirstChild("FartherReach")

			if fartherReach then
				fartherReach:Destroy()
			end
		end

		local character2 = localPlayer.Character

		if character2 then
			local grabbingScript = character2:FindFirstChild("GrabbingScript")

			if grabbingScript and not grabbingScript.Enabled then
				grabbingScript.Enabled = true
			end
		end

		print("[krampus] Extend line disabled")
	end

	v10:Toggle({
		Title = "extend line (further reach)",
		Value = false,
		CallBack = function(arg)
			flag9 = arg

			if arg then
				fn135()
				notify2("krampus", "Further reach enabled - grab distance increased!", 3)
			else
				fn136()
				notify2("krampus", "Further reach disabled", 2)
			end

			fn83()
		end,
	})

	localPlayer.CharacterAdded:Connect(function(character)
		task.wait(0.5)

		if flag9 then
			local fartherReach = character:FindFirstChild("FartherReach")

			if not fartherReach then
				local boolValue = Instance.new("BoolValue")
				boolValue.Name = "FartherReach"
				boolValue.Value = true
				boolValue.Parent = character
			elseif not fartherReach.Value then
				fartherReach.Value = true
			end
		end
	end)

	local n7 = math.floor(workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView or 70)
	v10:Section("camera")

	v10:Slider({
		Title = "field of view (fov)",
		Sliders = {
			{
				Title = "fov",
				Range = { 60, 120 },
				Increment = 1,
				StarterValue = n7,
				CallBack = function(fieldOfView)
					local currentCamera = workspace.CurrentCamera

					if currentCamera then
						currentCamera.FieldOfView = fieldOfView
					end

					fn83()
				end,
			},
		},
	})

	v10:Toggle({
		Title = "3rd person mode",
		Value = _G.thirdPerson,
		CallBack = function(thirdPerson)
			_G.thirdPerson = thirdPerson
			applyThirdPersonState()
			fn77()
			fn83()
		end,
	})

	v10:Section("troll")

	v10:Toggle({
		Title = "jerkoff (q)",
		Value = jerk.enabled,
		CallBack = function(arg)
			if arg then
				fn70()
			else
				fn71()
			end

			fn77()
			fn83()
		end,
	})

	local function fn137()
		local character = localPlayer.Character
		if not character then
			return
		end
		local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not torso or not humanoidRootPart then
			return
		end
		local spawnToyRemoteFunction = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
		local stickyPartEvent2 = replicatedStorage:FindFirstChild("PlayerEvents") and replicatedStorage.PlayerEvents:FindFirstChild("StickyPartEvent")
		local destroyToy = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("DestroyToy")
		if not spawnToyRemoteFunction or not stickyPartEvent2 then
			return
		end
		local v11 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if v11 then
			local toolPencil = v11:FindFirstChild("ToolPencil")

			if toolPencil and destroyToy then
				pcall(function()
					destroyToy:FireServer(toolPencil)
				end)

				task.wait(0.1)
			end
		end

		pcall(function()
			spawnToyRemoteFunction:InvokeServer("ToolPencil", CFrame.new(humanoidRootPart.Position) + Vector3.new(0, 0, 15), Vector3.zero)
		end)

		local stickyPart = nil
		local n8 = os.clock() + 2
		local toolPencil = nil
		local exitTo5 = nil
		local v12

		while true do
			v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

			if v12 then
				exitTo5 = 1
				break
			else
				runService.Heartbeat:Wait()
				if not (os.clock() > n8) then
					continue
				end
				break
			end
		end

		local flag10

		if exitTo5 == 1 then
			toolPencil = v12:FindFirstChild("ToolPencil")
			local exitTo2, exitTo, exitTo4, exitTo3, exitTo6

			if toolPencil then
				stickyPart = toolPencil:FindFirstChild("StickyPart")

				if stickyPart then
					flag10 = not toolPencil or not stickyPart
				else
					exitTo2 = nil

					while true do
						runService.Heartbeat:Wait()

						if os.clock() > n8 then
							break
						else
							exitTo = nil

							while true do
								v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

								if v12 then
									exitTo = 1
									break
								else
									runService.Heartbeat:Wait()
									if not (os.clock() > n8) then
										continue
									end
									break
								end
							end

							if exitTo == 1 then
								toolPencil = v12:FindFirstChild("ToolPencil")

								if toolPencil then
									stickyPart = toolPencil:FindFirstChild("StickyPart")
									if not stickyPart then
										continue
									end
								else
									exitTo2 = 1
									break
								end
							end

							break
						end
					end

					if exitTo2 == 1 then
						exitTo4 = nil

						while true do
							runService.Heartbeat:Wait()

							if os.clock() > n8 then
								break
							else
								exitTo3 = nil

								while true do
									v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

									if v12 then
										exitTo3 = 1
										break
									else
										runService.Heartbeat:Wait()
										if not (os.clock() > n8) then
											continue
										end
										break
									end
								end

								if exitTo3 == 1 then
									toolPencil = v12:FindFirstChild("ToolPencil")

									if toolPencil then
										exitTo4 = 1
										break
									else
										continue
									end
								end

								break
							end
						end

						if exitTo4 == 1 then
							stickyPart = toolPencil:FindFirstChild("StickyPart")

							if stickyPart then
								flag10 = not toolPencil or not stickyPart
							else
								exitTo6 = nil

								while true do
									exitTo2 = nil

									while true do
										runService.Heartbeat:Wait()

										if os.clock() > n8 then
											break
										else
											exitTo = nil

											while true do
												v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

												if v12 then
													exitTo = 1
													break
												else
													runService.Heartbeat:Wait()
													if not (os.clock() > n8) then
														continue
													end
													break
												end
											end

											if exitTo == 1 then
												toolPencil = v12:FindFirstChild("ToolPencil")

												if toolPencil then
													stickyPart = toolPencil:FindFirstChild("StickyPart")
													if not stickyPart then
														continue
													end
												else
													exitTo2 = 1
													break
												end
											end

											break
										end
									end

									if exitTo2 == 1 then
										exitTo4 = nil

										while true do
											runService.Heartbeat:Wait()

											if os.clock() > n8 then
												break
											else
												exitTo3 = nil

												while true do
													v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

													if v12 then
														exitTo3 = 1
														break
													else
														runService.Heartbeat:Wait()
														if not (os.clock() > n8) then
															continue
														end
														break
													end
												end

												if exitTo3 == 1 then
													toolPencil = v12:FindFirstChild("ToolPencil")

													if toolPencil then
														exitTo4 = 1
														break
													else
														continue
													end
												end

												break
											end
										end

										if exitTo4 == 1 then
											stickyPart = toolPencil:FindFirstChild("StickyPart")

											if stickyPart then
												exitTo6 = 2
												break
											else
												continue
											end
										else
											exitTo6 = 1
											break
										end
									end

									break
								end

								if exitTo6 == 1 then
									flag10 = not toolPencil or not stickyPart
								elseif exitTo6 == 2 then
									flag10 = not toolPencil or not stickyPart
								else
									flag10 = not toolPencil or not stickyPart
								end
							end
						else
							flag10 = not toolPencil or not stickyPart
						end
					else
						flag10 = not toolPencil or not stickyPart
					end
				end
			else
				exitTo4 = nil

				while true do
					runService.Heartbeat:Wait()

					if os.clock() > n8 then
						break
					else
						exitTo3 = nil

						while true do
							v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

							if v12 then
								exitTo3 = 1
								break
							else
								runService.Heartbeat:Wait()
								if not (os.clock() > n8) then
									continue
								end
								break
							end
						end

						if exitTo3 == 1 then
							toolPencil = v12:FindFirstChild("ToolPencil")

							if toolPencil then
								exitTo4 = 1
								break
							else
								continue
							end
						end

						break
					end
				end

				if exitTo4 == 1 then
					stickyPart = toolPencil:FindFirstChild("StickyPart")

					if stickyPart then
						flag10 = not toolPencil or not stickyPart
					else
						exitTo6 = nil

						while true do
							exitTo2 = nil

							while true do
								runService.Heartbeat:Wait()

								if os.clock() > n8 then
									break
								else
									exitTo = nil

									while true do
										v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

										if v12 then
											exitTo = 1
											break
										else
											runService.Heartbeat:Wait()
											if not (os.clock() > n8) then
												continue
											end
											break
										end
									end

									if exitTo == 1 then
										toolPencil = v12:FindFirstChild("ToolPencil")

										if toolPencil then
											stickyPart = toolPencil:FindFirstChild("StickyPart")
											if not stickyPart then
												continue
											end
										else
											exitTo2 = 1
											break
										end
									end

									break
								end
							end

							if exitTo2 == 1 then
								exitTo4 = nil

								while true do
									runService.Heartbeat:Wait()

									if os.clock() > n8 then
										break
									else
										exitTo3 = nil

										while true do
											v12 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

											if v12 then
												exitTo3 = 1
												break
											else
												runService.Heartbeat:Wait()
												if not (os.clock() > n8) then
													continue
												end
												break
											end
										end

										if exitTo3 == 1 then
											toolPencil = v12:FindFirstChild("ToolPencil")

											if toolPencil then
												exitTo4 = 1
												break
											else
												continue
											end
										end

										break
									end
								end

								if exitTo4 == 1 then
									stickyPart = toolPencil:FindFirstChild("StickyPart")

									if stickyPart then
										exitTo6 = 2
										break
									else
										continue
									end
								else
									exitTo6 = 1
									break
								end
							end

							break
						end

						if exitTo6 == 1 then
							flag10 = not toolPencil or not stickyPart
						elseif exitTo6 == 2 then
							flag10 = not toolPencil or not stickyPart
						else
							flag10 = not toolPencil or not stickyPart
						end
					end
				else
					flag10 = not toolPencil or not stickyPart
				end
			end
		else
			flag10 = not toolPencil or not stickyPart
		end

		if flag10 then
			return
		end

		pcall(function()
			stickyPartEvent2:FireServer(stickyPart, torso, CFrame.new(0, -1, 0) * CFrame.Angles(0, 3.1415926535897931, 0))
		end)

		for _, descendant in ipairs(toolPencil:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanQuery = false
				descendant.CanCollide = false
			end
		end
	end

	v10:Toggle({
		Title = "pencil shlong",
		Value = false,
		CallBack = function(arg)
			if arg then
				task.spawn(fn137)
			else
				local v11 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
				local toolPencil = v11 and v11:FindFirstChild("ToolPencil")
				local destroyToy = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("DestroyToy")

				if toolPencil and destroyToy then
					pcall(function()
						destroyToy:FireServer(toolPencil)
					end)
				end
			end

			fn83()
		end,
	})

	local v11 = v3:InitTab({ Title = "auras" })

	local tbl10 = {
		isRunning = false,
		tornadoCenter = Vector3.zero,
		activeToys = {},
		addToysToTornado = true,
		excludeSpawnedToys = false,
		tornadoType = "Follow Player",
		waypoints = {},
		currentWaypointIndex = 1,
		pathProgress = 0,
		tornadoConnection = nil,
		rotationSpeed = 5,
		attractionStrength = 210,
		layerCount = 16,
		layerSpacing = 5,
		baseHeight = 3,
		heightOffset = 8,
		minRadius = 10,
		maxRadius = 65,
		curvePower = 1.6,
		followOffset = Vector3.zero,
		smoothing = 0.15,
		pathSpeed = 24,
		pathRadiusX = 150,
		pathRadiusZ = 120,
		waypointCount = 12,
		pathHeight = 0,
	}

	local function fn138()
		return localPlayer.Character or localPlayer.CharacterAdded:Wait()
	end

	local function fn139()
		local function fn140()
			task.wait(0.15)
			local grabParts = workspace:FindFirstChild("GrabParts")
			if not grabParts then
				return
			end
			local grabPart = grabParts:FindFirstChild("GrabPart")
			if not grabPart then
				return
			end
			local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
			if not weldConstraint or not weldConstraint.Part1 then
				return
			end
			local model = weldConstraint.Part1:FindFirstAncestorOfClass("Model")
			if not model or not model:FindFirstChild("SoundPart") then
				return
			end

			if tbl10.excludeSpawnedToys and model.Parent and model.Parent.Name == localPlayer.Name .. "SpawnedInToys" then
				return
			end

			if tbl10.isRunning and tbl10.addToysToTornado and not tbl10.activeToys[model] then
				local soundPart = model.SoundPart

				pcall(function()
					local setNetworkOwner = replicatedStorage:FindFirstChild("GrabEvents") and replicatedStorage.GrabEvents:FindFirstChild("SetNetworkOwner")

					if setNetworkOwner then
						setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
					end
				end)

				for _, descendant in pairs(model:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
					end
				end

				tbl10.activeToys[model] = { layer = math.random(1, tbl10.layerCount) }
			end
		end

		workspace.ChildAdded:Connect(function(child)
			if child.Name == "GrabParts" then
				fn140()
			end
		end)

		if workspace:FindFirstChild("GrabParts") then
			fn140()
		end
	end

	workspace.DescendantRemoving:Connect(function(descendant)
		if descendant:IsA("Model") and descendant:FindFirstChild("SoundPart") then
			tbl10.activeToys[descendant] = nil
		end
	end)

	localPlayer.CharacterAdded:Connect(function()
		if tbl10.isRunning then
			tbl10.activeToys = {}
		end
	end)

	local function fn140()
		if tbl10.tornadoConnection then
			tbl10.tornadoConnection:Disconnect()
			tbl10.tornadoConnection = nil
		end

		tbl10.isRunning = false

		for k in pairs(tbl10.activeToys) do
			local soundPart = k:FindFirstChild("SoundPart")

			if soundPart then
				soundPart.Velocity = Vector3.zero
			end
		end
	end

	local function fn141()
		if tbl10.tornadoConnection then
			tbl10.tornadoConnection:Disconnect()
			tbl10.tornadoConnection = nil
		end

		tbl10.isRunning = true

		if tbl10.tornadoType == "Go around map" then
			tbl10.waypoints = {}
			local vector = Vector3.new(0, tbl10.pathHeight, 0)

			for i = 1, tbl10.waypointCount do
				local v12 = math.rad((i - 1) * 360 / tbl10.waypointCount)
				local pathRadiusX = tbl10.pathRadiusX
				local pathRadiusZ = tbl10.pathRadiusZ
				local n8 = vector + Vector3.new(math.cos(v12) * pathRadiusX, 0, math.sin(v12) * pathRadiusZ)
				local random = math.random
				table.insert(tbl10.waypoints, n8 + Vector3.new(math.random(-5, 5), 0, random(-5, 5)))
			end

			tbl10.currentWaypointIndex = 1
			tbl10.pathProgress = 0
		end

		tbl10.tornadoConnection = runService.Heartbeat:Connect(function(deltaTime)
			local humanoidRootPart = fn138()
			humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end

			if tbl10.tornadoType == "Follow Player" then
				tbl10.tornadoCenter = tbl10.tornadoCenter:Lerp(humanoidRootPart.Position + tbl10.followOffset, 1 - math.pow(1 - tbl10.smoothing, deltaTime * 60))
			elseif tbl10.tornadoType == "Go around map" and #tbl10.waypoints > 0 then
				local v12 = tbl10.waypoints[tbl10.currentWaypointIndex]
				local v13 = tbl10.waypoints[tbl10.currentWaypointIndex % #tbl10.waypoints + 1]
				local magnitude = (v13 - v12).Magnitude

				if magnitude > 0 then
					tbl10.tornadoCenter = v12:Lerp(v13, tbl10.pathProgress / magnitude)
					tbl10.pathProgress = tbl10.pathProgress + tbl10.pathSpeed * deltaTime

					if magnitude <= tbl10.pathProgress then
						tbl10.pathProgress = tbl10.pathProgress - magnitude
						tbl10.currentWaypointIndex = tbl10.currentWaypointIndex % #tbl10.waypoints + 1
					end
				end
			end

			for k, activeToy in pairs(tbl10.activeToys) do
				local soundPart = k:FindFirstChild("SoundPart")

				if soundPart and soundPart.Parent then
					local layer = activeToy.layer
					local curvePower = tbl10.curvePower
					local n8 = tbl10.minRadius + ((layer - 1) / math.max(tbl10.layerCount - 1, 1)) ^ curvePower * (tbl10.maxRadius - tbl10.minRadius)
					local n9 = tbl10.baseHeight + (layer - 1) * tbl10.layerSpacing + tbl10.heightOffset
					local tornadoCenter = tbl10.tornadoCenter
					local n10 = Vector3.new(soundPart.Position.X, tbl10.tornadoCenter.Y, soundPart.Position.Z) - tornadoCenter
					local n11 = math.atan2(n10.Z, n10.X) + math.rad(tbl10.rotationSpeed)
					local vector = Vector3.new(math.cos(n11) * n8, 0, math.sin(n11) * n8)
					local n12 = Vector3.new(tbl10.tornadoCenter.X, 0, tbl10.tornadoCenter.Z) + vector + Vector3.new(0, tbl10.tornadoCenter.Y + n9, 0) - soundPart.Position

					if n12.Magnitude > 0.1 then
						soundPart.Velocity = n12.Unit * tbl10.attractionStrength
					end
				else
					tbl10.activeToys[k] = nil
				end
			end
		end)
	end

	v11:Section(" vortex telekinesis")

	v11:Toggle({
		Title = "activate vortex",
		Value = false,
		CallBack = function(arg)
			if arg then
				fn141()
			else
				fn140()
			end
		end,
	})

	v11:Toggle({
		Title = "whitelist your own toys",
		Value = false,
		CallBack = function(excludeSpawnedToys)
			tbl10.excludeSpawnedToys = excludeSpawnedToys
		end,
	})

	v11:Button({
		Title = "disconnect all items from vortex",
		CallBack = function()
			for k in pairs(tbl10.activeToys) do
				local soundPart = k:FindFirstChild("SoundPart")

				if soundPart then
					soundPart.Velocity = Vector3.zero
				end

				for _, descendant in pairs(k:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = true
					end
				end
			end

			tbl10.activeToys = {}
		end,
	})

	v11:Slider({
		Title = "rotation speed",
		Sliders = {
			{
				Title = "speed",
				Range = { 1, 20 },
				Increment = 0.5,
				StarterValue = tbl10.rotationSpeed,
				CallBack = function(rotationSpeed)
					tbl10.rotationSpeed = rotationSpeed
				end,
			},
		},
	})

	v11:Slider({
		Title = "amount of layers",
		Sliders = {
			{
				Title = "layers",
				Range = { 4, 32 },
				Increment = 1,
				StarterValue = tbl10.layerCount,
				CallBack = function(layerCount)
					tbl10.layerCount = layerCount
				end,
			},
		},
	})

	v11:Slider({
		Title = "minimum radius",
		Sliders = {
			{
				Title = "min radius",
				Range = { 5, 30 },
				Increment = 1,
				StarterValue = tbl10.minRadius,
				CallBack = function(minRadius)
					tbl10.minRadius = minRadius
				end,
			},
		},
	})

	v11:Slider({
		Title = "maximum radius",
		Sliders = {
			{
				Title = "max radius",
				Range = { 30, 120 },
				Increment = 1,
				StarterValue = tbl10.maxRadius,
				CallBack = function(maxRadius)
					tbl10.maxRadius = maxRadius
				end,
			},
		},
	})

	v11:Slider({
		Title = "height offset",
		Sliders = {
			{
				Title = "offset",
				Range = { 0, 30 },
				Increment = 1,
				StarterValue = tbl10.heightOffset,
				CallBack = function(heightOffset)
					tbl10.heightOffset = heightOffset
				end,
			},
		},
	})

	v11:Slider({
		Title = "base height",
		Sliders = {
			{
				Title = "height",
				Range = { 0, 20 },
				Increment = 1,
				StarterValue = tbl10.baseHeight,
				CallBack = function(baseHeight)
					tbl10.baseHeight = baseHeight
				end,
			},
		},
	})

	v11:Slider({
		Title = "rotation power",
		Sliders = {
			{
				Title = "power",
				Range = { 0.5, 3 },
				Increment = 0.1,
				StarterValue = tbl10.curvePower,
				CallBack = function(curvePower)
					tbl10.curvePower = curvePower
				end,
			},
		},
	})

	v11:Slider({
		Title = "path speed",
		Sliders = {
			{
				Title = "speed",
				Range = { 10, 60 },
				Increment = 1,
				StarterValue = tbl10.pathSpeed,
				CallBack = function(pathSpeed)
					tbl10.pathSpeed = pathSpeed
				end,
			},
		},
	})
	-- join us: https://discord.gg/x7YbZeezpm

	fn139()
	v11:Section("other auras")

	v11:Toggle({
		Title = "poison aura",
		Value = _G.Poison_Aura,
		CallBack = function(poisonAura)
			_G.Poison_Aura = poisonAura
			aura.updateLoopState()
		end,
	})

	v11:Toggle({
		Title = "attraction aura",
		Value = _G.AttractionAura,
		CallBack = function(attractionAura)
			_G.AttractionAura = attractionAura
			aura.updateLoopState()
		end,
	})

	v11:Toggle({
		Title = "death aura",
		Value = _G.DeathAura,
		CallBack = function(deathAura)
			_G.DeathAura = deathAura
			aura.updateLoopState()
		end,
	})

	v11:Toggle({
		Title = "kick aura",
		Value = _G.KickAura,
		CallBack = function(kickAura)
			_G.KickAura = kickAura
			aura.updateLoopState()
		end,
	})

	v11:Slider({
		Title = "kick aura radius",
		Sliders = {
			{
				Title = "radius",
				Range = { 5, 80 },
				Increment = 1,
				StarterValue = _G.KickAuraRadius or 30,
				CallBack = function(kickAuraRadius)
					_G.KickAuraRadius = kickAuraRadius
				end,
			},
		},
	})

	v11:Toggle({
		Title = "unstick aura",
		Value = _G.UnstickAura,
		CallBack = function(unstickAura)
			_G.UnstickAura = unstickAura
			aura.updateLoopState()
		end,
	})

	v11:Slider({
		Title = "unstick aura radius",
		Sliders = {
			{
				Title = "radius",
				Range = { 5, 80 },
				Increment = 1,
				StarterValue = aura.unstickRadius or 30,
				CallBack = function(unstickRadius)
					aura.unstickRadius = unstickRadius
				end,
			},
		},
	})

	local v12 = v3:InitTab({ Title = "loop players" })
	v12:Section("selection")

	local v13 = v12:Dropdown({
		Title = "players to loop",
		Options = fn98(),
		PlaceHolder = "select players",
		Multi = true,
		CallBack = function(arg)
			fn102(arg)
		end,
	})

	target.targetSelectionListRef = { Refresh = function()
		if v13 and v13.SetOptions then
			v13:SetOptions(fn98(), true)

			if v13.Set then
				v13:Set(fn99(), true)
			end
		end
	end }

	target.selectedKickMethod = "Slower, but better hold"
	target.KickMethods = { SLOWER_BETTER_HOLD = "Slower, but better hold", FASTER_CAN_LAG = "Faster, but can cause lag" }

	v12:Button({
		Title = "add last clicked player",
		CallBack = function()
			if target.selectedTargetName then
				if fn92(target.selectedTargetName) then
					fn85()
				end
			else
				notify2("krampus", "no target has been clicked yet.")
			end
		end,
	})

	v12:Button({
		Title = "clear selected targets",
		CallBack = function()
			fn93()
		end,
	})

	v12:Section("loop functions")

	target.targetRagdollToggleRef = fn87(v12:Toggle({
		Title = "ragdoll target",
		Value = target.loopSpamKickRagdollEnabled,
		CallBack = function(loopSpamKickRagdollEnabled)
			target.loopSpamKickRagdollEnabled = loopSpamKickRagdollEnabled

			if loopSpamKickRagdollEnabled then
				task.spawn(fn15)
			else
				fn13()
			end

			fn77()
			fn85()
		end,
	}))

	local function fn142()
		task.spawn(function()
			while target.blobmanKickEnabled do
				local result11 = fn5()

				if not result11 then
					notify2("krampus", "no target selected", 2)
					target.blobmanKickEnabled = false

					if target.targetBlobmanKickToggleRef then
						target.targetToggleSyncing = true
						target.targetBlobmanKickToggleRef.Set(false)
						target.targetToggleSyncing = false
					end

					break
				else
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")
					character = character and character:FindFirstChild("HumanoidRootPart")

					if not (humanoid and character) then
						task.wait(0.1)
					else
						local cFrame = character.CFrame
						local seatPart = humanoid and humanoid.SeatPart
						local parent = nil

						if seatPart then
							parent = humanoid.SeatPart.Parent
							local flag10 = parent and parent.Name == "CreatureBlobman"
							local value17 = nil

							if not flag10 then
								parent = value17
							end
						end

						local character2, humanoidRootPart, humanoid2, n8, flag10, flag11, grabEvents2, setNetworkOwner, bodyVelocity, leftDetector, leftWeld, blobmanSeatAndOwnerScript, parent2

						if not parent then
							parent = antiKick.spawnToyExact("CreatureBlobman", character.CFrame * CFrame.new(0, 0, -5), antiKick.getPlot())

							if not parent then
								task.wait(0.5)
							else
								local vehicleSeat = parent:WaitForChild("VehicleSeat", 5)

								if not vehicleSeat then
									task.wait(0.5)
								else
									vehicleSeat:Sit(humanoid)
									local n9 = 0

									while true do
										task.wait(0.03)
										n9 += 0.03
										if not (humanoid.SeatPart and humanoid.SeatPart.Parent == parent or n9 >= 5) then
											continue
										end
										break
									end

									if not (humanoid.SeatPart and humanoid.SeatPart.Parent == parent) then
										task.wait(0.5)
									else
										character2 = result11.Character
										humanoidRootPart = nil
										humanoid2 = nil
										n8 = 0

										while true do
											flag10 = character2 and humanoidRootPart and humanoid2 and humanoid2.Health > 0
											flag11 = not flag10 and n8 < 10

											if flag11 then
												task.wait(0.2)
												n8 += 0.2
												character2 = result11.Character

												if character2 then
													humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
													humanoid2 = character2:FindFirstChild("Humanoid")
												end

												continue
											end

											break
										end

										character2 = character2 and humanoidRootPart and humanoid2 and humanoid2.Health > 0

										if not character2 then
											task.wait(0.5)
										else
											character.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(5, 0, 0))
											task.wait(0.15)
											grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
											setNetworkOwner = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")
											grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("DestroyGrabLine")

											if setNetworkOwner then
												setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
											end

											task.wait(0.08)

											if grabEvents2 then
												grabEvents2:FireServer(humanoidRootPart)
											end

											task.wait(0.08)
											bodyVelocity = Instance.new("BodyVelocity")
											bodyVelocity.Parent = humanoidRootPart
											bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
											bodyVelocity.Velocity = Vector3.new(0, 500, 0)
											humanoid2.Jump = true
											humanoid2.Sit = false
											task.wait(0.1)
											bodyVelocity.Velocity = Vector3.new(0, 1000, 0)

											task.delay(0.15, function()
												if bodyVelocity and bodyVelocity.Parent then
													bodyVelocity:Destroy()
												end
											end)

											leftDetector = parent:FindFirstChild("LeftDetector")

											if leftDetector then
												leftWeld = leftDetector:FindFirstChild("LeftWeld")
												blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
												blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

												if blobmanSeatAndOwnerScript then
													blobmanSeatAndOwnerScript:FireServer(leftDetector, humanoidRootPart, leftWeld)
												end
											end

											task.wait(0.08)
											parent2 = cFrame and character and character.Parent

											if parent2 then
												character.CFrame = cFrame
											end

											task.wait(1.5)
										end
									end
								end
							end
						else
							character2 = result11.Character
							humanoidRootPart = nil
							humanoid2 = nil
							n8 = 0

							while true do
								flag10 = character2 and humanoidRootPart and humanoid2 and humanoid2.Health > 0
								flag11 = not flag10 and n8 < 10

								if flag11 then
									task.wait(0.2)
									n8 += 0.2
									character2 = result11.Character

									if character2 then
										humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
										humanoid2 = character2:FindFirstChild("Humanoid")
									end

									continue
								end

								break
							end

							character2 = character2 and humanoidRootPart and humanoid2 and humanoid2.Health > 0

							if not character2 then
								task.wait(0.5)
							else
								character.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(5, 0, 0))
								task.wait(0.15)
								grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
								setNetworkOwner = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")
								grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("DestroyGrabLine")

								if setNetworkOwner then
									setNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
								end

								task.wait(0.08)

								if grabEvents2 then
									grabEvents2:FireServer(humanoidRootPart)
								end

								task.wait(0.08)
								bodyVelocity = Instance.new("BodyVelocity")
								bodyVelocity.Parent = humanoidRootPart
								bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyVelocity.Velocity = Vector3.new(0, 500, 0)
								humanoid2.Jump = true
								humanoid2.Sit = false
								task.wait(0.1)
								bodyVelocity.Velocity = Vector3.new(0, 1000, 0)

								task.delay(0.15, function()
									if bodyVelocity and bodyVelocity.Parent then
										bodyVelocity:Destroy()
									end
								end)

								leftDetector = parent:FindFirstChild("LeftDetector")

								if leftDetector then
									leftWeld = leftDetector:FindFirstChild("LeftWeld")
									blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
									blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

									if blobmanSeatAndOwnerScript then
										blobmanSeatAndOwnerScript:FireServer(leftDetector, humanoidRootPart, leftWeld)
									end
								end

								task.wait(0.08)
								parent2 = cFrame and character and character.Parent

								if parent2 then
									character.CFrame = cFrame
								end

								task.wait(1.5)
							end
						end
					end
				end
			end

			target.blobmanKickEnabled = false

			if target.targetBlobmanKickToggleRef then
				target.targetToggleSyncing = true
				target.targetBlobmanKickToggleRef.Set(false)
				target.targetToggleSyncing = false
			end

			fn85()
		end)
	end

	local function fn143(arg, arg2)
		if arg and arg.Get() ~= arg2 then
			target.targetToggleSyncing = true
			arg.Set(arg2)
			target.targetToggleSyncing = false
		end
	end

	target.targetKickToggleRef = fn87(v12:Toggle({
		Title = "loop kick (non blobman)",
		Value = target.loopSpamKickEnabled,
		CallBack = function(arg)
			if target.targetToggleSyncing then
				return
			end

			if not arg then
				target.loopSpamKickEnabled = false
				fn17()
				fn2()
				fn85()
				return
			end

			target.loopSpamKickEnabled = false
			_G.LoopKill = false
			_G.LoopKillPerm = false
			fn143(target.targetKillToggleRef, false)
			fn143(target.targetLoopKillPermToggleRef, false)
			target.loopSpamKickTarget = fn5()

			if not target.loopSpamKickTarget then
				notify2("krampus", "add players to the loop list first.")
				fn143(target.targetKickToggleRef, false)
				fn85()
				return
			end

			target.loopSpamKickEnabled = true
			fn20()
			fn77()
			fn85()
		end,
	}))

	v12:Section("kick settings")

	v12:Dropdown({
		Title = "kick method",
		Description = "Choose the remote spam sequence",
		Options = { target.KickMethods.SLOWER_BETTER_HOLD, target.KickMethods.FASTER_CAN_LAG },
		PlaceHolder = target.selectedKickMethod,
		Multi = false,
		CallBack = function(arg)
			local kickMethodChangedTo = type(arg) == "table" and arg[1] or arg
			target.selectedKickMethod = kickMethodChangedTo
			notify2("krampus", "Kick method changed to: " .. kickMethodChangedTo, 2)
		end,
	})

	target.targetBlobmanKickToggleRef = fn87(v12:Toggle({
		Title = "blobman kick (desync)",
		Value = false,
		CallBack = function(arg)
			if target.targetToggleSyncing then
				return
			end

			if not arg then
				target.blobmanKickEnabled = false
				return
			end

			if #target.playerList == 0 then
				notify2("krampus", "add players to the loop list first.", 3)
				fn143(target.targetBlobmanKickToggleRef, false)
				return
			end

			target.blobmanKickEnabled = true
			fn142()
			fn85()
		end,
	}))

	target.targetKillToggleRef = fn87(v12:Toggle({
		Title = "loop kill",
		Value = _G.LoopKill,
		CallBack = function(arg)
			if target.targetToggleSyncing then
				return
			end

			if not arg then
				_G.LoopKill = false
				target.selectedKillOnly = false
				setKillAllEnabled(false)
				fn85()
				fn84()
				return
			end

			target.loopSpamKickEnabled = false
			_G.LoopKillPerm = false
			fn143(target.targetKickToggleRef, false)
			fn143(target.targetLoopKillPermToggleRef, false)

			if #target.playerList == 0 then
				notify2("krampus", "add players to the loop list first.")
				fn143(target.targetKillToggleRef, false)
				fn85()
				return
			end

			for _, item20 in ipairs(target.playerList) do
				fn16(item20)
			end

			_G.LoopKill = true
			target.selectedKillOnly = true
			setKillAllEnabled(true)
			fn85()
			fn77()
			fn84()
		end,
	}))

	local function fn144()
		task.spawn(function()
			while target.snowballLoopEnabled do
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				if not humanoidRootPart then
					task.wait(0.1)
				else
					for _, item21 in ipairs(target.playerList) do
						if target.snowballLoopEnabled then
							local v15 = players:FindFirstChild(item21)

							if v15 and v15 ~= localPlayer and v15.Character then
								local humanoidRootPart2 = v15.Character:FindFirstChild("HumanoidRootPart")
								local humanoid = v15.Character:FindFirstChildOfClass("Humanoid")

								if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
									pcall(function()
										spawnToyRF:InvokeServer("BallSnowball", humanoidRootPart.CFrame * CFrame.new(0, 3, 5), Vector3.new(0, 59.667, 0))
									end)

									task.wait(0.05)
									local v16 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									local ballSnowball = v16 and v16:FindFirstChild("BallSnowball")

									if ballSnowball then
										local soundPart = ballSnowball:FindFirstChild("SoundPart")
										local snowRagdollPart = ballSnowball:FindFirstChild("SnowRagdollPart")

										if soundPart and snowRagdollPart then
											snowRagdollPart.CFrame = humanoidRootPart2.CFrame

											pcall(function()
												local bombEvents = replicatedStorage:FindFirstChild("BombEvents")
												bombEvents = bombEvents and bombEvents:FindFirstChild("BombExplode")

												if bombEvents then
													bombEvents:FireServer({
														Radius = 5.1961522102355957,
														Color = Color3.fromRGB(248, 248, 248),
														TimeLength = 0.5,
														Hitbox = soundPart,
														ExplodesByFire = false,
														MaxForcePerStudSquared = 0,
														Model = ballSnowball,
														ImpactSpeed = 10,
														ExplodesByPointy = false,
														DestroysModel = true,
														Type = "SnowPoof",
														PositionPart = humanoidRootPart2,
													}, humanoidRootPart2.Position)
												end
											end)
										end
									end
								end
							end

							task.wait(0.08)
							continue
						end

						break
					end

					task.wait(0.35)
				end
			end
		end)
	end

	v12:Toggle({
		Title = "snowball loop",
		Value = false,
		CallBack = function(snowballLoopEnabled)
			target.snowballLoopEnabled = snowballLoopEnabled

			if snowballLoopEnabled then
				if #target.playerList == 0 then
					notify2("krampus", "add players to loop list first", 3)
					target.snowballLoopEnabled = false
					return
				end

				fn144()
				notify2("krampus", "started snowballing target", 3)
			else
				notify2("krampus", "stopped sending my balls are the target", 2)
			end

			fn85()
		end,
	})

	local function fn145(arg)
		if not arg or arg == LocalPlayer then
			return false
		end
		local v14 = workspace:FindFirstChild(arg.Name .. "SpawnedInToys")
		if not v14 then
			return false
		end

		for _, child in ipairs(v14:GetChildren()) do
			if child.Name == "CreatureBlobman" then
				local vehicleSeat = child:FindFirstChild("VehicleSeat") or child:FindFirstChildWhichIsA("VehicleSeat", true)

				if vehicleSeat then
					local character = LocalPlayer.Character
					if not character then
						return false
					end
					local humanoid = character:FindFirstChild("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoid or not humanoidRootPart then
						return false
					end
					local cFrame = humanoidRootPart.CFrame
					humanoidRootPart.CFrame = vehicleSeat.CFrame
					humanoidRootPart.Velocity = Vector3.zero
					vehicleSeat:Sit(humanoid)
					task.wait(0.3)

					if humanoid.SeatPart == vehicleSeat then
						humanoid.Sit = false
						task.wait(0.1)
						humanoidRootPart.CFrame = cFrame
						task.wait(0.5)
						child:Destroy()
						return true
					end

					humanoidRootPart.CFrame = cFrame
				end
			end
		end

		return false
	end

	target.loopDestroyGucciEnabled = false

	local function fn146()
		task.spawn(function()
			while target.loopDestroyGucciEnabled do
				for _, item22 in ipairs(target.playerList) do
					if target.loopDestroyGucciEnabled then
						local v15 = players:FindFirstChild(item22)

						if v15 and v15 ~= localPlayer then
							if fn145(v15) then
								notify2("krampus", "took gucci" .. v15.Name, 2)
							end
						end

						task.wait(0.3)
						continue
					end

					break
				end

				task.wait(0.5)
			end
		end)
	end

	target.targetDestroyGucciToggleRef = fn87(v12:Toggle({
		Title = "destroy gucci",
		Value = false,
		CallBack = function(loopDestroyGucciEnabled)
			target.loopDestroyGucciEnabled = loopDestroyGucciEnabled

			if loopDestroyGucciEnabled then
				if #target.playerList == 0 then
					notify2("krampus", "add players to loop list first", 3)
					target.targetToggleSyncing = true
					target.targetDestroyGucciToggleRef.Set(false)
					target.targetToggleSyncing = false
					target.loopDestroyGucciEnabled = false
					return
				end

				fn146()
			end

			fn85()
		end,
	}))

	if not tbl.Runtime.Server.antiAntiLagEnabled then
		tbl.Runtime.Server.antiAntiLagEnabled = false
	end

	local flag10 = false
	local v14 = setAntiInputLagEnabled
	local flag11 = false
	local flag12 = false
	local n8 = 0
	local n9 = 0.1

	local byName4 = {
		InstrumentBrassBugle = true,
		InstrumentBrassTrumpet = true,
		InstrumentBrassVuvuzela = true,
		InstrumentDrumBongos = true,
		InstrumentDrumSnare = true,
		InstrumentGuitarAcoustic = true,
		InstrumentGuitarBanjo = true,
		InstrumentGuitarLyre = true,
		InstrumentGuitarUkulele = true,
		InstrumentGuitarViolin = true,
		InstrumentPianoKeyboard = true,
		InstrumentPianoMelodica = true,
		InstrumentVoiceMicrophone = true,
		InstrumentWoodwindOcarina = true,
		InstrumentWoodwindSaxophone = true,
		CupMugBrown = true,
		CupMugWhite = true,
		FoodBanana = true,
		FoodBread = true,
		FoodBroccoli = true,
		FoodCakePink = true,
		FoodCoconut = true,
		FoodDippyEgg = true,
		FoodDonut = true,
		FoodFrenchFries = true,
		FoodHamburger = true,
		FoodHotdog = true,
		FoodHotSauce = true,
		FoodMayonnaise = true,
		FoodMeatStick = true,
		FoodMushroomPoison = true,
		FoodPizzaCheese = true,
		FoodPizzaPepperoni = true,
		FoodPlate = true,
		FoodSodaCan = true,
		PoopPile = true,
		PoopPileSparkle = true,
	}

	local tbl12 = {}
	local tbl13 = {}
	local tbl14 = {}

	local function fn147(arg)
		if not arg then
			return true
		end
		local v15 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		if v15 and arg:IsDescendantOf(v15) then
			return true
		end
		local holdPart = arg:FindFirstChild("HoldPart")

		if holdPart then
			local holdingPlayer = holdPart:FindFirstChild("HoldingPlayer")

			if holdingPlayer then
				local value = holdingPlayer.Value
				if value == localPlayer or value == localPlayer.Name then
					return true
				end
			end
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant:FindFirstChild("PartOwner") then
				local value = descendant.PartOwner.Value
				if value == localPlayer.Name or value == localPlayer then
					return true
				end
			end
		end

		return false
	end

	local function fn148(arg)
		if not arg then
			return false
		end
		return not fn147(arg)
	end

	local function fn149(arg)
		if not arg or not arg.Parent then
			return
		end

		if fn147(arg) then
			return
		end
		-- join us: https://discord.gg/x7YbZeezpm

		if tbl13[arg] then
			return
		end
		local now = tick()
		if tbl14[arg] and now - tbl14[arg] < 0.1 then
			return
		end

		if now - n8 < n9 then
			return
		end
		tbl14[arg] = now
		n8 = now
		tbl13[arg] = true
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			tbl13[arg] = nil
			return
		end
		local holdPart = arg:FindFirstChild("HoldPart")
		if not holdPart then
			tbl13[arg] = nil
			return
		end

		task.spawn(function()
			pcall(function()
				if setNetworkOwnerEvent then
					safeFireRemote(setNetworkOwnerEvent, holdPart, holdPart.CFrame)
				end
			end)

			pcall(function()
				if holdPart.HoldItemRemoteFunction then
					holdPart.HoldItemRemoteFunction:InvokeServer(arg, character)
				end
			end)

			task.wait(0.08)
			if not arg or not arg.Parent then
				tbl13[arg] = nil
				return
			end

			if fn147(arg) then
				tbl13[arg] = nil
				return
			end

			if byName4[arg.Name] then
				pcall(function()
					if deleteToyRE then
						safeFireRemote(deleteToyRE, arg)
					end
				end)

				task.wait(0.05)

				if arg and arg.Parent and holdPart and holdPart.DropItemRemoteFunction then
					pcall(function()
						holdPart.DropItemRemoteFunction:InvokeServer(arg, CFrame.new(humanoidRootPart.Position.X, -100000, humanoidRootPart.Position.Z), Vector3.zero)
					end)
				end
			else
				pcall(function()
					if holdPart.DropItemRemoteFunction then
						holdPart.DropItemRemoteFunction:InvokeServer(arg, CFrame.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 500, humanoidRootPart.Position.Z), Vector3.zero)
					end
				end)
			end

			tbl13[arg] = nil
		end)
	end

	local function fn150()
		if not flag10 then
			return
		end

		if #tbl12 == 0 then
			return
		end

		if tick() - n8 < n9 then
			return
		end
		local value18 = nil

		while #tbl12 > 0 and not value18 do
			local v16 = table.remove(tbl12, 1)

			if v16 and v16.Parent and fn148(v16) then
				value18 = v16
			end
		end

		if value18 then
			fn149(value18)
		end
	end

	local function fn151(arg)
		if not arg or not arg.Parent then
			return
		end

		if not arg:FindFirstChild("HoldPart") then
			return
		end

		if fn147(arg) then
			return
		end

		if tbl13[arg] then
			return
		end

		for _, item23 in ipairs(tbl12) do
			if item23 == arg then
				return
			end
		end

		if byName4[arg.Name] then
			table.insert(tbl12, 1, arg)
		else
			table.insert(tbl12, arg)
		end

		if not flag12 then
			flag12 = true

			task.spawn(function()
				while flag10 and #tbl12 > 0 do
					fn150()
					task.wait(0.05)
				end

				flag12 = false
			end)
		end
	end

	local function fn152()
		workspace.DescendantAdded:Connect(function(descendant)
			if not flag10 then
				return
			end
			task.wait(0.02)

			if descendant:IsA("Model") and descendant:FindFirstChild("HoldPart") then
				if fn148(descendant) then
					fn151(descendant)
				end
			end
		end)
	end

	local function fn153()
		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("Model") and descendant:FindFirstChild("HoldPart") and descendant.Parent then
				if fn148(descendant) then
					fn151(descendant)
				end
			end
		end
	end

	local function callBack(arg)
		if arg == flag10 then
			return
		end
		flag10 = arg

		if arg then
			if _G.AntiInputLag and v14 then
				flag11 = true
				v14(false)
			end

			tbl12 = {}
			tbl13 = {}
			tbl14 = {}
			n8 = 0
			flag12 = false
			fn153()
			fn152()

			if notify2 then
				notify2("krampus", "destroying all holdables (anti net)", 2)
			end
		else
			tbl12 = {}
			tbl13 = {}
			flag12 = false

			if flag11 and v14 then
				v14(true)
				flag11 = false
			end

			if notify2 then
				notify2("krampus", "disabled destroy all holdables", 2)
			end
		end
	end

	local v15 = v3:InitTab({ Title = "esp" })
	v15:Section("esp")

	v15:Toggle({
		Title = "player icon & name",
		Value = esp.showNames,
		CallBack = function(showNames)
			esp.showNames = showNames

			if showNames then
				esp.enabled = true
			end

			fn77()
			fn82()
		end,
	})

	v15:Toggle({
		Title = "pcld esp",
		Value = esp.pcldEnabled,
		CallBack = function(pcldEnabled)
			esp.pcldEnabled = pcldEnabled
			fn77()
			fn82()
		end,
	})

	esp.antiKickESPEnabled = false
	esp.antiKickEntries = {}
	esp.antiKickConnections = {}
	esp.antiKickUseRainbow = false
	esp.antiKickColor = Color3.fromRGB(128, 0, 128)

	esp.getAntiKickColor = function()
		if esp.rainbow and esp.antiKickUseRainbow then
			return Color3.fromHSV(esp.hue % 1, 0.7, 1)
		end
		return esp.antiKickColor
	end

	esp.updateAntiKickColors = function()
		for _, antiKickEntry in pairs(esp.antiKickEntries) do
			if antiKickEntry and antiKickEntry.highlight and antiKickEntry.highlight.Parent then
				local v16 = esp.getAntiKickColor()
				antiKickEntry.highlight.FillColor = v16
				antiKickEntry.highlight.OutlineColor = v16
			end
		end
	end

	esp.applyAntiKickHighlight = function(adornee, arg)
		if not adornee or not adornee:FindFirstChild("StickyPart") then
			return
		end

		if esp.antiKickEntries[adornee] then
			return
		end
		local v16 = esp.getAntiKickColor()
		local highlight = Instance.new("Highlight")
		highlight.Name = "AntiKickESP_Highlight"
		highlight.Adornee = adornee
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillColor = v16
		highlight.OutlineColor = v16
		highlight.Enabled = true
		highlight.Parent = adornee

		esp.antiKickEntries[adornee] = {
			highlight = highlight,
			player = arg,
			toy = adornee,
			stickyState = not not (adornee.StickyPart:FindFirstChild("StickyWeld") and adornee.StickyPart.StickyWeld.Part1),
		}

		if adornee.StickyPart:FindFirstChild("StickyWeld") then
			local stickyWeld = adornee.StickyPart.StickyWeld

			local connection4 = stickyWeld:GetPropertyChangedSignal("Part1"):Connect(function()
				local v17 = esp.antiKickEntries[adornee]

				if v17 and v17.highlight and v17.highlight.Parent then
					v17.stickyState = stickyWeld.Part1 ~= nil
				end
			end)

			if not esp.antiKickConnections[adornee] then
				esp.antiKickConnections[adornee] = {}
			end

			table.insert(esp.antiKickConnections[adornee], connection4)
		end
	end

	esp.clearAntiKickEntry = function(arg)
		local v16 = esp.antiKickEntries[arg]

		if v16 then
			if v16.highlight and v16.highlight.Parent then
				v16.highlight:Destroy()
			end

			esp.antiKickEntries[arg] = nil
		end

		if esp.antiKickConnections[arg] then
			for _, antiKickConnection in ipairs(esp.antiKickConnections[arg]) do
				if antiKickConnection then
					antiKickConnection:Disconnect()
				end
			end

			esp.antiKickConnections[arg] = nil
		end
	end

	esp.refreshAntiKickToys = function()
		for k in pairs(esp.antiKickEntries) do
			esp.clearAntiKickEntry(k)
		end

		for k, value19 in pairs(esp) do
			if type(k) == "string" and k:match("^antiKickConn_") then
				if value19 and value19.Disconnect then
					value19:Disconnect()
				end

				esp[k] = nil
			end
		end

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				local v16 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")

				if v16 then
					for _, child in ipairs(v16:GetChildren()) do
						if child:FindFirstChild("StickyPart") then
							esp.applyAntiKickHighlight(child, player)
						end
					end

					local str3 = "antiKickConn_" .. player.Name

					if not esp[str3] then
						esp[str3] = v16.ChildAdded:Connect(function(child)
							if not esp.antiKickESPEnabled then
								return
							end
							task.wait(0.4)

							if child:FindFirstChild("StickyPart") then
								esp.applyAntiKickHighlight(child, player)
							end
						end)
					end
				end
			end
		end
	end

	local refreshAll = esp.refreshAll

	esp.refreshAll = function()
		if refreshAll then
			refreshAll()
		end

		if esp.antiKickESPEnabled then
			esp.refreshAntiKickToys()
		end
	end

	local connection4 = nil

	local function fn155()
		if connection4 then
			connection4:Disconnect()
		end

		connection4 = runService.Heartbeat:Connect(function()
			if esp.antiKickESPEnabled and esp.rainbow and esp.antiKickUseRainbow then
				esp.hue = (esp.hue + 0.01) % 1
				esp.updateAntiKickColors()
			end
		end)
	end

	esp.loopConnection = runService.Heartbeat:Connect(function()
		local now = os.clock()
		if now - esp.lastUpdate < esp.updateInterval then
			return
		end
		esp.lastUpdate = now

		if esp.rainbow then
			esp.hue = (esp.hue + 0.01) % 1
		end

		for k, entry in pairs(esp.entries) do
			if not (k.Parent and entry.character and entry.character.Parent) then
				esp.clearEntry(k)
			else
				esp.updateEntry(k)
			end
		end

		for k in pairs(esp.pcldEntries) do
			if not k.Parent then
				esp.clearPCLDEntry(k)
			else
				esp.updatePCLDEntry(k)
			end
		end
	end)

	v15:Toggle({
		Title = "anti kick esp",
		Value = false,
		CallBack = function(antiKickESPEnabled)
			esp.antiKickESPEnabled = antiKickESPEnabled

			if antiKickESPEnabled then
				esp.antiKickUseRainbow = esp.rainbow
				esp.refreshAntiKickToys()
				fn155()
			else
				for k in pairs(esp.antiKickEntries) do
					esp.clearAntiKickEntry(k)
				end

				for k, value20 in pairs(esp) do
					if type(k) == "string" and k:match("^antiKickConn_") then
						if value20 and value20.Disconnect then
							value20:Disconnect()
						end

						esp[k] = nil
					end
				end

				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end
			end

			fn82()
		end,
	})

	v15:Toggle({
		Title = "rainbow esp",
		Value = esp.rainbow,
		CallBack = function(rainbow)
			esp.rainbow = rainbow
			esp.antiKickUseRainbow = rainbow

			if esp.antiKickESPEnabled then
				if rainbow then
					esp.updateAntiKickColors()
				else
					esp.updateAntiKickColors()
				end
			end

			fn82()
		end,
	})

	v15:ColorPicker({
		Title = "anti kick esp color",
		Color = esp.antiKickColor,
		Linkable = false,
		CallBack = function(antiKickColor)
			esp.antiKickColor = antiKickColor

			if esp.antiKickESPEnabled and not esp.rainbow then
				esp.updateAntiKickColors()
			end

			fn82()
		end,
	})

	v15:ColorPicker({
		Title = "esp color",
		Color = esp.color,
		Linkable = false,
		CallBack = function(color)
			esp.color = color
			fn77()
			fn82()
		end,
	})

	fn82 = function()
		esp.syncEnabled()
		esp.refreshAll()
	end

	local v16 = v3:InitTab({ Title = "whitelist" })
	v16:Section("whitelist settings")

	v16:Toggle({
		Title = "auto whitelist friends",
		Value = whitelist.autoWhitelistFriends,
		CallBack = function(autoWhitelistFriends)
			whitelist.autoWhitelistFriends = autoWhitelistFriends

			if autoWhitelistFriends then
				refreshFriendWhitelist()
			else
				refresh()
			end
		end,
	})

	v16:Button({
		Title = "refresh friend status",
		CallBack = function()
			notify2("krampus", "refreshed friend status!", 3)
			refreshFriendWhitelist()
		end,
	})

	v16:Section("manual players")

	local v17 = v16:Dropdown({
		Title = "manual whitelist players",
		Options = fn100(),
		PlaceHolder = "select players",
		Multi = true,
		CallBack = function(arg)
			fn103(arg)
		end,
	})

	local v18 = v16:Paragraph({ Title = "whitelisted players", Content = "" })

	refresh = function()
		if v17 and v17.SetOptions then
			v17:SetOptions(fn100(), true)

			if v17.Set then
				v17:Set(fn101(), true)
			end
		end

		local tbl15 = {}

		for k in pairs(killAllWhitelist) do
			table.insert(tbl15, k)
		end

		table.sort(tbl15)
		local tbl16 = {}

		if whitelist.autoWhitelistFriends then
			for k, friendState in pairs(whitelist.friendStates) do
				if friendState then
					table.insert(tbl16, k)
				end
			end

			table.sort(tbl16)
		end

		local tbl17 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(tbl17, player.Name .. (killAllWhitelist[player.Name] and " [Manual]" or whitelist.autoWhitelistFriends and whitelist.friendStates[player.Name] and " [Friend]" or ""))
			end
		end

		table.sort(tbl17)
		local v19 = fn94
		local str3 = "Online Players: " .. fn89(tbl17)
		local str4 = "Manual Players: " .. fn89(tbl15)
		local tbl18 = { str3, str4 }
		v19(v18, "Whitelist Players", tbl18)
	end

	whitelist.selectionListRef = { Refresh = refresh }
	local v19 = v3:InitTab({ Title = "server" })
	v19:Section("lags")

	v19:Toggle({
		Title = "line lag server",
		Value = server.lineLagEnabled,
		CallBack = function(arg)
			setLineLagEnabled(arg)
			fn77()
			fn84()
		end,
	})

	v19:Toggle({
		Title = "monster line lag server",
		Value = server.monsterLineLagEnabled,
		CallBack = function(arg)
			setMonsterLineLagEnabled(arg)
			fn77()
			fn84()
		end,
	})

	v19:Toggle({
		Title = "packet lag server",
		Value = server.packetLagEnabled,
		CallBack = function(arg)
			setPacketLagEnabled(arg)
			fn77()
			fn84()
		end,
	})

	v19:Toggle({
		Title = "anti detect packet lag",
		Value = server.antiDetect,
		CallBack = function(antiDetect)
			server.antiDetect = antiDetect
			fn77()
			fn84()
		end,
	})

	v19:Slider({
		Title = "lines per second",
		Sliders = {
			{
				Title = "adjust lines per second",
				Range = { 1, 600 },
				Increment = 1,
				StarterValue = server.linesPerSecond,
				CallBack = function(linesPerSecond)
					server.linesPerSecond = linesPerSecond
					fn84()
				end,
			},
		},
	})

	v19:Slider({
		Title = "monster lines per second",
		Sliders = {
			{
				Range = { 1, 400 },
				Increment = 1,
				StarterValue = server.monsterLinesPerSecond,
				CallBack = function(monsterLinesPerSecond)
					server.monsterLinesPerSecond = monsterLinesPerSecond
					fn84()
				end,
			},
		},
	})

	v19:Slider({
		Title = "packet strength",
		Sliders = {
			{
				Title = " adjust packets",
				Range = { 10, 1000 },
				Increment = 1,
				StarterValue = server.packets,
				CallBack = function(packets)
					server.packets = packets
					fn84()
				end,
			},
		},
	})

	v19:Section("server loops")

	v19:Toggle({
		Title = "kill all",
		Value = _G.KillAll,
		CallBack = function(arg)
			setKillAllEnabled(arg)
			fn84()
			fn77()
			fn85()
		end,
	})

	v19:Toggle({ Title = "delete all holdable items", Value = false, CallBack = callBack })
	existingBlob = nil
	local flag13 = false
	local thread4 = nil

	local function fn156(massless)
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= localPlayer then
				local character = player.Character

				if character then
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					-- SL | https://discord.gg/x7YbZeezpm

					if humanoidRootPart then
						humanoidRootPart.Massless = massless
					end
				end
			end
		end
	end

	local function fn157()
		fn156(false)
	end

	local function fn158()
		fn156(true)
	end

	local function fn159()
		local CreatureBlobman = nil
		local character = localPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		character = character and character:FindFirstChild("HumanoidRootPart")
		if not (humanoid and character) then
			return
		end
		local x = character.Position.X
		local y = character.Position.Y
		local z = character.Position.Z

		if humanoid and humanoid.SeatPart then
			local parent = humanoid.SeatPart.Parent

			if parent and parent.Name == "CreatureBlobman" then
				CreatureBlobman = parent
			end
		end

		if not CreatureBlobman and existingBlob and existingBlob.Parent and existingBlob:FindFirstChild("HumanoidRootPart") then
			CreatureBlobman = existingBlob
			local vehicleSeat = CreatureBlobman:FindFirstChild("VehicleSeat")

			if vehicleSeat then
				vehicleSeat:Sit(humanoid)
				local n10 = 0

				while true do
					task.wait(0.04)
					n10 += 0.04
					if not (humanoid.SeatPart and humanoid.SeatPart.Parent == CreatureBlobman or n10 >= 5) then
						continue
					end
					break
				end

				if not (humanoid.SeatPart and humanoid.SeatPart.Parent == CreatureBlobman) then
					existingBlob = nil
					CreatureBlobman = nil
				end
			else
				existingBlob = nil
				CreatureBlobman = nil
			end
		end

		if not CreatureBlobman then
			CreatureBlobman = antiKick.spawnToyExact("CreatureBlobman", character.CFrame * CFrame.new(0, 0, -5), antiKick.getPlot())
			if not CreatureBlobman then
				return
			end
			local vehicleSeat = CreatureBlobman:WaitForChild("VehicleSeat", 5)
			if not vehicleSeat then
				return
			end
			vehicleSeat:Sit(humanoid)
			local n10 = 0

			while true do
				task.wait(0.04)
				n10 += 0.04
				if not (humanoid.SeatPart and humanoid.SeatPart.Parent == CreatureBlobman or n10 >= 5) then
					continue
				end
				break
			end

			if not (humanoid.SeatPart and humanoid.SeatPart.Parent == CreatureBlobman) then
				return
			end
			existingBlob = CreatureBlobman
		end

		CreatureBlobman.Name = "blob"
		local creatureRelease = CreatureBlobman.BlobmanSeatAndOwnerScript.CreatureRelease
		local creatureGrab = CreatureBlobman.BlobmanSeatAndOwnerScript.CreatureGrab
		local tbl15 = {}

		for _, getPlayer in game.Players:GetPlayers() do
			if getPlayer ~= localPlayer and getPlayer.Character and getPlayer.Character:FindFirstChild("HumanoidRootPart") and not isPlayerWhitelisted(getPlayer) then
				table.insert(tbl15, getPlayer)
			end
		end

		if #tbl15 == 0 then
			return
		end
		fn157()

		for _, item24 in ipairs(tbl15) do
			pcall(function()
				CreatureBlobman.HumanoidRootPart.CFrame = item24.Character.HumanoidRootPart.CFrame
				task.wait(0.02)

				for i = 1, 32 do
					CreatureBlobman.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					CreatureBlobman.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					item24.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					item24.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					task.wait()
				end

				creatureGrab:FireServer(nil, item24.Character.HumanoidRootPart, CreatureBlobman.RightDetector.RightWeld)
				creatureRelease:FireServer(CreatureBlobman.RightDetector.RightWeld)
			end)

			task.wait(0.1)
		end

		CreatureBlobman.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
		task.wait(0.1)
		CreatureBlobman.HumanoidRootPart.Anchored = true
		local n10 = #tbl15
		local n11 = math.max(n10 * 1.1, 10)
		local n12 = 6.2831853071795862 / n10
		local x2 = CreatureBlobman.HumanoidRootPart.Position.X
		local y2 = CreatureBlobman.HumanoidRootPart.Position.Y
		local z2 = CreatureBlobman.HumanoidRootPart.Position.Z
		local tbl16 = {}

		for i, item25 in ipairs(tbl15) do
			table.insert(tbl16, task.spawn(function()
				pcall(function()
					if not (item25.Character and item25.Character:FindFirstChild("HumanoidRootPart")) then
						return
					end

					if not isnetworkowner(item25.Character.HumanoidRootPart) then
						return
					end
					local n13 = n12 * (i - 1)
					local n14 = math.cos(n13) * n11
					local n15 = math.sin(n13) * n11
					Instance.new("BodyGyro", item25.Character.HumanoidRootPart).CFrame = CFrame.new(60, 65, 65)
					CreatureBlobman.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					CreatureBlobman.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					item25.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					item25.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					item25.Character.HumanoidRootPart.CFrame = CFrame.new(x2 + n14, y2 + 20, z2 + n15)
					local n16 = 0

					while n16 < 0.9 do
						item25.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						item25.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						n16 += task.wait()
					end

					safeFireRemote(setNetworkOwnerEvent, item25.Character.HumanoidRootPart, item25.Character.HumanoidRootPart.CFrame)
					safeFireRemote(destroyGrabLineEvent, item25.Character.HumanoidRootPart)
					task.wait()
					creatureGrab:FireServer(nil, item25.Character.HumanoidRootPart, CreatureBlobman.RightDetector.RightWeld)
				end)
			end))
		end

		task.wait(0.5)
		CreatureBlobman.HumanoidRootPart.Anchored = false
		task.wait(0.5)
		fn158()
	end

	local function fn160()
		while flag13 do
			if existingBlob and existingBlob.Parent then
				existingBlob:Destroy()
				existingBlob = nil
			end

			task.spawn(fn159)
			local now = os.clock()

			while flag13 and os.clock() - now < 25 do
				task.wait(0.1)
			end
		end
	end

	v19:Toggle({
		Title = "kick all (blobman)",
		CallBack = function(arg)
			if arg then
				if not flag13 then
					flag13 = true
					thread4 = task.spawn(fn160)
				end
			else
				flag13 = false

				if thread4 then
					task.cancel(thread4)
					thread4 = nil
				end

				if existingBlob and existingBlob.Parent then
					existingBlob:Destroy()
					existingBlob = nil
				end
			end
		end,
	})

	v19:Toggle({
		Title = "kick all (non blobman)",
		Value = _G.BringAll,
		CallBack = function(arg)
			setBringAllEnabled(arg)
			fn77()
			fn84()
		end,
	})

	v19:Section("break stuff")

	local tbl15 = {
		{ name = "Plot 1", coord = Vector3.new(2.5e38, 2.5e38, 2.5e38) },
		{ name = "Plot 2", coord = Vector3.new(2.5e38, 2.5e38, 2.5e38) },
		{ name = "Plot 3", coord = Vector3.new(2.5e38, 2.5e38, 2.5e38) },
		{ name = "Plot 4", coord = Vector3.new(-1e12, -1e12, -1e12) },
		{ name = "Plot 5", coord = Vector3.new(-1e12, -1e12, -1e12) },
	}

	local tbl16 = {}
	local flag14 = false
	local n10 = 0

	local function fn161()
		for _, item26 in ipairs(tbl16) do
			pcall(function()
				if item26 and item26.Parent then
					safeFireRemote(deleteToyRE, item26)
				end
			end)
		end

		tbl16 = {}
	end

	local function fn162()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end

		if canSpawnToyValue and not canSpawnToyValue.Value then
			local n11 = tick() + 3

			while true do
				task.wait(0.02)
				if not (canSpawnToyValue.Value or tick() > n11) then
					continue
				end
				break
			end
		end

		local folder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if not folder then
			folder = Instance.new("Folder")
			folder.Name = localPlayer.Name .. "SpawnedInToys"
			folder.Parent = workspace
		end

		local value21 = nil
		local connection5 = nil

		connection5 = folder.ChildAdded:Connect(function(child)
			if child.Name == "NinjaShuriken" then
				value21 = child
				connection5:Disconnect()
			end
		end)

		task.spawn(function()
			pcall(function()
				safeInvokeRemote(spawnToyRF, "NinjaShuriken", humanoidRootPart.CFrame * CFrame.new(5, 10, 20), Vector3.zero)
			end)
		end)

		local n11 = tick() + 2

		while true do
			task.wait(0.01)
			if not (value21 or tick() > n11) then
				continue
			end
			break
		end

		if connection5 then
			connection5:Disconnect()
		end

		if not value21 then
			local plotItems = workspace:FindFirstChild("PlotItems")

			if plotItems then
				for _, child in ipairs(plotItems:GetChildren()) do
					local ninjaShuriken = child:FindFirstChild("NinjaShuriken")
					if ninjaShuriken then
						value21 = ninjaShuriken
						break
					end
				end
			end
		end

		if not value21 then
			return nil
		end

		for _, descendant in ipairs(value21:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.LocalTransparencyModifier = 0.55
				descendant.CastShadow = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			elseif descendant:IsA("ProximityPrompt") then
				descendant.Enabled = false
			end
		end

		value21.Name = "NinjaShuriken_AntiKick"
		return value21
	end

	local function fn163(arg)
		if not arg or not arg.Parent then
			return false
		end
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		local setNetworkOwner = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")

		if setNetworkOwner then
			pcall(function()
				setNetworkOwner:FireServer(arg, arg.CFrame)
			end)

			return true
		end

		return false
	end

	local function fn164(arg, arg2)
		local result12 = fn162()
		if not result12 then
			return false
		end
		task.wait(0.2)
		local playerEvents = replicatedStorage:FindFirstChild("PlayerEvents")
		playerEvents = playerEvents and playerEvents:FindFirstChild("StickyPartEvent")
		if not playerEvents then
			return false
		end
		local plots = workspace:FindFirstChild("Plots")

		if plots then
			plots = plots:FindFirstChild(arg:gsub(" ", ""))
			plots = plots and plots:FindFirstChild("PlotArea")
		end

		if not plots then
			return false
		end
		local stickyPart = result12:FindFirstChild("StickyPart")

		if stickyPart then
			fn163(stickyPart)
			task.wait(0.05)

			pcall(function()
				playerEvents:FireServer(stickyPart, plots, CFrame.new(arg2))
			end)

			table.insert(tbl16, result12)
			return true
		end

		return false
	end

	local function fn165(arg)
		n10 += 1
		local v20 = n10
		flag14 = true

		for _, item27 in ipairs(arg) do
			if not (not flag14 or v20 ~= n10) then
				for _, item28 in ipairs(tbl15) do
					if item28.name == item27 then
						if fn164(item28.name, item28.coord) then
							notify2("krampus", "broke " .. item28.name, 2)
						end

						task.wait(0.3)
						break
					end
				end

				continue
			end

			break
		end

		flag14 = false
	end

	local tbl17 = {}

	for _, item29 in ipairs(tbl15) do
		table.insert(tbl17, item29.name)
	end

	local tbl18 = { "Plot 1", "Plot 2", "Plot 3", "Plot 4", "Plot 5" }

	v19:Dropdown({
		Title = "select plots to break",
		Options = tbl17,
		PlaceHolder = "select plots",
		Multi = true,
		CallBack = function(arg)
			if type(arg) == "table" then
				tbl18 = arg
			else
				tbl18 = { arg }
			end
		end,
	})

	v19:Button({
		Title = "break selected plots",
		CallBack = function()
			if #tbl18 == 0 then
				return
			end

			if flag14 then
				return
			end
			fn161()
			task.wait(0.1)

			task.spawn(function()
				fn165(tbl18)
			end)
		end,
	})

	v19:Button({
		Title = "fix plot(s)",
		CallBack = function()
			flag14 = false
			n10 += 1
			fn161()
		end,
	})

	localPlayer.CharacterAdded:Connect(function()
		if flag14 then
			task.wait(0.3)
			fn161()
			flag14 = false
		end
	end)

	local flag15 = false
	local n11 = 0
	local tbl19 = {}
	local tbl20 = {}
	local flag16 = false

	local function fn166()
		for _, item30 in ipairs(tbl19) do
			pcall(function()
				if item30 and item30.Parent then
					safeFireRemote(deleteToyRE, item30)
				end
			end)
		end

		tbl19 = {}
		tbl20 = {}
		flag16 = false
	end

	local function fn167()
		n11 += 1
		local v20 = n11

		while flag15 and v20 == n11 and not flag16 do
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

			if not humanoidRootPart then
				task.wait(0.1)
			else
				local v21 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

				if not v21 then
					task.wait(0.1)
				else
					local descendants = workspace.Map.BaseGround:GetDescendants()
					local n12 = 0

					for _, item31 in ipairs({
						Vector3.new(107.5, -101.3504, 43.374966),
						Vector3.new(-9.500076, -101.3504, -76.625),
						Vector3.new(90.5, -101.3504, -76.625),
						Vector3.new(-286.6, -101.3504, -10.8),
					}) do
						if not (not flag15 or v20 ~= n11 or n12 >= 4) then
							local value22 = nil
							local huge = math.huge

							for _, descendant in ipairs(descendants) do
								if descendant:IsA("BasePart") and descendant.Name == "Grass" and not tbl20[descendant] then
									local magnitude = (descendant.Position - item31).Magnitude

									if magnitude < huge then
										value22 = descendant
										huge = magnitude
									end
								end
							end

							if value22 then
								tbl20[value22] = true
								local value23 = nil
								local connection5 = nil

								connection5 = v21.ChildAdded:Connect(function(child)
									if child.Name == "NinjaShuriken" then
										value23 = child
										connection5:Disconnect()
									end
								end)

								if canSpawnToyValue and not canSpawnToyValue.Value then
									local n13 = tick() + 3

									while true do
										task.wait(0.02)
										if not (canSpawnToyValue.Value or tick() > n13) then
											continue
										end
										break
									end
								end

								task.spawn(function()
									pcall(function()
										local vector = Vector3.new
										safeInvokeRemote(spawnToyRF, "NinjaShuriken", humanoidRootPart.CFrame * CFrame.new(5, 10, 20), vector())
									end)
								end)

								local n13 = tick() + 2

								while true do
									task.wait(0.01)
									if not (value23 or tick() > n13) then
										continue
									end
									break
								end

								if value23 then
									local stickyPart = value23:FindFirstChild("StickyPart") or value23:WaitForChild("StickyPart", 1)

									if stickyPart then
										for i = 1, 20 do
											pcall(function()
												safeFireRemote(setNetworkOwnerEvent, stickyPart, stickyPart.CFrame)
											end)

											if not (stickyPart:FindFirstChild("PartOwner") and stickyPart.PartOwner.Value == localPlayer.Name) then
												task.wait(0.01)
												continue
											end
											break
										end

										pcall(function()
											safeFireRemote(stickyPartEvent, stickyPart, value22, CFrame.new(1e12, 1e12, 1e12))
										end)

										table.insert(tbl19, value23)
										n12 += 1
									end
								end

								task.wait(0.1)
							end

							continue
						end

						break
					end

					if n12 >= 4 then
						flag16 = true
					end

					if flag15 and v20 == n11 and not flag16 then
						tbl20 = {}
						task.wait(1)
					end
				end
			end
		end
	end

	v19:Toggle({
		Title = "break map ground",
		Value = false,
		CallBack = function(arg)
			flag15 = arg

			if arg then
				fn166()
				flag16 = false
				task.wait(0.1)
				task.spawn(fn167)
			else
				n11 += 1
				fn166()
			end

			fn84()
		end,
	})

	localPlayer.CharacterAdded:Connect(function()
		if flag15 then
			task.wait(0.3)
			fn166()
			tbl20 = {}
			flag16 = false
			task.wait(0.1)
			task.spawn(fn167)
		end
	end)

	v19:Section("misc")
	tbl.Runtime.FPS = { boostEnabled = false, oldProperties = {} }

	local function fn168(arg)
		if arg then
			local Lighting = game:GetService("Lighting")
			local Workspace = game:GetService("Workspace")

			for _, descendant in pairs(Workspace:GetDescendants()) do
				if descendant:IsA("BasePart") then
					if not tbl.Runtime.FPS.oldProperties[descendant] then
						tbl.Runtime.FPS.oldProperties[descendant] = { Material = descendant.Material, Reflectance = descendant.Reflectance, CastShadow = descendant.CastShadow }
					end

					descendant.Material = Enum.Material.Plastic
					descendant.Reflectance = 0
					descendant.CastShadow = false
				elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Smoke") or descendant:IsA("Fire") then
					if not tbl.Runtime.FPS.oldProperties[descendant] then
						tbl.Runtime.FPS.oldProperties[descendant] = { Enabled = descendant.Enabled }
					end

					descendant.Enabled = false
				end
			end

			for _, player in pairs(players:GetPlayers()) do
				if player.Character then
					for _, descendant in pairs(player.Character:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
							if not tbl.Runtime.FPS.oldProperties[descendant] then
								tbl.Runtime.FPS.oldProperties[descendant] = {
									Material = descendant.Material,
									Reflectance = descendant.Reflectance,
									CastShadow = descendant.CastShadow,
								}
							end

							descendant.Material = Enum.Material.Plastic
							descendant.Reflectance = 0
							descendant.CastShadow = false
						end
					end
				end
			end

			if not tbl.Runtime.FPS.oldProperties.Lighting then
				tbl.Runtime.FPS.oldProperties.Lighting = { GlobalShadows = Lighting.GlobalShadows, FogEnd = Lighting.FogEnd, Brightness = Lighting.Brightness }
			end

			Lighting.GlobalShadows = false
			Lighting.FogEnd = 100000
			Lighting.Brightness = 2

			if not tbl.Runtime.FPS.descendantConnection then
				tbl.Runtime.FPS.descendantConnection = Workspace.DescendantAdded:Connect(function(descendant)
					if not tbl.Runtime.FPS.boostEnabled then
						return
					end

					if descendant:IsA("BasePart") then
						if not tbl.Runtime.FPS.oldProperties[descendant] then
							tbl.Runtime.FPS.oldProperties[descendant] = { Material = descendant.Material, Reflectance = descendant.Reflectance, CastShadow = descendant.CastShadow }
						end

						descendant.Material = Enum.Material.Plastic
						descendant.Reflectance = 0
						descendant.CastShadow = false
					elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Smoke") or descendant:IsA("Fire") then
						if not tbl.Runtime.FPS.oldProperties[descendant] then
							tbl.Runtime.FPS.oldProperties[descendant] = { Enabled = descendant.Enabled }
						end

						descendant.Enabled = false
					end
				end)
			end

			notify2("krampus", "eanbled low graphics for more fps", 3)
		else
			local Lighting = game:GetService("Lighting")

			for k, oldProperty in pairs(tbl.Runtime.FPS.oldProperties) do
				if typeof(k) == "Instance" and k.Parent then
					for k2, value24 in pairs(oldProperty) do
						pcall(function()
							k[k2] = value24
						end)
					end
				elseif k == "Lighting" then
					for k2, value25 in pairs(oldProperty) do
						pcall(function()
							Lighting[k2] = value25
						end)
					end
				end
			end

			if tbl.Runtime.FPS.descendantConnection then
				tbl.Runtime.FPS.descendantConnection:Disconnect()
				tbl.Runtime.FPS.descendantConnection = nil
			end

			tbl.Runtime.FPS.oldProperties = {}
			notify2("krampus", "put graphics to regular", 3)
		end
	end

	v19:Toggle({
		Title = "potato graphics (fps advantage)",
		Value = false,
		CallBack = function(boostEnabled)
			tbl.Runtime.FPS.boostEnabled = boostEnabled
			fn168(boostEnabled)
			fn84()
		end,
	})

	localPlayer.CharacterAdded:Connect(function()
		task.wait(0.5)

		if tbl.Runtime.FPS.boostEnabled then
			task.spawn(function()
				fn168(true)
			end)
		end
	end)

	local tbl21 = {}
	local tbl22 = { "None" }

	local tbl23 = {
		A = true,
		B = true,
		C = true,
		D = true,
		E = true,
		F = true,
		G = true,
		H = true,
		I = true,
		J = true,
		K = true,
		L = true,
		M = true,
		N = true,
		O = true,
		P = true,
		Q = true,
		R = true,
		S = true,
		T = true,
		U = true,
		V = true,
		W = true,
		X = true,
		Y = true,
		Z = true,
		Zero = true,
		One = true,
		Two = true,
		Three = true,
		Four = true,
		Five = true,
		Six = true,
		Seven = true,
		Eight = true,
		Nine = true,
		LeftControl = true,
		RightControl = true,
		LeftAlt = true,
		RightAlt = true,
	}

	for _, getEnumItem in ipairs(Enum.KeyCode:GetEnumItems()) do
		local name = getEnumItem.Name

		if tbl23[name] then
			tbl21[name] = getEnumItem
			table.insert(tbl22, name)
		end
	end

	table.sort(tbl22)
	local v20 = v3:InitTab({ Title = "keybinds" })

	v20:Dropdown({
		Title = "walkspeed key",
		Options = tbl22,
		PlaceHolder = "None",
		Multi = false,
		CallBack = function(arg)
			local flag17 = type(arg) == "table" and arg[1] or arg

			if not flag17 or flag17 == "None" then
				keybind.walkspeedKey = nil
			else
				keybind.walkspeedKey = tbl21[flag17]
			end
		end,
	})

	v20:Dropdown({
		Title = "3rd person key",
		Options = tbl22,
		PlaceHolder = "None",
		Multi = false,
		CallBack = function(arg)
			local flag17 = type(arg) == "table" and arg[1] or arg

			if not flag17 or flag17 == "None" then
				keybind.thirdPersonKey = nil
			else
				keybind.thirdPersonKey = tbl21[flag17]
			end
		end,
	})

	v20:Dropdown({
		Title = "loop tp key",
		Options = tbl22,
		PlaceHolder = "None",
		Multi = false,
		CallBack = function(arg)
			arg = type(arg) == "table" and arg[1] or arg

			if not arg or arg == "None" then
				keybind.loopTpKey = nil
			else
				keybind.loopTpKey = tbl21[arg]
			end
		end,
	})

	local flag17 = false
	local value26 = nil

	local function fn169(arg, arg2, arg3)
		local spawnToyRemoteFunction = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
		if spawnToyRemoteFunction then
			return spawnToyRemoteFunction:InvokeServer(arg, arg2, arg3)
		end
		return nil
	end

	local function fn170(arg)
		local destroyToy = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("DestroyToy")

		if destroyToy and arg then
			destroyToy:FireServer(arg)
		end
	end

	local function fn171(arg)
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner")
		if not grabEvents2 then
			return
		end
		local v22 = players:FindFirstChild(arg)
		if not v22 or not v22.Character then
			return
		end
		local humanoidRootPart = v22.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		grabEvents2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
	end

	local function fn172(arg)
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("DestroyGrabLine")
		if not grabEvents2 then
			return
		end
		local v22 = players:FindFirstChild(arg)
		if not v22 or not v22.Character then
			return
		end
		local humanoidRootPart = v22.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		grabEvents2:FireServer(humanoidRootPart)
	end

	local function fn173(arg)
		local creatureBlobman = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		creatureBlobman = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")
		if not creatureBlobman then
			return
		end
		local leftDetector = creatureBlobman:FindFirstChild("LeftDetector")
		if not leftDetector then
			return
		end
		local v22 = players:FindFirstChild(arg)
		if not v22 or not v22.Character then
			return
		end
		local humanoidRootPart = v22.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local leftWeld = leftDetector:FindFirstChild("LeftWeld")
		if not leftWeld then
			return
		end
		local blobmanSeatAndOwnerScript = creatureBlobman:FindFirstChild("BlobmanSeatAndOwnerScript")
		blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

		if blobmanSeatAndOwnerScript then
			blobmanSeatAndOwnerScript:FireServer(leftDetector, humanoidRootPart, leftWeld)
		end
	end

	local function fn174()
		local creatureBlobman = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		creatureBlobman = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")
		if not creatureBlobman then
			return
		end
		local vehicleSeat = creatureBlobman:FindFirstChildWhichIsA("VehicleSeat")
		local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

		if vehicleSeat and humanoid then
			vehicleSeat:Sit(humanoid)

			if humanoidRootPart then
				humanoidRootPart.CFrame = vehicleSeat.CFrame + Vector3.new(0, 5, 0)
			end
		end
	end

	local flag18 = false

	local function fn175(arg)
		if flag18 then
			return
		end
		flag18 = true
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChild("Humanoid")
		if not humanoidRootPart or not character then
			flag18 = false
			return
		end
		local cFrame = humanoidRootPart.CFrame
		local creatureBlobman = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		local creatureBlobman2 = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")

		if not creatureBlobman2 then
			task.spawn(function()
				fn169("CreatureBlobman", CFrame.new(humanoidRootPart.Position + Vector3.new(0, 0, -5)), Vector3.zero)
			end)

			task.wait(0.15)
			creatureBlobman = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
			creatureBlobman2 = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")
		end

		fn174()
		local n12 = 0

		while n12 < 15 and (not creatureBlobman2 or not creatureBlobman2:FindFirstChildWhichIsA("VehicleSeat") or creatureBlobman2:FindFirstChildWhichIsA("VehicleSeat").Occupant ~= character) do
			task.wait(0.08)
			fn174()
			n12 += 1
		end

		local v22 = players:FindFirstChild(arg)
		if not v22 or not v22.Character then
			flag18 = false
			return
		end
		local humanoidRootPart2 = v22.Character:FindFirstChild("HumanoidRootPart")
		local humanoid = v22.Character:FindFirstChild("Humanoid")
		if not humanoidRootPart2 or not humanoid then
			flag18 = false
			return
		end
		humanoidRootPart.CFrame = CFrame.new(humanoidRootPart2.Position + Vector3.new(5, 0, 0))
		task.wait(0.15)
		fn171(arg)
		task.wait(0.08)
		fn172(arg)
		task.wait(0.08)
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Parent = humanoidRootPart2
		bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyVelocity.Velocity = Vector3.new(0, 500, 0)
		humanoid.Jump = true
		humanoid.Sit = false
		task.wait(0.1)
		bodyVelocity.Velocity = Vector3.new(0, 1000, 0)

		task.delay(0.15, function()
			if bodyVelocity and bodyVelocity.Parent then
				bodyVelocity:Destroy()
			end
		end)

		fn173(arg)
		task.wait(0.08)
		creatureBlobman = creatureBlobman and creatureBlobman:FindFirstChild("CreatureBlobman")

		if creatureBlobman then
			fn170(creatureBlobman)
		end

		if cFrame and humanoidRootPart then
			humanoidRootPart.CFrame = cFrame
		end

		flag18 = false
	end

	local function fn176()
		local currentCamera = workspace.CurrentCamera
		local character = localPlayer.Character
		local position = currentCamera.CFrame.Position
		local n12 = currentCamera.CFrame.LookVector * 150
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
		raycastParams.FilterDescendantsInstances = { character }
		local hit = workspace:Raycast(position, n12, raycastParams)

		if hit then
			local model = hit.Instance:FindFirstAncestorWhichIsA("Model")

			if model and model:FindFirstChild("Humanoid") then
				local playerFromCharacter = players:GetPlayerFromCharacter(model)
				if playerFromCharacter and playerFromCharacter ~= localPlayer then
					return playerFromCharacter.Name
				end
			end
		end

		return nil
	end

	local function fn177()
		game:GetService("UserInputService").InputBegan:Connect(function(input2, gameProcessed)
			if gameProcessed then
				return
			end

			if not flag17 then
				return
			end

			if value26 and input2.KeyCode == value26 then
				local result13 = fn176()

				if result13 then
					task.spawn(function()
						fn175(result13)
					end)
				end
			end
		end)
	end

	fn177()

	v20:Dropdown({
		Title = "blobman kick key",
		Options = tbl22,
		PlaceHolder = "None",
		Multi = false,
		CallBack = function(arg)
			local flag19 = type(arg) == "table" and arg[1] or arg

			if not flag19 or flag19 == "None" then
				flag17 = false
				value26 = nil
			else
				flag17 = true
				value26 = tbl21[flag19]
			end
		end,
	})

	v20:Dropdown({
		Title = "quick blob key",
		Options = tbl22,
		PlaceHolder = "None",
		Multi = false,
		CallBack = function(arg)
			local flag19 = type(arg) == "table" and arg[1] or arg

			if not flag19 or flag19 == "None" then
				keybind.quickBlobKey = nil
			else
				keybind.quickBlobKey = tbl21[flag19]
			end
		end,
	})

	local v22 = v3:InitTab({ Title = "settings" })

	v22:Dropdown({
		Title = "notif sound",
		Options = tbl4,
		PlaceHolder = str2,
		Multi = false,
		CallBack = function(arg)
			local flag19 = type(arg) == "table" and arg[1] or arg

			if flag19 and byName[flag19] then
				str2 = flag19
				ntfsnd.SoundId = "rbxassetid://" .. byName[str2]
				fn77()
			end
		end,
	})

	v22:Slider({
		Title = "notif volume",
		Sliders = {
			{
				Title = "volume",
				Range = { 0, 100 },
				Increment = 0.1,
				StarterValue = n3,
				CallBack = function(arg)
					n3 = fn76(arg)
					ntfsnd.Volume = n3 / 100
					fn77()
				end,
				Flag = "Slider1",
			},
		},
	})

	v22:Button({
		Title = "test notification",
		CallBack = function()
			notify2("krampus", "hi, this is a test noti.", 3)
		end,
	})

	fn79()
	fn80()
	fn83()
	fn81()
	fn82()
	fn84()
	fn85()
	refreshFriendWhitelist()
	refresh()

	if flags.AntiKick then
		antiKick.start()
	end

	notify2("loaded!", "krampus.gg has been loaded successfully, enjoy!", 8)
	v2:LoadSaveConfig()
end

functions.setAutoResetEnabled = setAutoResetEnabled
functions.setAntiInputLagEnabled = setAntiInputLagEnabled
functions.setLineLagEnabled = setLineLagEnabled
functions.setMonsterLineLagEnabled = setMonsterLineLagEnabled
functions.setPacketLagEnabled = setPacketLagEnabled
functions.setKillAllEnabled = setKillAllEnabled
functions.setBringAllEnabled = setBringAllEnabled
functions.applyThirdPersonState = applyThirdPersonState
functions.setWaterWalk = setWaterWalk
functions.enableAntiVoid = enableAntiVoid
functions.disableAntiVoid = disableAntiVoid
functions.clickTeleport = clickTeleport
functions.toggleJerk = toggleJerk
functions.setupFurtherExtend = setupFurtherExtend
functions.teardownFurtherExtend = teardownFurtherExtend
functions.handleNewGrabModel = handleNewGrabModel
functions.build = build

if extendGrabLineEvent then
	tbl.Runtime.packetLagActive = false

	extendGrabLineEvent.OnClientEvent:Connect(function(arg, arg2)
		if typeof(arg2) == "string" and string.len(arg2) > 300 and not tbl.Runtime.packetLagActive then
			tbl.Runtime.packetLagActive = true

			task.delay(8, function()
				tbl.Runtime.packetLagActive = false
			end)

			if tbl.notify then
				local flag = typeof(arg) == "Instance" and arg or nil
				local displayName = flag and flag.DisplayName or tostring(arg)
				flag = flag and flag.Name or tostring(arg)
				local v2 = string.len(arg2)
				tbl.notify("packet lag detected", displayName .. " (" .. flag .. ") detected packet lagging\n" .. "string length: " .. v2 .. "\n" .. "packet size: " .. math.round(v2 / 1048576 * 1000) / 1000 .. " mb", 6)
			end
		end
	end)
end

players.PlayerAdded:Connect(function()
	task.wait(1)
	refreshFriendWhitelist()
	fn8()
end)

players.PlayerRemoving:Connect(function(player)
	whitelist.friendStates[player.Name] = nil

	if whitelist.selectionListRef and whitelist.selectionListRef.Refresh then
		whitelist.selectionListRef.Refresh()
	end

	fn8()
end)

pcall(function()
	workspace.FallenPartsDestroyHeight = -1000000
end)

localPlayer.CharacterAdded:Connect(function()
	pcall(function()
		workspace.FallenPartsDestroyHeight = -1000000
	end)
end)

build()

task.spawn(function()
	task.wait(0.1)

	if tbl.Functions.setSelectedAntiInputLagOption then
		tbl.Functions.setSelectedAntiInputLagOption("Hamburger")
		print("[krampus] Anti-input item set to: " .. tbl.State.SelectedAntiInputLagToy)
	end

	tbl.State.SelectedAntiInputLagOption = "Hamburger"
	tbl.State.SelectedAntiInputLagToy = tbl.Constants.AntiInputLagToyList.Hamburger
	local antiInputLag = _G.AntiInputLag or false

	if setAntiInputLagEnabled then
		setAntiInputLagEnabled(true)
		task.wait(0.3)

		if not antiInputLag then
			setAntiInputLagEnabled(false)
		end
	end
end)