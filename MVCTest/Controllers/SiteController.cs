using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCTest.Controllers
{
    public class SiteController : Controller
    {
        // GET: Site
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UploadButtonClick()
        {
            return View();
        }


        public ActionResult AddAd()
        {
            ViewBag.Message = "Dodaj ogłoszenie";

            return View();
        }

        public ActionResult SearchButtonClick(string minimalPriceTextBox, string maximalPriceTextBox, string bathRoomAmount, string bedRoomsAmount, string streetComboBox)
        {
            return View("SearchResults");
        }
    }
}