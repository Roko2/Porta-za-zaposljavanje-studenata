export const ChoiceRemember = (jobId) => {
  let preferenceArray = localStorage.getItem("preference").split(",");
  if (preferenceArray.length < 20) {
    preferenceArray.push(jobId);
    localStorage.setItem("preference", preferenceArray);
  } else {
    preferenceArray.shift();
    preferenceArray.push(jobId);
    localStorage.setItem("preference", preferenceArray);
  }
};
