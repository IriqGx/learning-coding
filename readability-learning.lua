local age = 23
local job = false
local drivers_license = true

if age < 18 then
   print("You are a kid")
end

if job == true and drivers_license == true and age>= 18 then
   print("You are a doing good")
end

if job == false or drivers_license == false then
   if age>= 18 then
      print("You are lazy")
   end
end