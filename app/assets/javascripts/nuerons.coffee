# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@graph_render = ->
	width = $('#brain').innerWidth()
	height = 500
	color = d3.scale.category20()
	force = d3.layout.force().linkDistance(30).linkStrength(2).size([
		width
		height
	])
	svg = d3.select('#brain').append('svg').attr('width', '100%').attr('height', height).attr('preserveAspectRatio','xMinYMin')
	# build the arrow.
	svg.append('svg:defs').selectAll('marker').data(['end']).enter().append('svg:marker').attr('id', String).attr('viewBox', '0 -5 10 10').attr('refX', 15).attr('refY', 0).attr('markerWidth', 6).attr('markerHeight', 6).attr('orient', 'auto').append('svg:path').attr 'd', 'M0,-5L10,0L0,5'
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
		show_nueron = (url) ->
			window.location.href = url
		click = (d) ->
			console.log('clicked')
			show_nueron(d.uri)
			return
		mouseenter = ->
			d3.select(this).select('circle').transition().duration(750).attr('r', 16).style 'fill', 'lightsteelblue'
			d3.select(this).select('text').transition().duration(750).attr('x', 20).style('stroke', 'none').style('fill', 'black').style('stroke', 'none').style 'font', '20px sans-serif'
			return
		mouseleave = ->
			d3.select(this).select('circle').transition().duration(750).attr('r', 6).style 'fill', (d) ->
				color d.tag_list
			d3.select(this).select('text').transition().duration(750).attr('x', 12).style('stroke', 'none').style('fill', 'black').style('stroke', 'none').style('font', '0px sans-serif')
			return
		force.nodes(nuerons).links(synapses).start()
		link = svg.append('svg:g').selectAll('.link').data(bisynapses).enter().append('path').attr('class', 'link').attr('marker-end', 'url(#end)')
		node = svg.selectAll('.node').data(graph.nuerons).enter().append('g').attr('class', 'node').on('dblclick', click).on('mouseenter', mouseenter).on('mouseleave', mouseleave).call(force.drag)
		node.append('circle').attr('r', 6).style 'fill', (d) ->
			color d.tag_list
		node.append('title').text (d) ->
			d.title
		node.append('text').attr('x', 12).attr('dy', '.35em').text (d) ->
			d.title
		force.on 'tick', ->
			link.attr 'd', (d) ->
				'M' + d[0].x + ',' + d[0].y + 'S' + d[1].x + ',' + d[1].y + ' ' + d[2].x + ',' + d[2].y
			node.attr 'transform', (d) ->
				'translate(' + d.x + ',' + d.y + ')'
		return
	return

