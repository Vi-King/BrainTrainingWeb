class Events
	on: (opt) ->
		attach @, k, v for k, v of opt

	attach = (self, k, v) ->
		self["#{k}_org"] = self[k]
		self[k] = () ->
			v[k].apply(v, arguments)
			self["#{k}_org"].apply(self, arguments)

module.exports = Events
