using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class GetTerminiResultVM
    {

        public List<Row> rows;
        public  class Row
        {
            public int TerminID { get; set; }
            public string nazivProstorije { get; set; }
            public string Datum { get; set; }
            public string Pocetak { get; set; }
            public string Kraj { get; set; }
            public float Cijena { get; set; }
            public bool Slobodan { get; set; }
        }
    }
}