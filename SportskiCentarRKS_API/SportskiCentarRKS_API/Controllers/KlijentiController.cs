using SportskiCentarRKS_API.Helper;
using SportskiCentarRKS_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace SportskiCentarRKS_API.Controllers
{
    public class KlijentiController : AuthToken
    {
        private MyContext db = new MyContext();
        
        
        [ResponseType(typeof(Klijent))]
        [HttpPost]
        public IHttpActionResult PostKlijenti([FromBody] Klijent klijent)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Klijenti.Add(klijent);

            try
            {
                db.SaveChanges();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
            {
                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        // raise a new exception nesting
                        // the current instance as InnerException
                        raise = new InvalidOperationException(message, raise);
                    }
                }

                throw raise;
            }
            return Ok();
        }
    }
}
