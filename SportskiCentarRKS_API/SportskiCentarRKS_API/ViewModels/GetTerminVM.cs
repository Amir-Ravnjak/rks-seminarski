using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class GetTerminVM
    {
        public int TerminID { get; set; }
        public string nazivProstorije { get; set; }
        public string DatumIVrijeme { get; set; }
        public float Cijena { get; set; }
        public bool Slobodan { get; set; }
    }
}