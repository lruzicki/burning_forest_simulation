<html lang='en'>
<head>
  <title>Nyaplot</title>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.14/require.min.js"></script>
  <script>if(window['d3'] === undefined ||
   window['Nyaplot'] === undefined){
    var path = {"d3":"https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min","downloadable":"http://cdn.rawgit.com/domitry/d3-downloadable/master/d3-downloadable"};



    var shim = {"d3":{"exports":"d3"},"downloadable":{"exports":"downloadable"}};

    require.config({paths: path, shim:shim});


require(['d3'], function(d3){window['d3']=d3;console.log('finished loading d3');require(['downloadable'], function(downloadable){window['downloadable']=downloadable;console.log('finished loading downloadable');

	var script = d3.select("head")
	    .append("script")
	    .attr("src", "http://cdn.rawgit.com/domitry/Nyaplotjs/master/release/nyaplot.js")
	    .attr("async", true);

	script[0][0].onload = script[0][0].onreadystatechange = function(){


	    var event = document.createEvent("HTMLEvents");
	    event.initEvent("load_nyaplot",false,false);
	    window.dispatchEvent(event);
	    console.log('Finished loading Nyaplotjs');

	};


});});
}
</script>
</head>
<body><div id='vis-82ace60e-870e-4187-8723-59f87bafbb5a'></div>
<script>
(function(){
    var render = function(){
        var model = {"panes":[{"diagrams":[{"type":"scatter","options":{"x":"data0","y":"data1","color":["rgb(127,201,127)","rgb(190,174,212)","rgb(253,192,134)","rgb(255,255,153)","rgb(56,108,176)","rgb(240,2,127)","rgb(191,91,23)","rgb(102,102,102)"]},"data":"6081c7d6-9c2b-416a-b952-cd65f5a050f1"}],"options":{"x_label":"Forest density in %","y_label":"Burnt forest in %","zoom":true,"width":700,"xrange":[0.1,1.0],"yrange":[0.0,1.6666666666666667]}}],"data":{"6081c7d6-9c2b-416a-b952-cd65f5a050f1":[{"data0":0.1,"data1":0.0},{"data0":0.2,"data1":0.0},{"data0":0.3,"data1":1.6666666666666667},{"data0":0.4,"data1":0.0},{"data0":0.5,"data1":0.0},{"data0":0.6,"data1":1.25},{"data0":0.7,"data1":1.0714285714285714},{"data0":0.8,"data1":1.25},{"data0":0.9,"data1":1.1111111111111112},{"data0":1.0,"data1":1.0}]},"extension":[]}
        var id_name = '#vis-82ace60e-870e-4187-8723-59f87bafbb5a';
        Nyaplot.core.parse(model, id_name);

        require(['downloadable'], function(downloadable){
          var svg = d3.select(id_name).select("svg");
	  if(!svg.empty())
	    svg.call(downloadable().filename('fig'));
	});
    };
    if(window['Nyaplot']==undefined){
        window.addEventListener('load_nyaplot', render, false);
	return;
    } else {
       render();
    }
})();
</script>
</body>
</html>
