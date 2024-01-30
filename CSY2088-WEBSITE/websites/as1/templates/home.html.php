<form action="" method="post">
<input type="submit" name="logout" value="Logout" />
</form>
<h1>Welcome to Ed's Electronics!</h1>

<p>There are many products that you can find here via the products section above.</p>
<p>Feel free to post any questions to our staff. We are more than happy to help!</p>

<br>

<h2>Our Most Recent Product Additions:</h2>

<ul class='products'>
<?php foreach ($templateVars as $question): ?>
        <li>
            <h2>Product:
                <?php echo $question['name']; ?>
            </h2>
            <strong>Manufacturer:
                <?php echo $question['manufacturer'] ?>
            </strong>
            <br>
            <p>
                <?php echo $question['description'] ?>
            </p>
            <?php $linkForProduct ='/customer/productView?productid=' . $question['productid'] ?>
            <h3><a href="<?php echo $linkForProduct?>">View Details</a></h3>
            <div class='price'>
                <h3>Price:
                    £<?php echo $question['price'] ?>
                </h3>
            </div>

        </li>
    <?php endforeach; ?>
</ul>