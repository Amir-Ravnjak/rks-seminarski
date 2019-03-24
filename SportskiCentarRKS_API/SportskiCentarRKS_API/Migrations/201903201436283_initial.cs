namespace SportskiCentarRKS_API.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AutorizacijskiToken",
                c => new
                    {
                        AutorizacijskiTokenID = c.Int(nullable: false, identity: true),
                        Vrijednost = c.String(),
                        VrijemeEvidentiranja = c.DateTime(),
                        IpAdresa = c.String(),
                        DeviceInfo = c.String(),
                        KlijentID = c.Int(),
                    })
                .PrimaryKey(t => t.AutorizacijskiTokenID)
                .ForeignKey("dbo.Klijent", t => t.KlijentID)
                .Index(t => t.KlijentID);
            
            CreateTable(
                "dbo.Klijent",
                c => new
                    {
                        KlijentID = c.Int(nullable: false, identity: true),
                        Ime = c.String(),
                        Prezime = c.String(),
                        Telefon = c.String(),
                        Email = c.String(),
                        KorisnickoIme = c.String(),
                        LozinkaSalt = c.String(),
                        LozinkaHash = c.String(),
                    })
                .PrimaryKey(t => t.KlijentID);
            
            CreateTable(
                "dbo.Prostorija",
                c => new
                    {
                        ProstorijaID = c.Int(nullable: false, identity: true),
                        Naziv = c.String(),
                        Dimenzija = c.String(),
                    })
                .PrimaryKey(t => t.ProstorijaID);
            
            CreateTable(
                "dbo.Rezervacija",
                c => new
                    {
                        RezervacijaID = c.Int(nullable: false, identity: true),
                        TerminID = c.Int(nullable: false),
                        KlijentID = c.Int(nullable: false),
                        Odobrena = c.Boolean(nullable: false),
                        Uplaceno = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.RezervacijaID)
                .ForeignKey("dbo.Klijent", t => t.KlijentID, cascadeDelete: true)
                .ForeignKey("dbo.Termin", t => t.TerminID, cascadeDelete: true)
                .Index(t => t.TerminID)
                .Index(t => t.KlijentID);
            
            CreateTable(
                "dbo.Termin",
                c => new
                    {
                        TerminID = c.Int(nullable: false, identity: true),
                        ProstorijaID = c.Int(nullable: false),
                        Datum = c.DateTime(nullable: false),
                        Pocetak = c.String(),
                        Kraj = c.String(),
                        Cijena = c.Single(nullable: false),
                        Slobodan = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.TerminID)
                .ForeignKey("dbo.Prostorija", t => t.ProstorijaID, cascadeDelete: true)
                .Index(t => t.ProstorijaID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Rezervacija", "TerminID", "dbo.Termin");
            DropForeignKey("dbo.Termin", "ProstorijaID", "dbo.Prostorija");
            DropForeignKey("dbo.Rezervacija", "KlijentID", "dbo.Klijent");
            DropForeignKey("dbo.AutorizacijskiToken", "KlijentID", "dbo.Klijent");
            DropIndex("dbo.Termin", new[] { "ProstorijaID" });
            DropIndex("dbo.Rezervacija", new[] { "KlijentID" });
            DropIndex("dbo.Rezervacija", new[] { "TerminID" });
            DropIndex("dbo.AutorizacijskiToken", new[] { "KlijentID" });
            DropTable("dbo.Termin");
            DropTable("dbo.Rezervacija");
            DropTable("dbo.Prostorija");
            DropTable("dbo.Klijent");
            DropTable("dbo.AutorizacijskiToken");
        }
    }
}
