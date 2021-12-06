
// Mockito

// Mock dependencies using mockito

// 1. Add the package dependencies
// 2. Create a function to test
// 3. Create a test file with a mock http.Client
// 4. Write as test for each condition
// 5. Run the tests

// Sometimes calling databases slows down test execution
// A passing test might start failing if a web service or database returns unexpected results
  // --> this is a Flaky test
// It is difficult to tes all possible success and failure scenarios by using a live web service or database
// You can 'mock' dependencies that require a web service. Mocks allow emulating a live web service or database and return specific results depending on the situation

// You can mock dependencies by creating an alternative immplementation of a class
// Write these alternative implementations by hand or make use of the Mockito package as a shortcut

// The recipe demonstrates the basics of mocking with the Mockito Package

// 1. Add the package dependencies
// 2. Create a function to test
// 3. Create a test file with a mock http.Client
// 4. Write as test for each condition
// 5. Run the tests


// Using Mockito, we can mock a database function