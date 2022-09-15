import KeyboardArrowUpIcon from "@mui/icons-material/KeyboardArrowUp";
import { useState } from "react";

function ScrollButton() {
  const [visible, setVisible] = useState(false);

  const toggleVisible = () => {
    const scrolled = document.documentElement.scrollTop;
    if (scrolled > 300 && scrolled <= 1850) {
      setVisible(true);
    } else if (scrolled <= 300 || scrolled > 1850) {
      setVisible(false);
    }
  };

  const scrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  };

  window.addEventListener("scroll", toggleVisible);

  return (
    <button
      id="scrollToTop"
      style={{ display: visible ? "inline" : "none" }}
      onClick={scrollToTop}
    >
      <KeyboardArrowUpIcon fontSize="large" />
    </button>
  );
}
export default ScrollButton;
