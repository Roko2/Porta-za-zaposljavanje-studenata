using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class EmailQueries
    {
        public static async Task<string> DohvatiPrivatnePodatkeDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.PrivatniPodaci.Select(x => x.Lozinka).FirstAsync();
            }catch(Exception ex)
            {
                throw new Exception("Dogodila se greska prilikom dohvata privatnih podataka na razini baze", ex);
            }
        }
    }
}
