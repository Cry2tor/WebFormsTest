using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFormsTest.Models
{
    public class ImagesModel
    {
        public int id { get; set;}
        public string image_alt { get; set; }
        public string image_path { get; set; }
        public int homeId { get; set; }
    }

    public class ImagePath
    {
        public ImagePath(string v)
        {
            this.image_path = v;
        }

        public string image_path { get; set; }
    }
}