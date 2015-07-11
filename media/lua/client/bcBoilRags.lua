function TakeCleanRags_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.Pot"); -- recipes can not give you two different items, so work around this
end
