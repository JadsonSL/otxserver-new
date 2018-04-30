function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemEx = target
 
    -- Flower
    if item.actionid == 41354 then  -- Getting Flower
        if player:getStorageValue(lionrock.storages.getFlower) < 1 then
            player:addItem(lionrock.items.flower)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have picked a beatiful's lion's mane.")
            player:setStorageValue(lionrock.storages.getFlower, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			else 			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've picked this flower before.")
        end
        return true
    end
   
    if item:getId() == lionrock.items.flower and itemEx.actionid == 41340 then -- Using Flower with Basin
        if player:getStorageValue(lionrock.storages.usedFlower) < 1 then
            player:removeItem(lionrock.items.flower, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You burnt a lion's mane flower. The light in the small pyramid nearby begins to shine.")
            player:setStorageValue(lionrock.storages.usedFlower, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			else 			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have burned the flower before.")
        end
        return true
    end
   
    -- Using Skeleton
    if item.actionid == 41356 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You missed the skeleton, you can get the scroll from the \"Amphora\".")
    end
   
    -- Holy Water
    if item.actionid == 41355 then
        if player:getStorageValue(lionrock.storages.getHolyWater) < 1 then -- Getting Holy Water
            player:addItem(lionrock.items.holywater, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You took some holy water from the sacred well.")
            player:setStorageValue(lionrock.storages.getHolyWater, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			else 			
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've picked this holy water before.")
        end
    end
   
    if item:getId() == lionrock.items.holywater and itemEx.actionid == 41343 then -- Using HolyWater with Tears
        if player:getStorageValue(lionrock.storages.usedHolyWater) < 1 then
            player:removeItem(lionrock.items.holywater, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have purified a sacred pedestal with holy water. You have now passed the last test to enter the inner sanctum.")
            player:setStorageValue(lionrock.storages.usedHolyWater, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
        return true
    end
   
   
    -- Tongue
    if item:getId() == lionrock.items.tongue and itemEx.actionid == 41341 then -- Using HolyWater with Tears
        if player:getStorageValue(lionrock.storages.usedTongue) < 1 then
            player:removeItem(lionrock.items.tongue, 1)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have sacrificed a cobra tongue at an ancient statue. The light in the small pyramid nearby begins to shine.")
            player:setStorageValue(lionrock.storages.usedTongue, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
        return true
    end
   
    -- Large Amphora
    if item.actionid == 41345 then
        if player:getStorageValue(lionrock.storages.getScroll) < 1 then
            player:addItem(lionrock.items.scroll)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "As you pass incautiously, the ancient amphora crumbles to shards and dust. Amidst the debris you discover an old scroll.")
            player:setStorageValue(lionrock.storages.getScroll, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
   
   if item.actionid == 41357 then
       
        --if not lionrock.checkPlayerDoneQuest(player) then
		--    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not completed all missions.")
        --    return false
        --end
       
        if player:getStorageValue(lionrock.storages.playerCanDoTasks) - os.time() > 0 then
           player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Come back after the server save.")
            return false
        end
        -- Player reward
        player:setStorageValue(lionrock.storages.playerCanDoTasks, os.time() + 1 * 24 * 60 * 60 )
        local reward = lionrock.rewards[math.random(#lionrock.rewards)]
        player:addItem(reward.id, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Here is your reward.")
	   
        -- Reseting tasks
        lionrock.taskactive.ruby = false
        lionrock.taskactive.sapphire = false
        lionrock.taskactive.amethyst = false
        lionrock.taskactive.topaz = false
       
        -- removign fires.
		
		-- removign fires.
       
      --  local p, i = lionrock.items, lionrock.positions
       
	   
	   -- ruby
	local redflamePosition = Position(33069, 32298, 9)
	local redItem = Tile(redflamePosition):getItemById(1488)
	if redItem then
		redItem:remove()
	end
	
	
	-- amethyst
	local yellowflamePosition = Position(33077, 32302, 9)
	local yellowItem = Tile(yellowflamePosition):getItemById(1500)
	if yellowItem then
		yellowItem:remove()
	end
	
	
	-- topaz
	local purpleflamePosition = Position(33077, 32298, 9)
	local purpleItem = Tile(purpleflamePosition):getItemById(7473)
	if purpleItem then
		purpleItem:remove()
	end
	
	-- sapphire
	local tpflamePosition = Position(33069, 32302, 9)
	local tpItem = Tile(tpflamePosition):getItemById(8058)
	if tpItem then
		tpItem:remove()
	end
	
	
        --[[local tile = Tile(p.ruby)
        if tile:getItemById(i.redflame) ~= nil then
            tile:getItemById(i.redflame):remove()
        end
       
        tile = Tile(p.sapphire) ~= nil
        if tile:getItemById(i.blueflame) ~= nil then
            tile:getItemById(i.blueflame):remove()
        end
       
        tile = Tile(p.amethyst) ~= nil
        if tile:getItemById(i.yellowflame) ~= nil then
            tile:getItemById(i.yellowflame):remove()
        end
       
        tile = Tile(p.topaz) ~= nil
        if tile:getItemById(i.violetflame) ~= nil then
            tile:getItemById(i.violetflame):remove()
        end]]--
		
		
       --[[ local flames = {
            1488,
            1500,
            7473,
            8058
        }
		
        for i = 1, #lionrock.positions do
		local tile = Tile(lionrock.positions[i-1])
		for j = 1, #flames do
		if tile:getItemCountById(flames[j-1]) > 0 then
		tile:getItemById(flames[j-1]):remove()
		end
		end
		end--]]
       
        -- Removing Fountain
        Item(item.uid):remove()
        -- Stone back;
        Game.createItem(3608, 1, { x=33073, y=32300, z=9})
    end
end