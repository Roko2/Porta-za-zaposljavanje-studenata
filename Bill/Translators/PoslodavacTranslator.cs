using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class PoslodavacTranslator
    {
        public static PoslodavacDTO Translate(Poslodavac item)
        {
            if(item == null)
            {
                return null;
            }
            else
            {
                PoslodavacDTO model = new PoslodavacDTO()
                {
                    Id = item.PoslodavacId,
                    Naziv = item.Naziv,
                    Sjediste = item.Sjediste,
                    Oib = item.Oib,
                    Email = item.Email,
                    Telefon = item.Telefon,
                };
                return model;
            }
        }

        public static List<PoslodavacDTO> TranslateList(List<Poslodavac> list)
        {
            if (list == null)
            {
                return null;
            }
            else
            {
                List<PoslodavacDTO> model = new List<PoslodavacDTO>();
                foreach(var item in list)
                {
                    model.Add(Translate(item));
                }
                return model;
            }
        }
    }
}
