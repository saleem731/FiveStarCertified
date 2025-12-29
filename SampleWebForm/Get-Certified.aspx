<%@ Page Language="C#" %>

<%@ Import Namespace="System.Activities.Expressions" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<script runat="server">    
    protected void btnSubmit_Click1(Object sender, EventArgs e)
    {
        try
        {
            if (txtimgcode.Text == this.Session["CaptchaImageText"].ToString())
            {
                StringBuilder stringBuilder = new StringBuilder("<table border='1' cellspacing='2' cellpadding='2'><tr><td>First Name</td><td >%FName%</td></tr><tr><td>Last Name</td><td>%LName%</td></tr><tr><td>Email</td><td>%Email%</td></tr><tr><td>Phone</td><td>%phone%</td></tr><tr><td>City</td><td>%City%</td></tr><tr><td>Intrested In</td><td>%Intr%</td></tr><tr><td>Message</td><td>%Msg%</td></tr></table>");
                stringBuilder.Replace("%FName%", txtFname.Text);
                stringBuilder.Replace("%LName%", txtLname.Text);
                stringBuilder.Replace("%Email%", txtEmail.Text);
                stringBuilder.Replace("%phone%", txtNumber.Text);
                stringBuilder.Replace("%City%", txtCity.Text);
                stringBuilder.Replace("%Intr%", ddlIntrest.SelectedItem.Text);
                stringBuilder.Replace("%Msg%", txtMultiview.Text);
                MailMessage mail = new MailMessage();
                mail.Body = stringBuilder.ToString();
                mail.IsBodyHtml = true;
                mail.To.Add("cs@fivestarcertified.com");
                mail.To.Add("tpc81@yahoo.com");
                //mail.To.Add("tpc81@yahoo.com");
                /*You Need to set Following properties in below code 
                 * From Email
                 * Subject
                 * Mail Server (i.e mail.white.mysitehosted.com)
                 * Network Credential 
                */
                mail.From = new MailAddress("cs@fivestarcertified.com");
                mail.Subject = "Get Certified";
                SmtpClient smtp = new SmtpClient("mail.white.mysitehosted.com");
                System.Net.NetworkCredential Credentials = new NetworkCredential("cs@fivestarcertified.com", "adam0118");
                smtp.EnableSsl = false;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = Credentials;
                smtp.Send(mail);
                /*End Email Properties*/
                //lblStatus.Text = "Your data has been submitted successfully";
                txtFname.Text = "";
                txtLname.Text = "";
                txtEmail.Text = "";
                txtNumber.Text = "";
                txtCity.Text = "";
                txtimgcode.Text = "";
                txtMultiview.Text = "";
                lblError.Text = "";
                ddlIntrest.SelectedIndex = 0;
                Response.Redirect("https://fivestarcertified.com/ThankYou.html");
            }
            else
            {
                lblStatus.Text = "";
                lblError.Text = "Invalid Captcha Code";
            }
        }
        catch (System.Net.Mail.SmtpException smtpEx)
        {
            // Log detailed error to file
            using (System.IO.StreamWriter writer = new System.IO.StreamWriter(AppDomain.CurrentDomain.BaseDirectory + @"\error.txt", true))
            {
                writer.WriteLine("SMTP Error - Message :" + smtpEx.Message + "<br/>" + Environment.NewLine + "StackTrace :" +
                                 smtpEx.StackTrace +
                                 "" + Environment.NewLine + "Date :" + DateTime.Now.ToString());
                writer.WriteLine(Environment.NewLine +
                                 "-----------------------------------------------------------------------------" +
                                 Environment.NewLine);
            }
            // Display user-friendly error message
            lblStatus.Text = "";
            lblError.Text = "Unable to send email. Please try again later or contact support if the problem persists.";
        }
        catch (Exception ex)
        {
            // Log detailed error to file
            using (System.IO.StreamWriter writer = new System.IO.StreamWriter(AppDomain.CurrentDomain.BaseDirectory + @"\error.txt", true))
            {
                writer.WriteLine("Message :" + ex.Message + "<br/>" + Environment.NewLine + "StackTrace :" +
                                 ex.StackTrace +
                                 "" + Environment.NewLine + "Date :" + DateTime.Now.ToString());
                writer.WriteLine(Environment.NewLine +
                                 "-----------------------------------------------------------------------------" +
                                 Environment.NewLine);
            }
            // Display user-friendly error message
            lblStatus.Text = "";
            lblError.Text = "An error occurred while processing your request. Please try again later or contact support if the problem persists.";
        }
    }
</script>
<html class="">
<%--smtp.Send(mail)--%>
<!-- LAST MODIFIED 2015-08-01 12:04P BY:RES -->
<!--<html lang="en" class="no-js CorporateSite">-->
<!--[if IE 8]>
<html class="no-js lt-ie9 CorporateSite">
    <![endif]-->
<!--[if gt IE 8]>
    <!-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- START-ADDED 2015-08-01 10:46A BY:RES -->
<style type="text/css">
    .txtfont {
        text-transform: none !important;
    }

    .tblfrm {
        padding: 0px !important;
        margin: 0px !important;
    }

    span.valerror[style*="inline"] {
        display: block !important;
        background-color: Yellow;
        border: 1px solid #cccccc;
        font-size: .9em;
    }

    .imagefloat {
        float: right;
        height: 100px;
        width: 100px;
    }

    .imagefloat2 {
        float: right;
        height: 180px;
        width: 350px;
        margin: 1px auto;
        padding: 1px;
    }
    /*axcelleria CSS form pack*/
    .margin-a {
        margin-right: auto;
        margin-left: auto;
    }

    .float-r {
        float: right;
    }

    .float-l {
        float: left;
    }

    .clear {
        display: block;
        width: 100%;
        clear: both;
    }

    a.site-logo {
        top: -5px;
        margin-bottom: 0;
        height: 218px;
    }

    .clear-a:after {
        content: "";
        display: block;
        clear: both;
    }

    .input-text, .input-field {
        display: inline-block;
        width: 100px; /*max-width: 50%;*/
        line-height: 40px;
        position: relative;
    }

    .input-field {
        width: 80%;
    }

        .input-field input, .input-field select, .input-field textarea {
            width: 100%;
            border: 1px solid #ccc;
            padding: 5px 15px;
            border-radius: 4px;
            background: #fff;
            color: #999;
            font-size: 16px;
        }

        .input-field textarea {
            resize: vertical;
        }

    .invalid:after {
        content: "x";
        display: inline-block;
        background-color: #f00;
        position: absolute;
        top: 8px;
        right: 5px;
        color: #fff;
        width: 20px;
        height: 20px;
        line-height: 20px;
        text-align: center;
        border-radius: 20px;
    }

    .contact-form {
        max-width: 750px;
        padding: 25px;
        padding-left: 180px;
        margin-top: 25px;
    }

    .btn {
        cursor: pointer;
        display: inline-block;
        text-align: center;
        vertical-align: middle;
        padding: 5px 10px;
        border-radius: 5px;
        background-color: #fff;
        color: #777;
        text-decoration: none;
        border: 1px solid #eee;
    }

        .btn .small {
            font-size: 14px;
        }

        .btn .small-plus {
            font-size: 18px;
        }

        .btn .medium {
            font-size: 22px;
        }

        .btn .large {
            font-size: 26px;
        }

        .btn .large-plus {
            font-size: 30px;
        }

        .btn.gradient-orange, .btn.gradient-blue, .btn.gradient-green, .btn.gradient-red, .btn.black, .btn.orange, .btn.green, .btn.blue, .btn.red {
            color: #FFF;
            border: 0;
        }

        .btn.red {
            background-color: #C00;
        }

        .btn.blue {
            background-color: #0AF;
        }

        .btn.green {
            background-color: #0B4;
        }

        .btn.orange {
            background-color: #FA0;
        }

        .btn.black {
            background-color: #000;
        }

        .btn.gradient-red {
            background-color: #CC0000;
            background: -o-linear-gradient(top, #CC0000, #D00303);
            background: -ms-linear-gradient(top, #CC0000, #D00303);
            background: -moz-linear-gradient(top, #CC0000, #D00303);
            background: -webkit-linear-gradient(top, #CC0000, #D00303);
        }

        .btn.gradient-green {
            background-color: #00BB44;
            background: -o-linear-gradient(top, #00BB44, #00C050);
            background: -ms-linear-gradient(top, #00BB44, #00C050);
            background: -moz-linear-gradient(top, #00BB44, #00C050);
            background: -webkit-linear-gradient(top, #00BB44, #00C050);
        }

        .btn.gradient-blue {
            background-color: #0F469B;
            background: -o-linear-gradient(top, #2257b4, #0F469B);
            background: -ms-linear-gradient(top, #2257b4, #0F469B);
            background: -moz-linear-gradient(top, #2257b4, #0F469B);
            background: -webkit-linear-gradient(top, #2257b4, #0F469B);
        }

        .btn.gradient-orange {
            background-color: #D87D08;
            background: -o-linear-gradient(top, #fa9f2a, #D87D08);
            background: -ms-linear-gradient(top, #fa9f2a, #D87D08);
            background: -moz-linear-gradient(top, #fa9f2a, #D87D08);
            background: -webkit-linear-gradient(top, #fa9f2a, #D87D08);
        }

    .hpsearch-list > li {
        line-height: 40px;
        display: inline-block;
        float: none;
        vertical-align: middle;
    }

    .hpsearch-item > img {
        width: 40px;
    }

    ol.hpsearch-list {
        text-align: center;
    }
    /* move search bar END 2015-08-07 by: axcelleria */

    /*
    decrese search button thickness
    */
    #js-user a {
        padding-top: 2px;
        padding-bottom: 2px;
    }
body,td,th {
	font-family: "Lucida Grande", "Lucida Sans", Verdana, sans-serif;
}
</style>
<!-- END-ADDED 2015-08-01 10:46A BY:RES -->
<head id="ctl00_Head1">
    <title>Get Certified</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=1060">
    <!-- cmt -->
    <!-- Site Resources -->
    <!-- START-REMOVED 2015-08-01 10:46A BY:RES
    <script>
        var siteid = 68000000;
    </script>
       END-REMOVED 2015-08-01 10:46A BY:RES -->
    <!-- START-REMOVED 2015-08-01 10:46A BY:RES
    <script>
        var HMSTrackingVars = {
            "BusinessUnit": "US-RES",
            "Site": "deFiveStarCertifiedcorp",
            "SiteLevel": "1.0.0.0",
            "Channel": "www.FiveStarCertified.com"
        };
    </script>
    END-REMOVED 2015-08-01 10:46A BY:RES -->
    <!-- Color Variation Resources -->
    <!-- Template Resources -->
    <!--<link rel="stylesheet"../resources/css/allbdaf.css" /> -->
<link rel="stylesheet" href="./resources/css/allbdaf.css" />
    <!-- link rel="stylesheet" type="text/css" href="../../../files.a2.FiveStarCertified.com/styles/jFeaturedList/jFeaturedList-style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="../indexcf85.html?css=styles/cms.v.1352755983" /-->
    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script> -->
</head>
<body>
    <div style="width: 100%; overflow: hidden;">
        <div id="fb-root">
        </div>
        <script src="https://connect.facebook.net/en_US/all.js#xfbml=1"></script>
        <div id="site" class="site">
            <header class="site-head" id="site-head">
              <h2 class="site-title accessible">FiveStarCertified</h2>

                <h2 class="site-subtitle accessible">Directory Of the Top Certified Businesses</h2>

                <div class="site-attr site-attr-office" id="js-branding-header"></div>

                <div class="site-attr site-attr-agent" data-id="js-agent-branding"></div>
            </header>
            <!-- / .site-head -->
            <div id="site-menu" class="site-menu">
                <h6 class="accessible menu-title mainnav-title">Main Menu
                    <br>
                </h6>
                <p>&nbsp;
                    
                </p>
                <p>&nbsp;
                    
                </p>
                <ul id="mainnav-body" class="menu-body mainnav-body">
                    <li class="menu-item mainnav-item"><a href="index.html" class="menu-link mainnav-link">Home</a> </li>
                    <li class="menu-item mainnav-item"><a href="../business/business-search1.html" class="menu-link mainnav-link">Business Search</a> </li>
                    <li class="menu-item mainnav-item"><a href="product-search.aspx" class="menu-link mainnav-link">Product Search</a> </li>
                    <li class="menu-item mainnav-item"><a href="write-a-review.aspx" class="menu-link mainnav-link">Write A Review</a> </li>
                    <li class="menu-item mainnav-item"><a href="get-certified.aspx" class="menu-link mainnav-link">Get Certified</a> </li>
                    <li class="menu-item mainnav-item"><a href="contact.aspx" class="menu-link mainnav-link">Contact Us</a> </li>
                </ul>
                <nav id="mainnav" class="menu mainnav"></nav>
                <!-- == Menu: Meta ====================================================================== -->
                <!--<nav id="metanav" class="menu metanav skin-12"></nav>-->
                <div id="js-user" class="metanav skin-12">
                    <fieldset class="hpsearch-body" id="js-search-main">
                        <ol class="hpsearch-list">
                            <li class="hpsearch-item hpsearch-search"><span class="field select field-5">
                                <select id="City" name="City">
                                    <!-- START-Modified 2015-08-02 07:40PM BY:axcelleria -->
                                    <!--
                                        Modification code: added data-map attribute to dynamically change map image to target URL
                                        -->
                                    <option data-map="Atlanta,GA" value="Atlanta Georgia">Atlanta </option>
                                    <option data-map="Albuquerque,+New+Meksiko" value="Albuquerque New Mexico">Albuquerque
                                    </option>
                                    <option data-map="Austin,+TX,+USA" value="Austin Texas">Austin </option>
                                    <option data-map="Baltimore,+MD,+USA" value="Baltimore Maryland">Baltimore </option>
                                    <option data-map="Boston,+MA,+USA" value="Boston Massachusetts">Boston </option>
                                    <option data-map="Charlotte,+NC,+USA" value="Charlotte North Carolina">Charlotte
                                    </option>
                                    <option data-map="Chicago,+IL,+USA" value="Chicago illinois">Chicago </option>
                                    <option data-map="Cleveland,+OH,+USA" value="Cleveland Ohio">Cleveland </option>
                                    <option data-map="Colorado+Springs,+CO,+USA" value="Colorado Springs Colorado">Colorado
                                        Springs </option>
                                    <option data-map="Dallas,+TX,+USA" value="Dallas Texas">Dallas </option>
                                    <option data-map="Denver,+CO,+USA" value="Denver Colorado">Denver </option>
                                    <option data-map="Detroit,+MI,+USA" value="Denver Colorado">Detroit </option>
                                    <option data-map="El+Paso,+TX,+USA" value="El Paso Texas">El Paso </option>
                                    <option data-map="Fort+Worth,+TX,+USA" value="Honolulu Hawaii">Fort Worth </option>
                                    <option data-map="Fresno,+CA,+USA" value="Fresno California">Fresno </option>
                                    <option data-map="Honolulu,+HI,+USA" value="Honolulu Hawaii">Honolulu </option>
                                    <option data-map="Houston,+TX,+USA" value="Houston Texas">Houston </option>
                                    <option data-map="Jacksonville,+FL,+USA" value="Jacksonville Florida">Jacksonville
                                    </option>
                                    <option data-map="Kansas+City,+MO,+USA" value="Kansas City Kansas">Kansas City </option>
                                    <option data-map="Las+Vegas,+NV,+USA" value="Las Vegas Nevada">Las Vegas </option>
                                    <option data-map="Long+Beach,+CA,+USA" value="Long Beach California">Long Beach
                                    </option>
                                    <option data-map="Los+Angeles,+CA,+USA" value="Los Angeles California">Los Angeles
                                    </option>
                                    <option data-map="Louisville,+KY,+USA" value="Louisville Kentucky">Louisville </option>
                                    <option data-map="Memphis,+TN,+USA" value="Memphis Tennessee">Memphis </option>
                                    <option data-map="Mesa,+AZ,+USA" value="Mesa Arizona">Mesa </option>
                                    <option data-map="Miami,+FL,+USA" value="Miami Florida">Miami </option>
                                    <option data-map="Minneapolis,+MN,+USA" value="Minneapolis Minnesota">Minneapolis
                                    </option>
                                    <option data-map="Nashville,+TN,+USA" value="Nashville Tennessee">Nashville </option>
                                    <option data-map="New+Orleans,+LA,+USA" value="New Orleans Louisiana">New Orleans
                                    </option>
                                    <option data-map="New+York,+NY,+USA" value="New York New York">New York </option>
                                    <option data-map="Oklahoma+City,+OK,+USA" value="Oaklahoma City Oaklahoma">Oaklahoma
                                        City </option>
                                    <option data-map="Oakland,+CA,+USA" value="Oakland California">Oakland </option>
                                    <option data-map="Omaha,+NE,+USA" value="Omaha Nebraska">Omaha </option>
                                    <option data-map="Orlando,+FL,+USA" value="Orlando Florida">Orlando </option>
                                    <option data-map="Palm+Beach,+FL,+USA" value="Palm Beach Florida">Palm Beach </option>
                                    <option data-map="Palo+Alto,+CA,+USA" value="Palo Alto California">Palo Alto </option>
                                    <option data-map="Philadelphia,+PA,+USA" value="Philadelphia pennsylvania">Philadelphia
                                    </option>
                                    <option data-map="Phoenix,+AZ,+USA" value="Phoenix Arizona">Phoenix </option>
                                    <option data-map="Portland,+OR,+USA" value="Portland">Portland </option>
                                    <option data-map="Raleigh,+NC,+USA" value="Raleigh">Raleigh </option>
                                    <option data-map="Sacramento,+CA,+USA" value="Sacramento">Sacramento </option>
                                    <option data-map="St+Louis,+MO,+USA" value="Saint Louis">Saint Louis </option>
                                    <option data-map="San+Antonio,+TX,+USA" value="San Antonio">San Antonio </option>
                                    <option data-map="San+Diego,+CA,+USA" value="San Diego">San Diego </option>
                                    <option data-map="San+Francisco,+CA,+USA" value="San Francisco">San Francisco </option>
                                    <option data-map="San+Jose,+CA,+USA" value="San Jose California">San Jose </option>
                                    <option data-map="Seattle,+WA,+USA" value="Seattle">Seattle </option>
                                    <option data-map="Spokane,+WA,+USA" value="Spokane">Spokane </option>
                                    <option data-map="Tampa,+FL,+USA" value="Tampa">Tampa </option>
                                    <option data-map="Tucson,+AZ,+USA" value="Tucson">Tucson </option>
                                    <option data-map="Tulsa,+OK,+USA" value="Tulsa">Tulsa </option>
                                    <option data-map="Vancouver,+BC,+Canada" value="Vancouver">Vancouver </option>
                                    <option data-map="Virginia+Beach,+VA,+USA" value="Virginia Beach">Virginia Beach
                                    </option>
                                    <option data-map="Washington,+DC,+USA" value="Washington DC">Washington DC </option>
                                    <option data-map="Wichita,+KS,+USA" value="Witchita">Witchita
                                        <!-- END-Modified 2015-08-02 07:40PM BY:axcelleria -->
                                    </option>
                                </select></span></li>
                            <li class="hpsearch-item hpsearch-price">
                                <fieldset>
                                    <div class="hpsearch-list">
                                        <span class="field select field-5">
                                            <select id="Category" name="Category">
                                                <!-- START-Modified  2015-08-02 02:52PM BY:axcelleria -->
                                                <option value="Accountants">Accountants </option>
                                                <option value="Architects">Architects </option>
                                                <!--
                                                Modified code: 
                                                remove static http: protocol from value attribute
                                                -->
                                                <!-- START-Modified  2015-08-02 02:52PM BY:axcelleria -->
                                                <option value="Automotive">Automotive </option>
                                                <option value="Business Services">Business Services </option>
                                                <option value="Construction">Construction </option>
                                                <option value="Consumer Products">Consumer Products </option>
                                                <option value="Dentists">Dentists </option>
                                                <option value="Doctors">Doctors </option>
                                                <option value="Education">Education </option>
                                                <option value="Electricians">Electricians </option>
                                                <option value="Energy">Energy </option>
                                                <option value="Entertainment">Entertainment </option>
                                                <option value="Exterminators">Exterminators </option>
                                                <option value="Financial Services">Financial Services </option>
                                                <option value="Health">Health </option>
                                                <option value="Home Repair">Home Repair </option>
                                                <option value="Hospitality">Hospitality </option>
                                                <option value="Human Resources">Human Resources </option>
                                                <option value="Information Technology">Information Technology </option>
                                                <option value="Insurance">Insurance </option>
                                                <option value="Leasing Commercial">Leasing Commercial </option>
                                                <option value="Legal">Legal </option>
                                                <option value="Logistics">Logistics </option>
                                                <option value="Managed Service">Managed Service </option>
                                                <option value="Manufacturing">Manufacturing </option>
                                                <option value="Optometrists">Optometrists </option>
                                                <option value="Painters">Painters </option>
                                                <option value="Plumbers">Plumbers </option>
                                                <option value="Property Managers">Property Managers </option>
                                                <option value="Real Estate">Real Estate </option>
                                                <option value="Recreation">Recreation </option>
                                                <option value="Restaurants">Restaurants </option>
                                                <option value="Retailers">Retailers </option>
                                                <option value="Roofing">Roofing </option>
                                                <option value="Security">Security </option>
                                                <option value="Self Storage">Self Storage </option>
                                                <option value="Solar">Solar </option>
                                                <option value="Technology">Technology </option>
                                                <option value="Telecommunications">Telecommunications </option>
                                                <option value="Transportation">Transportation </option>
                                                <option value="Utilities">Utilities </option>
                                                <option value="Veterinarians">Veterinarians </option>
                                            </select></span>
                                    </div>
                                </fieldset>
                            </li>
                            <li class="hpsearch-item hpsearch-submit"><a class="btn btn-skin btn-1 js-submit"
                                 style="height: 23px; line-height: 23px;" >Search</a> </li>
                            <!-- fieldset>
                                <legend class="label"></legend>
                            </fieldset -->
                        </ol>
                    </fieldset>
                </div>
            </div>
            <!-- / .site-menu -->
            <!--<div id="site-body" class="site-body skin-4"><section id="page" class="page">		-->
            <div id="site-body" class="site-body ">
                <section id="page" class="page clearfix skin-4 margin-vertical pad-gutter-all">
                    <div class="clearfix margin-lead-vertical pad-horizontal richtext">
                        <p>
                            <style type="text/css">
                                .wrapper {
                                    width: 100%;
                                    height: auto;
                                    float: left;
                                    padding: 12px;
                                    margin-top: -80px;
                                    margin-left: 1px;
                                    margin-right: 1px;
                                }

                                h3.h3-special {
                                    font-size: 1.5em;
                                }

                                .hero-box {
                                    width: 890px;
                                    height: 100px;
                                    float: left;
                                    margin: 2% 0 5%;
                                    padding: 10px 10px 10px 10px;
                                    background: #ffffff;
                                    border-radius: 10px;
                                    -webkit-border-radius: 10px;
                                    -moz-border-radius: 10px;
                                    -o-border-radius: 5px;
                                    -ms-border-radius: 5px;
                                    box-shadow: 0 0 10px #cccccc;
                                    vertical-align: middle;
                                }

                                .btn-rt {
                                    position: relative;
                                    top: -45px;
                                    left: 620px;
                                }

                                .row {
                                    float: left;
                                    width: 100%;
                                }

                                .col {
                                    float: left;
                                    width: 430px;
                                    height: auto;
                                    margin: 0 2%;
                                }

                                .icon-special {
                                    float: left;
                                    min-width: 80px;
                                    min-height: 80px;
                                    margin: 0 10px 95px 0;
                                }
                            </style>
                        </p>
                        <p>&nbsp; </p>
                        <div class="wrapper">
                            <!-- START-Modified  2015-08-02 02:52PM GMT+7  by:axcelleria -->
                            <!--
                            Modification code: add <span> tag to change specific city dynamically 
                        -->
                            <h1>For Info On Becoming A Certified Business 
                              <!--end .col--> Or Product                          </h1>
                            <div class="row">
                              <form id="form1" runat="server" class="margin-a contact-form">
                                <asp:Label runat="server" ID="lblStatus" ForeColor="green" Font-Size="18px"></asp:Label>
                                    <asp:Label runat="server" ID="lblError" ForeColor="Red" Font-Size="16px"></asp:Label>
                                    <br />
                                    <br />
                                    <p class="clear-a">
                                        <span class="float-l input-text">First Name</span>
                                        <span class="float-l input-field" style="display: inline-table; width: 80% !important">
                                            <%--<input type="text" class="name" required/>--%>
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtFname" CssClass="name" Width="300px" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator runat="server" CssClass="valerror" ID="reqFname" ControlToValidate="txtFname" ErrorMessage="Please enter First Name!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">Last Name</span>
                                        <span class="float-l input-field" style="width: 80% !important">
                                            <%--<input type="text" class="name" />--%>
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox runat="server" ID="txtLname" CssClass="name" Width="300px" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator runat="server" ID="ReqLname" ControlToValidate="txtLname" ErrorMessage="Please enter Last Name!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">Email</span>
                                        <span class="float-l input-field" style="width: 80% !important">
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <%--<input type="email" required placeholder='e.g: yahoo@gmail.com' />--%>
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="name txtfont" Width="300px" MaxLength="254" placeholder='e.g: yahoo@gmail.com'></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="ReqEmail" runat="server"
                                                            ErrorMessage="Please enter email address!" ControlToValidate="txtEmail"
                                                            ForeColor="Red" Font-Size="13px"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                                            runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                            ControlToValidate="txtEmail"
                                                            CssClass="requiredFieldValidateStyle"
                                                            ForeColor="Red" Font-Size="13px"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                        </asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">Phone</span>
                                        <span class="float-l input-field" style="width: 80% !important">
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <%--<input type="number" />--%>
                                                        <asp:TextBox runat="server" ID="txtNumber" CssClass="name" Width="300px" MaxLength="10"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator runat="server" ID="ReqNumber" ControlToValidate="txtNumber" ErrorMessage="Please enter Number!" ForeColor="Red" Font-Size="13px" />
                                                        <br />
                                                        <asp:RegularExpressionValidator runat="server" ID="rexNumber" ControlToValidate="txtNumber" ValidationExpression="^[0-9]{10}$" ErrorMessage="Please enter valid number!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">City / Area</span>
                                        <span class="float-l input-field" style="width: 80% !important">
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <%--<input type="text" />--%>
                                                        <asp:TextBox runat="server" ID="txtCity" CssClass="name" Width="300px" MaxLength="30"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 300px;">
                                                        <asp:RequiredFieldValidator runat="server" ID="rexCity" ControlToValidate="txtCity" ErrorMessage="Please enter City Name!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">Interested In</span>
                                        <span class="float-l input-field">
                                            <%--<select id="zoom">
                                                <option value="Becoming A Certified Business" selected>Becoming A Certified Business</option>
                                                <option value="Becoming A Certified Product">Becoming A Certified Product</option>
                                                <option value="Other">Other</option>
                                            </select>--%>
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddlIntrest" runat="server" Style="width: 300px">
                                                            <asp:ListItem> -Select Interest Here-</asp:ListItem>
                                                            <asp:ListItem>Becoming A Certified Business</asp:ListItem>
                                                            <asp:ListItem>Becoming A Certified Product</asp:ListItem>
                                                            <asp:ListItem>Advertising On FiveStarCertified.com</asp:ListItem>
                                                            <asp:ListItem>Writing A Review</asp:ListItem>
                                                            <asp:ListItem>Other</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="rfvcandidate"
                                                            runat="server" ControlToValidate="ddlIntrest"
                                                            ErrorMessage="Please choose a candidate"
                                                            InitialValue="Please choose a candidate">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">Message</span>
                                        <span class="float-l input-field">
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <%--<textarea type="text" required></textarea>--%>
                                                        <asp:TextBox runat="server" ID="txtMultiview" CssClass="name" TextMode="MultiLine" MaxLength="1000" Width="300px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator runat="server" ID="rextxtMultiview" ControlToValidate="txtMultiview" ErrorMessage="Please enter Message!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </span>
                                    </p>
                                    <p class="">
                                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
                                        <br />
                                        <span class="input-text" style="vertical-align: top">Captcha</span>
                                        <span class="input-field">
                                            <%--<textarea type="text" required></textarea>--%>
                                            <table class="tblfrm">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtimgcode" CssClass="name txtfont" runat="server" Width="300px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator runat="server" ID="reqCaptch" ControlToValidate="txtimgcode" ErrorMessage="Please enter Captcha!" ForeColor="Red" Font-Size="13px" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" />
                                            <br />
                                        </span>
                                    </p>
                                    <p class="clear-a">
                                        <span class="float-l input-text">&nbsp;</span>
                                        <span class="float-l input-field">
                                            <%--<button type="submit" class="btn blue" disabled>Submit</button>--%>
                                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn blue" Width="50%" Text="Submit" OnClick="btnSubmit_Click1" />
                                        </span>
                                    </p>
                                </form>

                                <div align="center" style="font-size: 10px">
                                    <em>Disclaimer:  FiveStarCertified is an equal opportunity employer..</em>
                                </div>

                                <div id="Lead">&nbsp;</div>
                                <!--end .col-->
                            </div>
                            <!--end .row-->
                        </div>
                        <!--end .wrapper-->
                    </div>
                    <a id="contact"></a>
                </section>
                <!-- /.page -->
                <div id="js-content-miscbottom" class="grid-row clearfix grid-doublegutters margin-lead-all margin-leaddouble-top">
                    <div class="grid-unit width-1of2">
                        <article class="mod bfcontent ">
                            <header class="mod-head bfcontent-head">
                                <span class="icon icons-globe-color-54x53">&nbsp;</span>
                                <h3 class="mod-title bfcontent-title">Get Certified / Get More Business</h3>
                            </header>
                            <div class="mod-body bfcontent-body">
                                <p>
                                    FiveStarCertified certified the best businesses and generates more business for them?
                                </p>
                            </div>
                            <footer class="mod-foot bfcontent-foot">
                                <a class="btn btn-skin btn-3" href="get-certified.aspx">Get Certified</a>
                            </footer>
                        </article>
                    </div>
                    <div class="grid-unit width-1of2">
                        <article class="mod bfcontent ">
                            <header class="mod-head bfcontent-head">
                                <span class="icon icons-bellmail-95x47">&nbsp;</span>
                                <h3 class="mod-title bfcontent-title">Be the first to know</h3>
                            </header>
                            <div class="mod-body bfcontent-body">
                                <p>
                                    Create a FREE My FiveStarCertified account and get email alerts for new listings, sales and more.
                                </p>
                            </div>
                            <footer class="mod-foot bfcontent-foot">
                                <a class="btn btn-skin btn-3 js-user-register" href="registration.aspx">Create account</a>
                            </footer>
                        </article>
                    </div>
                </div>
            </div>
            <div class="illustration interior">
            </div>
            <footer id="site-foot" class="site-foot" data-quietmode="false">
                <div class="grid-row grid-padding pad-leaddouble-top">
                    <!-- Footer links -->
                    <div class="grid-unit width-2of3">
                        <!-- Business opps -->
                        <div class="grid-row grid-padding">
                            <h6 class="grid-unit width-7of20 margin-bottom">
                                <a class="link-7" href="index.html">FiveStarCertified.com </a>
                            </h6>
                            <!-- / .grid-unit -->
                            <ul class="grid-unit width-13of20 list-delim">
                                <li class="list-delim-item">
                                    <a class="link-8" href="worldwide-search.aspx">Worldwide Search </a>
                                </li>
                            </ul>
                            <!-- / .grid-unit -->
                        </div>
                        <!-- / .grid-row -->
                        <!-- Corporate info -->
                        <div class="grid-row grid-padding">
                            <h6 class="grid-unit width-7of20 margin-bottom">&nbsp;</h6>
                            <ul class="grid-unit width-13of20 list-delim">
                                <li class="list-delim-item">
                                    <a class="link-8" href="press-newsroom.aspx">Newsroom </a>
                                </li>
                                <li class="list-delim-item">
                                    <a class="link-8" href="blog.html">Blog </a>
                                </li>
                                <li class="list-delim-item">
                                    <a class="link-8" href="career-inquiry.aspx">Careers </a>
                                </li>
                            </ul>
                            <!-- / .grid-unit -->
                        </div>
                        <!-- / .grid-row -->
                        <!-- International -->
                        <div class="grid-row grid-padding">
                            <h6 class="grid-unit width-7of20 margin-bottom">
                                <a href="investor.aspx" class="link-7">FiveStarCertified business opportunities
                                </a>
                            </h6>
                            <!-- / .grid-unit -->
                            <ul class="grid-unit width-13of20 list-delim">
                                <li class="list-delim-item">
                                    <a href="investor.aspx" class="link-8">Invest in FiveStarCertified.com
 </a>
                                </li>
                                <li class="list-delim-item">
                                    <a href="get-certified.aspx" class="link-8"></a>
                                </li>
                            </ul>
                            <!-- / .grid-unit -->
                        </div>
                        <!-- / .grid-row -->
                        <div class="grid-row grid-padding pad-leaddouble-bottom site-investor">
                            <h6 class="grid-unit width-7of20 margin-bottom">
                                <a href="investor.aspx"class="link-7">FiveStarCertified investor relations
                                </a>
                            </h6>
                            <!-- / .grid-unit -->
                        </div>
                        <!-- / .grid-row -->
                        <!-- Other FiveStarCertified Sites -->
                        <div class="grid-row grid-padding">
                            <h6 class="grid-unit width-7of20 margin-bottom link-7">&nbsp;</h6>
                            <!-- / .grid-unit -->
                        </div>
                        <!-- / .grid-row -->
                    </div>
                    <!-- / .grid-unit -->
                    <div class="grid-unit width-1of3">
                        <!-- Social Media Links -->
                        <div class="site-social margin-lead-bottom">
                            <h6 class="text-4  margin-bottom">FiveStarCertified.com on social media</h6>
                            <ul class="inline-row">
                                <li class="inline-unit margin-half-right">
                                    <a target="_new" class="icon icons-facebook-color-27x27" href="https://www.facebook.com/fiveStarCertified">Facebook </a>
                                </li>
                                <li class="inline-unit margin-half-right">
                                    <a target="_new" class="icon icons-twitter-color-27x27" href="https://www.twitter.com">Twitter </a>
                                </li>
                                <li class="inline-unit margin-half-right">
                                    <a target="_new" class="icon icons-googleplus-color-27x27" href="https://plus.google.com">Google+ </a>
                                </li>
                                <li class="inline-unit margin-half-right">
                                    <a target="_new" class="icon icons-youtube-color-27x27" href="https://www.youtube.com">YouTube </a>
                                </li>
                                <li class="inline-unit margin-half-right">
                                    <a target="_new" class="icon icons-linkedin-color-27x27" href="https://www.linkedin.com">LinkedIn </a>
                                </li>
                                <li class="inline-unit">
                                    <a target="_new" class="icon icons-pinterest-color-27x27" href="https://pinterest.com">Pinterest </a>
                                </li>
                            </ul>
                        </div>
                        <div class="grid-row" style="padding-top: 50px">
                            <!-- Apps -->
                            <div class="site-apps grid-unit width-12of20">
                                <h6 class="text-4 margin-bottom">Our  apps</h6>
                                <ul class="inline-row">
                                    <li class="inline-unit">
                                        <a target="_new" class="icon icons-iphoneappstore-black-99x30" href="https://itunes.apple.com">Download on the AppStore </a>
                                    </li>
                                    <li class="inline-unit">
                                        <a target="_new" class="icon icons-androidappstore-black-86x30" href="https://play.google.com/store">Get it on Google Play </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- / .grid-unit -->
                            <!-- Site Supports -->
                            <div class="site-supports grid-unit width-8of20">
                                <h6 class="text-4 margin-bottom">We  support</h6>
                                <ul class="inline-row">
                                    <li class="inline-unit margin-half-right">
                                        <a target="_new" class="icon icons-susangkomencure-color-54x30" href="https://ww5.komen.org/">Susan G Komen for the Cure </a>
                                    </li>
                                    <li class="inline-unit">
                                        <!-- a target="_new" class="icon icons-childrensmiraclenetwork-color-49x30" href="/c/about/FiveStarCertified.com-cares">
							Children's Miracle Network
						</a -->
                                        <a href="https://give.childrensmiraclenetworkhospitals.org/">
                                            <img alt="Children's Miracle Network" src="https://www.fivestarcertified.com/resources/images/CMN_FooterLogo.png">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- / .grid-unit -->
                        </div>
                        <!--  / .grid-row -->
                    </div>
                    <!-- / .grid-unit -->
                </div>
                <!--  / .grid-row -->
                <hr class="line-5 fullwidth margin-lead-top margin-font-bottom">
                <!-- Footer Links -->
                <ul class="list-delim margin-bottom" style="text-align: center;">
                    <li class="list-delim-item">
                        <a class="link-8" href="/sitemap.html">Sitemap </a>
                    </li>
                    <li class="list-delim-item">
                        <a rel="nofollow" class="link-8 js-termsofuse" href="terms-of-use.html">Terms of Use </a>
                    </li>
                    <li class="list-delim-item">
                        <a rel="nofollow" class="link-8 js-privacypolicy" href="privacy.html">Privacy Policy </a>
                    </li>
                    <li class="list-delim-item">
                        <a class="link-8" href="https://www.FiveStarCertified.com">FiveStarCertified.com &reg;</a>
                    </li>
                </ul>
                <small style="text-align: center;" class="site-disclaimer text-5">FiveStarCertified.com  is an Equal Opportunity Employer and supports the Fair business Act. </small>
                <small style="text-align: center;" class="site-copyright text-5 pad-lead-bottom">&copy;
	2015 FiveStarCertified.com. All Rights Reserved.
    Powered byFiveStarCertified.com</small>
                <ul class="list-delim margin-bottom" style="text-align: center;">
                    <li class="list-delim-item"></li>
                </ul>
            </footer>
        </div>
        <!-- / .site -->
        <!-- Template Footer Resources -->
    </div>
    <!-- cms -->
</body>
</html>
