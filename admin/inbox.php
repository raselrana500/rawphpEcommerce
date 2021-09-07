<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php
	$filePath=realpath(dirname(__FILE__));
	include_once ($filePath."/../classes/cart.php");
	$ct=new Cart();
	$fm=new Format();
?>
<?PHP
	if (isset($_GET['cmrId'])) {
		$cmrId    =$_GET['cmrId'];
		$price=$_GET['price'];
		$date    =$_GET['date'];
		$shift=$ct->productShifted($cmrId,$price,$date);
	}
	if (isset($_GET['delProId'])) {
		$cmrId    =$_GET['delProId'];
		$price=$_GET['price'];
		$date    =$_GET['date'];
		$delOrder=$ct->delProductShifted($cmrId,$price,$date);
	}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <?php
                	if (isset($shift)) {
                		echo $shift;
                	}

                	if (isset($delOrder)) {
                		echo $delOrder;
                	}
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Cmr id</th>
							<th>Order Time</th>
							<th>product id</th>
							<th>Product Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Address</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
					<?php
						$getOrder=$ct->getAllOrderProduct();
						if ($getOrder) {
							while ($result=$getOrder->fetch_assoc()) {
					?>
						<tr class="odd gradeX">
							<td><?php echo $result['cmrId'];?></td>
							<td><?php echo $fm->formatDate($result['date']);?></td>
							<td><?php echo $result['productId'];?></td>
							<td><?php echo $result['productName'];?></td>
							<td><?php echo $result['quantity'];?></td>
							<td>$<?php echo $result['price'];?></td>
							<td><a href="customer.php?custId=<?php echo $result['cmrId'];?>">View Details</a></td>
							
							<?php
								if ($result['status'] == '0') { ?>
								<td><a href="?cmrId=<?php echo $result['cmrId'];?>&price=<?php echo $result['price'];?>&date=<?php echo $result['date'];?>">Shifted</a></td>
								<?php }elseif ($result['status'] == '1') { ?>
									<td>Pending</td>
								<?php }else{ ?>
								<td><a href="?delProId=<?php echo $result['cmrId'];?>&price=<?php echo $result['price'];?>&date=<?php echo $result['date'];?>">Remove</a></td>
							<?php } ?>
							
						</tr>
					<?php } } ?>
					</tbody>
				</table>
               </div>
            </div>
        </div>
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        $('.datatable').dataTable();
        setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
