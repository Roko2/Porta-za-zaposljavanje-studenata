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
        private readonly IPosao _posaoManager;
        public KategorijaManager(AppDbContext context, IPosao posaoManager)
        {
            _dbContext = context;
            _posaoManager = posaoManager;
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
                Random rand = new();
                List<Tuple<KategorijaDTO, List<PosaoDTO>>> kategorijePoslovi = new List<Tuple<KategorijaDTO, List<PosaoDTO>>>();
                List<PosaoDTO> randomPoslovi = new List<PosaoDTO>();
                var kategorije = await DohvatiSveKategorije();
                var randomKategorije = kategorije.OrderBy(item => rand.Next()).ToList();
                for (int i = 0; i < 3; i++)
                {
                    PosaoDTO posao = new();
                    var posloviKategorije = await _posaoManager.DohvatiSvePoslovePoKategoriji(randomKategorije[i].Id);
                    var randomPosao = posloviKategorije.Where(x => x.Aktivan != null).OrderBy(item => rand.Next()).ToList();
                    if (randomPosao.Count >= 3)
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            posao = await _posaoManager.DohvatiPosaoPoId(randomPosao[j].PosaoId);
                            randomPoslovi.Add(posao);
                        }
                    }
                    else if (randomPosao.Count() != 0)
                    {
                        foreach (var item in randomPosao)
                        {
                            posao = await _posaoManager.DohvatiPosaoPoId(item.PosaoId);
                            randomPoslovi.Add(posao);
                        }
                    }
                    kategorijePoslovi.Add(Tuple.Create(randomKategorije[i], randomPoslovi.ToList()));
                    randomPoslovi.Clear();
                }
                return kategorijePoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata nasumicnih kategorija i njihovih poslova!", ex);
            }
        }

        public async Task<List<Tuple<KategorijaDTO, List<PosaoDTO>>>> DohvatiReferenciraneKategorijePoslove(List<int> kategorijeId)
        {
            try
            {
                List<Tuple<KategorijaDTO, List<PosaoDTO>>> kategorijePoslovi = new();
                var brojKategorija = kategorijeId.GroupBy(x => x).Select(x => new { Name = x.Key, Value = x.Count() }).OrderByDescending(x => x.Value);
                if (brojKategorija.Count() == 1)
                {
                    Random rand = new();
                    List<PosaoDTO> poslovi = new();
                    List<KategorijaDTO> kategorije = await DohvatiSveKategorije();
                    List<int> kategorijeIds = kategorije.Where(x => x.Id != brojKategorija.First().Name).Select(x => x.Id).ToList();
                    List<int> nasumicnoOdabraneKategorije = new();
                    int randomKategorijaId;

                    poslovi.AddRange(await _posaoManager.DohvatiSvePoslovePoKategoriji(brojKategorija.First().Name));
                    kategorijePoslovi.Add(Tuple.Create(await DohvatiKategorijuPoId(brojKategorija.First().Name), poslovi.Take(3).ToList()));
                    poslovi.Clear();        
                    for (int i = 0; i < 2; i++)
                    {
                        do
                        {
                            randomKategorijaId = kategorijeIds.OrderBy(item => rand.Next()).FirstOrDefault();
                        } while (nasumicnoOdabraneKategorije.Contains(randomKategorijaId));
                        nasumicnoOdabraneKategorije.Add(randomKategorijaId);
                        poslovi.AddRange(await _posaoManager.DohvatiSvePoslovePoKategoriji(randomKategorijaId));
                        kategorijePoslovi.Add(Tuple.Create(await DohvatiKategorijuPoId(randomKategorijaId), poslovi.Take(3).ToList()));
                        poslovi.Clear();
                    }
                    kategorijePoslovi.OrderByDescending(x => x.Item2);
                }
                else if (brojKategorija.Count() == 2)
                {
                    List<PosaoDTO> poslovi = new();
                    List<KategorijaDTO> kategorije = await DohvatiSveKategorije();
                    foreach (var kategorija in brojKategorija)
                    {
                        poslovi.AddRange(await _posaoManager.DohvatiSvePoslovePoKategoriji(kategorija.Name));
                        kategorijePoslovi.Add(Tuple.Create(await DohvatiKategorijuPoId(kategorija.Name), poslovi.Take(3).ToList()));
                        poslovi.Clear();
                    }

                    var kategorijaIdKojaNijeOdabrana = kategorije.Where(x => !brojKategorija.Select(y => y.Name).ToList().Contains(x.Id)).First().Id;
                    var posloviKategorijeKojaNijeOdabrana = await _posaoManager.DohvatiSvePoslovePoKategoriji(kategorijaIdKojaNijeOdabrana);
                    kategorijePoslovi.Add(Tuple.Create(await DohvatiKategorijuPoId(kategorijaIdKojaNijeOdabrana), posloviKategorijeKojaNijeOdabrana.Take(3).ToList()));
                    kategorijePoslovi.OrderByDescending(x => x.Item2);
                }
                else
                {
                    List<PosaoDTO> poslovi = new();
                    foreach (var item in brojKategorija.Select((value, index) => (index, value)))
                    {
                        if (item.index < 3)
                        {
                            poslovi.AddRange(await _posaoManager.DohvatiSvePoslovePoKategoriji(item.value.Name));
                            kategorijePoslovi.Add(Tuple.Create(await DohvatiKategorijuPoId(item.value.Name), poslovi.Take(3).ToList()));
                            poslovi.Clear();
                        }
                    }
                    kategorijePoslovi.OrderByDescending(x => x.Item2);
                }

                return kategorijePoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata referenciranih kategorija i njihovih poslova!", ex);
            }
        }

        public async Task<int> DohvatiKategorijuIdPoPosaoId(int posaoId)
        {
            try
            {
                return await KategorijaQueries.DohvatiKategorijuIdPoPosaoIdDB(_dbContext, posaoId);
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvaćanja kategorije po ID!", ex);
            }
        }
    }
}
