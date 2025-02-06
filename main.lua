local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.Text = "Celeron V4 [BETA]"
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextAlign = Enum.TextAlign.Center
titleLabel.Parent = titleBar

-- Attach Button
local attachButton = Instance.new("TextButton")
attachButton.Size = UDim2.new(0, 120, 0, 40)
attachButton.Position = UDim2.new(0.5, -60, 0.3, 0)
attachButton.Text = "Attach"
attachButton.TextColor3 = Color3.fromRGB(255, 255, 255)
attachButton.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
attachButton.TextSize = 18
attachButton.Parent = mainFrame

-- Progress Bar
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 400, 0, 20)
progressBar.Position = UDim2.new(0.5, -200, 0.6, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
progressBar.BorderSizePixel = 0
progressBar.Parent = mainFrame

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(130, 60, 255)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBar

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 40, 0, 40)
minimizeButton.Position = UDim2.new(1, -40, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.TextSize = 24
minimizeButton.Parent = mainFrame

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
closeButton.TextSize = 24
closeButton.Parent = mainFrame

-- Monaco Editor (Luau Script Editor)
local editorBox = Instance.new("TextBox")
editorBox.Size = UDim2.new(1, -40, 0, 100)
editorBox.Position = UDim2.new(0, 20, 0, 100)
editorBox.Text = "Enter Luau Script Here..."
editorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
editorBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
editorBox.TextSize = 14
editorBox.Font = Enum.Font.Gotham
editorBox.TextWrapped = true
editorBox.MultiLine = true
editorBox.Parent = mainFrame

-- Key System and Attach Logic
local function checkKey()
    local key = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/zeq1568/c/refs/heads/main/key")
    local keyCondition = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/zeq1568/c/refs/heads/main/keycondition")
    if keyCondition == "true" then
        -- Proceed with normal functionality
        return true
    else
        -- Show key error or warning
        createMessageBox("Key Error", "Invalid key, please check your key.")
        return false
    end
end

-- Attach button functionality
attachButton.MouseButton1Click:Connect(function()
    if checkKey() then
        attachButton.Text = "Attaching..."
        progressFill:TweenSize(UDim2.new(0, 100, 1, 0), "Out", "Quad", 3, true)
        wait(3)
        attachButton.Text = "Attached"
        attachButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
    end
end)

-- Minimize Button Functionality
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Close Button Functionality
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Function to create custom message boxes
local function createMessageBox(title, message)
    local messageBox = Instance.new("Frame")
    messageBox.Size = UDim2.new(0, 400, 0, 200)
    messageBox.Position = UDim2.new(0.5, -200, 0.5, -100)
    messageBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    messageBox.BackgroundTransparency = 0.5
    messageBox.BorderSizePixel = 0
    messageBox.Parent = mainFrame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Text = title
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 20
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextAlign = Enum.TextAlign.Center
    titleLabel.Parent = messageBox

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -40, 0, 100)
    messageLabel.Position = UDim2.new(0, 20, 0, 50)
    messageLabel.Text = message
    messageLabel.BackgroundTransparency = 1
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.TextSize = 16
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextAlign = Enum.TextAlign.Center
    messageLabel.TextWrapped = true
    messageLabel.Parent = messageBox

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 100, 0, 40)
    closeButton.Position = UDim2.new(0.5, -50, 1, -50)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Text = "Close"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 16
    closeButton.Parent = messageBox

    closeButton.MouseButton1Click:Connect(function()
        messageBox:Destroy()
    end)
end

-- Example message box
createMessageBox("Key Validation", "Please enter a valid key to continue.")
