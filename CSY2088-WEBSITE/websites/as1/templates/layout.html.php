<!doctype html>
<html>

<head>
    <title>
        <?= $title ?>
    </title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/electronics.css" />
</head>

<body>
    <header>
        <h1>Ed's Electronics</h1>


        <ul>
            <li><a href="/">Home</a></li>
            <li>Products
                <ul>
                    <?php foreach ($categorylinks as $link): ?>
                        <li><a href="/customer/products?categoryname=<?php echo $link['categoryname'] ?>">
                                <?php echo $link['categoryname'] ?>
                            </a></li>
                    <?php endforeach ?>
                </ul>
            </li>
            <li><a href='/customer/myquestions'>My Questions</a>
            </li>

        </ul>

        <address>
            <p>We are open 9-5, 7 days a week. Call us on
                <strong>01604 11111</strong>
            </p>
        </address>

    </header>
    <section></section>
    <main>
        <?= $output ?>
    </main>
    <aside>

    </aside>


    <footer>
        &copy; Ed's Electronics 2023
    </footer>
</body>