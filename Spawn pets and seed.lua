-- // Grow a Garden GUI Script (Delta Executor)

-- Lista de semillas y mascotas, incluyendo Dragonfly y Bone Blossom
local seedsAndPets = {
    -- Seed Shop
    "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Watermelon",
    "Green Apple", "Avocado", "Banana", "Pineapple", "Kiwi", "Bell Pepper",
    "Prickly Pear", "Loquat", "Feijoa", "Sugar Apple", "Rafflesia", "Pitcher Plant",
    -- Pack normal / Daily
    "Pumpkin", "Cactus", "Dragonfruit", "Peach", "Raspberry", "Mango",
    -- Summer Seed Pack
    "Wild Carrot", "Pear", "Cantaloupe", "Parasol Flower", "Rosy Delight", "Elephant Ears",
    -- Night Pack
    "Nightshade", "Glowshroom", "Mint", "Moonflower", "Starfruit", "Moonglow", "Moon Blossom",
    -- Flower Pack
    "Rose", "Foxglove", "Lilac", "Pink Lily", "Purple Dahlia", "Sunflower",
    -- Crafters/Crafting
    "Peace Lily", "Aloe Vera", "Guanabana", "Crocus", "Succulent", "Violet Corn",
    "Bendboo", "Cocovine", "Dragon Pepper",
    -- Misc Harvest
    "Cacao", "Pepper", "Celestiberry", "Moon Melon", "Nectarine", "Blood Banana",
    "Chocolate Carrot", "Moon Mango", "Easter Egg", "Ember Lily", "Delphinium", "Lily Of The Valley", "Traveler's Fruit",
    -- Premium pack
    "Cranberry", "Durian", "Eggplant", "Lotus", "Venus Fly Trap",
    -- Dinosaurios (Prehistoric)
    "T‑Rex", "Spinosaurus", "Dilophosaurus", "Ankylosaurus", "Brontosaurus", "Stegosaurus", "Iguanodon",
    "Pachycephalosaurus", "Tanchozuru", "Tanuki",
    
    -- 🆕 Agregados
    "Bone Blossom",  -- ✅ Nuevo cultivo
    "Dragonfly",     -- ✅ Nueva mascota (Divina)
}

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "GardenSpawnerUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 350, 0, 260)
Frame.Position = UDim2.new(0.5, -175, 0.5, -130)
Frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "🌱 Grow a Garden – Spawner"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(180,255,180)
Title.Font = Enum.Font.GothamSemibold
Title.TextSize = 18

local TextBox = Instance.new("TextBox", Frame)
TextBox.PlaceholderText = "Ingresa semilla o mascota..."
TextBox.Size = UDim2.new(1, -20, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 60)
TextBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
TextBox.TextColor3 = Color3.fromRGB(230,230,230)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.ClearTextOnFocus = false
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

local Button = Instance.new("TextButton", Frame)
Button.Text = "🔄 Obtener"
Button.Size = UDim2.new(1, -20, 0, 45)
Button.Position = UDim2.new(0, 10, 0, 120)
Button.BackgroundColor3 = Color3.fromRGB(70,130,70)
Button.TextColor3 = Color3.fromRGB(245,245,245)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

-- Lógica para spawn
Button.MouseButton1Click:Connect(function()
    local item = TextBox.Text
    if table.find(seedsAndPets, item) then
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("BuyItem")
        if remote then
            remote:FireServer(item)
            game.StarterGui:SetCore("SendNotification", {
                Title = "✅ Éxito",
                Text = "Obtuviste: "..item,
                Duration = 3,
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "⚠️ Error",
                Text = "Remote 'BuyItem' no encontrado.",
                Duration = 4,
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "❌ No existe",
            Text = "Revisa que el nombre esté bien escrito.",
            Duration = 3,
        })
    end
end)
