import { Box, Container, Grid, Typography } from "@material-ui/core";
import { Stack } from "@mui/material";
import { CheckRoute } from "../Shared/CheckRoute";
import React, { useEffect, useState } from "react";
import { GoogleMap, Marker, useJsApiLoader } from "@react-google-maps/api";

function AboutUs() {
  CheckRoute();
  const containerStyle = {
    width: "45vw",
    height: "45vh",
  };

  const center = {
    lat: 45.8415463,
    lng: 17.3878005,
  };
  const { isLoaded } = useJsApiLoader({
    id: "google-map-script",
    googleMapsApiKey: "AIzaSyAcvHA9FhOdg49wtjvt3RHYlYENfbrCAaw",
  });

  const [map, setMap] = React.useState(null);
  const onLoad = React.useCallback(function callback(map) {
    map.setZoom(15);
    setMap(map);
  }, []);

  const onUnmount = React.useCallback(function callback(map) {
    setMap(null);
  }, []);

  return (
    <>
      <Container
        id="aboutUsContainer"
        style={{ margin: 0, padding: 0 }}
        maxWidth="xl"
      >
        <div className="mask">
          <Box
            sx={{ height: "22.5vh", display: "flex" }}
            alignItems="center"
            justifyContent="center"
          >
            <Stack>
              <Typography
                variant="h3"
                align="center"
                style={{ color: "white" }}
              >
                O nama
              </Typography>
              <Typography
                variant="h4"
                align="center"
                style={{ color: "white", marginTop: "1%" }}
              >
                Portal za zapošljavanje studenata
              </Typography>
            </Stack>
          </Box>
        </div>
      </Container>
      <Grid
        container
        alignItems="center"
        justifyContent="center"
        align="center"
        style={{ padding: "3%" }}
      >
        <Grid item xs={6}>
          {isLoaded ? (
            <GoogleMap
              id="googleMap"
              mapContainerStyle={containerStyle}
              center={center}
              onLoad={onLoad}
              onUnmount={onUnmount}
            >
              <Marker position={center}></Marker>
              <></>
            </GoogleMap>
          ) : (
            <></>
          )}
        </Grid>
        <Grid item xs={6}>
          <Stack>
            <Typography
              variant="h4"
              align="center"
              style={{
                color: "black",
                lineHeight: 1.5,
                padding: "3%",
              }}
            >
              Portal za zapošljavanje studenata je web usluga koja olakšava svim
              studentima pristup, pregled i informacije o pojedinim poslovima.
              Svrha portala je približiti studenta poslodavcu i obrnuto. Poslovi
              se nude po Vašem interesu na razini cijele Hrvatske. Svakim danom
              poslovi se ažuriraju kako bi student imao najnovije informacije.
            </Typography>
          </Stack>
        </Grid>
      </Grid>
    </>
  );
}
export default AboutUs;
