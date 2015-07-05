bcBoilRags = {};

function bcBoilRags.takeRags(player, item)
	player = getSpecificPlayer(player);
	local inv = player:getInventory();

	for x=1,4 do
		if item:getFullType() == "bcBoilRags.PotOfCleanRags" then
			inv:AddItem("Base.AlcoholRippedSheets");
		else
			inv:AddItem("Base.RippedSheetsDirty");
		end
	end
	inv:AddItem("Base.Pot");

	inv:Remove(item);
end

function bcBoilRags.createInventoryMenu(player, context, items)
	item = items[1];
	if not instanceof(item, "InventoryItem") then
		item = item.items[1];
	end
	if item == nil then return end;

	if item:getFullType() == "bcBoilRags.PotOfCleanRags" then
		context:addOption("Take clean rags", player, bcBoilRags.takeRags, item);
	elseif item:getFullType() == "bcBoilRags.PotOfDirtyRags" then
		context:addOption("Take dirty rags", player, bcBoilRags.takeRags, item);
	end
end

Events.OnFillInventoryObjectContextMenu.Add(bcBoilRags.createInventoryMenu);
