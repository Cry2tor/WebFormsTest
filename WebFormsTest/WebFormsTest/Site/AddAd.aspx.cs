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

            //if(FileUpload1.HasFile)
            //{
            //    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName);

            //    imageDB.image_alt = fileName;
            //    imageDB.image_path = "~/images/" + fileName;
            //}

            using (AgencjaNieruchomosciEntities dbb = new AgencjaNieruchomosciEntities())
            {
                dbb.home.Add(homeDB);

                try
                {
                    dbb.SaveChanges();
                }catch(Exception ex)
                {
                    Console.WriteLine(ex);
                }

                //if (FileUpload1.HasFile)
                //{
                //    var homeId = dbb.home.Where(x => x.home_address == streetTextBox.Text).Select(x => x.Id).FirstOrDefault();
                //    imageDB.ad_id = homeId;

                //    dbb.Images.Add(imageDB);
                //    dbb.SaveChanges();
                //}
            }
        }

        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxFileUploadEventArgs e)
        {

        }
        
        //protected void Upload(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        //string fileName = Path.GetFileName(e.FileName);
        //        //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName);

        //        //Images imageDB = new Images();
        //        //imageDB.image_alt = fileName;
        //        //imageDB.image_path = "~/images/" + fileName;

        //        Response.Redirect(Request.Url.AbsoluteUri);
        //    }
        //}


    }
}