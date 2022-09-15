import { NavLink, useNavigate } from "react-router-dom";
import { AppBar, Toolbar, IconButton, Stack } from "@mui/material";
import MenuIcon from "@mui/icons-material/Menu";
import { useState, useEffect } from "react";
import { Typography } from "@material-ui/core";
import AccountMenu from "../AccountMenu";
import NavbarButton from "../NavbarButton";
import TextFieldInput from "../TextFieldInput";
import MainStyle from "../../Style/MainStyle";
import * as React from "react";
import Image from "../Image";
import navbarIcon from "../../Images/navbarIcon.png";

import {
  createTheme,
  responsiveFontSizes,
  ThemeProvider,
} from "@mui/material/styles";

let theme = createTheme();
theme = responsiveFontSizes(theme);
function Navigation() {
  const classes = MainStyle();
  const [isNavExpanded, setIsNavExpanded] = useState(false);
  const [kategorije, setKategorije] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    fetch("https://localhost:7137/Kategorije")
      .then((res) => res.json())
      .then((res) => {
        setKategorije(res);
      })
      .catch((err) => console.error(err));
  }, []);
  const imageProps = {
    height: "90%",
    width: "90%",
    src: navbarIcon,
  };

  return (
    <AppBar position="static">
      <Toolbar>
        <MenuIcon
          sx={{ fontSize: "3vw", display: "none" }}
          className="hamburger"
          onClick={() => {
            setIsNavExpanded(!isNavExpanded);
          }}
        />
        <div className={isNavExpanded ? "navbar-menu expanded" : "navbar-menu"}>
          <IconButton
            className="logoIcon"
            style={{ marginLeft: 80 }}
            size="large"
            edge="start"
            color="inherit"
            aria-label="logo"
          >
            <Image {...imageProps} />
          </IconButton>
          <Typography
            style={{ marginRight: 25, fontSize: "1.5vw" }}
            component="div"
          >
            Zaposli se
          </Typography>
          <Stack direction="row" spacing={2} sx={{ ml: 2 }}>
            <NavLink
              className={({ isActive }) =>
                isActive ? "link-active" : "brk-btn"
              }
              to="home"
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              Početna
            </NavLink>
            <NavLink
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
              className={({ isActive }) =>
                isActive ? "link-active" : "brk-btn"
              }
              to="jobads"
            >
              Oglasi
            </NavLink>
            <NavLink
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
              className={({ isActive }) =>
                isActive ? "link-active" : "brk-btn"
              }
              to="aboutus"
            >
              O nama
            </NavLink>
            <NavLink
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
              className={({ isActive }) =>
                isActive ? "link-active" : "brk-btn"
              }
              to="favorites"
            >
              Favoriti
            </NavLink>
          </Stack>
          <Stack sx={{ mx: "auto" }}>
            <TextFieldInput />
          </Stack>
          <Stack sx={{ ml: "auto" }}>
            <AccountMenu />
          </Stack>
        </div>
      </Toolbar>
    </AppBar>
  );
}
export default Navigation;
