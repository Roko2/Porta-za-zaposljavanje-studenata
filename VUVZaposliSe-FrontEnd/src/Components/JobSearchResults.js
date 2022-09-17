import { CircularProgress, Grid, Stack, Typography } from "@mui/material";
import { useEffect, useState } from "react";
import JobAdditionalsEnum from "../Shared/JobAdditionalsEnum";
import JobCard from "./JobCard";
import { FormatStringArrayApi } from "../Shared/FormatStringArrayApi";
import Pagination from "@mui/material/Pagination";
function JobSearchResults({ queryText, params }) {
  const [searchResult, setSearchResult] = useState(null);
  const [inputQuery, setInputQuery] = useState("");
  const [activePage, setActivePage] = useState(null);
  function handlePageChange(e) {
    var pageNumber = e.target.innerHTML[0];
    var showDataNumber = parseInt(pageNumber) * 9;

    if (parseInt(pageNumber) == 1) {
      setActivePage(searchResult.slice(0, 9));
    } else if (parseInt(pageNumber) == Math.floor(searchResult.length / 9)) {
      if (searchResult.length % 9 == 0) {
        setActivePage(
          searchResult.slice(searchResult.length - 9, searchResult.length)
        );
      } else {
        var modOutput = searchResult.length % 9;
        setActivePage(
          searchResult.slice(
            searchResult.length - modOutput,
            searchResult.length
          )
        );
      }
    } else {
      setActivePage(searchResult.slice(showDataNumber, showDataNumber + 9));
    }
  }
  useEffect(() => {
    setInputQuery(queryText);
  }, [queryText]);
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
          inputQuery +
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
          setActivePage(res);
        })
        .catch((err) => console.error(err));
    },

    Object.values({ inputQuery, ...params })
  );

  if (searchResult && searchResult.length > 0) {
    return (
      <>
        <Grid
          container
          direction="row"
          justifyContent="center"
          alignItems="center"
          spacing={2}
          style={{ marginTop: "1%", paddingLeft: "5%" }}
        >
          {activePage != null
            ? activePage.map(
                (posao, index) =>
                  index < 9 && (
                    <Grid key={index} item xs={4}>
                      <JobCard
                        key={posao.posaoId}
                        jobId={posao.posaoId}
                        label={posao.naziv}
                        details={posao.opis}
                        employerId={posao.poslodavac.id}
                      ></JobCard>
                    </Grid>
                  )
              )
            : ""}
        </Grid>
        <Grid
          container
          direction="row"
          justifyContent="center"
          alignItems="center"
        >
          <Grid item xs={4}>
            <Pagination
              sx={{ mt: 3 }}
              count={
                Math.floor(searchResult.length / 9) == 0
                  ? 1
                  : Math.floor(searchResult.length / 9)
              }
              color="primary"
              size="large"
              onChange={(e) => handlePageChange(e)}
            />
          </Grid>
        </Grid>
      </>
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
