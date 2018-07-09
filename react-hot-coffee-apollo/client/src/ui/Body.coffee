React = require 'react'
{Query} = require "react-apollo"
gql = require "graphql-tag"
{Link, withRouter} = require 'react-functional-router'
{sort} = require 'ramda' #auto_require:ramda
{fmap} = require 'ramda-extras' #auto_require:ramda-extras

_ = require './renderer'

module.exports = () ->
	_ PersonList

PersonList = withRouter ({url}) ->
	_ Query,
		query: gql"""
			query persons($sort: String!) {
				persons(sort: $sort) {
					id name age position salary
					company {
						id name
					}
				}
			}
			"""
		variables: {sort: url.sort}
	,
		({ loading, error, data }) ->
			if loading then return _ {}, 'Loading...'
			if error then return _ {}, 'Error!'
			if !data || !data.persons then return 'No persons found'
			_ {},
				_ {},
					_ {}, 'Sort by:'
					_ Link, {query: {sort: 'name'}}, 'Name'
					_ Link, {query: {sort: 'salary'}}, 'Salary'
				fmap data.persons, (p) -> _ Person, {key: p.id, person: p}

Person = ({person}) ->
	_ {s: 'm0_0_20_0 bglime'},
		_ {}, person.name
		_ {}, person.position
		_ {}, person.company?.name
		_ {}, person.salary

