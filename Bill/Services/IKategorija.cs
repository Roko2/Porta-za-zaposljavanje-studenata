using Bill.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Services
{
    public interface IKategorija
    {
        Task<List<KategorijaDTO>> DohvatiSveKategorije();
        Task<KategorijaDTO> DohvatiKategorijuPoId(int kategorijaId);
        Task<List<Tuple<KategorijaDTO, List<PosaoDTO>>>> DohvatiNasumicneKategorijeIPoslove();
        Task<List<Tuple<KategorijaDTO,List<PosaoDTO>>>> DohvatiReferenciraneKategorijePoslove(List<int> kategorijeId);
        Task<int> DohvatiKategorijuIdPoPosaoId(int posaoId);
    }
}
