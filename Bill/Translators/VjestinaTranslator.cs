using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class VjestinaTranslator
    {
        public static VjestinaDTO Translate(Vjestina item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                VjestinaDTO model = new VjestinaDTO()
                {
                    Id = item.VjestinaId,
                    Naziv = item.Naziv
                };
                return model;
            }
        }

        public static List<VjestinaDTO> TranslateList(List<Vjestina> list)
        {
            if (list == null)
            {
                return null;
            }
            else
            {
                List<VjestinaDTO> model = new List<VjestinaDTO>();
                foreach (var item in list)
                {
                    model.Add(Translate(item));
                }
                return model;
            }
        }
    }
}
