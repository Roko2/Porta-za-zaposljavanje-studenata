import { Grid, Box, CircularProgress } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import "react-image-gallery/styles/css/image-gallery.css";
import { Typography } from "@material-ui/core";
import AllCategories from "../Components/AllCategories";
import HeaderContent from "../Components/Layout/HeaderContent";
import jwt_decode from "jwt-decode";
import JobCards from "../Components/JobCards";
import { CheckRoute } from "../Shared/CheckRoute";
import ScrollButton from "../Components/Layout/ScrollButton";
import { Button } from "@mui/material";
import LinearProgress from "@mui/material/LinearProgress";
function Home() {
  CheckRoute();
  const [kategorijePoslovi, setKategorijePoslovi] = useState(null);
  const [kategorije, setKategorije] = useState(null);
  const allCategoriesProps = {
    align: "center",
    space: 3,
    items: kategorije,
  };
  useEffect(() => {
    fetch("https://localhost:7137/Kategorije")
      .then((res) => res.json())
      .then((res) => {
        setKategorije(res);
      })
      .catch((err) => console.error(err));
    fetch("https://localhost:7137/KategorijePoslovi")
      .then((res) => res.json())
      .then((res) => {
        setKategorijePoslovi(res);
      })
      .catch((err) => console.error(err));

    const clientSecret = "695be4306e9e825884177d9af5a8c16620e0aa52a7";
    const clientId = "73c99510-612e-40ee-af34-6658a87886fe";
    let tempKey = localStorage.getItem("tempKey");
    var url = window.location.href;
    var token = null;
    if (localStorage.getItem("data") == null) {
      token = url.split("id_token=")[1];
    } else {
      const sign = require("jwt-encode");
      const jwt = sign(
        JSON.parse(localStorage.getItem("data")).user,
        JSON.parse(localStorage.getItem("data")).signature
      );
      token = jwt;
    }
    if (token != undefined || token != "" || token != null) {
      let decodedUser = jwt_decode(token);
      let decodedSignature = token;
      var data = { user: decodedUser, signature: decodedSignature };
      if (decodedUser.nonce == tempKey) {
        localStorage.setItem("data", JSON.stringify(data));
        var userToAdd = JSON.parse(localStorage.getItem("data"));
        userToAdd = userToAdd.user;
        let korisnik = {
          ime: userToAdd.given_name,
          prezime: userToAdd.family_name,
          email: userToAdd.preferred_username,
          adresa: userToAdd.address.locality,
          sub: userToAdd.sub,
        };
        korisnik = JSON.stringify(korisnik);
        fetch("https://localhost:7137/DodajNovogKorisnika", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: korisnik,
        })
          .then((res) => res)
          .catch((err) => console.error(err));
      }
    } else {
      localStorage.clear();
    }
  }, []);
  return (
    <>
      <Grid
        container
        direction="row"
        alignItems="center"
        justifyContent="center"
      >
        <Grid item xs={12}>
          <HeaderContent />
        </Grid>
      </Grid>
      <div
        style={{
          marginLeft: "5%",
          marginTop: "3%",
          marginRight: "5%",
          width: "100vw",
        }}
      >
        <Typography variant="h4" align="left">
          Istražite kategorije
        </Typography>
        {kategorije == null ? (
          <LinearProgress sx={{ mt: 2 }} />
        ) : (
          <AllCategories {...allCategoriesProps} />
        )}
        <Typography variant="h4" align="left" style={{ marginTop: "2%" }}>
          Top 3 kategorije
        </Typography>
        {kategorijePoslovi == null ? (
          <Box textAlign="center">
            <CircularProgress
              style={{
                marginTop: "2%",
              }}
            />
          </Box>
        ) : (
          <JobCards items={kategorijePoslovi} />
        )}
      </div>
      <ScrollButton />
    </>
  );
}
export default Home;
