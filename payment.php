<?php include "inc/header.php";?>
<?php
    $login=Session::get("cuslogin");
    if ($login == false) {
        header("Location:login.php");
    }
?>
<style>
.payment{width: 500px;min-height: 200px;text-align: center;border:1px solid #ddd;margin:0 auto;padding: 50px;}
.payment h2{border-bottom: 1px solid #ddd;margin-bottom: 40px;padding-bottom: 10px;}
.payment a{background: #ff0000;border-radius: 3px;color: #fff;font-size: 25px;padding: 5px 30px;}
.back{width: 160px;margin: 0 auto;padding:4px;display: block;background: #555;border:1px solid #333;color:#fff;border-radius: 3px;margin-top:10px;margin-bottom: 10px;text-align: center;color: #fff;font-size: 25px;}
.back:hover{background: #ff0000;}
.back a{color: #fff;}
.back a:hover{color: #fff;}
</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
    		<div class="payment">
    			<h2>Choose Payment Option</h2>
    			<a href="paymentoffline.php">Offline Payment</a>
    			<a href="paymentonline.php">Online Payment</a>
    		</div>
    		<div class="back">
    			<a href="cart.php">Previous</a>
    		</div>
 		</div>
 	</div>
</div>
<?php include "inc/footer.php";?>