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
    public class CodeListManager:ICodeList
    {
        private readonly AppDbContext _dbContext;

        public CodeListManager(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<string>> DohvatiLokacijePoslova()
        {
            try
            {
                var lLokacijePoslova = await CodeListQueries.DohvatiLokacijePoslovaDB(_dbContext);
                var lLokacijeFiltered = new List<string>();
                foreach (var lokacija in lLokacijePoslova)
                {
                    lLokacijeFiltered.Add(lokacija.Substring(lokacija.LastIndexOf(',') + 1));
                }
                return lLokacijeFiltered.Select(x => x.Trim()).Distinct().ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata lokacija!", ex);
            }
        }
        public async Task<List<VjestinaDTO>> DohvatiVjestine()
        {
            try
            {
                var lVjestineDB = await CodeListQueries.DohvatiVjestineDB(_dbContext);
                var lVjestine = VjestinaTranslator.TranslateList(lVjestineDB);

                return lVjestine;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata vjestinaw!", ex);
            }
        }
        public async Task<List<PogodnostDTO>> DohvatiPogodnosti()
        {
            try
            {
                var lPogodnostiDB = await CodeListQueries.DohvatiPogodnostiDB(_dbContext);
                var lPogodnosti = PogodnostTranslator.TranslateList(lPogodnostiDB);

                return lPogodnosti;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata pogodnosti!", ex);
            }
        }
    }
}
