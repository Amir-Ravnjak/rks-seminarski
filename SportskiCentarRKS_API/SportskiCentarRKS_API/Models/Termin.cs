using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.Models
{
    [Table("Termin")]
    public class Termin
    {
        [Key]
        public int TerminID { get; set; }
        public int ProstorijaID { get; set; }
        [ForeignKey("ProstorijaID")]
        public virtual Prostorija Prostorija { get; set; }
        public DateTime Datum { get; set; }
        public string Pocetak { get; set; }
        public string Kraj { get; set; }
        public float Cijena { get; set; }
        public bool Slobodan { get; set; }
    }
}