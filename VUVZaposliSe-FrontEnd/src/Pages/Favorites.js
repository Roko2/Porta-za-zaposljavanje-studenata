import { CircularProgress, Grid, Typography } from "@mui/material";
import { useEffect, useState } from "react";
import JobCard from "../Components/JobCard";

function Favorites() {
  const [data, setData] = useState(null);
  useEffect(() => {
    fetch(
      "https://localhost:7137/Korisnik/" +
        JSON.parse(localStorage.getItem("data")).user.sub
    )
      .then((res) => res.json())
      .then((res) => {
        fetch("https://localhost:7137/PosloviFavoriti?korisnikId=" + res)
          .then((res) => res.json())
          .then((res) => {
            setData(res);
          })
          .catch((err) => console.error(err));
      })
      .catch((err) => console.error(err));
  }, []);
  if (data != null && data.length > 0) {
    return (
      <>
        <Typography variant="h3" sx={{ mx: "auto", mt: 2 }}>
          Poslovi favoriti
        </Typography>
        <Grid
          container
          direction="row"
          justifyContent="center"
          alignItems="center"
          style={{ marginTop: "2%", paddingLeft: "5%" }}
          spacing={2}
        >
          {data.map((posao, index) => (
            <Grid key={index} item xs={4}>
              <JobCard
                key={posao.posaoId}
                jobId={posao.posaoId}
                label={posao.naziv}
                details={posao.opis}
                employerId={posao.poslodavac.id}
              ></JobCard>
            </Grid>
          ))}
        </Grid>
      </>
    );
  } else if (data != null && data.length == 0) {
    return (
      <Grid
        container
        justifyContent="center"
        alignItems="center"
        textAlign="center"
        style={{ marginTop: "30vh", marginBottom: "15vh" }}
      >
        <Grid item xs={12}>
          <Typography variant="h4">Nemate spremljenih favorita</Typography>
        </Grid>
      </Grid>
    );
  } else {
    return (
      <Grid
        container
        justifyContent="center"
        alignItems="center"
        textAlign="center"
        style={{ marginTop: "30vh" }}
      >
        <Grid item xs={12}>
          <CircularProgress />
        </Grid>
      </Grid>
    );
  }
}
export default Favorites;
