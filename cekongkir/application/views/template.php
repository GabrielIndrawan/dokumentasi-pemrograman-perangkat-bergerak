<html>
<head>
	<title>cekONGKIR - erfandibagus.com</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<style type="text/css">
		.content {
			margin-top: 45px;
		}
		.title-bar {
			margin-top: 30px;
		}
	</style>
</head>
<body>

	<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a href="../" class="navbar-brand">cekONGKIR</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="<?php echo base_url(); ?>"><i class="fa fa-home"></i> &nbsp;Home</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<?php echo $_content; ?>

	<script>
		function showOrig(str) {
		    if (str == "") {
		        document.getElementById("origincity").innerHTML = "";
		        return;
		    } else { 
		        if (window.XMLHttpRequest) {
		            // IE7+, Firefox, Chrome, Opera, Safari
		            xmlhttp = new XMLHttpRequest();
		        } else {
		            // IE6, IE5
		            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		        }
		        xmlhttp.onreadystatechange = function() {
		            if (this.readyState == 4 && this.status == 200) {
		                document.getElementById("origincity").innerHTML = this.responseText;
		            }
		        };
		        xmlhttp.open("GET","<?php echo base_url('check/city/'); ?>?q="+str,true);
		        xmlhttp.send();
		    }
		}

		function showDest(str) {
		    if (str == "") {
		        document.getElementById("destinationcity").innerHTML = "";
		        return;
		    } else { 
		        if (window.XMLHttpRequest) {
		            // IE7+, Firefox, Chrome, Opera, Safari
		            xmlhttp = new XMLHttpRequest();
		        } else {
		            // IE6, IE5
		            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		        }
		        xmlhttp.onreadystatechange = function() {
		            if (this.readyState == 4 && this.status == 200) {
		                document.getElementById("destinationcity").innerHTML = this.responseText;
		            }
		        };
		        xmlhttp.open("GET","<?php echo base_url('check/city/'); ?>?q="+str,true);
		        xmlhttp.send();
		    }
		}
	</script>
</body>
</html>