using SportskiCentarRKS_API.Helper;
using SportskiCentarRKS_API.Models;
using SportskiCentarRKS_API.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SportskiCentarRKS_API.Controllers
{
    public class AutentifikacijaController : AuthToken
    {
        private MyContext db = new MyContext();

        [HttpGet]
        [Route("api/Autentifikacija/LoginCheck/{username}/{pass}")]
        public IHttpActionResult LoginCheck(string username, string pass)
        {
            string token = Guid.NewGuid().ToString();

            Klijent klijent = db.Klijenti.Where(s => s.KorisnickoIme == username && s.LozinkaSalt == pass).FirstOrDefault();
            // unutar lozinkaSalt je smjesten string password

            if (klijent != null)
            {
                AutentifikacijaResultVM a = new AutentifikacijaResultVM();
                a.KlijentID = klijent.KlijentID;
                a.Ime = klijent.Ime;
                a.Prezime = klijent.Prezime;
                a.KorisnickoIme = klijent.KorisnickoIme;
                a.LozinkaSalt = klijent.LozinkaSalt;
                a.Telefon = klijent.Telefon;
                a.Email = klijent.Email;
                a.Token = token;

                db.AutorizacijskiToken.Add(new AutorizacijskiToken
                {
                    Vrijednost = a.Token,
                    KlijentID = a.KlijentID,
                    VrijemeEvidentiranja = DateTime.Now,
                    IpAdresa = "..."
                });

                db.SaveChanges();

                return Ok(a);
            }

            AutentifikacijaResultVM y = new AutentifikacijaResultVM();
            y.Ime = "PogresniPodaci";

            return Ok(y);
        }

        [HttpDelete]
        [Route("api/Autentifikacija/Logout")]
        public IHttpActionResult Logout()
        {
            IzbrisiToken();
            return Ok();
        }
    }
}
