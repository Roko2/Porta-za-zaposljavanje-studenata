using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class favoriti : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Favorit",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PosaoId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Favorit", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Favorit_Poslovi_PosaoId",
                        column: x => x.PosaoId,
                        principalTable: "Poslovi",
                        principalColumn: "PosaoId",
                        onDelete: ReferentialAction.Cascade);
                });

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
                        name: "FK_FavoritKorisnik_Favorit_FavoritiId",
                        column: x => x.FavoritiId,
                        principalTable: "Favorit",
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
                name: "IX_Favorit_PosaoId",
                table: "Favorit",
                column: "PosaoId");

            migrationBuilder.CreateIndex(
                name: "IX_FavoritKorisnik_KorisniciKorisnikId",
                table: "FavoritKorisnik",
                column: "KorisniciKorisnikId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "FavoritKorisnik");

            migrationBuilder.DropTable(
                name: "Favorit");
        }
    }
}
