using Bill.Dto;
using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.Controllers
{
    public class EmailController:Controller
    {
        private readonly IEmailSender _emailManager;

        public EmailController(IEmailSender emailManager)
        {
            _emailManager = emailManager;
        }

        [HttpPost("PosaljiEmail")]
        public async Task<IActionResult> PosaljiEmail([FromForm]EmailPoruka data)
        {
            try
            {
            await _emailManager.PosaljiEmail(data);
            return Ok();
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
