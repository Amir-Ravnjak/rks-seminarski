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

namespace SportskiCentarRKS_API.Controllers
{
    public class TerminiController : AuthToken
    {
        private MyContext _db = new MyContext();
        
        [HttpGet]
        [Route("api/Termini/{datum},{prostorijaID}")]
        public IHttpActionResult GetTermine(string datum, int prostorijaID)
        {
            
            

            GetTerminiResultVM model = new GetTerminiResultVM();

            List<Termin> termini= _db.Termini.Where(x => x.Datum >= DateTime.Now).ToList();
            if (datum != "noDate")
            {
                DateTime date = Convert.ToDateTime(datum);
                if (date > DateTime.Now)
                    termini = termini.Where(x => x.Datum == date).ToList();
            }
            if (prostorijaID >= 0)
                termini = termini.Where(x => x.ProstorijaID == prostorijaID).ToList();

            
            model.rows = termini.Select(x => new GetTerminiResultVM.Row
            {
                Datum = x.Datum.ToShortDateString(),
                Cijena = x.Cijena,
                Kraj = x.Kraj,
                Pocetak=x.Pocetak,
                nazivProstorije = x.Prostorija.Naziv,
                Slobodan=x.Slobodan,
                TerminID=x.TerminID
            }).ToList();
            return Ok(model);
            
        }
        [HttpGet]
        [Route("api/Termini/{TerminID}")]
        public IHttpActionResult GetTermin(int TerminID)
        {
            Termin t = _db.Termini.Where(x => x.TerminID == TerminID).Include(w => w.Prostorija).FirstOrDefault();

            GetTerminVM termin = new GetTerminVM { 
                Cijena = t.Cijena,
                DatumIVrijeme = t.Datum.ToShortDateString() + " - " + t.Pocetak + "-" + t.Kraj,
                nazivProstorije = t.Prostorija.Naziv,
                Slobodan = t.Slobodan,
                TerminID = t.TerminID
            };

            return Ok(termin);
            
        }

        [HttpPost]
        [Route("api/Termini/{TerminID}")]
        public IHttpActionResult SetTerminRezervisn(int TerminID)
        {
            Termin t = _db.Termini.Where(x => x.TerminID == TerminID).Include(w => w.Prostorija).FirstOrDefault();

            t.Slobodan = false;
            _db.SaveChanges();

            return Ok();
        }

    }
}
