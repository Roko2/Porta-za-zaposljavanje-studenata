using Bill.Dto;
using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.Controllers
{
    public class PosaoController:Controller
    {
        private readonly IPosao _posaoManager;
        private readonly ICodeList _codeListManager;

        public PosaoController(IPosao posaoManager, ICodeList codeListManager)
        {
            _posaoManager = posaoManager;
            _codeListManager = codeListManager;
        }

        [HttpGet("Poslovi")]
        public async Task<IActionResult> DohvatiSvePoslove()
        {
            try
            {
                var lPoslovi = await _posaoManager.DohvatiSvePoslove();
                return Ok(lPoslovi);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("PosloviKategorije/{kategorijaId}")]
        public async Task<IActionResult> DohvatiSvePoslovePoKategorijaId(int kategorijaId)
        {
            try
            {
                var lPosloviKategorije = await _posaoManager.DohvatiSvePoslovePoKategoriji(kategorijaId);
                return Ok(lPosloviKategorije);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Poslovi/{posaoId}")]
        public async Task<IActionResult> DohvatiSvePoslovePoPosaoId(int posaoId)
        {
            try
            {
                var posao = await _posaoManager.DohvatiPosaoPoId(posaoId);
                return Ok(posao);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("PosloviPoslodavac/{poslodavacId}")]
        public async Task<IActionResult> DohvatiSvePoslovePoPoslodavacId(int poslodavacId)
        {
            try
            {
                var posao = await _posaoManager.DohvatiSvePoslovePoPoslodavacId(poslodavacId);
                return Ok(posao);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("Lokacije")]
        public async Task<IActionResult> DohvatiLokacijePoslova()
        {
            try
            {
                var lokacije = await _codeListManager.DohvatiLokacijePoslova();
                return Ok(lokacije);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("Vjestine")]
        public async Task<IActionResult> DohvatiVjestine()
        {
            try
            {
                var vjestine = await _codeListManager.DohvatiVjestine();
                return Ok(vjestine);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("Pogodnosti")]
        public async Task<IActionResult> DohvatiPogodnosti()
        {
            try
            {
                var pogodnosti = await _codeListManager.DohvatiPogodnosti();
                return Ok(pogodnosti);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("PosloviSearch")]
        public async Task<IActionResult> PretraziPoslove([FromQuery] SvojstvaPretrageDTO svojstva )
        {
            try
            {
                var rezultatPretrage = await _posaoManager.PretraziPoslove(svojstva);
                return Ok(rezultatPretrage);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("PosaoFavorit")]
        public async Task<IActionResult> DodajPosaoZaFavorita([FromBody] PosaoFavoritDTO posaoFavorit)
        {
            try
            {
                return Ok(await _posaoManager.DodajPosaoZaFavorita(posaoFavorit));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("PosaoIsFavorit")]
        public async Task<IActionResult> ProvjeriPosaoJeKorisnikovFavorit(PosaoFavoritDTO posaoFavorit)
        {
            try
            {
                return Ok(await _posaoManager.ProvjeriPosaoJeKorisnikovFavorit(posaoFavorit));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
