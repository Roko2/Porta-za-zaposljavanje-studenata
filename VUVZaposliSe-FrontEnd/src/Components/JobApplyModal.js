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

export default function JobApplyModal() {
  const [open, setOpen] = React.useState(false);
  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);
  const [files, setFiles] = React.useState([]);
  return (
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
            <Typography id="transition-modal-title" variant="h4" component="h2">
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
                id="filled-required"
                label="Ime"
                defaultValue="Hello World"
                variant="standard"
              />
              <TextField
                inputProps={{ style: { fontSize: "0.8vw" } }}
                InputLabelProps={{ style: { fontSize: "0.8vw" } }}
                required
                id="filled-required"
                label="Prezime"
                defaultValue="Hello World"
                variant="standard"
              />
              <TextField
                inputProps={{ style: { fontSize: "0.8vw" } }}
                InputLabelProps={{ style: { fontSize: "0.8vw" } }}
                required
                id="filled-required"
                label="Adresa"
                defaultValue="Hello World"
                variant="standard"
              />
              <Typography variant="h6" style={{ marginTop: "4%" }}>
                Unesite Vaš CV
              </Typography>
              <FileUpload value={files} onChange={setFiles} />
            </Stack>
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
              <Button variant="contained" color="success">
                Pošalji prijavu
              </Button>
            </Stack>
          </Box>
        </Fade>
      </Modal>
    </div>
  );
}
