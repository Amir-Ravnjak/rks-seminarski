using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class RezervacijaPostVM
    {
        public int KlijentID { get; set; }
        public int TerminID { get; set; }
        public bool Odobrena { get; set; }
        public bool Uplaceno { get; set; }

    }
}