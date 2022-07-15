using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class CodeListQueries
    {
        public static async Task<List<string>> DohvatiLokacijePoslovaDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Poslovi.Select(x => x.Lokacija).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata lokacija na razini baze!", ex);
            }
        }
        public static async Task<List<Vjestina>> DohvatiVjestineDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Vjestine.Select(x => x).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata vjestina na razini baze!", ex);
            }
        }
        public static async Task<List<Pogodnost>> DohvatiPogodnostiDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Pogodnosti.Select(x => x).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata pogodnosti na razini baze!", ex);
            }
        }
    }
}
