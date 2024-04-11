
-- In some cases you'll want to extend the metatables of a few classes. The standard way of doing so is to place your
-- extensions/overrides in the meta/ folder where each file pertains to one class.

local CHAR = ix.meta.character

function CHAR:IsPolice()
	return self:GetFaction() == FACTION_POLICE
end

function CHAR:IsTaxi()
	return self:GetFaction() == FACTION_TAXI
end

function CHAR:IsMayor()
	return self:GetFaction() == FACTION_MAYOR
end

function CHAR:IsCitizen()
	return self:GetFaction() == FACTION_CITIZEN
end

function CHAR:AddBankBalance(amount)
    local oldBalance = self:GetBankBalance()
    self:SetData("bank", oldBalance + amount)
    hook.Run("BankBalanceChanged", self, oldBalance, amount, oldBalance + amount)
end

function CHAR:TakeBankBalance(amount)
    local oldBalance = self:GetBankBalance()
    self:SetData("bank", oldBalance - amount)
    hook.Run("BankBalanceChanged", self, oldBalance, -amount, oldBalance - amount)
end

function CHAR:GetBankBalance()
	return self:GetData("bank", 0)
end



