<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <title>Add Resume</title>
</head>
<body>
<div class="container-sm mt-3">
    <h2 class="text-center">Add a resume</h2>    
    <form class="mt-3 ms-5 me-5" action="add.php" method="post">
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Roll Number</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" placeholder="Roll Number" name="roll_no" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Full Name</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" placeholder="Full Name" name="name" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Date of Birth</label>
            <div class="col-sm-9">
                <input type="date" class="form-control" max='2005-10-29' name="date" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Home Address</label>
            <div class="col-sm-9">
                <textarea rows="2" class="form-control" placeholder="Address" name="address" required></textarea>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Mobile Number</label>
            <div class="col-sm-9">
                <input type="number" class="form-control" placeholder="Mobile Number" name="mobile" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Email</label>
            <div class="col-sm-9">
                <input type="email" class="form-control" placeholder="Email" name="email" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label pt-4">SGPA</label>
            <div class="col-sm-9 form-row d-flex">
                <div class="form-group mt-2 pe-4">
                    <label>Sem 1</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem1" required>
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 2</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem2">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 3</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem3">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 4</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem4">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 5</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem5">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 6</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem6">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 7</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem7">
                </div>
                <div class="form-group mt-2 pe-4">
                    <label>Sem 8</label>
                    <input type="number" min="0" max="10" step="0.01" class="form-control" name="sem8">
                </div>
            </div>
        </div>
        <div class="form-group row mt-3">
            <label class="col-md-3 col-form-label">CGPA</label>
            <div class="col-sm-9">
                <input type="number" min="0" max="10" step="0.01" class="form-control" placeholder="CGPA" name="cgpa" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Hobbies</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" placeholder="Hobbies" name="hobbies" required>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">Accommodation Type</label>
            <div class="row col-sm-9 ps-4">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="stay" value="Hostel" required>
                    <label class="form-check-label" for="gridRadios1">Hostel</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="stay" value="Day Scholar">
                    <label class="form-check-label" for="gridRadios2">Day Scholar</label>
                </div>
            </div>
        </div>
        <div class="form-group row mt-2">
            <label class="col-md-3 col-form-label">References</label>
            <div class="col-sm-9">
                <textarea type="text" class="form-control" placeholder="References" name="reference" required></textarea>
            </div>
        </div>
        <div class="ms-auto me-auto text-center mt-3">
            <button class="btn btn-primary" type="submit" name="submit">Add Resume</button>
        </div>
    </form>
    <?php
        if(isset($_POST["submit"])) {
            error_reporting(E_ALL ^ E_WARNING); 
            $name = $_POST["name"];
            $roll_no = $_POST["roll_no"];
            $mobile = $_POST["mobile"];
            $date = $_POST["date"];
            $address = $_POST["address"];
            $email = $_POST["email"];
            $semester = $_POST["semester"];
            $sem1 = $_POST["sem1"];
            $sem2 = $_POST["sem2"];
            $sem3 = $_POST["sem3"];
            $sem4 = $_POST["sem4"];
            $sem5 = $_POST["sem5"];
            $sem6 = $_POST["sem6"];
            $sem7 = $_POST["sem7"];
            $sem8 = $_POST["sem8"];
            $cgpa = $_POST["cgpa"];
            $stay = $_POST["stay"];
            $hobbies = $_POST["hobbies"];
            $reference = $_POST["reference"];

            if(!$sem2) $sem2 = 0;
            if(!$sem3) $sem3 = 0;
            if(!$sem4) $sem4 = 0;
            if(!$sem5) $sem5 = 0;
            if(!$sem6) $sem6 = 0;
            if(!$sem7) $sem7 = 0;
            if(!$sem8) $sem8 = 0;

            $conn = mysqli_connect('localhost', 'jaseem', 'test1234', 'resumes');
            if(! $conn) {
                echo "Connection error: " . mysqli_connect_error();
            }
            $sql = "DELETE FROM resumes WHERE roll_no = '" . $roll_no . "';";
            if(mysqli_query($conn, $sql)) {
                $sql = "INSERT INTO resumes VALUES ('" . $roll_no . "', '" . $name . "', '" . $date . "', '" . $address . "', '" . $mobile . "', '" . $email . "', " . $sem1 . ", " . $sem2 . ", " . $sem3 . ", " . $sem4 . ", " . $sem5 . ", " . $sem6 . ", " . $sem7 . ", " . $sem8 . ", " . $cgpa . ", '" . $hobbies . "', '" . $stay . "', '" . $reference . "');";
                if(mysqli_query($conn, $sql)) {
                    echo "<h6 class='w-50 ms-auto me-auto text-center text-success mt-3'>Resume added successfully</h6>";
                }
                else {
                    echo mysqli_error($conn);
                    echo "<h6 class='w-50 ms-auto me-auto text-center text-danger mt-3'>Resume could not be added</h6>";
                }            
            }
            else {
                echo mysqli_error($conn);
                echo "<h6 class='w-50 ms-auto me-auto text-center text-danger mt-3'>Previous resume could not be deleted</h6>";
            }
        }
    ?>
</body>
</html>