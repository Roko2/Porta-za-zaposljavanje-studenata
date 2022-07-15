namespace Dal.Classes
{
    public class Komentar
    {
        public int KomentarId { get; set; }
        public string Tekst { get; set; }
        public virtual Korisnik Korisnik { get; set; }
        public virtual Posao Posao{ get; set; }
    }
}
