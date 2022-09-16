import * as React from "react";
import Paper from "@mui/material/Paper";
import InputBase from "@mui/material/InputBase";
import IconButton from "@mui/material/IconButton";
import SearchIcon from "@mui/icons-material/Search";
import { useNavigate } from "react-router-dom";
import { useState } from "react";

function TextFieldInput() {
  const [inputValue, setInputValue] = useState("");
  const navigate = useNavigate();
  const SearchPage = () => {
    navigate("/jobads");
  };

  return (
    <Paper
      sx={{
        p: "2px 4px",
        display: "flex",
        alignItems: "center",
        width: "25vw",
      }}
    >
      <InputBase
        onChange={(e) => setInputValue(e.target.value)}
        id="searchQuery"
        sx={{ ml: 1, flex: 1 }}
        placeholder="Pretraga"
        value={inputValue}
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
