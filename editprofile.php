<?php include "inc/header.php";?>
<?php
    $login=Session::get("cuslogin");
    if ($login == false) {
        header("Location:login.php");
    }
?>
<?php
	$cmrId=Session::get("cmrId");
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        $updateCmr  = $cmr->customerUpdate($_POST,$cmrId);
    }
?>

<style>
	.tblone{width: 550px;margin:0 auto;border:2px solid #ddd;}
	.tblone tr td{text-align: justify; }
	.tblone input[type="text"]{width: 400px;font-size: 15px;padding: 5px;}
	.success{color: green;font-size: 18px;}
	.error{color: red;font-size: 18px;}
</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
    	<?php
    		$id=Session::get("cmrId");
    		$getData=$cmr->getCustomerData($id);
    		if ($getData) {
    			while ($result=$getData->fetch_assoc()) {
    	?>
			<form action="" method="POST">
				<table class="tblone">
				<?php
					if (isset($updateCmr)) {
						echo "<tr><td colspan='2'>".$updateCmr."</td></tr>";
					}
				?>
					<tr>
						<td colspan="3" style="color:white;background: #444;"><h2 style="color: #fff;">Update Profile Details</h2></td>
					</tr>
					<tr>
						<td width="20%">Name</td>
						<td><input type="text" name="name" value="<?php echo $result['name'];?>"></td>
					</tr>
					<tr>
						<td>Address</td>
						<td><input type="text" name="address" value="<?php echo $result['address'];?>"></td>
					</tr>
					<tr>
						<td>City</td>
						<td><input type="text" name="city" value="<?php echo $result['city'];?>"></td>
					</tr>
					<tr>
						<td>Country</td>
						<td><input type="text" name="country" value="<?php echo $result['country'];?>"></td>
					</tr>
					<tr>
						<td>Zipcode</td>
						<td><input type="text" name="zip" value="<?php echo $result['zip'];?>"></td>
					</tr>
					<tr>
						<td>Phone</td>
						<td><input type="text" name="phone" value="<?php echo $result['phone'];?>"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" name="submit" value="submit"></td>
					</tr>
				</table>
			</form>
			<?php } } ?>	
 		</div>
 	</div>
</div>
<?php include "inc/footer.php";?>