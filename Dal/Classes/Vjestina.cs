namespace Dal.Classes
{
    public class Vjestina
    {
        public Vjestina()
        {
            Poslovi = new HashSet<Posao>();
        }
        public int VjestinaId { get; set; }
        public string Naziv { get; set; }
        public virtual ICollection<Posao> Poslovi { get; set; }
    }
}
