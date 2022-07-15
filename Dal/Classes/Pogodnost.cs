namespace Dal.Classes
{
    public class Pogodnost
    {
        public Pogodnost()
        {
            Poslovi = new HashSet<Posao>();
        }
        public int PogodnostId { get; set; }
        public string Naziv { get; set; }
        public virtual ICollection<Posao> Poslovi { get; set; }
    }
}
