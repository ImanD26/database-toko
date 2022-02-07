<?php
    include 'header.php';
    include 'dbh.inc.php';
?>

<div class="staff-result">
<h1>Total order price</h1>
<?php
$sql="CALL show_order_price";
    if($result=mysqli_query($conn, $sql)){
        while($row=mysqli_fetch_assoc($result)){
            echo "<div class ='item-box-1'>
                <table border='0' width='350px' cellspacing='0'>
                    <thead>
                    <tr bgcolor= 'lightgray'>
                        <th>customer name</th>
                        <th>purchase id</th>
                        <th>purchase date</th>
                        <th>total order</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>".$row['customername']."</td>
                        <td>".$row['purchaseid']."</td>
                        <td>".$row['purchasedate']."</td>
                        <td>".$row['totalorder']."</td>
                    </tr>
                </tbody>";
        }
    } 
?>