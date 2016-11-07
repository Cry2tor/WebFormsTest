using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFormsTest.Models;
using System.Web.Security;

namespace WebFormsTest.CustomAccount
{
    public partial class CustomLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            //if (IsValid)
            //{
            //    AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();
            //    var user = db.users.Where(p => p.email == Email.Text && p.Password == Password.Text).Select(p => new UsersModel()
            //    {
            //        email = p.email,
            //        Name = p.Name,
            //        LastName = p.LastName,
            //        id = p.id
            //    }).FirstOrDefault();

            //    FormsAuthentication.Authenticate()

            //    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            //        1,                                     // ticket version
            //        user.email,                              // authenticated username
            //        DateTime.Now,                          // issueDate
            //        DateTime.Now.AddMinutes(30),           // expiryDate
            //        false,                                  // true to persist across browser sessions
            //                                                // can be used to store additional user data
            //        FormsAuthentication.FormsCookiePath);  // the path for the cookie

            //    // Encrypt the ticket using the machine key
            //    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

            //    // Add the cookie to the request to save it
            //    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            //    cookie.HttpOnly = true;
            //    Response.Cookies.Add(cookie);
            //    FormsAuthentication.RedirectFromLoginPage(user.email, false);
            //}
        }
    }
}