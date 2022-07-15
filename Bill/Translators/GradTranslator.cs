using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class GradTranslator
    {
        public static GradDTO Translate(Grad item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                GradDTO model = new GradDTO
                {
                    GradId = item.GradId,
                    Naziv = item.Naziv
                };
                return model;
            }
        }
    }
}
