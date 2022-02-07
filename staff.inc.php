<?php
    include 'header.php';
    include 'dbh.inc.php';
?>

<div class="staff-result">
<h1>Total payment to supplier</h1>
<?php
$sql="CALL show_total_payment_to_supplier";
    if($result=mysqli_query($conn, $sql)){
        while($row=mysqli_fetch_assoc($result)){
            echo "<div class ='item-box-2'>
                <table border='0' width='350px' cellspacing='0'>
                    <thead>
                    <tr bgcolor= 'lightgray'>
                        <th>supplier name</th>
                        <th>cost</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>".$row['suppliername']."</td>
                        <td>".$row['cost']."</td>
                    </tr>
                </tbody>";
        }
    } else{
        echo "There are no procedure";
    }
?>