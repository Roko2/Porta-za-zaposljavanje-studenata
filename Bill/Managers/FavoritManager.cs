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
    public class FavoritManager : IFavorit
    {
        private readonly AppDbContext _dbContext;

        public FavoritManager(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public FavoritManager()
        {

        }
        public async Task<List<FavoritDTO>> DohvatiPosloveFavoriteKorisnika(int korisnikId)
        {
            try
            {
                var posloviDB = await FavoritQueries.DohvatiPosloveFavoriteKorisnika(_dbContext, korisnikId);
                return FavoritTranslator.TranslateList(posloviDB);
            }catch(Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata favorita poslova korisnika!", ex);
            }
        }
    }
}
