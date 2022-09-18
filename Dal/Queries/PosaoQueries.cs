using Common;
using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Queries
{
    public class PosaoQueries
    {
        public static async Task<List<Posao>> DohvatiSvePosloveDB(AppDbContext dbContext)
        {
            try
            {
                return await dbContext.Poslovi.Include(x => x.Kategorija)
                                               .Include(x => x.Poslodavac)
                                               .Include(x => x.Vjestine)
                                               .Include(x => x.Pogodnosti)
                                               .Select(x => x).Where(x=>x.Aktivan==true).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata svih poslova na razini baze!", ex);
            }
        }

        public static async Task<List<Posao>> DohvatiSvePoslovePoKategorijiDB(AppDbContext dbContext, int kategorijaId)
        {
            try
            {
                return await dbContext.Poslovi.Include(x => x.Kategorija)
                                               .Include(x => x.Poslodavac)
                                               .Include(x => x.Vjestine)
                                               .Include(x => x.Pogodnosti)
                                               .Where(x => x.Kategorija.KategorijaId == kategorijaId && x.Aktivan == true).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id kategorije na razini baze!", ex);
            }
        }
        public static async Task<Posao> DohvatiPosaoPoIdDB(AppDbContext dbContext, int posaoId)
        {
            try
            {
                return await dbContext.Poslovi.Include(x => x.Kategorija)
                                               .Include(x => x.Poslodavac)
                                               .Include(x => x.Vjestine)
                                               .Include(x => x.Pogodnosti)
                                               .Where(x => x.PosaoId == posaoId).FirstAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id posla na razini baze!", ex);
            }
        }
        public static async Task<List<Posao>> DohvatiSvePoslovePoPoslodavacIdDB(AppDbContext dbContext, int poslodavacId)
        {
            try
            {
                return await dbContext.Poslovi.Include(x => x.Kategorija)
                                               .Include(x => x.Poslodavac)
                                               .Include(x => x.Vjestine)
                                               .Include(x => x.Pogodnosti)
                                               .Where(x => x.Poslodavac.PoslodavacId == poslodavacId).ToListAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dohvata posla po id poslodavca na razini baze!", ex);
            }
        }

        public static async Task<List<Posao>> PretraziPoslove(AppDbContext dbContext, SvojstvaPretrage svojstva)
        {
            try
            {
                var poslovi = await dbContext.Poslovi.Include(x => x.Kategorija)
                                               .Include(x => x.Poslodavac)
                                               .Include(x => x.Vjestine)
                                               .Include(x => x.Pogodnosti)
                                               .Include(x=>x.Grad)
                                               .Select(x => x).Where(x=>x.Aktivan==true).ToListAsync();
                if(svojstva == null) {
                    return poslovi;
                }
                if (svojstva.Naziv != null && svojstva.Naziv != "undefined" && svojstva.Naziv != "")
                {
                    poslovi = poslovi.Where(x => x.Naziv.Trim().ToLower().Contains(svojstva.Naziv.Trim().ToLower()) || x.Opis.Trim().ToLower().Contains(svojstva.Naziv.Trim().ToLower())).ToList();
                }

                if (svojstva.Vjestine != null && svojstva.Vjestine.Any())
                {
                    poslovi = poslovi.Where(x => x.Vjestine.Any(y => svojstva.Vjestine.Contains(y.VjestinaId))).ToList();
                }

                if (svojstva.Pogodnosti != null && svojstva.Pogodnosti.Any())
                {
                    poslovi = poslovi.Where(x => x.Pogodnosti.Any(y => svojstva.Pogodnosti.Contains(y.PogodnostId))).ToList();
                }

                if (svojstva.Kategorije != null && svojstva.Kategorije.Any())
                {
                    poslovi = poslovi.Where(x => svojstva.Kategorije.Contains(x.Kategorija.KategorijaId)).ToList();
                }

                if (svojstva.Poslodavci != null && svojstva.Poslodavci.Any())
                {
                    poslovi = poslovi.Where(x => svojstva.Poslodavci.Contains(x.Poslodavac.PoslodavacId)).ToList();
                }

                if (svojstva.GradId != null && svojstva.GradId != 0)
                {
                    poslovi = poslovi.Where(x => x.Grad.GradId == svojstva.GradId).ToList();
                }

                return poslovi;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom pretrage poslova na razini baze.", ex);
            }
        }
        public static async Task<TipIzmjeneFavoritaEnum> DodajPosaoZaFavorita(AppDbContext dbContext, PosaoFavorit posaoFavorit)
        {
            try
            {
                Favorit favorit = new Favorit();
                favorit.Posao = await dbContext.Poslovi.FirstAsync(x => x.PosaoId == posaoFavorit.PosaoId);
                favorit.Korisnik = await dbContext.Korisnici.FirstAsync(x => x.KorisnikId == posaoFavorit.KorisnikId);
                dbContext.Favoriti.Add(favorit);
                await dbContext.SaveChangesAsync();
                return TipIzmjeneFavoritaEnum.DodanFavorit;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom dodavanja favorita na razini baze!", ex);
            }
        }
        public static async Task<TipIzmjeneFavoritaEnum> ObrisiPosaoZaFavorita(AppDbContext dbContext, PosaoFavorit posaoFavorit)
        {
            try
            {
                Favorit favorit = await dbContext.Favoriti.Where(x => x.Posao.PosaoId == posaoFavorit.PosaoId && x.Korisnik.KorisnikId == posaoFavorit.KorisnikId).FirstAsync();
                dbContext.Favoriti.Remove(favorit);
                await dbContext.SaveChangesAsync();
                return TipIzmjeneFavoritaEnum.ObrisanFavorit;
            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom brisanja favorita na razini baze!", ex);
            }
        }
        public static async Task<bool> ProvjeriPosaoJeKorisnikovFavorit(AppDbContext dbContext, PosaoFavorit posaoFavorit)
        {
            try
            {
                 return await dbContext.Korisnici.AnyAsync(x => x.KorisnikId == posaoFavorit.KorisnikId && x.Favoriti.Any(y => y.Posao.PosaoId == posaoFavorit.PosaoId));

            }
            catch (Exception ex)
            {
                throw new Exception("Dogodila se greška prilikom provjere korisnika ima li posao za isti favorit na razini baze!", ex);
            }
        }
    }
}
