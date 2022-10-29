SELECT equip.model, losses.losses_total
FROM losses
	JOIN equip ON losses.equip_id = equip.id;

SELECT equip_type.type, SUM(losses.losses_total)
FROM losses
	JOIN equip ON losses.equip_id = equip.id
	JOIN equip_type ON equip.equip_type_id = equip_type.id
GROUP BY equip_type.type

SELECT equip_type.type, SUM(losses.captured)
FROM losses
	JOIN equip ON losses.equip_id = equip.id
	JOIN equip_type ON equip.equip_type_id = equip_type.id
GROUP BY equip_type.type