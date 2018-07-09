{prop, sort, sortBy, values} = require 'ramda' #auto_require:ramda
{fmap, fmapObjIndexed} = require 'ramda-extras' #auto_require:ramda-extras

companies =
	1: {id: 1, name: 'Vandelay Industries', employees: 9, turnover: 1000000}
	2: {id: 2, name: 'Pendent Publishing', employees: 42, turnover: 7500000}

persons =
	1: {id: 1, name: 'George Costanza', age: 36, position: 'Salesman', salary: 40000, company: 1}
	2: {id: 2, name: 'Elaine Benes', age: 34, position: 'Editor', salary: 100000, company: 2}
	3: {id: 3, name: 'Kel Vernsen', age: 42, position: 'Manager', salary: 100000, company: 1}
	4: {id: 4, name: 'H.E. Pennypacker', age: 52, position: 'Philanthrop', salary: 123456789}

denorm = (x, mapping, data) ->
	fmapObjIndexed x, (v, k) ->
		if mapping[k] then data[mapping[k]][v] else v

denormList = (xs, mapping, data) -> fmap xs, (x) -> denorm x, mapping, data

module.exports =
	Query:
		persons: (_, {sort}) ->
			list = denormList values(persons), {company: 'companies'}, {companies}
			sortBy prop(sort), list
		companies: () -> values companies
