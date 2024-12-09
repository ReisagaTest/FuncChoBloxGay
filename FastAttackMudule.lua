local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:waitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[3]
local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
local cooldownfastattack = tick()

new = {}
function FastAttackConnectorFunction()
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.ReplicatedStorage
    repeat task.wait() until game.Players
    repeat task.wait() until game.Players.LocalPlayer
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts:waitForChild("CombatFramework"))
    local CombatFrameworkR = getupvalues(CombatFramework)[1]
    local RigController = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
    local RigControllerR = getupvalues(RigController)[3]
    local realbhit = require(game.ReplicatedStorage.CombatFramework.RigLib)
    local cooldownfastattack = tick()


    
    ReturnFunctions = {}
    function CurrentWeapon()
        local ac = CombatFrameworkR.activeController
        local ret = ac.blades[1]
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while ret.Parent ~= game.Players.LocalPlayer.Character do
                    ret = ret.Parent
                end
            end
        )
        if not ret then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return ret
    end
    function AttackFunctgggggion()
        if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
            return nil
        end
        local ac = CombatFrameworkR.activeController
        ac.hitboxMagnitude = 55
        if ac and ac.equipped then
            for indexincrement = 1, 1 do
                local bladehit =require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},60)
                if #bladehit > 0 then
                    local AcAttack8 = debug.getupvalue(ac.attack, 5)
                    local AcAttack9 = debug.getupvalue(ac.attack, 6)
                    local AcAttack7 = debug.getupvalue(ac.attack, 4)
                    local AcAttack10 = debug.getupvalue(ac.attack, 7)
                    local NumberAc12 = (AcAttack8 * 798405 + AcAttack7 * 727595) % AcAttack9
                    local NumberAc13 = AcAttack7 * 798405
                    (function()
                        NumberAc12 = (NumberAc12 * AcAttack9 + NumberAc13) % 1099511627776
                        AcAttack8 = math.floor(NumberAc12 / AcAttack9)
                        AcAttack7 = NumberAc12 - AcAttack8 * AcAttack9
                    end)()
                    AcAttack10 = AcAttack10 + 1
                    debug.setupvalue(ac.attack, 5, AcAttack8)
                    debug.setupvalue(ac.attack, 6, AcAttack9)
                    debug.setupvalue(ac.attack, 4, AcAttack7)
                    debug.setupvalue(ac.attack, 7, AcAttack10)
                    for k, v in pairs(ac.animator.anims.basic) do
                        v:Play(0.01,0.01,0.01)
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                            "weaponChange",
                            tostring(CurrentWeapon())
                        )
                        game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, 2, "")
                    end
                end
            end
        end
    end
    CountAttack = 0  
    TickCountAttack = tick()
    spawn(function()
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Args = {...}
            if Method == 'FireServer' and self.Name == "RigControllerEvent" and  Args[1] == "hit"  then
                CountAttack = CountAttack + 1 
                TickCountAttack = tick()
            end
            return OldNameCall(self, unpack(Args))
        end)
    end)
    function ReturnFunctions:GetCount()
        return CountAttack
    end
    function ReturnFunctions:Attack(k)
        UFFF = k 
    end
    FastAttackSettings = {
        ["CDAAT"] = 30,
        ["Timewait"] = 1
    }
    spawn(function()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    end)
    function ReturnFunctions:InputValue(CDAAT,Timewait)
        FastAttackSettings["CDAAT"] = CDAAT
        FastAttackSettings["Timewait"] = Timewait
    end
    function ReturnFunctions:InputSetting(tbbb)
        conchosetting = tbbb
    end
    function atack()
        pcall(function()
            AttackFunctgggggion()
        end)
    end
    ToiCanOxi = 0
    conchosetting = {}
    function ReturnFunctions:GetMethod()
        MethodAttack = "Normal"
        if CountAttack < FastAttackSettings["CDAAT"] then 
            MethodAttack = "Fast"
        end 
        return MethodAttack
    end
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    if conchosetting and type(conchosetting) == "table" then 
                        if conchosetting and NeedAttacking and Config["Fast Attack"] then 
                            ToiCanOxi = 2 
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"])
                            else
                                conchosetting["DelayAttack"] = 0.3
                                wait(conchosetting["DelayAttack"])
                            end
                        elseif CountAttack < FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                        elseif CountAttack >= FastAttackSettings["CDAAT"] then 
                            ToiCanOxi = ToiCanOxi +1
                            atack()
                            if conchosetting["DelayAttack"] and type(conchosetting["DelayAttack"]) == "number" and conchosetting["DelayAttack"] >= 0.1 then 
                                wait(conchosetting["DelayAttack"]*2)
                            else
                                conchosetting["DelayAttack"] = 0.1
                                wait(conchosetting["DelayAttack"]*2)
                            end
                        end
                    end
                end)
            end
        end
    end) 
    spawn(function()
        while task.wait() do 
            pcall(function() 
                if tick()-TickCountAttack >= FastAttackSettings["Timewait"] then 
                    CountAttack = 0 
                end
            end)
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    Fastflux.activeController:attack()
                    task.wait(0.35)
                end)
            end
        end
    end)
    spawn(function()
        while task.wait() do 
            if UFFF then 
                pcall(function()
                    local Fastflux = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    a = math.random(2,3)
                    if a > 1 then 
                        game:GetService "VirtualUser":CaptureController()
                        game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                    end
                    task.wait(1)
                end)
            end
        end
    end)
    spawn(function()
        while wait() do 
            if UFFF then
                pcall(function() 
                    if CountAttack >= FastAttackSettings["CDAAT"] then 
                        TickFastAttackF = tick()
                        repeat wait() until tick()-TickFastAttackF >= FastAttackSettings["Timewait"]
                        CountAttack = 0
                    end    
                end)  
            end
        end
    end)
    return ReturnFunctions
end
return FastAttackConnectorFunction()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local CombatFramework = require(LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
local StopCameraShaker = require(ReplicatedStorage.Util.CameraShaker)
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigController = require(Players.LocalPlayer.PlayerScripts.CombatFramework.RigController)
local RigControllerR = getupvalues(RigController)[2]
local RigLib = require(ReplicatedStorage.CombatFramework.RigLib)
local realbhit = RigLib
StopCameraShaker:Stop()

getAllBladeHits = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = LocalPlayer
	local Enemies = game:GetService("Workspace").Enemies:GetChildren()

	for i, v in pairs(Enemies) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5 then
			table.insert(Hits, Human.RootPart)
		end
	end

	return Hits
end)

getAllBladeHitsPlayers = LPH_NO_VIRTUALIZE(function(Sizes)
	local Hits = {}
	local Client = LocalPlayer
	local Characters = game:GetService("Workspace").Characters:GetChildren()

	for i, v in pairs(Characters) do
		local Human = v:FindFirstChildOfClass("Humanoid")
		if v.Name ~= LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and Client:DistanceFromCharacter(Human.RootPart.Position) < Sizes + 5 then
			table.insert(Hits, Human.RootPart)
		end
	end

	return Hits
end)

game:GetService("ReplicatedStorage").Assets.GUI:WaitForChild("DamageCounter").Enabled = false
local RigEven = ReplicatedStorage.RigControllerEvent
local AttackAnim = Instance.new("Animation")
local AttackCoolDown = 0
local cooldowntickFire = 0
local MaxFire = 1000
local FireCooldown = 0.0325678
local FireL = 0
local bladehit = {}

CancelCoolDown = LPH_NO_VIRTUALIZE(function()
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		AttackCoolDown = tick() + (FireCooldown or 0.288) + ((FireL / MaxFire) * 0.3)
		RigEven.FireServer(RigEven, "weaponChange", ac.currentWeaponModel.Name)
		FireL = FireL + 1
		task.delay((FireCooldown or 0.288) + ((FireL+0.4/MaxFire)*0.3),function()
			FireL = FireL - 1
		end)
	end
end)

AttackFunction = LPH_NO_VIRTUALIZE(function(typef)
	local ac = CombatFrameworkR.activeController
	if ac and ac.equipped then
		local bladehit = {}
		if typef == 1 then
			bladehit = getAllBladeHits(60)
		elseif typef == 2 then
			bladehit = getAllBladeHitsPlayers(65)
		else
			for i2,v2 in pairs(getAllBladeHits(55)) do
				table.insert(bladehit,v2)
			end
			for i3,v3 in pairs(getAllBladeHitsPlayers(55)) do
				table.insert(bladehit,v3)
			end
		end
		if #bladehit > 0 then
			pcall(task.spawn,ac.attack,ac)
			if tick() > AttackCoolDown then
				CancelCoolDown()
			end
			if tick() - cooldowntickFire > 0.5 then
				ac.timeToNextAttack = 0
				ac.hitboxMagnitude = 60
				pcall(task.spawn,ac.attack,ac)
				cooldowntickFire = tick()
			end
			local AMI3 = ac.anims.basic[3]
			local AMI2 = ac.anims.basic[2]
			local REALID = AMI3 or AMI2
			AttackAnim.AnimationId = REALID
			local StartP = ac.humanoid:LoadAnimation(AttackAnim)
			StartP:Play(0.01,0.01,0.01)
			RigEven.FireServer(RigEven,"hit",bladehit,AMI3 and 3 or 2,"")
			task.delay(0.01,function()
				StartP:Stop()
			end)
		end
	end
end)

LPH_NO_VIRTUALIZE(function()
	task.spawn(function()
		while game:GetService("RunService").Stepped:Wait() do
			local ac = CombatFrameworkR.activeController
			if ac and ac.equipped and not CheckStun() then
				if NeedAttacking and Config["Fast Attack"] then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,1)
					end)
				elseif NeedAttacking and Config["Fast Attack"] then
					task.spawn(function()
						pcall(task.spawn,AttackFunction,2)
					end)
				elseif NeedAttacking and Config["Fast Attack"] == false then
					if ac.hitboxMagnitude ~= 55 then
						ac.hitboxMagnitude = 55
					end
					pcall(task.spawn, ac.attack, ac)
				end
			end
		end
	end)
end)()