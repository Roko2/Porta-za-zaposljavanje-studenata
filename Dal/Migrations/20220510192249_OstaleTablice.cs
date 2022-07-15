using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class OstaleTablice : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "KategorijaRadnika",
                columns: table => new
                {
                    KategorijaRadnikaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KategorijaRadnika", x => x.KategorijaRadnikaId);
                });

            migrationBuilder.CreateTable(
                name: "Kategorije",
                columns: table => new
                {
                    KategorijaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kategorije", x => x.KategorijaId);
                });

            migrationBuilder.CreateTable(
                name: "Pogodnost",
                columns: table => new
                {
                    PogodnostId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Pogodnost", x => x.PogodnostId);
                });

            migrationBuilder.CreateTable(
                name: "Poslodavac",
                columns: table => new
                {
                    PoslodavacId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Lokacija = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Sjediste = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Poslodavac", x => x.PoslodavacId);
                });

            migrationBuilder.CreateTable(
                name: "Vjestina",
                columns: table => new
                {
                    VjestinaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vjestina", x => x.VjestinaId);
                });

            migrationBuilder.CreateTable(
                name: "Poslovi",
                columns: table => new
                {
                    PosaoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Opis = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    DatumAktivnosti = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Lokacija = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BrojRadnika = table.Column<int>(type: "int", nullable: false),
                    Satnica = table.Column<decimal>(type: "decimal(10,2)", nullable: false),
                    KategorijaId = table.Column<int>(type: "int", nullable: false),
                    PoslodavacId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Poslovi", x => x.PosaoId);
                    table.ForeignKey(
                        name: "FK_Poslovi_Kategorije_KategorijaId",
                        column: x => x.KategorijaId,
                        principalTable: "Kategorije",
                        principalColumn: "KategorijaId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Poslovi_Poslodavac_PoslodavacId",
                        column: x => x.PoslodavacId,
                        principalTable: "Poslodavac",
                        principalColumn: "PoslodavacId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "KategorijaRadnikaPosao",
                columns: table => new
                {
                    KategorijeRadnikaKategorijaRadnikaId = table.Column<int>(type: "int", nullable: false),
                    PosloviPosaoId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_KategorijaRadnikaPosao", x => new { x.KategorijeRadnikaKategorijaRadnikaId, x.PosloviPosaoId });
                    table.ForeignKey(
                        name: "FK_KategorijaRadnikaPosao_KategorijaRadnika_KategorijeRadnikaKategorijaRadnikaId",
                        column: x => x.KategorijeRadnikaKategorijaRadnikaId,
                        principalTable: "KategorijaRadnika",
                        principalColumn: "KategorijaRadnikaId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_KategorijaRadnikaPosao_Poslovi_PosloviPosaoId",
                        column: x => x.PosloviPosaoId,
                        principalTable: "Poslovi",
                        principalColumn: "PosaoId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Komentari",
                columns: table => new
                {
                    KomentarId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tekst = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KorisnikId = table.Column<int>(type: "int", nullable: false),
                    PosaoId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Komentari", x => x.KomentarId);
                    table.ForeignKey(
                        name: "FK_Komentari_Korisnici_KorisnikId",
                        column: x => x.KorisnikId,
                        principalTable: "Korisnici",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Komentari_Poslovi_PosaoId",
                        column: x => x.PosaoId,
                        principalTable: "Poslovi",
                        principalColumn: "PosaoId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PogodnostPosao",
                columns: table => new
                {
                    PogodnostId = table.Column<int>(type: "int", nullable: false),
                    PosloviPosaoId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PogodnostPosao", x => new { x.PogodnostId, x.PosloviPosaoId });
                    table.ForeignKey(
                        name: "FK_PogodnostPosao_Pogodnost_PogodnostId",
                        column: x => x.PogodnostId,
                        principalTable: "Pogodnost",
                        principalColumn: "PogodnostId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PogodnostPosao_Poslovi_PosloviPosaoId",
                        column: x => x.PosloviPosaoId,
                        principalTable: "Poslovi",
                        principalColumn: "PosaoId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PosaoVjestina",
                columns: table => new
                {
                    PosloviPosaoId = table.Column<int>(type: "int", nullable: false),
                    VjestineVjestinaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PosaoVjestina", x => new { x.PosloviPosaoId, x.VjestineVjestinaId });
                    table.ForeignKey(
                        name: "FK_PosaoVjestina_Poslovi_PosloviPosaoId",
                        column: x => x.PosloviPosaoId,
                        principalTable: "Poslovi",
                        principalColumn: "PosaoId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PosaoVjestina_Vjestina_VjestineVjestinaId",
                        column: x => x.VjestineVjestinaId,
                        principalTable: "Vjestina",
                        principalColumn: "VjestinaId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_KategorijaRadnikaPosao_PosloviPosaoId",
                table: "KategorijaRadnikaPosao",
                column: "PosloviPosaoId");

            migrationBuilder.CreateIndex(
                name: "IX_Komentari_KorisnikId",
                table: "Komentari",
                column: "KorisnikId");

            migrationBuilder.CreateIndex(
                name: "IX_Komentari_PosaoId",
                table: "Komentari",
                column: "PosaoId");

            migrationBuilder.CreateIndex(
                name: "IX_PogodnostPosao_PosloviPosaoId",
                table: "PogodnostPosao",
                column: "PosloviPosaoId");

            migrationBuilder.CreateIndex(
                name: "IX_PosaoVjestina_VjestineVjestinaId",
                table: "PosaoVjestina",
                column: "VjestineVjestinaId");

            migrationBuilder.CreateIndex(
                name: "IX_Poslovi_KategorijaId",
                table: "Poslovi",
                column: "KategorijaId");

            migrationBuilder.CreateIndex(
                name: "IX_Poslovi_PoslodavacId",
                table: "Poslovi",
                column: "PoslodavacId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "KategorijaRadnikaPosao");

            migrationBuilder.DropTable(
                name: "Komentari");

            migrationBuilder.DropTable(
                name: "PogodnostPosao");

            migrationBuilder.DropTable(
                name: "PosaoVjestina");

            migrationBuilder.DropTable(
                name: "KategorijaRadnika");

            migrationBuilder.DropTable(
                name: "Pogodnost");

            migrationBuilder.DropTable(
                name: "Poslovi");

            migrationBuilder.DropTable(
                name: "Vjestina");

            migrationBuilder.DropTable(
                name: "Kategorije");

            migrationBuilder.DropTable(
                name: "Poslodavac");
        }
    }
}
