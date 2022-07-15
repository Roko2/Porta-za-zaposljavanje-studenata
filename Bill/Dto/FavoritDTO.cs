using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class FavoritDTO
    {
        public int PosaoId { get; set; }
        public string Naziv { get; set; }
        public string Opis { get; set; }
        public PoslodavacDTO Poslodavac { get; set; }
    }
}
