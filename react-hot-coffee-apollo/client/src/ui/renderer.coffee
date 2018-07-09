React = require 'react'
fela = require 'fela'
prefixer = require('fela-plugin-prefixer').default
fallbackValue = require('fela-plugin-fallback-value').default
shortstyle = require 'shortstyle'
{props, type} = require 'ramda' #auto_require:ramda
{} = require 'ramda-extras' #auto_require:ramda-extras

styleMaps = require './styleMaps'
felaRenderer = require './felaRenderer'

attrMaps = {}
attrMaps.is = (x) -> {id: x} # hack to be able to use is as a label

Shortstyle = shortstyle styleMaps, attrMaps, (x) ->
	if type(x) == 'Number' then x/10 + 'em'
	else x

createElementFela = ->
	[comp, props, children] = Shortstyle.createElementHelper(felaRenderer)(arguments...)
	React.createElement comp, props, children...

module.exports = createElementFela
