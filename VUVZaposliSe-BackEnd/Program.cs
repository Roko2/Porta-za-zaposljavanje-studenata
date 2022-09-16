using Bill.Managers;
using Bill.Services;
using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;
using VUVZaposliSe_BackEnd.BackgroundTasks;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//sprječavanja cirkularnog exceptiona na tablicama kod many to many relacija (opcionalno ako dode do errora)
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<AppDbContext> (option =>
        option.UseSqlServer(builder.Configuration.GetConnectionString("default")));
builder.Services.AddScoped<IKategorija, KategorijaManager>();
builder.Services.AddScoped<IPoslodavac, PoslodavacManager>();
builder.Services.AddScoped<IPosao, PosaoManager>();
builder.Services.AddScoped<IKorisnik, KorisnikManager>();
builder.Services.AddScoped<ICodeList, CodeListManager>();
builder.Services.AddSingleton<IBackgroundTask, BackgroundJobTask>();
builder.Services.AddHostedService<BackgroundJobDateMeasurer>();
builder.Services.AddScoped<IFavorit, FavoritManager>();
builder.Services.AddScoped<IEmailSender, EmailManager>();
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "originRules",
                      policy =>
                      {
                          policy.AllowAnyHeader();
                          policy.AllowAnyOrigin();
                          policy.AllowAnyMethod();
                      });
});
var app = builder.Build();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();

app.UseAuthorization();
app.UseCors("originRules");
app.MapControllers();

app.Run();
