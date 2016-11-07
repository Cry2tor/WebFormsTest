using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsTest.Site
{
    public partial class AddAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void uploadAd_Click(object sender, EventArgs e)
        {
            Images imageDB = new Images();
            home homeDB = new home();

            int tempValue = 0;
            int.TryParse(priceTextBox.Text, out tempValue);
            homeDB.price = tempValue;
            int.TryParse(bathTextBox.Text, out tempValue);
            homeDB.bathrooms = tempValue;
            int.TryParse(bedTextBox.Text, out tempValue);
            homeDB.bedrooms = tempValue;
            homeDB.square_feet = buildingAreaTextBox.Text;
            homeDB.year_built = buildDateTextBox.Text;
            homeDB.contact_name = contactNameTextBox.Text;
            homeDB.home_location = districtTextBox.Text;
            homeDB.email_contact = emailTextBox.Text;
            homeDB.garages = garageTextBox.Text;
            homeDB.notes = noticesTextBox.Text;
            homeDB.phone = phoneTextBox.Text;
            homeDB.home_address = streetTextBox.Text;

            using (AgencjaNieruchomosciEntities dbb = new AgencjaNieruchomosciEntities())
            {
                dbb.home.Add(homeDB);

                try
                {
                    dbb.SaveChanges();
                    Session["home_id"] = dbb.home.Where(p => p.email_contact == emailTextBox.Text).Select(p => p.Id).FirstOrDefault();
                    AjaxFileUpload1.Enabled = true;                   
                }catch(Exception ex)
                {
                    Console.WriteLine(ex);
                }
            }
        }

        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxFileUploadEventArgs e)
        {
            if (e.FileName != String.Empty)
            {
                string fileName = Path.GetFileName(e.FileName);
                AjaxFileUpload1.SaveAs(Server.MapPath("~/images/") + fileName);

                Images imageDB = new Images();
                imageDB.image_alt = fileName;
                imageDB.image_path = "~/images/" + fileName;
                int home_id = 0;
                int.TryParse(Session["home_id"].ToString(), out home_id);
                imageDB.ad_id = home_id;

                AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();
                db.Images.Add(imageDB);
                db.SaveChanges();
            }
        }
    }
}