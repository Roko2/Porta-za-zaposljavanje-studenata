using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dal.Migrations
{
    public partial class maknutoPoljeLokacijaPoslodavac : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Lokacija",
                table: "Poslodavac");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Lokacija",
                table: "Poslodavac",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
