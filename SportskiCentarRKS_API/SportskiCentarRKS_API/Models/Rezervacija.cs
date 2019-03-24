using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.Models
{
    [Table("Rezervacija")]
    public class Rezervacija
    {
        [Key]
        public int RezervacijaID { get; set; }
        public int TerminID { get; set; }
        [ForeignKey("TerminID")]
        public virtual Termin Termin { get; set; }
        public int KlijentID { get; set; }
        [ForeignKey("KlijentID")]
        public virtual Klijent Klijent { get; set; }
        public bool Odobrena { get; set; }
        public bool Uplaceno { get; set; }
    }
}