import { Grid } from "@mui/material";
import React, { useEffect, useState } from "react";
import MuiAlert from "@mui/material/Alert";
import Stack from "@mui/material/Stack";
import Button from "@mui/material/Button";
import Snackbar from "@mui/material/Snackbar";
const Alert = React.forwardRef(function Alert(props, ref) {
  return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
});
function Favorite() {
  const [open, setOpen] = useState(false);
  const [userId, setUserId] = useState(null);
  const [checked, setChecked] = useState(null);
  const handleClose = (event, reason) => {
    if (reason === "clickaway") {
      return;
    }

    setOpen(false);
  };
  function handleChange(e) {
    setChecked(e.target.checked);
    fetch(
      "https://localhost:7137/Korisnik/" +
        JSON.parse(localStorage.getItem("data")).user.sub
    )
      .then((res) => res.json())
      .then((res) => {
        setUserId(res);
      })
      .catch((err) => console.error(err));
  }
  useEffect(() => {
    fetch(
      "https://localhost:7137/Korisnik/" +
        JSON.parse(localStorage.getItem("data")).user.sub
    )
      .then((res) => res.json())
      .then((res) => {
        fetch(
          "https://localhost:7137/PosaoIsFavorit?PosaoId=" +
            window.location.pathname.split("/").pop() +
            "&KorisnikId=" +
            res
        )
          .then((res) => res.json())
          .then((res) => {
            document.getElementById("checkbox").checked = res;
          })
          .catch((err) => console.error(err));
      })
      .catch((err) => console.error(err));
  }, []);
  useEffect(() => {
    if (userId != null) {
      let favoriteObj = {
        posaoId: window.location.pathname.split("/").pop(),
        korisnikId: userId,
      };
      fetch("https://localhost:7137/PosaoFavorit", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(favoriteObj),
      })
        .then((res) => res.json())
        .then((res) => {
          setUserId(null);
          setOpen(true);
        })
        .catch((err) => console.error(err));
    }
  }, [userId]);
  return (
    <Grid
      textAlign="center"
      container
      justifyContent="center"
      alignItems="center"
    >
      <Grid item xs>
        <input
          type="checkbox"
          id="checkbox"
          onChange={(event) => handleChange(event)}
        />
        <label htmlFor="checkbox">
          <svg
            id="heart-svg"
            viewBox="467 392 58 57"
            xmlns="http://www.w3.org/2000/svg"
          >
            <g
              id="Group"
              fill="none"
              fillRule="evenodd"
              transform="translate(467 392)"
            >
              <path
                d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                id="heart"
                fill="#AAB8C2"
              />
              <circle
                id="main-circ"
                fill="#E2264D"
                opacity="0"
                cx="29.5"
                cy="29.5"
                r="1.5"
              />

              <g id="grp7" opacity="0" transform="translate(7 6)">
                <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2" />
                <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2" />
              </g>

              <g id="grp6" opacity="0" transform="translate(0 28)">
                <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2" />
                <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2" />
              </g>

              <g id="grp3" opacity="0" transform="translate(52 28)">
                <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2" />
                <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2" />
              </g>

              <g id="grp2" opacity="0" transform="translate(44 6)">
                <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2" />
                <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2" />
              </g>

              <g id="grp5" opacity="0" transform="translate(14 50)">
                <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2" />
                <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2" />
              </g>

              <g id="grp4" opacity="0" transform="translate(35 50)">
                <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2" />
                <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2" />
              </g>

              <g id="grp1" opacity="0" transform="translate(24)">
                <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
                <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
              </g>
            </g>
          </svg>
        </label>
        <Stack spacing={2} sx={{ width: "100%" }}>
          <Snackbar open={open} autoHideDuration={10000} onClose={handleClose}>
            {checked == true ? (
              <Alert
                onClose={handleClose}
                severity="success"
                sx={{ width: "100%", fontSize: "0.8vw" }}
              >
                Posao uspješno dodan u favorite!
              </Alert>
            ) : (
              <Alert
                onClose={handleClose}
                severity="info"
                sx={{ width: "100%", fontSize: "0.8vw" }}
              >
                Posao uspješno obrisan iz favorita!
              </Alert>
            )}
          </Snackbar>
        </Stack>
      </Grid>
    </Grid>
  );
}
export default Favorite;
