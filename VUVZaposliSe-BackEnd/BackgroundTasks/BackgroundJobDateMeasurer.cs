using Bill.Services;
using Microsoft.AspNetCore.Mvc;

namespace VUVZaposliSe_BackEnd.BackgroundTasks
{
    public class BackgroundJobDateMeasurer: BackgroundService
    {
        private readonly IBackgroundTask worker;
        public BackgroundJobDateMeasurer(IBackgroundTask worker)
        {
            this.worker = worker;
        }
        protected override async Task ExecuteAsync(CancellationToken cancellationToken)
        {
            await worker.RacunajDatumPosla(cancellationToken);
        }
    }
}
