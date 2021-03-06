    <!-- Javascript -->
<script src="{$path}/public/assets/vendor/jquery/jquery.min.js"></script>
<script src="{$path}/public/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="{$path}/public/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="{$path}/public/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="{$path}/public/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="{$path}/public/assets/scripts/klorofil-common.js"></script>
<script src="{$path}public/js_search/jquery.autocomplete.min.js"></script>
   

<script>
    $(function() {
        var data, options;

        // headline charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [23, 29, 24, 40, 25, 24, 35],
                [14, 25, 18, 34, 29, 38, 44],
            ]
        };

        options = {
            height: 300,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
                showGrid: false
            },
            lineSmooth: false,
        };

        new Chartist.Line('#headline-chart', data, options);


        // visits trend charts
        data = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [
                {
                    name: 'series-real',
                    data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
                },
                {
                    name: 'series-projection',
                    data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
                }
            ]
        };

        options = {
            fullWidth: true,
            lineSmooth: false,
            height: "270px",
            low: 0,
            high: 'auto',
            series: {
                'series-projection': {
                    showArea: true,
                    showPoint: false,
                    showLine: false
                },
            },
            axisX: {
                showGrid: false,

            },
            axisY: {
                showGrid: false,
                onlyInteger: true,
                offset: 0,
            },
            chartPadding: {
                left: 20,
                right: 20
            }
        };

        new Chartist.Line('#visits-trends-chart', data, options);


        // visits chart
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [[6384, 6342, 5437, 2764, 3958, 5068, 7654]]
        };

        options = {
            height: 300,
            axisX: {
                showGrid: false
            },
        };

        new Chartist.Bar('#visits-chart', data, options);


        // real-time pie chart
        var sysLoad = $('#system-load').easyPieChart({
            size: 130,
            barColor: function(percent) {
                return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
            },
            trackColor: 'rgba(245, 245, 245, 0.8)',
            scaleColor: false,
            lineWidth: 5,
            lineCap: "square",
            animate: 800
        });

        var updateInterval = 3000; // in milliseconds

        setInterval( function() {
            var randomVal;
            randomVal = getRandomInt(0, 100);

            sysLoad.data('easyPieChart').update(randomVal);
            sysLoad.find('.percent').text(randomVal);
        }, updateInterval);

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

    });
</script>
    <script type="text/javascript">
    	$(document).ready(function(){

    		$("#ten_san_pham").blur(function(){

    			var ten_san_pham=$("#ten_san_pham").val();
    			if(ten_san_pham!="")
    			{
    				$("#ten_san_pham_url").val(bodau(ten_san_pham));
    			}
    		});
    	
    	function bodau(str){
            	str= str.toLowerCase();
            	str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
            	str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
            	str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
            	str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
            	str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
            	str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
            	str= str.replace(/đ/g,"d");
            	str= str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~/g,"-");
            	str= str.replace(/-+-/g,"-");
            	str= str.replace(/^\-+|\-+$/g,"");
            	return str;
            	}
        });

       
       function timeRefresh(timeoutPeriod) 
        {
        setTimeout(function(){

            $.ajax({

                url: "{$path}don-dat-hang/so-don-dat-hang.html", 
                dataType: "text",
                type: "GET",
                success: function(result)
                {
                    //alert("Ve client");
                    $("#sodhMoi").html(result);
                    timeRefresh(timeoutPeriod);
                }

                }); 

        },timeoutPeriod);
    }
   
    </script>

      <script type="text/javascript">
        $(document).ready(function(){

            $("#tieu_de").blur(function(){

                var tieu_de=$("#tieu_de").val();
                if(tieu_de!="")
                {
                    $("#tieu_de_url").val(bodau(tieu_de));
                }
            });
        
        function bodau(str){
                str= str.toLowerCase();
                str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
                str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
                str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
                str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
                str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
                str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
                str= str.replace(/đ/g,"d");
                str= str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~/g,"-");
                str= str.replace(/-+-/g,"-");
                str= str.replace(/^\-+|\-+$/g,"");
                return str;
                }
        });

        </script>
    
    
