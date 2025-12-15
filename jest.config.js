/** @type {import('jest').Config} */
module.exports = {
  // Use jsdom to simulate browser environment
  testEnvironment: "jsdom",

  // Where to find tests
  testMatch: ["**/tests/**/*.test.js"],

  // Setup file to configure jsdom with jQuery
  setupFilesAfterEnv: ["./tests/setup.js"],

  // Verbose output
  verbose: true,
};
