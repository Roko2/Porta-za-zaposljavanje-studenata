using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Classes
{
    public class SvojstvaPretrage
    {
        public int GradId { get; set; }
        public string Naziv { get; set; }
        public List<int> Vjestine { get; set; }
        public List<int> Pogodnosti { get; set; }
        public List<int> Kategorije { get; set; }
        public List<int> Poslodavci { get; set; }
    }
}
