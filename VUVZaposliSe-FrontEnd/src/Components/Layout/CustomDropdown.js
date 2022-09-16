import * as React from "react";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import { Grid } from "@material-ui/core";
function CustomDropdown({
  color,
  label,
  items,
  isSingleValueArray,
  selectId,
  onChangeValue,
}) {
  const [data, setData] = React.useState("");
  const handleChange = (event) => {
    const {
      target: { value },
    } = event;
    setData(value);
    onChangeValue(value, event.target.name);
  };
  return (
    <Grid container>
      <Grid item xs>
        <FormControl
          sx={{
            mt: 1,
            width: "100%",
            "@media screen and (min-width: 40em)": {
              width: "50%",
            },
          }}
        >
          <InputLabel id="demo-simple-select-helper-label">{label}</InputLabel>
          <Select
            labelId="demo-simple-select-helper-label"
            id="demo-simple-select-helper"
            value={data}
            name={selectId.toString()}
            label="Age"
            onChange={handleChange}
          >
            <MenuItem key={0} value="">
              Odaberite
            </MenuItem>
            {items.map((item, index) => (
              <MenuItem key={index} value={++index}>
                {isSingleValueArray ? item : item.naziv}
              </MenuItem>
            ))}
          </Select>
        </FormControl>
      </Grid>
    </Grid>
  );
}
export default CustomDropdown;
