import { Grid, Typography } from "@material-ui/core";
import { Divider, Stack } from "@mui/material";
import CalendarMonthIcon from "@mui/icons-material/CalendarMonth";
import LocationOnIcon from "@mui/icons-material/LocationOn";
import ManIcon from "@mui/icons-material/Man";
import ContactPhoneIcon from "@mui/icons-material/ContactPhone";
import AttachMoneyIcon from "@mui/icons-material/AttachMoney";
function SingleJobHeader(job) {
  return (
    <Grid
      direction="row"
      container
      justifyContent="center"
      alignItems="center"
      style={{ marginTop: "2%" }}
    >
      <Grid item xs={2}>
        <Stack justifyContent="start" alignItems="start" spacing={1.5}>
          <Stack direction="row" spacing={1}>
            <CalendarMonthIcon fontSize="large" color="warning" />
            <Typography className="jobHeaderText">
              Oglas je aktivan do
            </Typography>
          </Stack>
          <Stack direction="row" spacing={1}>
            <LocationOnIcon fontSize="large" color="warning" />
            <Typography className="jobHeaderText">Lokacija</Typography>
          </Stack>
          <Stack direction="row" spacing={1}>
            <ManIcon fontSize="large" color="warning" />
            <Typography className="jobHeaderText">Broj radnika</Typography>
          </Stack>
          <Stack direction="row" spacing={1}>
            <AttachMoneyIcon fontSize="large" color="warning" />
            <Typography className="jobHeaderText">Satnica</Typography>
          </Stack>
          <Stack direction="row" spacing={1}>
            <ContactPhoneIcon fontSize="large" color="warning" />
            <Typography className="jobHeaderText">Kontakt</Typography>
          </Stack>
        </Stack>
      </Grid>
      <Grid item xs={4}>
        <Stack
          justifyContent="center"
          alignItems="start"
          spacing={{ xs: 5, sm: 4, md: 2.5, xxl: 2 }}
        >
          <Typography className="jobHeaderText">
            {job.aktivan != null
              ? job.datumAktivnosti
              : "Oglas više nije aktivan"}
          </Typography>
          <Typography className="jobHeaderText">{job.lokacija}</Typography>
          <Typography className="jobHeaderText">{job.brojRadnika}</Typography>
          <Stack direction="row" spacing={0.5}>
            <Typography className="jobHeaderText">{job.satnica}</Typography>
            <Typography className="jobHeaderText"> kn/h</Typography>
            <Divider
              orientation="vertical"
              style={{
                width: "1px",
              }}
              flexItem
            />
            <Typography className="jobHeaderText">
              {(job.satnica / 7.53).toFixed(2)}
            </Typography>
            <Typography className="jobHeaderText"> eur/h</Typography>
          </Stack>
          <Stack direction="row" spacing={0.5}>
            <Typography className="jobHeaderText">
              {job.poslodavac.telefon}
            </Typography>
            <Typography className="jobHeaderText">/</Typography>
            <Typography className="jobHeaderText">
              {" "}
              {job.poslodavac.email}
            </Typography>
          </Stack>
        </Stack>
      </Grid>
      <Grid item xs={6}></Grid>
    </Grid>
  );
}
export default SingleJobHeader;
