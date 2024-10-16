source(output(
		Country as string,
		Currency as string,
		Name as string,
		Region as string,
		Population as integer,
		{Area (sq. mi.)} as string,
		{Pop. Density (per sq. mi.)} as string,
		{Coastline (coast per area ratio)} as string,
		{Net migration} as string,
		{Infant mortality (per 1000 births)} as string,
		{GDP ($ per capita)} as string,
		{Literacy (%)} as string,
		{Phones (per 1000)} as string,
		{Arable (%)} as string,
		{Crops (%)} as string,
		{Other (%)} as string,
		Climate as string,
		Birthrate as string,
		Deathrate as string,
		Agriculture as string,
		Industry as string,
		Service as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	ignoreNoFilesFound: false) ~> source1
source1 sink(allowSchemaDrift: true,
	validateSchema: false,
	input(
		country_id as string,
		c_name as string,
		c_population as integer
	),
	deletable:false,
	insertable:true,
	updateable:false,
	upsertable:false,
	format: 'table',
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true,
	saveOrder: 1,
	errorHandlingOption: 'stopOnFirstError',
	mapColumn(
		c_name = Name,
		c_population = Population
	)) ~> sink1