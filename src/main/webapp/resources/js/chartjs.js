$(function() {
  var ctx, data, myLineChart, options;
  Chart.defaults.global.responsive = true;
  ctx = $('#line-chart').get(0).getContext('2d');
  options = {
    scaleShowGridLines: true,
    scaleGridLineColor: "rgba(0,0,0,.05)",
    scaleGridLineWidth: 1,
    scaleShowHorizontalLines: true,
    scaleShowVerticalLines: true,
    bezierCurve: false,
    bezierCurveTension: 0.4,
    pointDot: true,
    pointDotRadius: 4,
    pointDotStrokeWidth: 1,
    pointHitDetectionRadius: 20,
    datasetStroke: true,
    datasetStrokeWidth: 2,
    datasetFill: true,
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].strokeColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  };
  data = {
    labels: ['1', '2', '3', '4', '5', '6', '7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'],
    datasets: [
      {
        label: "My First dataset",
        fillColor: "rgba(26, 188, 156,0.2)",
        strokeColor: "#1ABC9C",
        pointColor: "#1ABC9C",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "#1ABC9C",
        data: [65, 59, 80, 81, 56, 55, 40,49,90,40,98,20,30,20,19,29,39,49,50,10,20,30,48,58,29,38,49,28,38,48,29]
       },
    ]
  };
  myLineChart = new Chart(ctx).Line(data, options);
});
