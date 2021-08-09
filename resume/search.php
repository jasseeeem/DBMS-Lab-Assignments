<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <title>Search Resume</title>
</head>
<body>
    <div class="container-sm mt-3">
        <h2 class="text-center">Search for a resume</h2>
        <form class="ms-auto me-auto w-50 text-center form-inline mb-4" action="search.php" method="post">
            <div class="input-group">
                <label class="me-3 pt-1">Roll Number</label>
                <input class="form-control" maxlength="10" type="text" name="roll_no" required></input>
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit" name="submit">Search</button>
                </div>
            </div>
        </form>
        <?php
            if(isset($_POST["submit"])) {
                error_reporting(E_ALL ^ E_WARNING);
                $roll_no = $_POST["roll_no"]; 
                $conn = mysqli_connect('localhost', 'jaseem', 'test1234', 'resumes');
                if(! $conn) {
                    echo "Connection error: " . mysqli_connect_error();
                }
                $sql = "SELECT * FROM resumes WHERE roll_no = '" . $roll_no .  "';";
                $result = mysqli_query($conn, $sql);
                $row = mysqli_fetch_assoc($result);
                if($row) {
                    $col_to_actual = [
                        "roll_no" => "Roll Number",
                        "name" => "Name",
                        "date" => "Date of Birth",
                        "address" => "Address",
                        "mobile" => "Mobile",
                        "email" => "Email",
                        "sgpa1" => "SGPA (Sem 1)",
                        "sgpa2" => "SGPA (Sem 2)",
                        "sgpa3" => "SGPA (Sem 3)",
                        "sgpa4" => "SGPA (Sem 4)",
                        "sgpa5" => "SGPA (Sem 5)",
                        "sgpa6" => "SGPA (Sem 6)",
                        "sgpa7" => "SGPA (Sem 7)",
                        "sgpa8" => "SGPA (Sem 8)",
                        "cgpa" => "CGPA",
                        "hobbies" => "Hobbies",
                        "stay" => "Accommodation",
                        "reference" => "References",
                    ];
                    echo "<table class='ms-auto me-auto table table-striped table-bordered w-50'>";
                    echo "<tbody>";
                        foreach($row as $column => $value) {
                            // if($column == "sgpa1") {
                            //     echo "<tr><td class='text-center'>SGPA</td><td></td>";
                            // }
                            if($value) echo "<tr><td class='text-center'>" . $col_to_actual[$column] . "</td><td class='text-center'>" . $value . "</td></tr>";
                        }
                    echo "</tbody>";
                    echo "</table";
                }
                else {
                    echo "<h6 class='w-50 ms-auto me-auto text-center text-danger'>No resume found for this Roll Number</h6>";
                }
            }
        ?>
    </div>
    </body>
</html>