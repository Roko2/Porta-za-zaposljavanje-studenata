using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Classes
{
    public class Favorit
    { 
        public int Id { get; set; }
        public virtual Posao Posao { get; set; }
        public virtual Korisnik Korisnik { get; set; }
    }
}
