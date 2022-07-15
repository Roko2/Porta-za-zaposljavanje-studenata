using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class VjestinaDTO
    {
        public VjestinaDTO()
        {
            Poslovi = new HashSet<PosaoDTO>();
        }
        public int Id { get; set; }
        public string Naziv { get; set; }
        public ICollection<PosaoDTO> Poslovi { get; set; }
    }
}
