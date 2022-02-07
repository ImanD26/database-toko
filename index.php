<?php
    include_once 'header.php';
    include 'dbh.inc.php';
?>

    <section class="index">
        <h1>Shop Anytime, Anywhere, Anyplace!</h1>
            <form action="search.php" method="post">
                <input type="text" name="search" placeholder="What item do you want to buy?">
                <button type="submit" name="submit-search">Search</button>
            </form>
    </section>

<?php
    include_once 'footer.php';
?>