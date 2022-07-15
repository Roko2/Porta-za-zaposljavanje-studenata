using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class KategorijaTranslator
    {
        public static List<KategorijaDTO> TranslateList(List<Kategorija> item)
        {
            if(item == null)
            {
                return null;
            }
            else
            {
                List<KategorijaDTO> model = new List<KategorijaDTO>();
                foreach(var kategorija in item)
                {
                    model.Add(Translate(kategorija));
                }
                
                return model;
            }
        }
        
        public static KategorijaDTO Translate(Kategorija item)
        {
            if(item == null)
            {
                return null;
            }
            else
            {
                KategorijaDTO model = new KategorijaDTO()
                {
                    Id = item.KategorijaId,
                    Naziv = item.Naziv
                };
                return model;
            }
        }
    }
}
