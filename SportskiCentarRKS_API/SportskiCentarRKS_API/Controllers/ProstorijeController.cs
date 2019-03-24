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
    public class ProstorijeController : AuthToken
    {
        private MyContext db = new MyContext();

        [HttpGet]
        [Route("api/Prostorije/")]
        public IHttpActionResult GetProstorije()
        {

            GetProstorijeVM model = new GetProstorijeVM();

            model.rows = db.Prostorije.Select(x => new GetProstorijeVM.Row {
                Naziv = x.Naziv,
                ProstorijaID = x.ProstorijaID
            }).ToList();

            return Ok(model);
        }

        [HttpGet]
        [Route("api/Prostorije/{ProstorijaID}")]
        public IHttpActionResult GetProstoriju(int ProstorijaID)
        {
            Prostorija p = db.Prostorije.Where(w => w.ProstorijaID == ProstorijaID).FirstOrDefault();

            GetProstorijuVM prostorija = new GetProstorijuVM
            {
                ProstorijaID = p.ProstorijaID,
                NazivProstorije = p.Naziv
            };

            return Ok(prostorija);

        }
    }
}
