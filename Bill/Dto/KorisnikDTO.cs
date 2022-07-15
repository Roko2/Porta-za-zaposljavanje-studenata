using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class KorisnikDTO
    {
        public int KorisnikId { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string? Adresa { get; set; }
        public string Email { get; set; }
        public string Sub { get; set; }
    }
}
