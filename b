-- ts file was generated at discord.gg/25ms
-- Fixed & Modified by Saturn Team

local _LocalPlayer = game.Players.LocalPlayer
local _RunService = game:GetService('RunService')
local _PlayerGui = _LocalPlayer:WaitForChild("PlayerGui")

-- Eski GUI temizliği
if _PlayerGui:FindFirstChild("SaturnTeam_GUI") then
    _PlayerGui.SaturnTeam_GUI:Destroy()
end

local _ScreenGui = Instance.new('ScreenGui')
local _MainButton = Instance.new('TextButton')
local _UICorner = Instance.new('UICorner')
local _UIStroke = Instance.new('UIStroke')
local _Watermark = Instance.new('TextLabel')

_ScreenGui.Name = "SaturnTeam_GUI"
_ScreenGui.Parent = _PlayerGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

_Watermark.Name = "Watermark"
_Watermark.Parent = _ScreenGui
_Watermark.BackgroundTransparency = 1.000
_Watermark.Position = UDim2.new(0.5, -100, 0, 15)
_Watermark.Size = UDim2.new(0, 200, 0, 30)
_Watermark.Font = Enum.Font.SourceSansBold
_Watermark.Text = "Made by: Saturn Team"
_Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
_Watermark.TextSize = 22

_MainButton.Name = "ToggleButton"
_MainButton.Parent = _ScreenGui
_MainButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_MainButton.Position = UDim2.new(0.68, 0, 0.16, 0)
_MainButton.Size = UDim2.new(0, 150, 0, 50)
_MainButton.Font = Enum.Font.SourceSansSemibold
_MainButton.Text = "Instant Twisted: OFF"
_MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
_MainButton.TextScaled = true
_MainButton.Draggable = true 

_UICorner.CornerRadius = UDim.new(0, 10)
_UICorner.Parent = _MainButton

_UIStroke.Color = Color3.fromRGB(255, 255, 255)
_UIStroke.Thickness = 2
_UIStroke.Parent = _MainButton

-- ORIJINAL DEĞİŞKENLER
local u6 = {
    'rbxassetid://13294471966',
    'rbxassetid://134775406437626',
}
local u7 = false
local u8 = nil
local u9 = false
local u10 = nil

-- ORIJINAL FONKSIYON 1 (DOKUNULMADI)
local function u19()
    local v11 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
    local _HumanoidRootPart = v11:WaitForChild('HumanoidRootPart')
    local _Humanoid = v11:WaitForChild('Humanoid')

    u9 = true
    u10 = _RunService.RenderStepped:Connect(function()
        if u9 and _Humanoid.AutoRotate then
            _Humanoid.AutoRotate = false
        end
    end)

    local _CFrame = _HumanoidRootPart.CFrame
    local v15 = _CFrame * CFrame.Angles(0, math.rad(-135), 0)
    local v16 = _CFrame * CFrame.Angles(0, math.rad(0), 0)

    task.wait(0.39)

    local v17 = {
        {
            Dash = Enum.KeyCode.W,
            Key = Enum.KeyCode.Q,
            Goal = 'KeyPress',
        },
    }
    local _Communicate = v11:FindFirstChild('Communicate')

    if _Communicate then
        _Communicate:FireServer(unpack(v17))
    end

    _HumanoidRootPart.CFrame = v15
    task.wait(0.125)
    _HumanoidRootPart.CFrame = v16
    task.wait(0.8)

    u9 = false
    if u10 then
        u10:Disconnect()
        u10 = nil
    end
end

-- ORIJINAL FONKSIYON 2 (DOKUNULMADI)
local function v25()
    u7 = not u7
    _MainButton.Text = u7 and "Instant Twisted: ON" or "Instant Twisted: OFF"
    _MainButton.TextColor3 = u7 and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)

    if u7 then
        u8 = (_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):WaitForChild('Humanoid').AnimationPlayed:Connect(function(p20)
            for _, animId in ipairs(u6) do
                if p20.Animation.AnimationId == animId then
                    task.spawn(u19)
                    break
                end
            end
        end)
    elseif u8 then
        u8:Disconnect()
        u8 = nil
    end
end

_MainButton.MouseButton1Click:Connect(v25)

_LocalPlayer.CharacterAdded:Connect(function()
    u7 = false
    _MainButton.Text = "Instant Twisted: OFF"
    _MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    if u8 then u8:Disconnect() u8 = nil end
    if u10 then u10:Disconnect() u10 = nil end
end)
