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
        [HttpGet("ReferentneKategorijePoslovi")]
        public async Task<IActionResult> DohvatiReferentneKategorijeIPoslove([FromQuery] List<int> kategorijeIds)
        {
            try
            {
                List<Tuple<KategorijaDTO, List<PosaoDTO>>> kategorijaPoslovi = new();
                if (kategorijeIds == null)
                {
                    kategorijaPoslovi = await _kategorijaManager.DohvatiNasumicneKategorijeIPoslove();
                }
                else
                {
                    kategorijaPoslovi = await _kategorijaManager.DohvatiReferenciraneKategorijePoslove(kategorijeIds);
                }
                return Ok(kategorijaPoslovi);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
