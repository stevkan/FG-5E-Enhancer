function onHover(state)
	local nodeActiveCT = CombatManager.getActiveCT();
	local nodeCT = window.getDatabaseNode(); 
	local tokenCT = CombatManager.getTokenFromCT(nodeCT);

	if state and tokenCT then
		-- add blue underlay
		tokenCT.removeAllUnderlays(); 
		local space = nodeCT.getChild('space');  
		if space == nil then 
			space = 1;
		else
			space = space.getValue()/5/2+0.5; 
		end
		tokenCT.addUnderlay(space, CombatEnhancer.TOKENUNDERLAYCOLOR_3); 

	elseif tokenCT then
		-- remove all underlays, if active then put back active underlay
		tokenCT.removeAllUnderlays(); 
		Debug.console("nodeCT.getNodeName():" .. nodeCT.getNodeName());
		if nodeActiveCT and nodeActiveCT.getNodeName() == nodeCT.getNodeName() then
			Debug.console("nodeActiveCT.getNodeName:" .. nodeActiveCT.getNodeName());
			local tokenActiveCT = CombatManager.getTokenFromCT(nodeActiveCT);
			if tokenActiveCT then
				local space = nodeActiveCT.getChild('space');  
				if space == nil then 
					space = 1;
				else
					space = space.getValue()/5/2+0.5; 
				end
				tokenCT.addUnderlay(space, CombatEnhancer.TOKENUNDERLAYCOLOR_1); 
			end
		end
	end
end
