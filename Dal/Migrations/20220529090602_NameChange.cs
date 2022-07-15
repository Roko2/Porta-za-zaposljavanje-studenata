using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class NameChange : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Poslovi_Poslodavac_PoslodavacId",
                table: "Poslovi");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Poslodavac",
                table: "Poslodavac");

            migrationBuilder.RenameTable(
                name: "Poslodavac",
                newName: "Poslodavci");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Poslodavci",
                table: "Poslodavci",
                column: "PoslodavacId");

            migrationBuilder.AddForeignKey(
                name: "FK_Poslovi_Poslodavci_PoslodavacId",
                table: "Poslovi",
                column: "PoslodavacId",
                principalTable: "Poslodavci",
                principalColumn: "PoslodavacId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Poslovi_Poslodavci_PoslodavacId",
                table: "Poslovi");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Poslodavci",
                table: "Poslodavci");

            migrationBuilder.RenameTable(
                name: "Poslodavci",
                newName: "Poslodavac");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Poslodavac",
                table: "Poslodavac",
                column: "PoslodavacId");

            migrationBuilder.AddForeignKey(
                name: "FK_Poslovi_Poslodavac_PoslodavacId",
                table: "Poslovi",
                column: "PoslodavacId",
                principalTable: "Poslodavac",
                principalColumn: "PoslodavacId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
