using Dal.Classes;
using Microsoft.EntityFrameworkCore;
namespace Dal.Queries
{
    public class KorisnikQueries
    {
        public static async Task DodajNovogKorisnika(AppDbContext dbContext, Korisnik korisnik)
        {
            try
            {
                bool korisnikPostoji = await dbContext.Korisnici.Where(x => x.Sub == korisnik.Sub).AnyAsync();
                if (!korisnikPostoji)
                {
                    dbContext.Korisnici.Add(korisnik);
                    await dbContext.SaveChangesAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom spremanja korisnika na razini baze!", ex);
            }
        }
        public static async Task<int> DohvatiKorisnikIdPoSub(AppDbContext dbContext, string sub)
        {
            try
            {
                return await dbContext.Korisnici.Where(x => x.Sub.Equals(sub)).Select(x => x.KorisnikId).FirstAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom spremanja korisnika na razini baze!", ex);
            }
        }
    }
}
