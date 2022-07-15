using Bill.Dto;
using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.Controllers
{
    public class KategorijaController : Controller
    {
        private readonly IKategorija _kategorijaManager;
        public KategorijaController(IKategorija kategorijaManger)
        {
            _kategorijaManager = kategorijaManger;
        }
        [HttpGet("Kategorije")]
        public async Task<IActionResult> DohvatiSveKategorije()
        {
            try
            {
            var lKategorije= await _kategorijaManager.DohvatiSveKategorije();
            return Ok(lKategorije);
                
            }
            catch(Exception ex)
            {
               return BadRequest(ex.Message);
            }
        }

        [HttpGet("Kategorije/{kategorijaId}")]
        public async Task<IActionResult> DohvatiKategorijuPoId(int kategorijaId)
        {
            try
            {
                var kategorija = await _kategorijaManager.DohvatiKategorijuPoId(kategorijaId);
                return Ok(kategorija);
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("KategorijePoslovi")]
        public async Task<IActionResult> DohvatiNasumicneKategorijeIPoslove()
        {
            try
            {
                List<Tuple<KategorijaDTO,List<PosaoDTO>>> kategorijaPoslovi = await _kategorijaManager.DohvatiNasumicneKategorijeIPoslove();
                return Ok(kategorijaPoslovi);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
