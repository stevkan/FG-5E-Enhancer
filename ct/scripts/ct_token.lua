function onHover(state)
	Debug.console(state)
	local nodeActiveCT = CombatManager.getActiveCT();
	local nodeCT = window.getDatabaseNode(); 
	local tokenCT = CombatManager.getTokenFromCT(nodeCT);

	if state and tokenCT then
		Debug.console('first if statement')
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
		Debug.console('second if statement')
		-- remove all underlays, if active then put back active underlay
		tokenCT.removeAllUnderlays(); 
		if nodeActiveCT and nodeActiveCT.getNodeName() == nodeCT.getNodeName() then
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
