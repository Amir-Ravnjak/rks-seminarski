using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;

namespace SportskiCentarRKS_API.Models
{
    public class MyContext : DbContext
    {

        public MyContext()
            : base("name=MyContext")
        {
            //this.Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<Klijent> Klijenti { get; set; }
        public virtual DbSet<Prostorija> Prostorije { get; set; }
        public virtual DbSet<Rezervacija> Rezervacije { get; set; }
        public virtual DbSet<Termin> Termini { get; set; }
        public virtual DbSet<AutorizacijskiToken> AutorizacijskiToken { get; set; }

    }
}