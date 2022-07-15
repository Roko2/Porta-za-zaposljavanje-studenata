import { Chip, Divider, Grid, Typography } from "@material-ui/core";
import { Stack } from "@mui/material";

function SingleJobReq(job) {
  return (
    <Stack spacing={2} style={{ marginTop: "3%" }}>
      {job.vjestine.length != 0 ? (
        <Stack direction="row" spacing={1} alignItems="center">
          <Typography style={{ fontWeight: 600 }} variant="h6">
            POTREBNE VJEŠTINE
          </Typography>
          <Divider
            style={{
              width: "75%",
            }}
          ></Divider>
        </Stack>
      ) : (
        ""
      )}
      <Grid container>
        {job.vjestine.map((item, index) => (
          <Grid
            style={{ textAlign: "center" }}
            key={index}
            item
            xs={8}
            md={4}
            lg={3}
          >
            <Chip
              label={item.naziv}
              color="primary"
              variant="outlined"
              style={{ fontSize: "0.7vw" }}
            />
          </Grid>
        ))}
      </Grid>
      {job.pogodnosti.length != 0 ? (
        <Stack direction="row" spacing={1} alignItems="center">
          <Typography style={{ fontWeight: 600 }} variant="h6">
            POGODNOSTI
          </Typography>
          <Divider
            style={{
              width: "75%",
            }}
          ></Divider>
        </Stack>
      ) : (
        ""
      )}
      <Grid container>
        {job.pogodnosti.map((item, index) => (
          <Grid
            style={{ textAlign: "center" }}
            key={index}
            item
            xs={5}
            md={3}
            lg={2}
          >
            <Chip
              label={item.naziv}
              style={{ fontSize: "0.7vw" }}
              color="primary"
              variant="outlined"
            />
          </Grid>
        ))}
      </Grid>
    </Stack>
  );
}
export default SingleJobReq;
