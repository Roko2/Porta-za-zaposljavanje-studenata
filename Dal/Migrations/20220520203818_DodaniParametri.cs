using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class DodaniParametri : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.AddColumn<string>(
                name: "Oib",
                table: "Poslodavac",
                type: "nvarchar(max)",
                nullable: true,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Oib",
                table: "Poslodavac");

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

            migrationBuilder.CreateIndex(
                name: "IX_KategorijaRadnikaPosao_PosloviPosaoId",
                table: "KategorijaRadnikaPosao",
                column: "PosloviPosaoId");
        }
    }
}
