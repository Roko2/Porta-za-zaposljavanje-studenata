using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class KategorijaQueries
    {
        public static async Task<List<Kategorija>> DohvatiSveKategorijeDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Kategorije.Select(x => x).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata kategorija na razini baze", ex);
            }
        }

        public static async Task<Kategorija> DohvatiKategorijuPoIdDB(AppDbContext dbContext, int kategorijaId)
        {
            try
            {
                return await dbContext.Kategorije.Where(x => x.KategorijaId == kategorijaId).FirstAsync();
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata kategorije po ID na razini baze!", ex);
            }
        }
    }
}
