/**
 * 
 */
function getChart(condition){
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        [condition, 'Sales'],
        ['1월', 1000],
        ['2월', 1170],
        ['3월', 660],
        ['4월', 1030],
        ['5월', 1530],
        ['6월', 1230],
        ['7월', 1330],
        ['8월', 930],
        ['9월', 1750],
        ['10월', 1230],
        ['11월', 1530],
        ['12월', 1130],
      ]);

      var options = {
        chart: {
          title: 'Company Performance',
          subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        }
      };

      var chart = new google.charts.Bar(document.getElementById('salesChart'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
}
$(function(){
	$("#searchYears").click(function(){
		$("#years").fadeToggle("slow");
		$("#years_temp").fadeToggle("slow");
	}),
	$("#searchYear").click(function(){
		$("#year").fadeToggle("slow");
		$("#year_temp").fadeToggle("slow");
	}),
	$("#searchMonth").click(function(){
		$("#month").fadeToggle("slow");
		$("#month_temp").fadeToggle("slow");
	}),
	$("#searchCondition").click(function(){
		$("#condition").fadeToggle("slow");
		$("#condition_temp").fadeToggle("slow");
	})
})