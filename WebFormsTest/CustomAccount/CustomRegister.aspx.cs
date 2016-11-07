using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsTest.CustomAccount
{
    public partial class CustomRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if(Email.Text != String.Empty)
            {
                if(Password.Text != string.Empty)
                {
                    AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();
                    users user = new users();
                    user.email = Email.Text;
                    user.Password = Password.Text;

                    db.users.Add(user);
                    db.SaveChanges();
                    this.Response.Redirect("~/CustomAccount/CustomLogin");
                }
            }
        }
    }
}