using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFormsTest.Models
{
    public class HomeModel
    {
        public long id { get; set; }
        public double price { get; set; }
        public int bathrooms { get; set; }
        public int bedrooms { get; set; }
        public string home_location { get; set; }
        public string contact_name { get; set; }
        public string email_contact { get; set; }
        public string phone { get; set; }
        public string home_address { get; set; }
        public string square_feet { get; set; }
        public string year_built { get; set; }
        public string garages { get; set; }
        public string notes { get; set; }
    }

    public class HomeGridModel
    {
        public double price { get; set; }
        public int bathrooms { get; set; }
        public int bedrooms { get; set; }
        public string home_location { get; set; }
        public string square_feet { get; set; }
        public string year_built { get; set; }
        public string garages { get; set; }
    }
}