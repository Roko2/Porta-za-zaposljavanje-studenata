namespace Dal.Classes
{
    public class PovijestPretraga
    {
        public int PovijestPretragaId { get; set; }
        public virtual Kategorija Kategorija{ get; set; }
        public virtual Korisnik Korisnik { get; set; }
        public DateTime DatumKreiranja { get; set; }
    }
}
