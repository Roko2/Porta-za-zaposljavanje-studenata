import { Grid, IconButton, Typography } from "@material-ui/core";
import { useEffect, useState } from "react";
import CircularProgress from "@mui/material/CircularProgress";
import Image from "../Components/Image";
import { useLocation } from "react-router-dom";
import EmailIcon from "@mui/icons-material/Email";
import { ImageFinder } from "../Shared/ImageFinder";
import SingleJobHeader from "../Components/SingleJobHeader";
import SingleJobReq from "../Components/SingleJobReq";
import { CheckRoute } from "../Shared/CheckRoute";
import Favorite from "../Components/Favorite";
import { Button, Stack, Tooltip } from "@mui/material";
import JobApplyModal from "../Components/JobApplyModal";
import { ChoiceRemember } from "../Shared/ChoiceRemember";
function SingleJob() {
  CheckRoute();
  const [job, setJob] = useState(null);
  useEffect(() => {
    let jobId = window.location.pathname.split("/").pop();
    ChoiceRemember(jobId);
    fetch("https://localhost:7137/Poslovi/" + jobId)
      .then((res) => res.json())
      .then((res) => {
        setJob(res);
      })
      .catch((err) => console.error(err));
  }, []);
  function GoToMail(mailBody) {
    window.open(
      `mailto:?subject=Posao na Portal za zapošljavanje studenata&body=${mailBody}`
    );
  }
  if (job) {
    const naziviPogodnosti = [
      ...new Set(job.pogodnosti.flatMap(({ naziv }) => naziv)),
    ];
    let pogodnosti = naziviPogodnosti.join(", ");
    let mailBody = `Šaljem ti poveznicu za posao%0D%0A%0D%0A${job.naziv}%0D%0A${job.lokacija}%0D%0A${job.satnica} kn/h%0D%0A${pogodnosti}%0D%0APogledaj posao: ${window.location.href}`;
    return (
      <Grid
        direction="row"
        container
        justifyContent="center"
        alignItems="center"
        style={{ marginTop: "4%" }}
      >
        <Grid item xs={3}>
          <Image
            customStyle={{ display: "flex", margin: "0 auto", marginTop: "5%" }}
            width={"15vw"}
            height={"20vh"}
            src={ImageFinder(job.poslodavac.id)}
          ></Image>
          <Stack
            direction="row"
            justifyContent="center"
            alignItems="center"
            spacing={2}
            sx={{ mt: 1 }}
          >
            <Stack>
              <Tooltip title={<h5>Podijeli posao sa prijateljem!</h5>}>
                <IconButton
                  style={{ display: "flex", margin: "0 auto" }}
                  color="primary"
                  onClick={() => GoToMail(mailBody)}
                >
                  <EmailIcon fontSize="large" />
                </IconButton>
              </Tooltip>
            </Stack>
            <Stack>
              <Favorite />
            </Stack>
          </Stack>
          <Stack alignItems="center">
            <JobApplyModal />
          </Stack>
        </Grid>
        <Grid item xs={7}>
          <Typography style={{ fontWeight: 600 }} align="center" variant="h3">
            {job.naziv}
          </Typography>
          <Typography align="center" variant="h6" style={{ marginTop: "2%" }}>
            {job.opis}
          </Typography>
          <SingleJobHeader {...job} />
          <SingleJobReq {...job} />
        </Grid>
        <Grid item xs={2}></Grid>
      </Grid>
    );
  } else {
    return (
      <Grid container justifyContent="center" alignItems="center">
        <Grid item xs={1} style={{ marginTop: "25vh", marginBottom: "25vh" }}>
          <CircularProgress />
        </Grid>
      </Grid>
    );
  }
}
export default SingleJob;
