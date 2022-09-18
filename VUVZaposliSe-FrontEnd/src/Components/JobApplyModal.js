import * as React from "react";
import Backdrop from "@mui/material/Backdrop";
import Box from "@mui/material/Box";
import Modal from "@mui/material/Modal";
import Fade from "@mui/material/Fade";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import TextField from "@mui/material/TextField";
import { Stack } from "@mui/material";
import FileUpload from "react-material-file-upload";
import axios from "axios";
import { CircularProgress, Grid, Snackbar } from "@material-ui/core";
import MuiAlert from "@mui/material/Alert";
const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 500,
  bgcolor: "background.paper",
  boxShadow: 24,
  p: 4,
};
const Alert = React.forwardRef(function Alert(props, ref) {
  return <MuiAlert elevation={6} ref={ref} variant="filled" {...props} />;
});
export default function JobApplyModal() {
  const [open, setOpen] = React.useState(false);
  const [openSnackbar, setOpenSnackbar] = React.useState(false);
  const [ime, setIme] = React.useState(null);
  const [prezime, setPrezime] = React.useState(null);
  const [adresa, setAdresa] = React.useState(null);
  const [displayValidation, setDisplayValidation] = React.useState("none");
  const [jobSendSuccess, setJobSendSuccess] = React.useState("none");
  const handleOpen = () => {
    let user = JSON.parse(localStorage.getItem("data")).user;
    setIme(user.given_name);
    setPrezime(user.family_name);
    setAdresa(user.address.locality);
    setOpen(true);
  };
  const handleCloseSnackbar = (event, reason) => {
    if (reason === "clickaway") {
      return;
    }
    setOpenSnackbar(false);
  };
  const handleClose = () => setOpen(false);
  const [files, setFiles] = React.useState([]);

  const ApplyForJob = async (e) => {
    if (files == null || files.length == 0) {
      setDisplayValidation("block");
      setJobSendSuccess("none");
    } else {
      setJobSendSuccess("block");
      var data = new FormData();
      data.append("prilog", files[0]);
      data.append("primatelj", "da");
      data.append("predmet", "Prijavnica za posao");
      let preparedContent =
        "<p>Poštovani, <br><br>student " +
        ime +
        " " +
        prezime +
        " u privitku Vam šalje CV za svrhu prijave za posao.<br><br>Lijep pozdrav, <br><br>Web portal 'Zaposli se'.</p>";
      data.append("sadrzaj", preparedContent);
      try {
        const res = await axios.post(
          "https://localhost:7137/PosaljiEmail",
          data
        );
        setDisplayValidation("none");
        setOpen(false);
        setOpenSnackbar(true);
        setJobSendSuccess("none");
        setFiles([]);
      } catch (ex) {
        console.log(ex);
      }
    }
  };
  return (
    <>
      <div
        style={{
          width: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
        }}
      >
        <Button
          onClick={handleOpen}
          style={{
            marginTop: "1%",
            width: "35%",
          }}
          size="large"
          variant="contained"
        >
          Prijavi se za posao
        </Button>

        <Modal
          aria-labelledby="transition-modal-title"
          aria-describedby="transition-modal-description"
          open={open}
          onClose={handleClose}
          closeAfterTransition
          BackdropComponent={Backdrop}
          BackdropProps={{
            timeout: 500,
          }}
        >
          <Fade in={open}>
            <Box sx={style}>
              <Typography
                id="transition-modal-title"
                variant="h4"
                component="h2"
              >
                Prijavnica za posao
              </Typography>
              <Typography
                id="transition-modal-description"
                variant="h6"
                sx={{ mt: 2 }}
              >
                Vaši podaci koji se šalju poslodavcu
              </Typography>
              <Stack sx={{ mt: 3 }} spacing={2}>
                <TextField
                  inputProps={{ style: { fontSize: "0.8vw" } }}
                  InputLabelProps={{ style: { fontSize: "0.8vw" } }}
                  required
                  id="inptIme"
                  value={ime}
                  label="Ime"
                  variant="standard"
                />
                <TextField
                  inputProps={{ style: { fontSize: "0.8vw" } }}
                  InputLabelProps={{ style: { fontSize: "0.8vw" } }}
                  required
                  id="inptPrezime"
                  label="Prezime"
                  value={prezime}
                  variant="standard"
                />
                <TextField
                  inputProps={{ style: { fontSize: "0.8vw" } }}
                  InputLabelProps={{ style: { fontSize: "0.8vw" } }}
                  required
                  id="inptAdresa"
                  label="Adresa"
                  value={adresa}
                  variant="standard"
                />
                <Typography variant="h6" style={{ marginTop: "4%" }}>
                  Unesite Vaš CV
                </Typography>
                <FileUpload value={files} onChange={setFiles} />
                <Typography
                  variant="body1"
                  display={displayValidation}
                  sx={{ color: "red", mt: 1 }}
                >
                  CV je obavezno polje
                </Typography>
              </Stack>
              <Box textAlign="center" display={jobSendSuccess}>
                <CircularProgress
                  id="circularProgressJobApply"
                  thickness={3}
                  style={{ marginTop: "4%" }}
                />
              </Box>
              <Stack
                direction="row"
                justifyContent="flex-end"
                spacing={1}
                sx={{ mt: 4 }}
              >
                <Button
                  onClick={handleClose}
                  variant="contained"
                  style={{ color: "white", background: "gray" }}
                >
                  Odustani
                </Button>
                <Button
                  variant="contained"
                  color="success"
                  onClick={() => ApplyForJob()}
                >
                  Pošalji prijavu
                </Button>
              </Stack>
            </Box>
          </Fade>
        </Modal>
      </div>
      <Snackbar
        open={openSnackbar}
        autoHideDuration={10000}
        onClose={handleCloseSnackbar}
        style={{ left: "15%" }}
      >
        <Alert
          onClose={handleCloseSnackbar}
          severity="success"
          sx={{ width: "100%", fontSize: 13 }}
        >
          Prijavnica je uspješno poslana poslodavcu!
        </Alert>
      </Snackbar>
    </>
  );
}
