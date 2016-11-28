$(function() {
    var w = $(window).width(),
        h = $(window).height(),
        node,
        link,
        labels,
        root,
        linkIndexes,
        typeSize;

    function tick(e) {
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node.attr('cx', function(d) { return d.x; })
            .attr('cy', function(d) { return d.y; });

        labels.attr('transform', function(d) {
            return 'translate(' + d.x + ',' + d.y + ')';
        });
    }

    function color(d) {
        return (d.type === 'g') ? '#DD5958' : '#76729A';
    }

    function songsTypeSize(d) {
        var s;
        if (d.type === 'g') {
            s = d.companies.length/root.max_companies;
        } else {
            s = d.financial_orgs.length/root.max_financial_orgs;
        }
        return s;
    }

    function playsTypeSize(d) {
        var s;
        if (d.type === 'g') {
            s = d.plays / root.maxGenrePlays;
        } else {
            s = d.plays / root.maxArtistPlays;
        }
        return s;
    }
    typeSize = songsTypeSize;

    function radius(d) {
        var r = typeSize(d);
        if (d.type === 'g') {
            r = Math.max(r * 40, 4);
        } else {
            r = Math.max(r * 25, 2);
        }
        return r;
    }

    function charge(d, i) {
        var r = typeSize(d);
        return -r * 1000;
    }

    function isConnected(a, b) {
        return linkIndexes[a.index + ',' + b.index] || a.index == b.index;
    }

    function fade(bo) {
        return function(d) {
            var opacity = bo ? 0.2 : 1;
            var rad = radius(d);

            node.style('stroke-opacity', function(o) {
                thisOpac = isConnected(d, o) ? 1 : opacity;
                this.setAttribute('fill-opacity', thisOpac);
                return thisOpac;
            });

            link.style('stroke-opacity', function(o) {
                return o.source === d || o.target === d ? 1 : opacity;
            });


            labels.select('text.label').remove();
            node.select('title').remove();

            if (bo) {
                labels.filter(function(o) {
                        return isConnected(o, d);
                    })
                    .append('svg:text')
                    .attr('y', '5px')
                    .attr('x', function(o) {return radius(o) + 5 + 'px'})
                    .style('fill', '#1b1b1b')
                    .attr('text-anchor', 'top')
                    .attr('class', 'label')
                    .text(function(o) { return (o !== d) ? o.name.substr(0, 16) : ''; });

                node.filter(function(o) {
                        return o === d;
                    })
                    .append('title')
                    .text(function(o) { return o.name });
            }
        };
    }

    var force = d3.layout.force()
        .on('tick', tick)
        .size([w, h])
        .linkDistance(10)
        .gravity(0.05)
        .charge(charge);

    var vis = d3.select('.graph').append('svg:svg')
        .attr('width', w)
        .attr('height', h);

    function update() {
        force
            .nodes(root.nodes)
            .links(root.links)
            .start();

        link = vis.selectAll('link.link')
            .data(root.links);

        link.enter().append('svg:line')
            .attr('class', 'link')
            .attr('source', function(d) { return d.source; })
            .attr('target', function(d) { return d.target; });

        link.exit().remove();

        node = vis.selectAll('circle.node')
            .data(root.nodes);

        node.enter().append('svg:circle')
            .attr('class', 'node')
            .attr('id', function(d) {
                    return d.type + d.id;
                })
            .style('fill', color)
            .attr('r', radius)
            .on('mouseover', fade(true))
            .on('mouseout', fade(false))
            .call(force.drag);

        node.exit().remove();

        linkIndexes = {};
        root.links.forEach(function(d) {
            linkIndexes[d.source.index + ',' + d.target.index] = 1;
            linkIndexes[d.target.index + ',' + d.source.index] = 1;
        });

        labels = vis.selectAll('g.labelParent')
            .data(root.nodes);

        labels.enter().append('svg:g')
            .attr('class', 'labelParent');

        labels.exit().remove();
        node.each(fade(false));
    }

    d3.json('/app/company_data.json', function(json) {
        root = json;
        update();
    });

    $(window).on('resize', function() {
      w = $(window).width()
      h = $(window).height()
      vis.attr("width", w).attr("height", h);
    })


    $('form').submit(function(e) {
      e.preventDefault();
      searchNode($(this).find('.search').val().toLowerCase());
    })

    function searchNode(selectedVal) {
        var node_names = []
        var selected = vis.selectAll(".node").filter(function(d, i) {
          var match = ~d.name.toLowerCase().indexOf(selectedVal);
          if (match) node_names.push(d.name);
          return !match;
        });
        labels.filter(function(o) {

                return ~node_names.indexOf(o.name);
            }).append('svg:text')
            .attr('y', '5px')
            .attr('x', function(o) {return radius(o) + 5 + 'px'})
            .style('fill', '#1b1b1b')
            .attr('text-anchor', 'top')
            .attr('class', 'label')
            .text(function(o) { return o.name.substr(0, 16) });
        selected.transition().duration(300).style("opacity", 0);
        d3.selectAll(".node").transition()
            .delay(1000)
            .duration(300)
            .style('opacity', 1);
        setTimeout(function() {
          labels.select('text.label').remove()
        }, 1000)

}
});
