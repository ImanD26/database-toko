<?php
    include_once'header.php';
    include 'dbh.inc.php';
?>

<section class="procedure-call">
    <div class="procedure-call-1">
        <h2>Total order price</h2>
        <form action="staff.inc0.php"method="post">
            <button type="submit" name="check_2">Check total order price</button>
        </form>
    </div>
    
    <div class="procedure-call-1">
        <h2>Total payment to supplier</h2>
        <form action="staff.inc.php"method="post">
            <button type="submit" name="check_2">Check total payment</button>
        </form>
    </div>
    
    <div class="procedure-call-1">
        <h2>Unpurchased item</h2>
        <form action="staff.inc2.php"method="post">
            <button type="submit" name="check_2">Check unpurchased item</button>
        </form>
    </div>
    
    <div class="procedure-call-1">
        <h2>Expected profit</h2>
        <form action="staff.inc3.php"method="post">
            <button type="submit" name="check_3">Check profit</button>
        </form>
    </div>
</section>