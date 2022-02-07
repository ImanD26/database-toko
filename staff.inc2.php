<?php
    include 'header.php';
    include 'dbh.inc.php';
?>

<div class="staff-result-1">
<h1>Unpurchased item</h1>
<?php
$sql="CALL show_unpurchased_item";
    if($result=mysqli_query($conn, $sql)){
        while($row=mysqli_fetch_assoc($result)){
            echo "<div class ='item-box-1'>
                <table border='0' width='350px' cellspacing='0'>
                    <thead>
                    <tr bgcolor= 'lightgray'>
                        <th>customer itemname</th>
                        <th>purchase price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>".$row['itemname']."</td>
                        <td>".$row['price']."</td>
                    </tr>
                </tbody>";
    }
    }else{
        echo "There are no procedure";
    }
?>