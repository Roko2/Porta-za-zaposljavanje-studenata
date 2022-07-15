using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace Dal.Classes
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {
        }

        public DbSet<Korisnik> Korisnici { get; set; }

        public DbSet<Kategorija> Kategorije { get; set; }
        public DbSet<Komentar> Komentari { get; set; }
        public DbSet<Posao> Poslovi { get; set; }
        public DbSet<Poslodavac> Poslodavci { get; set; }
        public DbSet<Pogodnost> Pogodnosti{ get; set; }
        public DbSet<Vjestina> Vjestine{ get; set; }
        public DbSet<Grad> Gradovi{ get; set; }
        public DbSet<Favorit> Favoriti{ get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder) 
        {
            //modelBuilder.Entity<Korisnik>().Property(x => x.KorisnikId).HasAnnotation(DatabaseGeneratedOption.None);

        }

    }
}
