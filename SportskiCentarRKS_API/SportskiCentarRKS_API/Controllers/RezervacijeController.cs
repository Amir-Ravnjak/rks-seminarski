using SportskiCentarRKS_API.Helper;
using SportskiCentarRKS_API.Models;
using SportskiCentarRKS_API.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace SportskiCentarRKS_API.Controllers
{
    public class RezervacijeController : AuthToken
    {
        private MyContext db = new MyContext();


        [HttpGet]
        [Route("api/Rezervacije/getRezervacijeByKlijentID/{KlijentID}")]
        public IHttpActionResult getRezervacijeByKlijentID(string KlijentID)
        {
            if (ProvjeriValidnostTokena() == false)
                return Unauthorized();

            int IDint = Convert.ToInt32(KlijentID);

            List<Rezervacija> rezervacije = db.Rezervacije.Where(s => s.KlijentID == IDint).ToList();

            RezervacijeResultVM model = new RezervacijeResultVM
            {
                rows = rezervacije.Select(x => new RezervacijeResultVM.Row
                {
                    RezervacijaID = x.RezervacijaID,
                    nazivProstorije = x.Termin.Prostorija.Naziv,
                    terminInfo = x.Termin.Datum.ToShortDateString()+ " - " + x.Termin.Pocetak + "-" + x.Termin.Kraj,
                    Odobrena = x.Odobrena
                }).ToList()
            };

            return Ok(model);
        }
        [HttpGet]
        [Route("api/Rezervacije/{rezervacijaID}")]
        public IHttpActionResult getRezervaciju(string rezervacijaID)
        {
            int IDint = Convert.ToInt32(rezervacijaID);
            Rezervacija rezervacija = db.Rezervacije.Where(s => s.RezervacijaID == IDint).Include(w=>w.Termin).FirstOrDefault();

            GetRezervacijuResultVM model = new GetRezervacijuResultVM
            {
                RezervacijaID = rezervacija.RezervacijaID,
                Uplaceno = rezervacija.Uplaceno,
                Pocetak = rezervacija.Termin.Datum.ToShortDateString() + " - " + rezervacija.Termin.Pocetak,
                Kraj = rezervacija.Termin.Datum.ToShortDateString() + " - " + rezervacija.Termin.Kraj,
                Odobrena = rezervacija.Odobrena,
                Cijena = rezervacija.Termin.Cijena.ToString(),
                nazivProstorije=rezervacija.Termin.Prostorija.Naziv
                
            };

            return Ok(model);
        }

        [ResponseType(typeof(Rezervacija))]
        public IHttpActionResult PostSoba([FromBody] RezervacijaPostVM rez)
        {
            
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            Rezervacija rezervacija = new Rezervacija
            {
                TerminID = rez.TerminID,
                KlijentID = rez.KlijentID,
                Uplaceno = rez.Uplaceno,
                Odobrena = rez.Odobrena
            };

            db.Rezervacije.Add(rezervacija);
            db.SaveChanges();

            return Ok();
        }

    }
}

