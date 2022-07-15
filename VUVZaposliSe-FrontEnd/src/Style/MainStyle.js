import { makeStyles } from "@mui/styles";
function MainStyle() {}
export default MainStyle = makeStyles((theme) => ({
  appBar: {
    color: "red",
  },
  root: {
    margin: 0,
    padding: 0,
    width: "100%",
  },
  inputColor: {
    "& label": {
      color: "white",
    },
    "& label.Mui-focused": {
      color: "white !important",
    },
    "& .MuiInput-underline:after": {
      borderBottomColor: "white",
    },
    "& .MuiOutlinedInput-root": {
      "& fieldset": {
        borderColor: "white",
      },
      "&:hover fieldset": {
        borderColor: "white",
        borderWidth: "0.15rem",
      },
      "&.Mui-focused fieldset": {
        borderColor: "white",
      },
    },
  },
  linkStyle: {
    textDecoration: "none !important",
    color: "white",
  },
  loginDiv: {
    backgroundColor: "#6884e4 !important",
    height: "100vh",
  },
  loginCntrDiv: {
    width: "50vw",
    height: "50vh",
    borderRadius: 5,
    backgroundColor: "white",
    boxShadow: "rgba(0, 0, 0, 0.35) 0px 5px 15px;",
  },
}));
