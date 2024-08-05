import axios from "axios";
import { ACCESS_TOKEN } from "./constants";

// Define the base URL, with a fallback to the default if not set
const apiUrl = "http://localhost:8000";  // Fixed URL syntax

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL || apiUrl,  // Use fallback URL if env variable is not set
});

api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem(ACCESS_TOKEN);

    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }

    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default api;
