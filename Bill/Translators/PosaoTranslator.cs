using Bill.Dto;
using Dal.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Translators
{
    public class PosaoTranslator
    {
        public static List<PosaoDTO> TranslateList(List<Posao> item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                List<PosaoDTO> model = new List<PosaoDTO>();
                foreach (var posao in item)
                {
                    model.Add(Translate(posao));
                }

                return model;
            }
        }

        public static PosaoDTO Translate(Posao item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                PosaoDTO model = new PosaoDTO()
                {
                    PosaoId = item.PosaoId,
                    DatumAktivnosti= item.DatumAktivnosti.ToShortDateString(),
                    BrojRadnika= item.BrojRadnika,
                    Lokacija= item.Lokacija,
                    Opis = item.Opis,
                    Satnica = item.Satnica,
                    Aktivan = item.Aktivan,
                    Naziv = item.Naziv,
                    Grad = GradTranslator.Translate(item.Grad),
                    Kategorija = KategorijaTranslator.Translate(item.Kategorija),
                    Poslodavac = PoslodavacTranslator.Translate(item.Poslodavac),
                    Pogodnosti = PogodnostTranslator.TranslateList(item.Pogodnosti.ToList()),
                    Vjestine = VjestinaTranslator.TranslateList(item.Vjestine.ToList())
                };
                return model;
            }
        }
        public static List<PosaoPretragaDTO> SearchTranslateList(List<Posao> item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                List<PosaoPretragaDTO> model = new List<PosaoPretragaDTO>();
                foreach (var posao in item)
                {
                    model.Add(SearchTranslate(posao));
                }

                return model;
            }

        }
        public static PosaoPretragaDTO SearchTranslate(Posao item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                PosaoPretragaDTO model = new PosaoPretragaDTO()
                {
                    PosaoId = item.PosaoId,
                    Naziv = item.Naziv,
                    Opis = item.Opis,
                    Poslodavac = PoslodavacTranslator.Translate(item.Poslodavac),
                };
                return model;
            }
        }
        public static SvojstvaPretrage SearchSvojstvaTranslateDB(SvojstvaPretrageDTO item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                SvojstvaPretrage model = new SvojstvaPretrage()
                {
                    GradId = item.GradId,
                    Naziv = item.Naziv,
                    Kategorije = item.Kategorije,
                    Poslodavci = item.Poslodavci,
                    Pogodnosti = item.Pogodnosti,
                    Vjestine = item.Vjestine,
                };
                return model;
            }
        }
        public static PosaoFavorit PosaoFavoritiTranslateDB(PosaoFavoritDTO item)
        {
            if (item == null)
            {
                return null;
            }
            else
            {
                PosaoFavorit model = new PosaoFavorit()
                {
                    KorisnikId = item.KorisnikId,
                    PosaoId = item.PosaoId,
                };
                return model;
            }
        }
    }
}
