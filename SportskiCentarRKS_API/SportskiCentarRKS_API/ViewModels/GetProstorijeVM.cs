using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class GetProstorijeVM
    {
        public List<Row> rows { get; set; }

        public class Row
        {
            public int ProstorijaID { get; set; }
            public string Naziv { get; set; }
        }
    }
}