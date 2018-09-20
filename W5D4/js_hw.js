function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// Write a function that takes three strings - a verb, an adjective,
// and a noun - uppercases and interpolates them into the sentence "We
// shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
//
// For example,
//
// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}

function isSubstring (searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz (nums) {
  let fizzBuzzArr = [];

  nums.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });
  return fizzBuzzArr;
}

function isPrime (num) {
  if (num < 2) {return false; }

  for (let i=2; i < num; i ++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes (n) {

  function firstNPrimes (n) {
    const primes = [];
    let i = 2;

    while (primes.length < n) {
      if (isPrime(i)) {
        primes.push(i);
      }
      i++;
    }
    return primes;
  }

  let sum = 0;

  n_primes = firstNPrimes(n);

  for (let i=0; i < n_primes.length; i++) {
    sum += n_primes[i];
  }
  return sum;
}

function printCallBack (arr) {
  arr.forEach(el => console.log(el));
}

function titleize (names, callback) {
  let titleized_names = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  printCallBack(titleized_names);
}

function Elephant (name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRR!!!'`)
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function () {
  let rand_num = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[rand_num]}!`)
}

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(Elephant.paradeHelper, herd);
