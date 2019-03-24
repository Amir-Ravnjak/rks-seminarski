using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class RezervacijeResultVM
    {
        public List<Row> rows { get; set; }

        public class Row
        {
            public int RezervacijaID { get; internal set; }
            public string nazivProstorije { get; set; }
            public string terminInfo { get; set; }
            public bool Odobrena { get; internal set; }
        }
    }
}