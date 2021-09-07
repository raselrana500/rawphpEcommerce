<?php include "inc/header.php";?>
<?php
    $login=Session::get("cuslogin");
    if ($login == false) {
        header("Location:login.php");
    }
?>
<style>
	.success{font-size: 18px;color: green;}
	.error{font-size: 18px;color: red;}
	table.tblone img {height: 100px; width: 120px;}
</style>
<?php
	if (isset($_GET['proid'])) {
		$proid    =$_GET['proid'];
		$cmrId=$_GET['cmrId'];
		$delCompProduct=$pd->delCompareProduct($proid,$cmrId);
	}
?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
			<div class="cartpage">
			    	<h2>Compare</h2>
			    	<?php
			    		if (isset($updateCart)) {
			    			echo $updateCart;
			    		}
			    		if (isset($delProduct)) {
			    			echo $delProduct;
			    		}
			    	?>
						<table class="tblone">
							<tr>
								<th>SL</th>
								<th>Product Name</th>
								<th>Price</th>
								<th>Image</th>
								<th>Action</th>
							</tr>
							<?php
								$cmrId=Session::get("cmrId");
								$getPd=$pd->getCompareData($cmrId);
								if ($getPd) {
									$i=0;
									while ($result=$getPd->fetch_assoc()) {
										$i++;
							?>
							<tr>
								<td><?php echo $i;?></td>
								<td><?php echo $result['productName'];?></td>
								<td>$ <?php echo $result['price'];?></td>
								<td><img src="admin/<?php echo $result['image'];?>" alt=""/></td>
								<td><a href="details.php?proid=<?php echo $result['productId'];?>">View</a> || 
								<a href="?proid=<?php echo $result['productId'];?>&cmrId=<?php echo $cmrId;?>">Remove</a></td>

							</tr>
						<?php } } ?>	
						</table>
					</div>
					<div class="shopping">
						<div class="shopleft" style="width:100%;text-align:center;">
							<a href="index.php"> <img src="images/shop.png" alt="" /></a>
						</div>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
<?php include "inc/footer.php";?>

