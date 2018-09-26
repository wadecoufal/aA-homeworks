console.log("Hello from the JavaScript console!");

// Your AJAX request here

$.ajax({
      type: 'GET',
      url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
      success(data) {
        console.log("We have your London weather!")
        // console.log(data);
        console.log(data.main['temp']);
      },
      error() {
        console.error("An error occurred.");
      },
   });

// Add another console log here, outside your AJAX request
console.log("End of index.js");

$.ajax({
      type: 'GET',
      url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
      success(data) {
        console.log("We have your New York weather!")
        // console.log(data);
      },
      error() {
        console.error("An error occurred.");
      },
   });

for (let i = 0; i < 1000000000; i++) {
  if (i === 999999999) {
    console.log("Loop finished.")
  }
}
