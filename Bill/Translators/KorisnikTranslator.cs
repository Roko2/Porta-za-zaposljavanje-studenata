using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class KorisnikTranslator
    {
        public static Korisnik TranslateDB(KorisnikDTO item)
        {
            if(item == null)
            {
                return null;
            }
            else
            {
                Korisnik model = new Korisnik()
                {
                    Adresa = item.Adresa,
                    Email = item.Email,
                    Ime = item.Ime,
                    Prezime = item.Prezime,
                    Sub = item.Sub
                };
                return model;
            }
        }
    }
}
