# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@graph_render = ->
	width = 960
	height = 500
	color = d3.scale.category20()
	force = d3.layout.force().linkDistance(10).linkStrength(2).size([
		width
		height
	])
	svg = d3.select('body').append('svg').attr('width', width).attr('height', height)
	d3.json '/nuerons.json', (error, graph) ->
		if error
			throw error
		nuerons = graph.nuerons.slice()
		synapses = []
		bisynapses = []
		graph.synapses.forEach (synapse) ->
			s = nuerons[synapse.origin_id - 1]
			t = nuerons[synapse.next_id - 1]
			i = {}
			# intermediate node
			nuerons.push i
			synapses.push({source: s, target: i}, {source: i, target: t})
			bisynapses.push([s, i, t])
			return
		force.nodes(nuerons).links(synapses).start()
		link = svg.selectAll('.link').data(bisynapses).enter().append('path').attr('class', 'link')
		node = svg.selectAll('.node').data(graph.nuerons).enter().append('circle').attr('class', 'node').attr('r', 4).style('fill', (d) ->
			color d.user_id
		).call(force.drag)
		node.append('title').text (d) ->
			d.title
		text = svg.append("svg:g").selectAll("g").data(graph.nuerons).enter().append("svg:g");
		text.append('svg:text').attr('x', 8).attr('y', '.31em').text (d) ->
			d.title
		force.on 'tick', ->
			link.attr 'd', (d) ->
				'M' + d[0].x + ',' + d[0].y + 'S' + d[1].x + ',' + d[1].y + ' ' + d[2].x + ',' + d[2].y
			node.attr 'transform', (d) ->
				'translate(' + d.x + ',' + d.y + ')'
			text.attr 'transform', (d) ->
				'translate(' + d.x + ',' + d.y + ')'
		return
	return

@show_nueron = (n) ->
	window.location.href = '/nuerons/' + n
