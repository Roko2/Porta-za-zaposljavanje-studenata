using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class BackgroundTaskQueries
    {
        public static async Task PromijeniStatusPoslova(AppDbContext db)
        {
            try
            {
                DateTime danasnjiDatum = DateTime.Now;
                var poslovi = await db.Poslovi.Where(x => x.DatumAktivnosti < danasnjiDatum).ToListAsync();
                foreach(var posao in poslovi)
                {
                    posao.Aktivan = null;
                }
                await db.SaveChangesAsync();
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom promjene statusa poslova na razini baze!", ex);
            }
        }
    }
}
