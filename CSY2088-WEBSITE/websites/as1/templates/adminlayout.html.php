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
            <li><a href="/admin/home">Home</a></li>
            <li>Add
                <ul>
                    <li><a href="/admin/addproduct">Add Product</a></li>
                    <li><a href="/admin/addcategories">Add Category</a></li>
                    <li><a href="/admin/adduser">Add User</a></li>
                </ul>
            </li>
            <li>Questions
                <ul>
                    <li><a href="/admin/userquestions">Unanswered Questions</a></li>
                    <li><a href="/admin/alluserquestions">All Questions</a></li>
                    <li><a href="/admin/moderatequestions">Unmoderated Questions</a></li>
                </ul>
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