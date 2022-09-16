import React from "react";
import { Typography, Button } from "@mui/material";
import MainStyle from "../Style/MainStyle";
import { Grid } from "@material-ui/core";
import Image from "../Components/Image";
import loginMainImage from "../Images/loginMainImage.png";
import loginMainImageIcon from "../Images/loginMainImageIcon.png";
import loginButtonIcon from "../Images/loginButtonIcon.png";
import { hashRandom } from "react-hash-string";
import { CheckRoute } from "../Shared/CheckRoute";
function Login() {
  function AutentikacijaKorisnika() {
    CheckRoute();
    const clientId = "73c99510-612e-40ee-af34-6658a87886fe";
    const url = "https://localhost:3000/home";
    const scopes = "openid profile address phone email";
    let tempKey = hashRandom();
    localStorage.setItem("tempKey", tempKey);
    fetch(
      "https://fed-lab.aaiedu.hr/sso/module.php/oidc/authorize.php?response_type=id_token&client_id=" +
        clientId +
        "&redirect_uri=" +
        url +
        "&scope=" +
        scopes +
        "&nonce=" +
        tempKey,
      {
        method: "GET",
        redirect: "manual",
      }
    )
      .then(async (response) => {
        if (!response.redirected) {
          window.location.href = response.url;
        }
        if (!response.ok) {
          const error = "Ne radi";
          return Promise.reject(error);
        }
      })
      .catch((error) => {
        console.error(
          "Dogodila se greška prilikom poziva AAIEDU servisa!",
          error
        );
      });
  }
  const classes = MainStyle();
  const imagePropsMainDiv = {
    height: "100%",
    width: "100%",
    src: loginMainImage,
  };
  const imagePropsIcon = {
    height: "64px",
    width: "64px",
    src: loginMainImageIcon,
  };
  const imagePropsBtnLoginIcon = {
    height: "16px",
    width: "16px",
    src: loginButtonIcon,
  };
  return (
    <div className={classes.loginDiv}>
      <Grid
        container
        direction="column"
        alignItems="center"
        justifyContent="center"
        style={{ minHeight: "100vh" }}
      >
        <div className={classes.loginCntrDiv}>
          <Grid container style={{ height: "100%" }}>
            <Grid style={{ height: "100%" }} item xs={8}>
              <Image {...imagePropsMainDiv} />
            </Grid>
            <Grid item xs={4}>
              <Typography
                sx={{ mt: "15px", typography: { sm: "h4", xs: "h6" } }}
                align="center"
              >
                Veleučilište u Virovitici
              </Typography>
              <Grid
                container
                justifyContent="center"
                alignItems="center"
                style={{ marginTop: "15%" }}
              >
                <Grid item xs>
                  <Image
                    customStyle={{ display: "flex", margin: "0 auto" }}
                    {...imagePropsIcon}
                  />
                  <Typography
                    sx={{
                      mt: "10%",
                      typography: { sm: "h4", xs: "h6" },
                    }}
                    variant="h4"
                    align="center"
                    style={{ fontWeight: "bold" }}
                  >
                    PORTAL ZAPOSLI SE
                  </Typography>
                  <Button
                    sx={{ size: { sm: "medium", xs: "small", lg: "large" } }}
                    variant="contained"
                    endIcon={<Image {...imagePropsBtnLoginIcon} />}
                    style={{
                      display: "flex",
                      margin: "0 auto",
                      marginTop: "20%",
                      textTransform: "none",
                      fontSize: "0.7vw",
                    }}
                    onClick={AutentikacijaKorisnika}
                  >
                    Prijavi se putem AAI@Edu.hr
                  </Button>
                </Grid>
              </Grid>
            </Grid>
          </Grid>
        </div>
      </Grid>
    </div>
  );
}
export default Login;
