<?php include "inc/header.php";?>
<?php
    $login=Session::get("cuslogin");
    if ($login == false) {
        header("Location:login.php");
    }
?>
<?PHP
    if (isset($_GET['cmrId'])) {
        $cmrId    =$_GET['cmrId'];
        $price=$_GET['price'];
        $date    =$_GET['date'];
        $conf=$ct->productShiftedcon($cmrId,$price,$date);
    }
    if (isset($_GET['delProId'])) {
        $cmrId    =$_GET['delProId'];
        $price=$_GET['price'];
        $date    =$_GET['date'];
        $delOrder=$ct->delProductShifted($cmrId,$price,$date);
    }
?>
<style>
</style>
 <div class="main">
    <div class="content">  	
    	<div class="section group">
    		<div class="order">
    			<h2>Your Order Details</h2>
                <table class="tblone">
                            <tr>
                                <th>No</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <?php
                                $cmrId=Session::get("cmrId");
                                $getOrder=$ct->getOrderedProduct($cmrId);
                                if ($getOrder) {
                                    $i=0;
                                    $sum=0;
                                    $qty=0;
                                    while ($result=$getOrder->fetch_assoc()) {
                                        $i++;
                            ?>
                            <tr>
                                <td><?php echo $i;?></td>
                                <td><?php echo $result['productName'];?></td>
                                <td><img src="admin/<?php echo $result['image'];?>" alt=""/></td>
                                <td>$ <?php echo $result['price'];?></td>
                                <td><?php echo $result['quantity'];?></td>
                                <td>$ <?php
                                         echo $result['price'];
                                        ?>    
                                </td>
                                <td><?php echo $fm->formatDate($result['date']);?></td>
                                <td>
                                    <?php 
                                        if ($result['status']==0) {
                                            echo "Pending";
                                        }elseif ($result['status']=='1') {
                                        echo "Shifted";
                                       }else{
                                            echo "Received";
                                        }

                                    ?>  
                                </td>
                                <td>
                                <?php
                                    if ($result['status']==1) { ?>
                                       <a href="?cmrId=<?php echo $result['cmrId'];?>&price=<?php echo $result['price'];?>&date=<?php echo $result['date'];?>">Confirm</a>
                                <?php }elseif($result['status']==2){?>
                                    Ok
                                  <?php }elseif($result['status']==0){?>
                                    Wait For Shift
                                  <?php } ?>
                                

                                </td>
                            </tr>
                        <?php } } ?>    
                        </table>
    		</div>
    	</div>
       <div class="clear"></div>
    </div>
 </div>
<?php include "inc/footer.php";?>