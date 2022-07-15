using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class PosaoDTO
    {
        public PosaoDTO()
        {
            Vjestine = new HashSet<VjestinaDTO>();
            Pogodnosti = new HashSet<PogodnostDTO>();
        }
        public int PosaoId { get; set; }
        public string Opis { get; set; }
        public string DatumAktivnosti { get; set; }
        public string Lokacija { get; set; }
        public int BrojRadnika { get; set; } = 1;
        public decimal Satnica { get; set; }
        public bool? Aktivan { get; set; }
        public string Naziv { get; set; }
        public GradDTO Grad { get; set; }
        public KategorijaDTO Kategorija { get; set; }
        public PoslodavacDTO Poslodavac { get; set; }
        public ICollection<VjestinaDTO> Vjestine { get; set; }
        public ICollection<PogodnostDTO> Pogodnosti { get; set; }
    }
}
