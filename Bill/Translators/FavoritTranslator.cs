using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class FavoritTranslator
    {
        public static List<FavoritDTO> TranslateList(List<Posao> item)
        {
            if(item == null) return null;
            List<FavoritDTO> model = new List<FavoritDTO>();
            foreach(var posao in item)
            {
                model.Add(Translate(posao));
            }
            return model;
        }
        public static FavoritDTO Translate(Posao item)
        {
            if(item == null) return null;
            FavoritDTO model = new FavoritDTO
            {
                PosaoId = item.PosaoId,
                Naziv = item.Naziv,
                Opis = item.Opis,
                Poslodavac = PoslodavacTranslator.Translate(item.Poslodavac)

            };
            return model;
        }
    }
}
