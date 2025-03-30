local playermoney = 1000

local guns = {
    ["AK74"] = { Price = 690 },
    ["Glock 17"] = { Price = 132 },
    ["Scar"] = { Price = 939 }
}

print("What gun do you want to buy? (AK74, Glock 17, Scar)")
local gunChoice = io.read()

if guns[gunChoice] then
    local price = guns[gunChoice].Price
    print("Good choice! That will be $" .. price .. ".")
    print("Do you want to buy it? (Yes/No)")
    local confirm = io.read()

    if confirm == "Yes" or confirm == "yes" then
        if playermoney >= price then
            playermoney = playermoney - price
            print("You bought the " .. gunChoice .. "! Remaining money: $" .. playermoney)
        else
            print("You don't have enough money.")
        end
    else
        print("Purchase canceled.")
    end
else
    print("Sorry, we don't have that weapon.")
end
