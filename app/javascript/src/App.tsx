import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import Hello from "./components/Hello";

export default function App() {
  return (
    <BrowserRouter>
      <Route path="/" component={Hello} />
    </BrowserRouter>
  );
}
