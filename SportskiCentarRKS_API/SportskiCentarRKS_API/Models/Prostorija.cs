using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SportskiCentarRKS_API.Models
{
    [Table("Prostorija")]
    public class Prostorija
    {
        [Key]
        public int ProstorijaID { get; set; }
        public string Naziv { get; set; }
        public string Dimenzija { get; set; }
    }
}