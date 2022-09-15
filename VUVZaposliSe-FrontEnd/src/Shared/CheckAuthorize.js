export const CheckAuthorize = () => {
  let data = localStorage.getItem("data");
  let tempKey = localStorage.getItem("tempKey");
  if (
    data != null &&
    data != undefined &&
    tempKey != null &&
    tempKey != undefined
  ) {
    let userData = JSON.parse(data);
    if (userData != undefined && userData.user.nonce == tempKey) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};
