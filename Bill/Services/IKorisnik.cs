using Bill.Dto;

namespace Bill.Services
{
    public interface IKorisnik
    {
       Task DodajNovogKorisnika(KorisnikDTO korisnik);
        Task<int> DohvatiKorisnikIdPoSub(string korisnikSub);
    }
}
