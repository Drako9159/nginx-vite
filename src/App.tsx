import { useState, useEffect } from "react";

import "./App.css";
import { API } from "./config/constants";

function App() {
  const [posts, setPosts] = useState([]);

  function handleClick() {
    console.log(posts);
  }

  useEffect(() => {
    fetch(API)
      .then((response) => {
        return response.json();
      })
      .then((data) => setPosts(data));
    
  }, []);

  return (
    <div className="App">
      <p className="read-the-docs">Datos que vienen de un API</p>
      
      <button onClick={handleClick}>Respiesta API</button>
    </div>
  );
}

export default App;
