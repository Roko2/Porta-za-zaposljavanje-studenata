import { Box, Grid, Typography } from "@material-ui/core";
import { useEffect, useState } from "react";
import CustomCheckBoxList from "./CustomCheckBoxList";
import CustomDropdown from "./Layout/CustomDropdown";
import CustomMultipleSelect from "./Layout/CustomMultipleSelect";
import JobAdditionalsEnum from "../Shared/JobAdditionalsEnum";
function Filters({ func }) {
  const [lokacije, setLokacije] = useState(null);
  const [vjestine, setVjestine] = useState(null);
  const [pogodnosti, setPogodnosti] = useState(null);
  const [kategorije, setKategorije] = useState(null);
  const [poslodavci, setPoslodavci] = useState(null);
  useEffect(() => {
    fetch("https://localhost:7137/Lokacije")
      .then((res) => res.json())
      .then((res) => {
        setLokacije(res);
      })
      .catch((err) => console.error(err));
    fetch("https://localhost:7137/Vjestine")
      .then((res) => res.json())
      .then((res) => {
        setVjestine(res);
      })
      .catch((err) => console.error(err));
    fetch("https://localhost:7137/Pogodnosti")
      .then((res) => res.json())
      .then((res) => {
        setPogodnosti(res);
      })
      .catch((err) => console.error(err));
    fetch("https://localhost:7137/Kategorije")
      .then((res) => res.json())
      .then((res) => {
        setKategorije(res);
      })
      .catch((err) => console.error(err));
    fetch("https://localhost:7137/Poslodavci")
      .then((res) => res.json())
      .then((res) => {
        setPoslodavci(res);
      })
      .catch((err) => console.error(err));
  }, []);

  //setiraj query string na svaki change
  function SetQueryState(data, type) {
    func(data, type);
  }
  return (
    <div className="filters">
      <Grid style={{ marginTop: 0 }} container direction="column" spacing={3}>
        <Typography style={{ marginTop: 10 }} variant="h4">
          Filteri pretrage
        </Typography>
        <Grid item xs>
          <Typography variant="h5">Lokacija</Typography>
          {lokacije && (
            <CustomDropdown
              onChangeValue={SetQueryState}
              id="lokacijeDropdown"
              color="black"
              label="Mjesto"
              items={lokacije}
              selectId={JobAdditionalsEnum.lokacije}
              isSingleValueArray={true}
            />
          )}
        </Grid>
        <Grid item xs>
          <Typography variant="h5">Vještine</Typography>
          {vjestine && (
            <CustomMultipleSelect
              onChangeValue={SetQueryState}
              id="vjestineSelect"
              color="black"
              label="Vještina"
              items={vjestine}
              selectId={JobAdditionalsEnum.vjestine}
              isSingleValueArray={false}
            />
          )}
        </Grid>
        <Grid item xs>
          <Typography variant="h5">Pogodnosti</Typography>
          {pogodnosti && (
            <CustomMultipleSelect
              onChangeValue={SetQueryState}
              id="pogodnostiSelect"
              color="black"
              label="Pogodnosti"
              items={pogodnosti}
              selectId={JobAdditionalsEnum.pogodnosti}
              isSingleValueArray={false}
            />
          )}
        </Grid>
        <Grid item xs>
          <Typography variant="h5">Poslodavci</Typography>
          {poslodavci && (
            <CustomMultipleSelect
              onChangeValue={SetQueryState}
              id="poslodavciSelect"
              color="black"
              label="Poslodavci"
              items={poslodavci}
              selectId={JobAdditionalsEnum.poslodavci}
              isSingleValueArray={false}
            />
          )}
        </Grid>
        <Grid item xs>
          <Typography variant="h5">Kategorije</Typography>
          <Box
            sx={{
              display: "flex",
              flexDirection: "column",
              justifyContent: "flex-end",
              alignItems: "flex-end",
            }}
          >
            {kategorije && (
              <CustomCheckBoxList
                id="kategorijeChk"
                items={kategorije}
                selectId={JobAdditionalsEnum.kategorije}
                isSingleValueArray={false}
                onChangeValue={SetQueryState}
              />
            )}
          </Box>
        </Grid>
      </Grid>
    </div>
  );
}
export default Filters;
