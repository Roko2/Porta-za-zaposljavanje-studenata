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
    public class PoslodavacManager : IPoslodavac
    {
        private readonly AppDbContext _dbContext;

        public PoslodavacManager(AppDbContext context)
        {
            _dbContext = context;
        }
        public async Task<PoslodavacDTO> DohvatiPoslodavcaPoId(int id)
        {
            try
            {
                var poslodavac = await PoslodavacQueries.DohvatiPoslodavcaPoIdDB(_dbContext, id);
                var poslodavacDTO = PoslodavacTranslator.Translate(poslodavac);
                return poslodavacDTO;
            }
            catch(Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata poslodavca po id!",ex);
            }
        }

        public async Task<List<PoslodavacDTO>> DohvatiSvePoslodavce()
        {
            try
            {
                var poslodavci = await PoslodavacQueries.DohvatiSvePoslodavceDB(_dbContext);
                var lPoslodavciDTO = PoslodavacTranslator.TranslateList(poslodavci);
                return lPoslodavciDTO;
            }
            catch (Exception ex)
            {

                throw new Exception("Dogodila se greška prilikom dohvata svih poslodavaca!",ex);
            }
        }
    }
}
