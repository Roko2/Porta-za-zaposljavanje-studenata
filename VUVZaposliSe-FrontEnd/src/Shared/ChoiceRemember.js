export const ChoiceRemember = (jobId) => {
  let preferenceArray = localStorage.getItem("preference")?.split(",");
  fetch("https://localhost:7137/KategorijaPosla/" + jobId)
    .then((res) => res.json())
    .then((res) => {
      if (!preferenceArray) {
        localStorage.setItem("preference", res);
      } else if (preferenceArray.length < 20) {
        preferenceArray.push(res);
        localStorage.setItem("preference", preferenceArray);
      } else {
        preferenceArray.shift();
        preferenceArray.push(res);
        localStorage.setItem("preference", preferenceArray);
      }
    })
    .catch((err) => console.error(err));
};
