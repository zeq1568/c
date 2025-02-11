-- Instances
local HttpService = game:GetService("HttpService")

local CeleronBeta = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local Editor = Instance.new("TextBox")
local RunButton = Instance.new("TextButton")
local SaveButton = Instance.new("TextButton")
local KeySystemFrame = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local SubmitKey = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")

-- Properties
CeleronBeta.Name = "CeleronBeta"
CeleronBeta.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = CeleronBeta
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Active = true
MainFrame.Draggable = true -- Allows dragging
MainFrame.Visible = false -- Hidden until key is verified

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Text = "Celeron Beta"
TitleBar.TextSize = 18
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)

CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.MouseButton1Click:Connect(function()
    CeleronBeta:Destroy()
end)

Editor.Name = "Editor"
Editor.Parent = MainFrame
Editor.Size = UDim2.new(1, -20, 0, 200)
Editor.Position = UDim2.new(0, 10, 0, 40)
Editor.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Editor.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor.Font = Enum.Font.Code
Editor.TextSize = 16
Editor.MultiLine = true
Editor.Text = 'print("Hello World!")' -- Default editor text

RunButton.Name = "RunButton"
RunButton.Parent = MainFrame
RunButton.Size = UDim2.new(0, 80, 0, 30)
RunButton.Position = UDim2.new(1, -90, 1, -40)
RunButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple button
RunButton.Text = "Run"
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.MouseButton1Click:Connect(function()
    loadstring(Editor.Text)()
end)

SaveButton.Name = "SaveButton"
SaveButton.Parent = MainFrame
SaveButton.Size = UDim2.new(0, 80, 0, 30)
SaveButton.Position = UDim2.new(0, 10, 1, -40)
SaveButton.Text = "Save"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Key System UI
KeySystemFrame.Name = "KeySystemFrame"
KeySystemFrame.Parent = CeleronBeta
KeySystemFrame.Size = UDim2.new(0, 300, 0, 150)
KeySystemFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
KeySystemFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

KeyInput.Name = "KeyInput"
KeyInput.Parent = KeySystemFrame
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.2, 0)
KeyInput.PlaceholderText = "Enter Key"
KeyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

SubmitKey.Name = "SubmitKey"
SubmitKey.Parent = KeySystemFrame
SubmitKey.Size = UDim2.new(0.5, 0, 0, 30)
SubmitKey.Position = UDim2.new(0.25, 0, 0.6, 0)
SubmitKey.Text = "Submit"
SubmitKey.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitKey.BackgroundColor3 = Color3.fromRGB(0, 128, 0)

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = KeySystemFrame
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0.85, 0)
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
StatusLabel.TextSize = 14

-- Directory path
local directoryPath = "Celeron\\"

-- Create the folder if it doesn't exist
if not isfolder(directoryPath) then
    makefolder(directoryPath)
end

-- Filename input and extension selection code
local fileNameInput = Instance.new("TextBox")
fileNameInput.Size = UDim2.new(0.8, 0, 0, 40)
fileNameInput.Position = UDim2.new(0.1, 0, 0.2, 0)
fileNameInput.PlaceholderText = "Enter filename (without extension)"
fileNameInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fileNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
fileNameInput.Parent = KeySystemFrame

local extensionDropdown = Instance.new("TextButton")
extensionDropdown.Size = UDim2.new(0.8, 0, 0, 40)
extensionDropdown.Position = UDim2.new(0.1, 0, 0.6, 0)
extensionDropdown.Text = "Choose Extension (.lua or .luau)"
extensionDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
extensionDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
extensionDropdown.Parent = KeySystemFrame

local fileExtension = ".lua"  -- Default extension

extensionDropdown.MouseButton1Click:Connect(function()
    -- Toggle between .lua and .luau
    if fileExtension == ".lua" then
        fileExtension = ".luau"
    else
        fileExtension = ".lua"
    end
    extensionDropdown.Text = "Chosen Extension: " .. fileExtension
end)

-- Key system logic
local keyUrl = "https://raw.githubusercontent.com/zeq1568/c/refs/heads/main/key"
local keyConditionUrl = "https://raw.githubusercontent.com/zeq1568/c/refs/heads/main/keycondition"

local function getKeyData(url)
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)
    return success and response or nil
end

local function verifyKey(inputKey)
    local validKey = getKeyData(keyUrl)
    local keyCondition = getKeyData(keyConditionUrl)

    if not validKey or not keyCondition then
        StatusLabel.Text = "Failed to fetch key data."
        return false
    end

    if inputKey == validKey then
        return true
    else
        StatusLabel.Text = "Invalid Key!"
        return false
    end
end

SubmitKey.MouseButton1Click:Connect(function()
    local inputKey = KeyInput.Text
    if verifyKey(inputKey) then
        KeySystemFrame:Destroy()
        MainFrame.Visible = true
    else
        StatusLabel.Text = "Invalid Key!"
    end
end)

SaveButton.MouseButton1Click:Connect(function()
    local filename = fileNameInput.Text .. fileExtension  -- Combine input filename and extension
    local content = Editor.Text  -- Get the content from the editor
    local filePath = directoryPath .. filename  -- Full path for saving the file

    -- Save the file with the chosen extension inside the Celeron folder
    pcall(function()
        writefile(filePath, content)
    end)

    -- Optionally, show a confirmation message in StatusLabel
    StatusLabel.Text = "Script saved as " .. filePath
end)