React = require 'react'
{Query} = require "react-apollo"
gql = require "graphql-tag"
{} = require 'ramda' #auto_require:ramda
{fmap} = require 'ramda-extras' #auto_require:ramda-extras

_ = require './renderer'

module.exports = () ->
	_ Query,
		query: gql"""
			{
				persons {
					id name age position salary
					company {
						id name
					}
				}
			}
			"""
	,
		({ loading, error, data }) ->
			_ {},
				loading && _ {}, 'Loading...'
				error && _ {}, 'Error!'
				data && data.persons && fmap data.persons, (p) -> _ Person, {key: p.id, person: p}

Person = ({person}) ->
	_ {s: 'm0_0_20_0 bglime'},
		_ {}, person.name
		_ {}, person.position
		_ {}, person.company?.name

