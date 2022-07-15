import { Box } from "@mui/material";
function Image(props) {
  return (
    <Box
      style={props.customStyle}
      component="img"
      sx={{
        height: props.height,
        width: props.width,
      }}
      src={props.src}
    />
  );
}
export default Image;
