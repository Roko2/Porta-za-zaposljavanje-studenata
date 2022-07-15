﻿// <auto-generated />
using System;
using Dal.Classes;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Dal.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20220701192202_tableNameChange")]
    partial class tableNameChange
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("Dal.Classes.Favorit", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<int>("PosaoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("PosaoId");

                    b.ToTable("Favoriti");
                });

            modelBuilder.Entity("Dal.Classes.Grad", b =>
                {
                    b.Property<int>("GradId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("GradId"), 1L, 1);

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("GradId");

                    b.ToTable("Gradovi");
                });

            modelBuilder.Entity("Dal.Classes.Kategorija", b =>
                {
                    b.Property<int>("KategorijaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KategorijaId"), 1L, 1);

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("KategorijaId");

                    b.ToTable("Kategorije");
                });

            modelBuilder.Entity("Dal.Classes.Komentar", b =>
                {
                    b.Property<int>("KomentarId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KomentarId"), 1L, 1);

                    b.Property<int>("KorisnikId")
                        .HasColumnType("int");

                    b.Property<int>("PosaoId")
                        .HasColumnType("int");

                    b.Property<string>("Tekst")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("KomentarId");

                    b.HasIndex("KorisnikId");

                    b.HasIndex("PosaoId");

                    b.ToTable("Komentari");
                });

            modelBuilder.Entity("Dal.Classes.Korisnik", b =>
                {
                    b.Property<int>("KorisnikId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("KorisnikId"), 1L, 1);

                    b.Property<string>("Adresa")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Ime")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Prezime")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sub")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("KorisnikId");

                    b.ToTable("Korisnici");
                });

            modelBuilder.Entity("Dal.Classes.Pogodnost", b =>
                {
                    b.Property<int>("PogodnostId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PogodnostId"), 1L, 1);

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PogodnostId");

                    b.ToTable("Pogodnosti");
                });

            modelBuilder.Entity("Dal.Classes.Posao", b =>
                {
                    b.Property<int>("PosaoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PosaoId"), 1L, 1);

                    b.Property<bool?>("Aktivan")
                        .HasColumnType("bit");

                    b.Property<int>("BrojRadnika")
                        .HasColumnType("int");

                    b.Property<DateTime>("DatumAktivnosti")
                        .HasColumnType("datetime2");

                    b.Property<int>("GradId")
                        .HasColumnType("int");

                    b.Property<int>("KategorijaId")
                        .HasColumnType("int");

                    b.Property<string>("Lokacija")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Opis")
                        .IsRequired()
                        .HasColumnType("varchar(MAX)");

                    b.Property<int>("PoslodavacId")
                        .HasColumnType("int");

                    b.Property<decimal>("Satnica")
                        .HasPrecision(10, 2)
                        .HasColumnType("decimal(10,2)");

                    b.HasKey("PosaoId");

                    b.HasIndex("GradId");

                    b.HasIndex("KategorijaId");

                    b.HasIndex("PoslodavacId");

                    b.ToTable("Poslovi");
                });

            modelBuilder.Entity("Dal.Classes.Poslodavac", b =>
                {
                    b.Property<int>("PoslodavacId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("PoslodavacId"), 1L, 1);

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Oib")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sjediste")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Telefon")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PoslodavacId");

                    b.ToTable("Poslodavci");
                });

            modelBuilder.Entity("Dal.Classes.Vjestina", b =>
                {
                    b.Property<int>("VjestinaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("VjestinaId"), 1L, 1);

                    b.Property<string>("Naziv")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("VjestinaId");

                    b.ToTable("Vjestine");
                });

            modelBuilder.Entity("FavoritKorisnik", b =>
                {
                    b.Property<int>("FavoritiId")
                        .HasColumnType("int");

                    b.Property<int>("KorisniciKorisnikId")
                        .HasColumnType("int");

                    b.HasKey("FavoritiId", "KorisniciKorisnikId");

                    b.HasIndex("KorisniciKorisnikId");

                    b.ToTable("FavoritKorisnik");
                });

            modelBuilder.Entity("PogodnostPosao", b =>
                {
                    b.Property<int>("PogodnostId")
                        .HasColumnType("int");

                    b.Property<int>("PosloviPosaoId")
                        .HasColumnType("int");

                    b.HasKey("PogodnostId", "PosloviPosaoId");

                    b.HasIndex("PosloviPosaoId");

                    b.ToTable("PogodnostPosao");
                });

            modelBuilder.Entity("PosaoVjestina", b =>
                {
                    b.Property<int>("PosloviPosaoId")
                        .HasColumnType("int");

                    b.Property<int>("VjestineVjestinaId")
                        .HasColumnType("int");

                    b.HasKey("PosloviPosaoId", "VjestineVjestinaId");

                    b.HasIndex("VjestineVjestinaId");

                    b.ToTable("PosaoVjestina");
                });

            modelBuilder.Entity("Dal.Classes.Favorit", b =>
                {
                    b.HasOne("Dal.Classes.Posao", "Posao")
                        .WithMany()
                        .HasForeignKey("PosaoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Posao");
                });

            modelBuilder.Entity("Dal.Classes.Komentar", b =>
                {
                    b.HasOne("Dal.Classes.Korisnik", "Korisnik")
                        .WithMany()
                        .HasForeignKey("KorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Posao", "Posao")
                        .WithMany()
                        .HasForeignKey("PosaoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Korisnik");

                    b.Navigation("Posao");
                });

            modelBuilder.Entity("Dal.Classes.Posao", b =>
                {
                    b.HasOne("Dal.Classes.Grad", "Grad")
                        .WithMany()
                        .HasForeignKey("GradId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Kategorija", "Kategorija")
                        .WithMany()
                        .HasForeignKey("KategorijaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Poslodavac", "Poslodavac")
                        .WithMany()
                        .HasForeignKey("PoslodavacId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Grad");

                    b.Navigation("Kategorija");

                    b.Navigation("Poslodavac");
                });

            modelBuilder.Entity("FavoritKorisnik", b =>
                {
                    b.HasOne("Dal.Classes.Favorit", null)
                        .WithMany()
                        .HasForeignKey("FavoritiId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Korisnik", null)
                        .WithMany()
                        .HasForeignKey("KorisniciKorisnikId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("PogodnostPosao", b =>
                {
                    b.HasOne("Dal.Classes.Pogodnost", null)
                        .WithMany()
                        .HasForeignKey("PogodnostId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Posao", null)
                        .WithMany()
                        .HasForeignKey("PosloviPosaoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("PosaoVjestina", b =>
                {
                    b.HasOne("Dal.Classes.Posao", null)
                        .WithMany()
                        .HasForeignKey("PosloviPosaoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Dal.Classes.Vjestina", null)
                        .WithMany()
                        .HasForeignKey("VjestineVjestinaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
