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
            if (!IsPostBack)
            {
                setTextBoxesWithValuesFromSession();
            }
            //var homes = homesGridView_GetData();
            //homesGridView.DataSource = homes;
            //homesGridView.DataBind();
        }

        public void setTextBoxesWithValuesFromSession()
        {
            var streets = getAvailableStreetsFromDatabase();
            streetComboBox.DataSource = streets;
            streetComboBox.DataBind();

            if (Session.Count > 0)
            {
                if (Session["minPrice"].ToString() != null)
                {
                    minimalPriceTextBox.Text = Session["minPrice"].ToString();
                }
                if (Session["maxPrice"].ToString() != null)
                {
                    maximalPriceTextBox.Text = Session["maxPrice"].ToString();
                }
                if (Session["bathRoomsAmount"].ToString() != null)
                {
                    bathRoomAmount.Text = Session["bathRoomsAmount"].ToString();
                }
                if (Session["bedRoomsAmount"].ToString() != null)
                {
                    bedRoomsAmount.Text = Session["bedRoomsAmount"].ToString();
                }
                if (Session["street"].ToString() != null)
                {
                    streetComboBox.SelectedValue = Session["street"].ToString();
                }
            }
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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IEnumerable<HomeModel> homesGridView_GetData()
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
            if(streetComboBox.SelectedValue != "")
            {
                homeQuery = homeQuery.Where(x => x.home_address == streetComboBox.SelectedValue);
            }
            
            return homeQuery;
        }

        protected void detailsButton_Click(object sender, EventArgs e)
        {
            Button button = (Button) sender;
            int row = 0;
            int.TryParse(button.CommandArgument, out row);
            var rowValue = homesGridView.DataKeys[row].Value.ToString();
            Session["id"] = rowValue;

            this.Response.Redirect("~/Site/DetailsView");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        public IEnumerable<HomeModel> searchForHomes(AgencjaNieruchomosciEntities db)
        {
             return db.home.Where(x => x.home_address != "").Select(p => new HomeModel
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
                }).ToList();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            upGrid1.Update();
        }

        protected void detailsButton_Command(object sender, CommandEventArgs e)
        {

        }
    }
}