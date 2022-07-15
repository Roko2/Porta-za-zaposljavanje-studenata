using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class tableNameChange : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Favorit_Poslovi_PosaoId",
                table: "Favorit");

            migrationBuilder.DropForeignKey(
                name: "FK_FavoritKorisnik_Favorit_FavoritiId",
                table: "FavoritKorisnik");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Favorit",
                table: "Favorit");

            migrationBuilder.RenameTable(
                name: "Favorit",
                newName: "Favoriti");

            migrationBuilder.RenameIndex(
                name: "IX_Favorit_PosaoId",
                table: "Favoriti",
                newName: "IX_Favoriti_PosaoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Favoriti",
                table: "Favoriti",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Favoriti_Poslovi_PosaoId",
                table: "Favoriti",
                column: "PosaoId",
                principalTable: "Poslovi",
                principalColumn: "PosaoId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FavoritKorisnik_Favoriti_FavoritiId",
                table: "FavoritKorisnik",
                column: "FavoritiId",
                principalTable: "Favoriti",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Favoriti_Poslovi_PosaoId",
                table: "Favoriti");

            migrationBuilder.DropForeignKey(
                name: "FK_FavoritKorisnik_Favoriti_FavoritiId",
                table: "FavoritKorisnik");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Favoriti",
                table: "Favoriti");

            migrationBuilder.RenameTable(
                name: "Favoriti",
                newName: "Favorit");

            migrationBuilder.RenameIndex(
                name: "IX_Favoriti_PosaoId",
                table: "Favorit",
                newName: "IX_Favorit_PosaoId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Favorit",
                table: "Favorit",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Favorit_Poslovi_PosaoId",
                table: "Favorit",
                column: "PosaoId",
                principalTable: "Poslovi",
                principalColumn: "PosaoId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FavoritKorisnik_Favorit_FavoritiId",
                table: "FavoritKorisnik",
                column: "FavoritiId",
                principalTable: "Favorit",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
