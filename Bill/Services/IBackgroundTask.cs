﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Services
{
    public interface IBackgroundTask
    {
        Task RacunajDatumPosla(CancellationToken cancellationToken);
    }
}
