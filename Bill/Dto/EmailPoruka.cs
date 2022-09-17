using Microsoft.AspNetCore.Http;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class EmailPoruka
    {
        public string Primatelj { get; set; }
        public string Predmet { get; set; }
        public string Sadrzaj { get; set; }
        public IFormFile Prilog { get; set; }
    }
}
