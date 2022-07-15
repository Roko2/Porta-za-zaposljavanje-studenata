import { Typography, Grid } from "@material-ui/core";
import { IconButton } from "@mui/material";
import Divider from "@mui/material/Divider";
import Button from "@mui/material/Button";
import ContactMailIcon from "@mui/icons-material/ContactMail";
import MainStyle from "../../Style/MainStyle";
import { SocialIcon } from "react-social-icons";
import navbarIcon from "../../Images/navbarIcon.png";
import Image from "../Image";
function Footer() {
  const date = new Date();
  let currentYear = date.getFullYear();
  const classes = MainStyle();
  const imageProps = {
    height: "90%",
    width: "90%",
    src: navbarIcon,
  };
  function GoToMail() {
    window.open("mailto:rokokovac1@gmail.com?subject=Upit");
  }
  return (
    <div className="footer">
      <Typography align="center" variant="h4">
        ZAPOSLI SE
      </Typography>
      <Typography className="footerText" align="center" variant="h5">
        Pronađite posao za sebe. Zasigurno postoji odgovarajući poslodavac za
        vas.
        <br /> Otvoreni smo za bilo kakva pitanja. Odgovorite klikom na gumb.
      </Typography>
      <Button
        onClick={() => GoToMail()}
        className="btn"
        sx={{ backgroundColor: "white", mt: "2%" }}
        variant="outlined"
        startIcon={<ContactMailIcon />}
      >
        Kontakt
      </Button>
      <Divider className="divider" />
      <Typography style={{ marginTop: "3%" }}>
        &copy; {currentYear} Zaposli Se. Sva prava pridržana.
      </Typography>
      <Grid container spacing={2} justifyContent="space-between">
        <Grid item>
          <IconButton
            className="logoIcon"
            style={{ marginLeft: 100 }}
            size="large"
            edge="start"
            color="inherit"
            aria-label="logo"
          >
            <Image {...imageProps} />
          </IconButton>
        </Grid>
        <Grid item>
          <Grid container spacing={2}>
            <Grid item xs>
              <SocialIcon
                fgColor="white"
                bgColor="transparent"
                className="socialIcon"
                url="https://twitter.com"
              />
            </Grid>
            <Grid item xs>
              <SocialIcon
                fgColor="white"
                bgColor="transparent"
                className="socialIcon"
                url="https://linkedin.com"
              />
            </Grid>
            <Grid item xs>
              <SocialIcon
                fgColor="white"
                className="socialIcon"
                bgColor="transparent"
                url="https://facebook.com"
              />
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

export default Footer;
