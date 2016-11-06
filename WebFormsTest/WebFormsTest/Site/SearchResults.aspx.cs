using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFormsTest.Models;

namespace WebFormsTest.Site
{
    public partial class SearchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setTextBoxesWithValuesFromSession();
            //getData();
        }

        public void setTextBoxesWithValuesFromSession()
        {
            //var streets = getAvailableStreetsFromDatabase();
            //streetComboBox.DataSource = streets;
            //streetComboBox.DataBind();

            //if (Session.Count > 0)
            //{
            //    if (Session["minPrice"].ToString() != null)
            //    {
            //        minimalPriceTextBox.Text = Session["minPrice"].ToString();
            //    }
            //    if(Session["maxPrice"].ToString() != null)
            //    {
            //        maximalPriceTextBox.Text = Session["maxPrice"].ToString();
            //    }
            //    if(Session["bathRoomsAmount"].ToString() != null)
            //    {
            //        bathRoomAmount.Text = Session["bathRoomsAmount"].ToString();
            //    }
            //    if (Session["bedRoomsAmount"].ToString() != null)
            //    {
            //        bedRoomsAmount.Text = Session["bedRoomsAmount"].ToString();
            //    }
            //    if(Session["street"].ToString() != null)
            //    {
            //        streetComboBox.SelectedValue = Session["street"].ToString();
            //    }
            //}
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

        public ActionResult getResultsFromDatabase()
        {

            return new JsonResult()
            {
                
            };
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable homesGridView_GetData()
        {
            AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();

            var homeQuery = searchForHomes(db);
            double minPrice = 0;
            double maxPrice = 0;
            int bathRoomsAmount = 0;
            int bedRoomAmount = 0;

            if(minimalPriceTextBox.Text != "")
            {
                 minPrice = Convert.ToDouble(minimalPriceTextBox.Text);
            }
            if(maximalPriceTextBox.Text != "")
            {
                maxPrice = Convert.ToDouble(maximalPriceTextBox.Text);
            }
            if(bathRoomAmount.Text != "")
            {
                bathRoomsAmount = Convert.ToInt32(bathRoomAmount.Text);
            }
            if(bedRoomsAmount.Text != "")
            {
                bedRoomAmount = Convert.ToInt32(bedRoomsAmount.Text);
            }


            if(maxPrice != 0)
            {
                homeQuery = homeQuery.Where(x => x.price <= maxPrice);
            }
            if(bathRoomsAmount != 0)
            {
                homeQuery = homeQuery.Where(x => x.bathrooms <= bathRoomsAmount);
            }
            if(bedRoomAmount != 0)
            {
                homeQuery = homeQuery.Where(x => x.bedrooms <= bedRoomAmount);
            }
            
            return homeQuery;
        }

        protected void detailsButton_Click(object sender, EventArgs e)
        {
            Button button = (Button) sender;
            int row = 0;
            int.TryParse(button.CommandArgument, out row);
            //GridViewRow gridRow = homesGridView.Rows[row];
            //var rowValue = gridRow.Cells[0];

            this.Response.Redirect("~/Site/DetailsView");
        }

        public IQueryable<HomeModel> searchForHomes(AgencjaNieruchomosciEntities db)
        {
             return db.home.Select(p => new HomeModel
                {
                    id = p.Id,
                    bathrooms = p.bathrooms.Value,
                    bedrooms = p.bedrooms.Value,
                    contact_name = p.contact_name,
                    email_contact = p.email_contact,
                    garages = p.garages,
                    home_address = p.home_address,
                    home_location = p.home_location,
                    notes = p.notes,
                    phone = p.phone,
                    price = p.price.Value,
                    square_feet = p.square_feet,
                    year_built = p.year_built,
                });
        }

        [WebMethod]
        public static HomeModel[] GetData() //GetData function
        {
            AgencjaNieruchomosciEntities db = new AgencjaNieruchomosciEntities();
            var data = db.home.Select(p => new HomeModel
            {
                bathrooms = p.bathrooms.Value,
                bedrooms = p.bedrooms.Value,
                garages = p.garages,
                home_location = p.home_location,
                price = p.price.Value,
                square_feet = p.square_feet,
                year_built = p.year_built,
            });
            List<HomeModel> homes = new List<HomeModel>();

            foreach (var home in data)
            {
                homes.Add(home);
            }

            return homes.ToArray();
        }
        public class DetailsClass //Class for binding data
        {
            public string Username { get; set; }
            public string Firstname { get; set; }
            public string Lastname { get; set; }
            public string EmailID { get; set; }

        }
    }
}