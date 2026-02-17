import axios from "axios";
import { useEffect, useState } from "react";

const API_URL = process.env.REACT_APP_API_URL;

function Res() {
  const [listOfRestaurants, setListOfRestaurants] = useState([]);

  useEffect(() => {
    axios
      .get(`${API_URL}/restaurants`)
      .then((response) => {
        setListOfRestaurants(response.data);
      })
      .catch((error) => {
        console.error("Error fetching restaurants:", error);
      });
  }, []);

  return (
    <div>
      {listOfRestaurants.map((restaurant) => {
        return (
          <div key={restaurant.restaurant_id} className="restaurant">
            <div className="name">{restaurant.name}</div>
            <div className="address">{restaurant.address}</div>
            <div className="phone">{restaurant.phone}</div>
          </div>
        );
      })}
    </div>
  );
}

export default Res;
