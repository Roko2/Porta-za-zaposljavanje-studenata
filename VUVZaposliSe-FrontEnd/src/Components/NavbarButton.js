import { Button } from "@mui/material";
function NavbarButton(props) {
  return (
    <Button
      onClick={props.method}
      sx={{ fontSize: 14, textTransform: "inherit" }}
      color="inherit"
    >
      {props.Naziv}
    </Button>
  );
}
export default NavbarButton;
