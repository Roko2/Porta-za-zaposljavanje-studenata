using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Dto
{
    public class PoslodavacDTO
    {
        public int Id { get; set; }
        public string Naziv { get; set; }
        public string Sjediste { get; set; }
        public string Oib { get; set; }

        public string Telefon { get; set; }
        public string Email { get; set; }
        public string CheckOib(string oib)
        {
            if (oib == null) { return "Oib ne može biti prazan!"; }
            else if (oib.Trim().Length == 0) { return "Oib ne može biti prazan!"; }
            else if (oib.Trim().Length != 11) { return "Oib mora imati 11 znamenaka!"; }
            else
            {
                return oib;
            }
        }
    }
}
