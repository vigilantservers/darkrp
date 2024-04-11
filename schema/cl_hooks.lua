
-- Here is where all of your clientside hooks should go.

-- Disables the crosshair permanently.
function Schema:CharacterLoaded(character)
	self:ExampleFunction("@serverWelcome", character:GetName())
end

hook.Add("BankBalanceChanged", "NotifyPlayerOfBankChange", function(char, oldBalance, change, newBalance)
   if(change > 0) then
      char:Notify("You have received $"..change.." in your bank account.")
   else
      char:Notify("You have withdrawn $"..math.abs(change).." from your bank account.")
   end
end)