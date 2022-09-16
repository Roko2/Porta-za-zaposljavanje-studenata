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

        [HttpGet("PosaljiEmail")]
        public async Task<IActionResult> PosaljiEmail(EmailPrivatniPodaci data)
        {
            try
            {
            var message = new EmailPoruka(data.Primatelj, data.Predmet, data.Sadrzaj);
            await _emailManager.PosaljiEmail(message);
            return Ok();
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
