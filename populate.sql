INSERT INTO countries (id, name) VALUES
	(1, 'the Soviet Union'),
	(2, 'Russia'), 
	(3, 'the Czech Republic'),
	(4, 'Italy');
	
INSERT INTO equip_type (id, type) VALUES
	(1, 'Tanks'), 
	(2, 'Armoured Fighting Vehicles'), 
	(3, 'Engineering Vehicles And Equipment'), 
	(4, 'Artillery Support Vehicles And Equipment'),
	(5, 'Infantry Fighting Vehicles'), 
	(6, 'Infantry Mobility Vehicles');
	
INSERT INTO equip (id, equip_type_id, country_id, model, submodel) VALUES
	(1, 1, 1, 'T-62M', NULL),
	(2, 1, 1, 'T-62MV', NULL),
	(3, 1, 1, 'T-64A', NULL),
	(4, 2, 2, 'Vityaz DT-10PM articulated tracked carrier', NULL),
	(5, 2, 2, 'Vityaz DT-30 articulated tracked carrier', NULL), 
	(6, 3, 2, 'RKhM-6 Povozka', 'with RP-377VM1 jammer'),
	(7, 3, 3, 'BREM-Ch "BREM-4" armoured recovery vehicle', NULL), 
	(8, 4, 1, '1V110 BM-21 Grad battery command vehicle', NULL), 
	(9, 5, 1, 'BMD-2', NULL), 
	(10, 6, 4, 'Iveco LMV Rys', NULL);
	
INSERT INTO losses (equip_id, losses_total, abandoned, abandoned_and_destroyed, captured, captured_and_destroyed, captured_and_stripped) VALUES
	(1, 20, 1, NULL, 14, NULL, NULL),
	(2, 3, NULL, NULL, 1, NULL, NULL),
	(3, 2, NULL, NULL, NULL, NULL, NULL),
	(4, 1, NULL, NULL, NULL, NULL, NULL),
	(5, 3, NULL, NULL, 1, NULL, NULL),
	(6, 1, NULL, NULL, NULL, NULL, NULL), 
	(7, 5, 1, NULL, 1, NULL, NULL),
	(8, 1, NULL, NULL, NULL, 1, NULL),
	(9, 139, 6, NULL, 38, NULL, 2),
	(10, 26, NULL, 1, 1, NULL, NULL);