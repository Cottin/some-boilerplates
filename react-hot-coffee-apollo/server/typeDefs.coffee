module.exports = """
	type Query { 
		persons: [Person]
		companies: [Company]
	}

	type Person {
		id: Int
		name: String
		age: Int
		position: String
		salary: Int
		company: Company
	}

	type Company {
		id: Int
		name: String
		employees: Int
		turnover: Float
	}

"""
