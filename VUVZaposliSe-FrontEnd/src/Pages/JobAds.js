import { Grid } from "@mui/material";
import { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import Filters from "../Components/FIlters";
import JobSearchResults from "../Components/JobSearchResults";
function JobAds() {
  const location = useLocation();
  const [params, setParams] = useState({ data: null, selectType: null });
  function getParams(data, type) {
    setParams({ data: data, selectType: type });
  }
  return (
    <Grid container direction="row" justifyContent="center">
      <Grid item xs={2} textAlign="center">
        <Filters func={getParams} />
      </Grid>
      <Grid item xs={10} textAlign="center">
        <JobSearchResults
          searchTextQuery={location.state != null ? location.state : null}
          params={params}
        />
      </Grid>
    </Grid>
  );
}
export default JobAds;
