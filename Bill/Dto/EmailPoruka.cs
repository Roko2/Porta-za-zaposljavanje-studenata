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
        public EmailPoruka(string primatelj, string predmet, string sadrzaj)
        {
            Primatelj = primatelj;
            Predmet = predmet;
            Sadrzaj = sadrzaj;
        }
    }
}
