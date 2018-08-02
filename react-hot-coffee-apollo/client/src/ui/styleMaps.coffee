{__, match, merge, nth, reduce, split, test, type} = require 'ramda' #auto_require:ramda
{cc} = require 'ramda-extras'

_ERR = 'StyleMap-error: '


f = (x) ->
	ret = {}
	if type(x) != 'String' then throw new Error _ERR + "font expected type string, given: #{x}"
	
	RE = /^([a-z_])([\d]{1,2}|_)([a-z]{2,3}|__)([\d_])?$/
	if ! test RE, x then throw new Error _ERR + "Invalid string given for font: #{x}"
	[_, family, size, color, weight] = match RE, x

	switch family
		when 'o' then ret.fontFamily = "'Open Sans', sans-serif"
		when '_' then # no-op
		else throw new Error _ERR + "invalid family '#{family}' for t: #{x}"

	switch size
		when '0' then ret.fontSize = '0.7rem'
		when '1' then ret.fontSize = '0.8rem'
		when '2' then ret.fontSize = '0.9rem'
		when '3' then ret.fontSize = '1.0rem'
		when '4' then ret.fontSize = '1.1rem'
		when '5' then ret.fontSize = '1.2rem'
		when '6' then ret.fontSize = '1.3rem'
		when '7' then ret.fontSize = '1.4rem'
		when '8' then ret.fontSize = '1.5rem'
		when '9' then ret.fontSize = '1.6rem'
		when '_' then # no-op
		else throw new Error _ERR + "invalid size '#{size}' for t: #{x}"


	opacity = 1
	switch color
		when 'bk' then ret.color = "rgba(66, 66, 66, #{opacity})"
		when 'gy' then ret.color = "rgba(106, 106, 106, #{opacity})"
		when 'wh' then ret.color = "rgba(255, 255, 255, #{opacity})"
		when 'bu' then ret.color = "rgba(19, 142, 204, #{opacity})"
		when 'ii' then ret.color = 'inherit'
		when '__' then # no-op
		else throw new Error _ERR + "invalid color '#{color}' for t: #{x}"

	switch weight
		when '_' then # noop
		when undefined then # noop
		else ret.fontWeight = parseInt(weight) * 100

	return ret


beige = '#F6EEE2'
lightBeige = '#FFF9F0'
white = '#FFFFFF'
grey = '#F8F8F5'
blue = '#25AAED'
darkBlue = '#284F63'

mix = (x) ->
	mixins = split ' ', x
	mergeM = (mem, m) -> merge mem, _mixins(m)
	reduce mergeM, {}, mixins

_mixins = (m) ->
	switch m

		when 'h1'
			':hover':
				background: '#E2F2FA' 
				'> div': 
					background: '#E2F2FA' 

		when 'h2'
			':hover':
				background: '#386379' 
				boxShadow: '0 1px 1px 0 rgba(0,0,0,0.65)'
				'> a': 
					color: '#FFFFFF'
				'> div': 
					color: '#FFFFFF'
					'> svg': 
						fill: '#FFFFFF' 
				'> svg': 
					fill: '#FFFFFF' 

		# base
		when 'be'
			background: beige
		when 'lbe'
			background: lightBeige
		when 'wh'
			background: white
		when 'bu'
			background: blue
		when 'dbu'
			background: darkBlue
		when 'gy´'
			background: grey

		# alternating
		when 'wh-gy'
			':nth-child(odd)':
				background: white
			':nth-child(even)':
				background: grey
		when 'gy-wh'
			':nth-child(odd)':
				background: grey
			':nth-child(even)':
				background: white

		# dev
		when 'lime' then backgroundColor: 'lime'
		when 'teal' then backgroundColor: 'teal'
		when 'pink' then backgroundColor: 'pink'
		when 'red' then backgroundColor: 'red'
		when 'green' then backgroundColor: 'green'
		when 'blue' then backgroundColor: 'blue'
		when 'lightblue' then backgroundColor: 'lightblue'
		when undefined then {}

		else throw new Error _ERR + "invalid mixin '#{m}'"


#auto_export:none_
module.exports = {f, beige, lightBeige, white, grey, blue, darkBlue, mix}