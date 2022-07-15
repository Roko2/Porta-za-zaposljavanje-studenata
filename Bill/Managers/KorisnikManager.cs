using Bill.Dto;
using Bill.Services;
using Bill.Translators;
using Dal.Classes;
using Dal.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Managers
{
    public class KorisnikManager : IKorisnik
    {
        private readonly AppDbContext _dbContext;

        public KorisnikManager(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task DodajNovogKorisnika(KorisnikDTO korisnik)
        {
            try
            {
                var korisnikTranslated = KorisnikTranslator.TranslateDB(korisnik);
                await KorisnikQueries.DodajNovogKorisnika(_dbContext, korisnikTranslated);
            }catch(Exception ex)
            {
                throw new Exception("Dogodila se greška kod dodavanja novog korisnika!", ex);
            }
        }
        public async Task<int> DohvatiKorisnikIdPoSub(string korisnikSub)
        {
            try
            {
                return await KorisnikQueries.DohvatiKorisnikIdPoSub(_dbContext, korisnikSub);
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška kod dodavanja novog korisnika!", ex);
            }
        }
    }
}
