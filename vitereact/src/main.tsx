import { createRoot } from "react-dom/client";
import App from "./App";
import { Provider } from 'react-redux';
import store from './store/main';
import "./index.css";
import "./styles/task-manager.css";
import { Toaster } from "./components/ui/toaster";

createRoot(document.getElementById("root")!).render(
  <Provider store={store}>
    <App />
    <Toaster />
  </Provider>
);