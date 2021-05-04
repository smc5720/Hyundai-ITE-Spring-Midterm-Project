import React from 'react';
import './App.css';
import {Container} from "react-bootstrap";
import BoardList from "./components/BoardList";

function App() {
  return (
      <Container className="p-3">
        <BoardList></BoardList>
      </Container>
  );
}

export default App;
