using Bill.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Services
{
    public interface ICodeList
    {
        Task<List<string>> DohvatiLokacijePoslova();
        Task<List<VjestinaDTO>> DohvatiVjestine();
        Task<List<PogodnostDTO>> DohvatiPogodnosti();
    }
}
