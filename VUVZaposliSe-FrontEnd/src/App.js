import { Route, Routes } from "react-router-dom";
import Home from "./Pages/Home";
import AboutUs from "./Pages/AboutUs";
import UserProfile from "./Pages/UserProfile";
import Login from "./Pages/Login";
import React, { useState } from "react";
import NoMatch from "./Pages/NoMatch";
import MainStyle from "./Style/MainStyle";
import "../src/App.css";
import AppLayout from "./Components/Layout/AppLayout";
import JobAds from "./Pages/JobAds";
import SingleJob from "./Pages/SingleJob";
import Favorites from "./Pages/Favorites";
function App() {
  return (
    <Routes>
      <Route exact path="/" element={<Login />} />
      <Route index path="login" element={<Login />} />
      <Route path="*" element={<NoMatch />} />
      <Route element={<AppLayout />}>
        <Route path="home" element={<Home />} />
        <Route path="aboutus" element={<AboutUs />} />
        <Route path="userprofile" element={<UserProfile />} />
        <Route path="jobads" element={<JobAds />} />
        <Route path="singlejob/:id" element={<SingleJob />} />
        <Route path="favorites" element={<Favorites />} />
        <Route path="*" element={<NoMatch />} />
      </Route>
    </Routes>
  );
}
export default App;
