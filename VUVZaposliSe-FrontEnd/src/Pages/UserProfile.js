import { Divider, Grid, Stack, Typography } from "@mui/material";
import { CheckRoute } from "../Shared/CheckRoute";
function UserProfile() {
  CheckRoute();
  let userData = JSON.parse(localStorage.getItem("data")).user;
  console.log(userData);
  return (
    <Grid
      container
      justifyContent="center"
      alignItems="center"
      sx={{ mt: 3, mb: 10 }}
    >
      <Grid item xs={3}>
        <Typography textAlign="center" variant="h4">
          Korisnički podaci
        </Typography>
        <Grid container sx={{ mt: 4 }}>
          <Grid item xs={6}>
            <Stack spacing={3} alignItems="center">
              <Typography variant="h6">Ime:</Typography>
              <Typography variant="h6">Prezime:</Typography>
              <Typography variant="h6">Korisničko ime:</Typography>
              <Typography variant="h6">Adresa:</Typography>
              <Typography variant="h6">Email:</Typography>
            </Stack>
          </Grid>
          <Grid item xs={6}>
            <Stack spacing={3} alignItems="center">
              <Typography variant="h6">{userData.given_name}</Typography>
              <Typography variant="h6">{userData.family_name}</Typography>
              <Typography variant="h6">
                {userData.preferred_username}
              </Typography>
              <Typography variant="h6">{userData.address.locality}</Typography>
              <Typography variant="h6">{userData.email}</Typography>
            </Stack>
          </Grid>
        </Grid>
      </Grid>
    </Grid>
  );
}
export default UserProfile;
