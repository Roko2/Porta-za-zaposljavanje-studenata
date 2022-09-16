import * as React from "react";
import { useTheme } from "@mui/material/styles";
import Box from "@mui/material/Box";
import OutlinedInput from "@mui/material/OutlinedInput";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import Chip from "@mui/material/Chip";
import { Grid } from "@material-ui/core";
function CustomMultipleSelect({
  color,
  label,
  items,
  selectId,
  onChangeValue,
}) {
  const ITEM_HEIGHT = 48;
  const ITEM_PADDING_TOP = 8;
  const MenuProps = {
    PaperProps: {
      style: {
        maxHeight: ITEM_HEIGHT * 4.5 + ITEM_PADDING_TOP,
        width: 250,
      },
    },
  };
  function getStyles(name, personName, theme) {
    return {
      fontWeight:
        personName.indexOf(name) === -1
          ? theme.typography.fontWeightRegular
          : theme.typography.fontWeightMedium,
    };
  }
  const theme = useTheme();
  const [personName, setPersonName] = React.useState([]);
  const handleChange = (event) => {
    const {
      target: { value },
    } = event;
    let ids = value.map((a) => (a.id != null ? a.id : a));
    setPersonName(value);
    let posloviBody = JSON.stringify(ids);
    onChangeValue(posloviBody, event.target.name);
  };
  return (
    <Grid container>
      <Grid item xs>
        <FormControl sx={{ m: 1, width: "80%" }}>
          <InputLabel id="demo-multiple-chip-label">{label}</InputLabel>
          <Select
            labelId="demo-multiple-chip-label"
            id="demo-multiple-chip"
            multiple
            name={selectId.toString()}
            value={personName}
            onChange={handleChange}
            input={<OutlinedInput id="select-multiple-chip" label="Chip" />}
            renderValue={(selected) => (
              <Box sx={{ display: "flex", flexWrap: "wrap", gap: 0.5 }}>
                {selected.map((value) => (
                  <Chip key={value.id} label={value.naziv} />
                ))}
              </Box>
            )}
            MenuProps={MenuProps}
          >
            {items.map((item, i) => (
              <MenuItem
                key={i}
                value={item}
                style={getStyles(item.naziv, personName, theme)}
              >
                {item.naziv}
              </MenuItem>
            ))}
          </Select>
        </FormControl>
      </Grid>
    </Grid>
  );
}
export default CustomMultipleSelect;
