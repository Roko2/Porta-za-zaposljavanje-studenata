using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.Controllers
{
    public class FavoritController:Controller
    {
        private readonly IFavorit _favoritManager;
        public FavoritController(IFavorit favoritManager)
        {
            _favoritManager = favoritManager;
        }
        [HttpGet("PosloviFavoriti")]
        public async Task<IActionResult> DohvatiPosloveFavoriteKorisnika(int korisnikId)
        {
            try
            {
                return Ok(await _favoritManager.DohvatiPosloveFavoriteKorisnika(korisnikId));
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
