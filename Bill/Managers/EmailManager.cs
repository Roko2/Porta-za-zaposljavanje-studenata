using Bill.Dto;
using Bill.Services;
using Dal.Classes;
using Dal.Queries;
using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bill.Managers
{
    public class EmailManager : IEmailSender
    {
        private readonly AppDbContext _dbContext;

        public EmailManager(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<string> DohvatiPrivatnePodatke()
        {
            try
            {
                return await EmailQueries.DohvatiPrivatnePodatkeDB(_dbContext);
            }catch(Exception ex)
            {
                throw new Exception("Dogodila se greska prilikom dohvata privatnih podataka",ex);
            }
        }

        public async Task PosaljiEmail(EmailPoruka poruka)
        {
            var emailPoruka = KreirajEmail(poruka);
            await Posalji(emailPoruka);
        }
        private MimeMessage KreirajEmail(EmailPoruka poruka)
        {
            var emailPoruka = new MimeMessage();
            emailPoruka.From.Add(new MailboxAddress("roko.kovac@vuv.hr"));
            //primatelj je poslodavac
            emailPoruka.To.AddRange(new List<MailboxAddress>() { new MailboxAddress("rokokovac77@gmail.com") });
            emailPoruka.Subject = poruka.Predmet;
            emailPoruka.Body = new TextPart(MimeKit.Text.TextFormat.Text) { Text = poruka.Sadrzaj };
            return emailPoruka;
        }
        private async Task Posalji(MimeMessage mailMessage)
        {
            using (var client = new SmtpClient())
            {
                try
                {
                    client.Connect("smtp.office365.com", 587, false);
                    client.Authenticate("roko.kovac@vuv.hr", await DohvatiPrivatnePodatke());
                    client.Send(mailMessage);
                }
                catch(Exception ex)
                {
                    throw new Exception(ex.ToString());
                }
                finally
                {
                    client.Disconnect(true);
                    client.Dispose();
                }
            }
        }
    }
}
