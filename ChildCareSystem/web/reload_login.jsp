<%-- 
    Document   : reload_login.jsp
    Created on : May 22, 2021, 5:33:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            $(window).on('load', function () {
                $('#exampleModal').modal('show');
            });
        </script>
        <title>Login Page</title>
        
    </head>
    <body>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">REGISTER FORM</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="DispatchServlet" method="POST">
                            <div class="form-group">
                                <label for="fullNanme">Full Name</label>
                                <input type="text" class="form-control" id="fullName" placeholder="Full Name" name="fullName" required="true">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder="Email" required="true">
                                ${ERROR.emailDupError}
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address">
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber">Phone Number</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNum" placeholder="Phone Number" required="true">
                                ${SIGNUP_ERROR.phoneNumberError}
                                ${ERROR1.phoneNumDupError}
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" name="password" placeholder="Password" required="true">
                                ${SIGNUP_ERROR.passwordError}
                                ${ERROR.passwordError}
                                <small id="passwordHelp" class="form-text text-muted">Password must contain at least 1 uppercase, lowercase, number and must be 6 characters</small>
                            </div>
                            <div class="form-group">
                                <label for="cpassword">Confirm password</label>
                                <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm password" required="true">
                            </div>
                            <div class="form-group">
                                <label for="birthday">DOB</label>
                                <input type="date" class="form-control" name="birthday" id="birthday">
                            </div>
                            <div class="form-group">
                                <label for="citizenID">CitizenID</label>
                                <input type="text" class="form-control" id="citizenID" name="citizenID" aria-describedby="citizenIDHelp" placeholder="CitizenID" required="true">
                                ${SIGNUP_ERROR.citizenIDError}
                                ${ERROR.citizenIDDupError}
                                <small id="citizenIDHelp" class="form-text text-muted">Must be 12 numbers</small>
                            </div>
                            <input type="hidden" name="roleID" value="3">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                                <button type="submit" class="btn btn-primary" name="btAction" value="Register">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="center">
            <h1>Login</h1>
            <form action="DispatchServlet" method="POST">
                <div class="txt_field">
                    <input type="text" name="phoneNum" required="true">
                    <span></span>
                    <label>Phone Number</label>
                </div>
                <div class ="txt_field">
                    <input type="password" name="password" required="true">
                    <span></span>
                    <label>Password</label>
                </div>
                <button type="submit" class="btn btn-primary" name="btAction" value="Login">Login</button></br>
            </form>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Register 
            </button>





    </body>
</html>
