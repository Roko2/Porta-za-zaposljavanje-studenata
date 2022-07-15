import * as React from "react";
import Paper from "@mui/material/Paper";
import InputBase from "@mui/material/InputBase";
import Divider from "@mui/material/Divider";
import IconButton from "@mui/material/IconButton";
import MenuIcon from "@mui/icons-material/Menu";
import SearchIcon from "@mui/icons-material/Search";
import DirectionsIcon from "@mui/icons-material/Directions";
import MainStyle from "../Style/MainStyle";
import { useNavigate } from "react-router-dom";

function TextFieldInput() {
  const classes = MainStyle();
  const navigate = useNavigate();
  const SearchPage = () => {
    navigate("/jobads", {
      state: {
        naziv: document.getElementById("searchQuery").value,
      },
    });
  };

  return (
    <Paper
      sx={{ p: "2px 4px", display: "flex", alignItems: "center", width: 400 }}
    >
      <InputBase
        id="searchQuery"
        sx={{ ml: 1, flex: 1 }}
        placeholder="Pretraga"
        inputProps={{ "aria-label": "pretraga" }}
      />
      <IconButton
        onClick={() => SearchPage()}
        type="button"
        sx={{ p: "10px" }}
        aria-label="search"
      >
        <SearchIcon />
      </IconButton>
    </Paper>
  );
}
export default TextFieldInput;
