using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class Grat : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "GradId",
                table: "Poslovi",
                type: "int",
                nullable: true,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Gradovi",
                columns: table => new
                {
                    GradId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Gradovi", x => x.GradId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Poslovi_GradId",
                table: "Poslovi",
                column: "GradId");

            migrationBuilder.AddForeignKey(
                name: "FK_Poslovi_Gradovi_GradId",
                table: "Poslovi",
                column: "GradId",
                principalTable: "Gradovi",
                principalColumn: "GradId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Poslovi_Gradovi_GradId",
                table: "Poslovi");

            migrationBuilder.DropTable(
                name: "Gradovi");

            migrationBuilder.DropIndex(
                name: "IX_Poslovi_GradId",
                table: "Poslovi");

            migrationBuilder.DropColumn(
                name: "GradId",
                table: "Poslovi");
        }
    }
}
