using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class tablicaFavoriti : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FavoritKorisnik");

            migrationBuilder.AddColumn<int>(
                name: "KorisnikId",
                table: "Favoriti",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Favoriti_KorisnikId",
                table: "Favoriti",
                column: "KorisnikId");

            migrationBuilder.AddForeignKey(
                name: "FK_Favoriti_Korisnici_KorisnikId",
                table: "Favoriti",
                column: "KorisnikId",
                principalTable: "Korisnici",
                principalColumn: "KorisnikId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Favoriti_Korisnici_KorisnikId",
                table: "Favoriti");

            migrationBuilder.DropIndex(
                name: "IX_Favoriti_KorisnikId",
                table: "Favoriti");

            migrationBuilder.DropColumn(
                name: "KorisnikId",
                table: "Favoriti");

            migrationBuilder.CreateTable(
                name: "FavoritKorisnik",
                columns: table => new
                {
                    FavoritiId = table.Column<int>(type: "int", nullable: false),
                    KorisniciKorisnikId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FavoritKorisnik", x => new { x.FavoritiId, x.KorisniciKorisnikId });
                    table.ForeignKey(
                        name: "FK_FavoritKorisnik_Favoriti_FavoritiId",
                        column: x => x.FavoritiId,
                        principalTable: "Favoriti",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FavoritKorisnik_Korisnici_KorisniciKorisnikId",
                        column: x => x.KorisniciKorisnikId,
                        principalTable: "Korisnici",
                        principalColumn: "KorisnikId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_FavoritKorisnik_KorisniciKorisnikId",
                table: "FavoritKorisnik",
                column: "KorisniciKorisnikId");
        }
    }
}
