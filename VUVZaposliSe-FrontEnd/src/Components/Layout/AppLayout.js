import { Outlet } from "react-router-dom";
import Navigation from "./Navigation";
import Footer from "./Footer";
import { Grid } from "@mui/material";
import { CheckAuthorize } from "../../Shared/CheckAuthorize";
function AppLayout() {
  setTimeout(() => {
    if (!CheckAuthorize()) {
      localStorage.clear();
      window.location.href = "https://localhost:3000/login";
    }
  }, "500");
  return (
    <Grid container style={{ height: 'calc("100% - 60px")' }}>
      <Navigation />
      <Outlet />
      <Footer />
    </Grid>
  );
}
export default AppLayout;
