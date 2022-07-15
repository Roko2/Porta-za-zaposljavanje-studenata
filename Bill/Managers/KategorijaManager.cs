using Bill.Dto;
using Bill.Services;
using Bill.Translators;
using Dal.Classes;
using Dal.Queries;

namespace Bill.Managers
{
    public class KategorijaManager : IKategorija
    {
        private readonly AppDbContext _dbContext;
        public KategorijaManager(AppDbContext context)
        {
            _dbContext = context;
        }
        public async Task<List<KategorijaDTO>> DohvatiSveKategorije()
        {
            try
            {
                var kategorije = await KategorijaQueries.DohvatiSveKategorijeDB(_dbContext);
                var kategorijaDTO = KategorijaTranslator.TranslateList(kategorije);
                return kategorijaDTO;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvaćanja kategorija iz baze!", ex);
            }
        }

        public async Task<KategorijaDTO> DohvatiKategorijuPoId(int kategorijaId)
        {
            try
            {
                var kategorija = await KategorijaQueries.DohvatiKategorijuPoIdDB(_dbContext, kategorijaId);
                var kategorijaDTO = KategorijaTranslator.Translate(kategorija);
                return kategorijaDTO;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvaćanja kategorije po ID!", ex);
            }
        }
        public async Task<List<Tuple<KategorijaDTO, List<PosaoDTO>>>> DohvatiNasumicneKategorijeIPoslove()
        {
            try
            {
                Random rand = new Random();
                List<Tuple<KategorijaDTO, List<PosaoDTO>>> kategorijePoslovi = new List<Tuple<KategorijaDTO, List<PosaoDTO>>>();
                List<PosaoDTO> randomPoslovi = new List<PosaoDTO>();
                var kategorijeDB = await KategorijaQueries.DohvatiSveKategorijeDB(_dbContext);
                var kategorije = KategorijaTranslator.TranslateList(kategorijeDB);
                var randomKategorije = kategorije.OrderBy(item => rand.Next()).ToList();
                for (int i = 0; i < 3; i++)
                {
                    Posao posao = new Posao();
                    PosaoDTO posaoTranslated = new PosaoDTO();
                    var posloviKategorijeDB = await PosaoQueries.DohvatiSvePoslovePoKategorijiDB(_dbContext, randomKategorije[i].Id);
                    var posloviKategorije = PosaoTranslator.TranslateList(posloviKategorijeDB);
                    var randomPosao = posloviKategorije.Where(x => x.Aktivan != null).OrderBy(item => rand.Next()).ToList();
                    if (randomPosao.Count >= 3)
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            posao = await PosaoQueries.DohvatiPosaoPoIdDB(_dbContext, randomPosao[j].PosaoId);
                            posaoTranslated = PosaoTranslator.Translate(posao);
                            randomPoslovi.Add(posaoTranslated);
                        }
                    }
                    else if (randomPosao.Count() != 0)
                    {
                        foreach (var item in randomPosao)
                        {
                            posao = await PosaoQueries.DohvatiPosaoPoIdDB(_dbContext, item.PosaoId);
                            posaoTranslated = PosaoTranslator.Translate(posao);
                            randomPoslovi.Add(posaoTranslated);
                        }
                    }
                    kategorijePoslovi.Add(Tuple.Create(randomKategorije[i], randomPoslovi.ToList()));
                    randomPoslovi.Clear();
                }
                return kategorijePoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata naumicnih kategorija i njihovih poslova!", ex);
            }
        }
    }
}
