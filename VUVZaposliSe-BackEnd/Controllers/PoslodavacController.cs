using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.Controllers
{
    public class PoslodavacController:Controller
    {
        private readonly IPoslodavac _poslodavacManager;

        public PoslodavacController(IPoslodavac poslodavacManager)
        {
            _poslodavacManager = poslodavacManager;
        }

        [HttpGet("Poslodavci/{id}")]
        public async Task<IActionResult> DohvatiPoslodavcaPoId(int id)
        {
            try
            {
                var poslodavac = await _poslodavacManager.DohvatiPoslodavcaPoId(id);
                return Ok(poslodavac);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet("Poslodavci")]
        public async Task<IActionResult> DohvatiSvePoslodavce()
        {
            try
            {
                var poslodavci = await _poslodavacManager.DohvatiSvePoslodavce();
                return Ok(poslodavci);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
