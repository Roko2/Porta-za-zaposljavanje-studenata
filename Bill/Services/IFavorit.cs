using Bill.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Services
{
    public interface IFavorit
    {
        Task <List<FavoritDTO>> DohvatiPosloveFavoriteKorisnika(int korisnikId);
    }
}
