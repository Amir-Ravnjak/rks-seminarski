using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.ViewModels
{
    public class AutentifikacijaResultVM
    {
        public int KlijentID { get; internal set; }
        public string KorisnickoIme { get; internal set; }
        public string LozinkaSalt { get; internal set; }
        public string Telefon { get; internal set; }
        public string Ime { get; internal set; }
        public string Prezime { get; internal set; }
        public string Email { get; internal set; }
        public string Token { get; internal set; }
    }
}