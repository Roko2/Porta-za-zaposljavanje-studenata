import { CircularProgress, Grid, Stack, Typography } from "@mui/material";
import { useEffect, useState } from "react";
import JobAdditionalsEnum from "../Shared/JobAdditionalsEnum";
import JobCard from "./JobCard";
import { FormatStringArrayApi } from "../Shared/FormatStringArrayApi";
import SweetPagination from "sweetpagination";
function JobSearchResults({ queryText, params }) {
  const [searchResult, setSearchResult] = useState(null);
  const [currentPageData, setCurrentPageData] = useState(new Array(2).fill());
  const [inputQuery, setInputQuery] = useState("");
  useEffect(() => {
    document.getElementById("searchQuery").value = queryText;
    setInputQuery(document.getElementById("searchQuery").value);
  }, []);
  useEffect(
    () => {
      let vjestine = [];
      let pogodnosti = [];
      let kategorije = [];
      let poslodavci = [];
      let gradId = null;
      if (params.selectType == JobAdditionalsEnum.vjestine) {
        vjestine = FormatStringArrayApi("Vjestine", params.data);
        localStorage.setItem("vjestine", vjestine);
      }
      if (params.selectType == JobAdditionalsEnum.pogodnosti) {
        pogodnosti = FormatStringArrayApi("Pogodnosti", params.data);
        localStorage.setItem("pogodnosti", pogodnosti);
      }
      if (params.selectType == JobAdditionalsEnum.kategorije) {
        if (params.data != null && params.data.length > 0) {
          kategorije = FormatStringArrayApi("Kategorije", params.data);
          localStorage.setItem("kategorije", kategorije);
        }
      }
      if (params.selectType == JobAdditionalsEnum.poslodavci) {
        poslodavci = FormatStringArrayApi("Poslodavci", params.data);
        localStorage.setItem("poslodavci", poslodavci);
      }
      if (params.selectType == JobAdditionalsEnum.lokacije) {
        gradId = params.data;
        localStorage.setItem("grad", gradId);
      }
      fetch(
        "https://localhost:7137/PosloviSearch?Naziv=" +
          document.getElementById("searchQuery").value +
          "&GradId=" +
          localStorage.getItem("grad") +
          "&" +
          localStorage.getItem("vjestine") +
          "&" +
          localStorage.getItem("pogodnosti") +
          "&" +
          localStorage.getItem("kategorije") +
          "&" +
          localStorage.getItem("poslodavci")
      )
        .then((res) => res.json())
        .then((res) => {
          setSearchResult(res);
        })
        .catch((err) => console.error(err));
    },

    Object.values({ inputQuery, ...params })
  );
  if (searchResult && searchResult.length > 0) {
    return (
      <Grid
        container
        direction="row"
        justifyContent="center"
        alignItems="center"
        spacing={2}
        style={{ marginTop: "1%", paddingLeft: "5%" }}
      >
        {currentPageData[0] != undefined
          ? currentPageData.map((posao, index) => (
              <Grid key={index} item xs={4}>
                <JobCard
                  key={posao.posaoId}
                  jobId={posao.posaoId}
                  label={posao.naziv}
                  details={posao.opis}
                  employerId={posao.poslodavac.id}
                ></JobCard>
              </Grid>
            ))
          : ""}
        <Grid item xs={12}>
          <SweetPagination
            currentPageData={setCurrentPageData}
            dataPerPage={9}
            getData={searchResult}
            navigation={true}
          />
        </Grid>
      </Grid>
    );
  } else if (searchResult?.length == 0) {
    return (
      <div
        style={{
          marginTop: "35vh",
        }}
      >
        <Typography variant="h4">Nema rezultata pretrage</Typography>
      </div>
    );
  } else {
    return (
      <div
        style={{
          marginTop: "35vh",
        }}
      >
        <CircularProgress />
      </div>
    );
  }
}
export default JobSearchResults;
