import { Grid } from "@material-ui/core";
import MainStyle from "../Style/MainStyle";
import Button from "@mui/material/Button";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

function AllCategories({ align, items, space }) {
  const classes = MainStyle();
  const navigate = useNavigate();
  const SearchPage = (event) => {
    navigate("/jobads", {
      state: {
        naziv: event.name,
      },
    });
  };
  return (
    <Grid
      container
      style={{
        width: "100%",
        marginTop: "2%",
        borderRadius: "5px",
      }}
      className="allCategoriesDiv"
      spacing={space}
      justifyContent={align}
    >
      {items.map((item, index) => (
        <Grid style={{ textAlign: "center" }} key={index} item md={3}>
          <Button
            name={item.naziv}
            onClick={(e) => SearchPage(e.target)}
            variant="contained"
          >
            {item.naziv}
          </Button>
        </Grid>
      ))}
    </Grid>
  );
}
export default AllCategories;
