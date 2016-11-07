using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFormsTest.Models;

namespace WebFormsTest.Site
{
    public partial class DetailsView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"].ToString() != "")
            {
                int id = 0;
                int.TryParse(Session["id"].ToString(), out id);
                AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();
                var home = db.home.Where(p => p.Id == id).Select(p => new HomeModel
                {
                    id = p.Id,
                    price = p.price.Value,
                    bathrooms = p.bathrooms.Value,
                    bedrooms = p.bedrooms.Value,
                    year_built = p.year_built,
                    square_feet = p.square_feet,
                    contact_name = p.contact_name,
                    email_contact = p.email_contact,
                    garages = p.garages,
                    home_address = p.home_address,
                    home_location = p.home_location,
                    notes = p.notes,
                    phone = p.phone
                });

                priceTextBox.Text = home.Select(p => p.price).FirstOrDefault().ToString();
                contactNameTextBox.Text = home.Select(p => p.contact_name).FirstOrDefault().ToString();
                emailTextBox.Text = home.Select(p => p.email_contact).FirstOrDefault().ToString();
                bedTextBox.Text = home.Select(p => p.bedrooms).FirstOrDefault().ToString();
                bathTextBox.Text = home.Select(p => p.bathrooms).FirstOrDefault().ToString();
                garageTextBox.Text = home.Select(p => p.garages).FirstOrDefault().ToString();
                buildingAreaTextBox.Text = home.Select(p => p.square_feet).FirstOrDefault().ToString();
                buildDateTextBox.Text = home.Select(p => p.year_built).FirstOrDefault().ToString();
                districtTextBox.Text = home.Select(p => p.home_location).FirstOrDefault().ToString();
                phoneTextBox.Text = home.Select(p => p.phone).FirstOrDefault().ToString();
                noticesTextBox.Text = home.Select(p => p.notes).FirstOrDefault().ToString();
                streetTextBox.Text = home.Select(p => p.home_address).FirstOrDefault().ToString();

                var images = db.Images.Where(p => p.ad_id == id).Select(p => new ImagesModel
                {
                    id = p.Id,
                    homeId = p.ad_id,
                    image_alt = p.image_alt,
                    image_path = p.image_path,
                }).ToList();

                List<ImagePath> img = new List<ImagePath>();

                foreach (var image in images)
                {
                    string fileName = Path.GetFileName(image.image_path);
                    img.Add(new ImagePath("~/images/" + fileName));
                }

                imagesGrid.DataSource = img;
                imagesGrid.DataBind();
            }
        }
    }
}