import React from "react";
import img from "../images/Pad_thai.png";
import Header from "../components/Header";
import FoodTypes from "../components/FoodTypes";
import FoodBrands from "../components/FoodBrands";
import ResCards from "../components/ResCards";
import Footer from "../components/Footer";
function Home() {
  return (
    <div>
      <div className="no-use">
        <Header />
        <div className="butter">
          <div className="cover-text">
            <h1>Craving? Just grab some bites!</h1>
          </div>
          <img src={img} alt="Pad Thai" />
        </div>
      </div>
      <ResCards />
      <FoodTypes />
      <FoodBrands />
      <Footer />
    </div>
  );
}

export default Home;
