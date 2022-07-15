using Bill.Services;
using Dal.Classes;
using Dal.Queries;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics;

namespace Bill.Managers
{
    public class BackgroundJobTask : IBackgroundTask
    {
        private readonly IServiceScopeFactory scopeFactory;
        public BackgroundJobTask(IServiceScopeFactory scopeFactory)
        {
            this.scopeFactory = scopeFactory;
        }
        public async Task RacunajDatumPosla(CancellationToken cancellationToken)
        {
            while (!cancellationToken.IsCancellationRequested)
            {
                using (var scope = scopeFactory.CreateScope())
                {
                    var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
                    int hourSpan = 24 - DateTime.Now.Hour;
                    int numberOfHours = hourSpan;
                    if (hourSpan == 24)
                    {
                        await BackgroundTaskQueries.PromijeniStatusPoslova(dbContext);
                        numberOfHours = 24;
                    }
                    //ako se doda parametar cancellationToken u konstruktor od delay-a onda se bilo gdje u programu postavljanjem vrijednosti cancellationToken prekida thread tj background task
                    await Task.Delay(TimeSpan.FromHours(numberOfHours));
                }
            }
        }


    }
}
