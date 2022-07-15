using Bill.Dto;
using Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Services
{
    public interface IPosao
    {
        Task<List<PosaoDTO>> DohvatiSvePoslove();
        Task<List<PosaoDTO>> DohvatiSvePoslovePoKategoriji(int kategorijaId);
        Task<PosaoDTO> DohvatiPosaoPoId(int posaoId);
        Task<List<PosaoDTO>> DohvatiSvePoslovePoPoslodavacId(int poslodavacId);
        Task<List<PosaoPretragaDTO>> PretraziPoslove(SvojstvaPretrageDTO svojstva);
        Task<TipIzmjeneFavoritaEnum> DodajPosaoZaFavorita(PosaoFavoritDTO posaoFavorit);
        Task<bool> ProvjeriPosaoJeKorisnikovFavorit(PosaoFavoritDTO posaoFavorit);
    }
}
