using Bill.Dto;
using Bill.Services;
using Microsoft.AspNetCore.Mvc;
using System.Web.Http.Cors;

namespace VUVZaposliSe_BackEnd.Controllers
{
    [EnableCors(origins: "https://localhost:3000", headers: "*", methods: "*")]
    public class KorisnikController:Controller
    {
        private readonly IKorisnik _korisnikManager;

        public KorisnikController(IKorisnik korisnikManager)
        {
            _korisnikManager = korisnikManager;
        }
        [HttpPost("DodajNovogKorisnika")]
        public async Task<IActionResult> DodajNovogKorisnika([FromBody] KorisnikDTO korisnik)
        {
            try
            {
                await _korisnikManager.DodajNovogKorisnika(korisnik);
                return Ok();
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("Korisnik/{korisnikSub}")]
        public async Task<IActionResult> DohvatiKorisnikIdPoSub(string korisnikSub)
        {
            try
            {       
                return Ok(await _korisnikManager.DohvatiKorisnikIdPoSub(korisnikSub));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
