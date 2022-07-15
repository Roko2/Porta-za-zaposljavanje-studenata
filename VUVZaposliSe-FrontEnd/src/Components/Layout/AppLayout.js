import { Outlet } from "react-router-dom";
import Navigation from "./Navigation";
import Footer from "./Footer";
import { Grid } from "@mui/material";
function AppLayout() {
  return (
    <Grid container style={{ height: 'calc("100% - 60px")' }}>
      <Navigation />
      <Outlet />
      <Footer />
    </Grid>
  );
}
export default AppLayout;
