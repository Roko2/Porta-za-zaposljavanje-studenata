import * as React from "react";
import Box from "@mui/material/Box";
import Avatar from "@mui/material/Avatar";
import Menu from "@mui/material/Menu";
import MenuItem from "@mui/material/MenuItem";
import ListItemIcon from "@mui/material/ListItemIcon";
import Divider from "@mui/material/Divider";
import IconButton from "@mui/material/IconButton";
import Typography from "@mui/material/Typography";
import Tooltip from "@mui/material/Tooltip";
import PersonAdd from "@mui/icons-material/PersonAdd";
import Settings from "@mui/icons-material/Settings";
import Logout from "@mui/icons-material/Logout";
import NavbarButton from "./NavbarButton";
import { Link } from "react-router-dom";

export default function AccountMenu() {
  const [anchorEl, setAnchorEl] = React.useState(null);
  const [userInitials, setUserInitials] = React.useState(null);
  const open = Boolean(anchorEl);
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };
  const handleClose = () => {
    setAnchorEl(null);
  };
  function Odjavi() {
    var data = JSON.parse(localStorage.getItem("data"));
    fetch(
      "https://fed-lab.aaiedu.hr/sso/module.php/oidc/logout.php?id_token_hint=" +
        data.signature +
        "&post_logout_redirect_uri=https://localhost:3000/login",
      {
        redirect: "manual",
        method: "GET",
        mode: "cors",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
      }
    )
      .then((data) => data)
      .then((response) => {
        if (!response.redirected) {
          window.location.href = response.url;
          localStorage.clear();
        }
      })
      .catch((err) => console.error(err));
  }
  React.useEffect(() => {
    setTimeout(function () {
      let userData = JSON.parse(localStorage.getItem("data")).user;
      setUserInitials(
        userData.given_name.charAt(0) + userData.family_name.charAt(0)
      );
    }, 200);
  }, []);
  return (
    <React.Fragment>
      <Box sx={{ display: "flex", alignItems: "center", textAlign: "center" }}>
        <Tooltip
          title={<span style={{ fontSize: "0.6vw" }}>Postavke računa</span>}
          fontSize="30px"
        >
          <IconButton
            onClick={handleClick}
            size="medium"
            sx={{ ml: 2 }}
            aria-controls={open ? "account-menu" : undefined}
            aria-haspopup="true"
            aria-expanded={open ? "true" : undefined}
          >
            <Avatar sx={{ width: 40, height: 40 }}>
              {userInitials == null ? "" : userInitials}
            </Avatar>
          </IconButton>
        </Tooltip>
      </Box>
      <Menu
        anchorEl={anchorEl}
        id="account-menu"
        open={open}
        onClose={handleClose}
        onClick={handleClose}
        PaperProps={{
          elevation: 0,
          sx: {
            overflow: "visible",
            filter: "drop-shadow(0px 2px 8px rgba(0,0,0,0.32))",
            mt: 1.5,
            "& .MuiAvatar-root": {
              width: 32,
              height: 32,
              ml: -0.5,
              mr: 1,
            },
            "&:before": {
              content: '""',
              display: "block",
              position: "absolute",
              top: 0,
              right: 14,
              width: 10,
              height: 10,
              bgcolor: "background.paper",
              transform: "translateY(-50%) rotate(45deg)",
              zIndex: 0,
            },
          },
        }}
        transformOrigin={{ horizontal: "right", vertical: "top" }}
        anchorOrigin={{ horizontal: "right", vertical: "bottom" }}
      >
        <MenuItem
          style={{ textDecoration: "none", outline: "none" }}
          component={Link}
          to="userprofile"
        >
          <Avatar /> <Typography variant="body1">Profil</Typography>
        </MenuItem>
        <Divider />
        <MenuItem onClick={Odjavi}>
          <ListItemIcon>
            <Logout fontSize="medium" />
          </ListItemIcon>
          <Typography variant="body1">Odjava</Typography>
        </MenuItem>
      </Menu>
    </React.Fragment>
  );
}
