import * as React from "react";
import Checkbox from "@mui/material/Checkbox";
import FormGroup from "@mui/material/FormGroup";
import FormControlLabel from "@mui/material/FormControlLabel";
import { ClearLocalStorageSearch } from "../Shared/ClearLocalStorageSearch";
function CustomCheckBoxList({
  items,
  isSingleValueArray,
  selectId,
  onChangeValue,
}) {
  const handleChange = (e) => {
    const values = [
      ...document.querySelectorAll('[type="checkbox"]:checked'),
    ].map((el) => el.value);
    if (values != null && values.length > 0) {
      onChangeValue(JSON.stringify(values), e.target.name);
    } else {
      localStorage.setItem("kategorije", "");
      onChangeValue(null, e.target.name);
    }
  };
  return (
    <FormGroup>
      {items.map((item, index) => (
        <FormControlLabel
          key={index}
          control={
            <Checkbox
              key={index}
              value={item.id}
              name={selectId.toString()}
              onChange={handleChange}
              sx={{ "& .MuiSvgIcon-root": { fontSize: 20 } }}
            />
          }
          label={isSingleValueArray ? item : item.naziv}
        />
      ))}
    </FormGroup>
  );
}
export default CustomCheckBoxList;
