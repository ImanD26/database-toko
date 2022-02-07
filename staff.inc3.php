<?php
    include 'header.php';
    include 'dbh.inc.php';
?>

<div class="staff-result-1">
<h1>Expected Profit</h1>
<?php
$sql="CALL total_expected_profit_from_item";
    if($result=mysqli_query($conn, $sql)){
        while($row=mysqli_fetch_assoc($result)){
            echo "<div class ='item-box-3'>
                <table border='0' width='350px' cellspacing='0'>
                    <thead>
                    <tr bgcolor= 'lightgray'>
                        <th>item name</th>
                        <th>expected profit</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>".$row['itemname']."</td>
                        <td>".$row['expected_profit']."</td>
                    </tr>
                </tbody>";
        }
    } else{
        echo "There are no procedure";
    }
?>