using Bill.Dto;
using Bill.Services;
using Bill.Translators;
using Common;
using Dal.Classes;
using Dal.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Managers
{
    public class PosaoManager : IPosao
    {
        private readonly AppDbContext _dbContext;

        public PosaoManager(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<List<PosaoDTO>> DohvatiSvePoslove()
        {
            try
            {
                var lPosloviDB = await PosaoQueries.DohvatiSvePosloveDB(_dbContext);
                var lPoslovi = PosaoTranslator.TranslateList(lPosloviDB);
                return lPoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata svih poslova!", ex);
            }
        }
        public async Task<List<PosaoDTO>> DohvatiSvePoslovePoKategoriji(int kategorijaId)
        {
            try
            {
                var lPosloviDB = await PosaoQueries.DohvatiSvePoslovePoKategorijiDB(_dbContext, kategorijaId);
                var lPoslovi = PosaoTranslator.TranslateList(lPosloviDB);
                return lPoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id kategorije!", ex);
            }
        }
        public async Task<PosaoDTO> DohvatiPosaoPoId(int posaoId)
        {
            try
            {
                var posaoDB = await PosaoQueries.DohvatiPosaoPoIdDB(_dbContext, posaoId);
                var posao = PosaoTranslator.Translate(posaoDB);
                return posao;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id posla!", ex);
            }
        }
        public async Task<List<PosaoDTO>> DohvatiSvePoslovePoPoslodavacId(int poslodavacId)
        {
            try
            {
                var lPosloviDB = await PosaoQueries.DohvatiSvePoslovePoPoslodavacIdDB(_dbContext, poslodavacId);
                var lPoslovi = PosaoTranslator.TranslateList(lPosloviDB);
                return lPoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id poslodavca !", ex);
            }
        }

        public async Task<List<PosaoPretragaDTO>> PretraziPoslove(SvojstvaPretrageDTO svojstva)
        {
            try
            {
                var translatedSvojstva = PosaoTranslator.SearchSvojstvaTranslateDB(svojstva);
                var lPretrazeniPosloviDB = await PosaoQueries.PretraziPoslove(_dbContext, translatedSvojstva);
                var lPretrazeniPoslovi = PosaoTranslator.SearchTranslateList(lPretrazeniPosloviDB);
                return lPretrazeniPoslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se pogreška kod pretrage poslova!", ex);
            }
        }
        public async Task<TipIzmjeneFavoritaEnum> DodajPosaoZaFavorita(PosaoFavoritDTO posaoFavorit)
        {
            try
            {
                var posaoFavoritTranslated = PosaoTranslator.PosaoFavoritiTranslateDB(posaoFavorit);
                var isKorisnikPosaoFavorit = await PosaoQueries.ProvjeriPosaoJeKorisnikovFavorit(_dbContext, posaoFavoritTranslated);
                if (!isKorisnikPosaoFavorit)
                {
                    return await PosaoQueries.DodajPosaoZaFavorita(_dbContext, posaoFavoritTranslated);
                }
                else
                {
                    return await PosaoQueries.ObrisiPosaoZaFavorita(_dbContext, posaoFavoritTranslated);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se pogreška kod favorita poslova!", ex);
            }
        }
        public async Task<bool> ProvjeriPosaoJeKorisnikovFavorit(PosaoFavoritDTO posaoFavorit)
        {
            try
            {
                var posaoFavoritTranslated = PosaoTranslator.PosaoFavoritiTranslateDB(posaoFavorit);
                return await PosaoQueries.ProvjeriPosaoJeKorisnikovFavorit(_dbContext, posaoFavoritTranslated);

            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se pogreška kod favorita poslova!", ex);
            }
        }
    }
}

