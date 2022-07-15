using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Dal.Classes
{
    public class Posao
    {
        public Posao()
        {
            Vjestine = new HashSet<Vjestina>();
            Pogodnosti = new HashSet<Pogodnost>();
        }
        public int PosaoId { get; set; }
        [Column(TypeName = "varchar(MAX)")]
        [MaxLength]
        public string Opis { get; set; }
        public string Naziv { get; set; }
        public DateTime DatumAktivnosti { get; set; }
        public string Lokacija { get; set; }
        public int BrojRadnika { get; set; } = 1;
        [Precision(10,2)]
        public decimal Satnica { get; set; }
        public bool? Aktivan  { get; set; }
        public virtual Kategorija Kategorija { get; set; }
        public virtual Grad Grad { get; set; }
        public virtual Poslodavac Poslodavac { get; set; }
        public virtual ICollection<Vjestina> Vjestine { get; set; }
        public virtual ICollection<Pogodnost> Pogodnosti { get; set; }
    }
}
