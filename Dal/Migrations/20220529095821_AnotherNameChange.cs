using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class AnotherNameChange : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PogodnostPosao_Pogodnost_PogodnostId",
                table: "PogodnostPosao");

            migrationBuilder.DropForeignKey(
                name: "FK_PosaoVjestina_Vjestina_VjestineVjestinaId",
                table: "PosaoVjestina");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Vjestina",
                table: "Vjestina");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Pogodnost",
                table: "Pogodnost");

            migrationBuilder.RenameTable(
                name: "Vjestina",
                newName: "Vjestine");

            migrationBuilder.RenameTable(
                name: "Pogodnost",
                newName: "Pogodnosti");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Vjestine",
                table: "Vjestine",
                column: "VjestinaId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Pogodnosti",
                table: "Pogodnosti",
                column: "PogodnostId");

            migrationBuilder.AddForeignKey(
                name: "FK_PogodnostPosao_Pogodnosti_PogodnostId",
                table: "PogodnostPosao",
                column: "PogodnostId",
                principalTable: "Pogodnosti",
                principalColumn: "PogodnostId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PosaoVjestina_Vjestine_VjestineVjestinaId",
                table: "PosaoVjestina",
                column: "VjestineVjestinaId",
                principalTable: "Vjestine",
                principalColumn: "VjestinaId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PogodnostPosao_Pogodnosti_PogodnostId",
                table: "PogodnostPosao");

            migrationBuilder.DropForeignKey(
                name: "FK_PosaoVjestina_Vjestine_VjestineVjestinaId",
                table: "PosaoVjestina");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Vjestine",
                table: "Vjestine");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Pogodnosti",
                table: "Pogodnosti");

            migrationBuilder.RenameTable(
                name: "Vjestine",
                newName: "Vjestina");

            migrationBuilder.RenameTable(
                name: "Pogodnosti",
                newName: "Pogodnost");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Vjestina",
                table: "Vjestina",
                column: "VjestinaId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Pogodnost",
                table: "Pogodnost",
                column: "PogodnostId");

            migrationBuilder.AddForeignKey(
                name: "FK_PogodnostPosao_Pogodnost_PogodnostId",
                table: "PogodnostPosao",
                column: "PogodnostId",
                principalTable: "Pogodnost",
                principalColumn: "PogodnostId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PosaoVjestina_Vjestina_VjestineVjestinaId",
                table: "PosaoVjestina",
                column: "VjestineVjestinaId",
                principalTable: "Vjestina",
                principalColumn: "VjestinaId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
