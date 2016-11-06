using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsTest.Site
{
    public partial class MainView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var streets = getAvailableStreetsFromDatabase();
            streetComboBox.DataSource = streets;
            streetComboBox.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            Session["minPrice"] = minimalPriceTextBox.Text;
            Session["maxPrice"] = maximalPriceTextBox.Text;
            Session["bathRoomsAmount"] = bathRoomAmount.Text;
            Session["bedRoomsAmount"] = bedRoomsAmount.Text;
            Session["street"] = streetComboBox.SelectedValue;
            this.Response.Redirect("~/Site/SearchResults");
        }

        public List<string> getAvailableStreetsFromDatabase()
        {
            List<string> streets = new List<string>();
            using (AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities())
            {
                var street = from p in db.home
                             select (p.home_address);
                foreach (var str in street)
                {
                    streets.Add(str);
                }
            }
            return streets;
        }
    }
}