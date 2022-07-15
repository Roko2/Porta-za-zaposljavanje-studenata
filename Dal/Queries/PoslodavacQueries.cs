using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class PoslodavacQueries
    {
        public static async Task<Poslodavac> DohvatiPoslodavcaPoIdDB(AppDbContext dbContext,int id)
        {
            try
            {   
                return await dbContext.Poslodavci.Where(x => x.PoslodavacId ==  id).FirstAsync();
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška pri dohvacanju poslodavca po oibu na razini baze!", ex);
            }
        }

        public static async Task<List<Poslodavac>> DohvatiSvePoslodavceDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Poslodavci.Select(x => x).ToListAsync();
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata svih poslodavaca na razini baze!", ex);
            }
        }
    }
}
