using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class FavoritQueries
    {
        public static async Task<List<Posao>> DohvatiPosloveFavoriteKorisnika(AppDbContext dbContext,int korisnikId)
        {
            try
            {
                var poslovi = await dbContext.Favoriti.Where(x => x.Korisnik.KorisnikId == korisnikId).Select(x=>x.Posao.PosaoId).ToListAsync();
                return await dbContext.Poslovi.Include(x=>x.Poslodavac).Where(x=>poslovi.Contains(x.PosaoId)).ToListAsync();
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška kod dohvata poslova favorita korisnika na razini baze!", ex);
            }
        }
    }
}
