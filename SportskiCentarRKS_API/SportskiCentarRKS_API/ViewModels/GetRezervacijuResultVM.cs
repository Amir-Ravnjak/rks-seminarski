using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class GetRezervacijuResultVM
    {
        public int RezervacijaID { get; set; }
        public string Pocetak { get; set; }
        public string Kraj { get; set; }
        public string Cijena { get; set; }
        public string nazivProstorije { get; set; }
        public bool Odobrena { get; set; }
        public bool Uplaceno { get; set; }
    }
}