import { Grid, Typography } from "@material-ui/core";
import { Divider, Stack } from "@mui/material";
import JobCard from "./JobCard";

function JobCards({ items }) {
  return items.map((item, index) => (
    <>
      <Stack sx={{ mt: 2 }}>
        <Typography style={{ fontSize: "1vw" }} key={index}>
          {item.item1.naziv}
        </Typography>
        <Divider flexItem variant="fullWidth" />
      </Stack>
      <Grid
        container
        direction="row"
        justifyContent="center"
        alignItems="center"
        key={index}
        spacing={2}
        style={{ marginTop: "1%" }}
      >
        {item.item2.map((posao, i) => (
          <Grid key={i} item xs={4}>
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
  ));
}
export default JobCards;
