import { CheckRoute } from "../Shared/CheckRoute";
function NoMatch() {
  CheckRoute();
  return (
    <>
      <div>Ne znamo kako ste završili na ovom linku!</div>
      <div>Obratite se administratoru</div>
    </>
  );
}
export default NoMatch;
