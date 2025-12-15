// Jest setup file - runs before each test file
// Mocks browser globals that our JS files expect

// Mock jQuery
const $ = require("jquery");
global.$ = global.jQuery = $;

// Mock Shiny object
global.Shiny = {
  setInputValue: jest.fn(),
  shinyapp: {
    $inputValues: {
      language: "en",
    },
  },
};
