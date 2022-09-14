import * as React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardMedia from "@mui/material/CardMedia";
import Typography from "@mui/material/Typography";
import { ChoiceRemember } from "../Shared/ChoiceRemember";
import {
  Button,
  CardActionArea,
  CardActions,
  Divider,
  filledInputClasses,
} from "@mui/material";

import { Link, useNavigate, useSearchParams } from "react-router-dom";
import { ImageFinder } from "../Shared/ImageFinder";
function JobCard({ label, details, employerId, jobId }) {
  function shorten(str, maxLen, separator = " ") {
    if (str.length <= maxLen) return str;
    return str.substr(0, str.lastIndexOf(separator, maxLen));
  }
  return (
    <Card sx={{ maxWidth: 345 }}>
      <CardActionArea>
        <CardMedia
          component="img"
          height="140"
          image={ImageFinder(employerId)}
        />
        <CardContent>
          <Typography gutterBottom variant="h4" component="div">
            {label}
          </Typography>
          <Typography variant="h5" color="text.secondary">
            {shorten(details, 150) + "..."}
          </Typography>
        </CardContent>
        <Divider variant="middle" flexItem />
      </CardActionArea>
      <CardActions>
        <Button
          component={Link}
          size="medium"
          color="primary"
          sx={{ ml: "auto" }}
          key={jobId}
          onClick={ChoiceRemember(jobId)}
          to={`/singlejob/${jobId}`}
        >
          Detalji
        </Button>
      </CardActions>
    </Card>
  );
}
export default JobCard;
