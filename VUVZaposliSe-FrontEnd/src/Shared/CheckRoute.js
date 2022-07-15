import { ClearLocalStorageSearch } from "./ClearLocalStorageSearch";
export const CheckRoute = () => {
  let route = window.location.pathname;
  if (route != "/jobads") {
    ClearLocalStorageSearch();
  }
};
