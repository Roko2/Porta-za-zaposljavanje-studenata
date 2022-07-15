using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Classes
{
    public class Korisnik
    {
        public Korisnik()
        {
            Favoriti = new HashSet<Favorit>();
        }
        public int KorisnikId { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string? Adresa { get; set; }
        public string Email { get; set; }
        public string Sub { get; set; }
        public virtual ICollection<Favorit> Favoriti { get; set; }
    }
}
