using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class PogodnostTranslator
    {
        public static PogodnostDTO Translate(Pogodnost item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                PogodnostDTO model = new PogodnostDTO()
                {
                    Id = item.PogodnostId,
                    Naziv= item.Naziv        
                };
                return model;
            }
        }

        public static List<PogodnostDTO> TranslateList(List<Pogodnost> list)
        {
            if (list == null)
            {
                return null;
            }
            else
            {
                List<PogodnostDTO> model = new List<PogodnostDTO>();
                foreach (var item in list)
                {
                    model.Add(Translate(item));
                }
                return model;
            }
        }
    }
}
