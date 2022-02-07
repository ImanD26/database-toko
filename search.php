<?php
    include 'header.php';
    include 'dbh.inc.php';
?>

<div class="search-container">
    <h1>Search Result</h1>
<?php
    if(isset($_POST['submit-search'])){
        $search = mysqli_real_escape_string($conn, $_POST['search']);
        $sql = "SELECT * FROM item WHERE itemname LIKE '%$search%' OR price LIKE '%search%'";
        $result = mysqli_query($conn, $sql);
        $queryResult = mysqli_num_rows($result);
        
        if ($queryResult > 0){
            while ($row = mysqli_fetch_assoc($result)){
                echo "<div class ='item-box'>
                <table border='0' width='200px' cellspacing='0'>
                <thead>
                    <tr bgcolor= 'lightgray'>
                        <th>item name</th>
                        <th>price</th>
                    </tr>
                </thead>
                </div>
                    <tbody>
                    <tr>
                        <td>".$row['itemname']."</td>
                        <td>".$row['price']."</td>
                    </tr>
                </tbody>";
            }
        } else{
            echo "There are no item matching your search!";
        }
    }
?>
</div>