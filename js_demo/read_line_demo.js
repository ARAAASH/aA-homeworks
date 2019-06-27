const readline = require('readline');

const reader = readline.createInterface({
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addTwoNumbers(callback) {
  reader.question('enter first num:', function(num1Srting) {
    reader.question('enter second num: ', function(num2String) {
      const num1 = parseInt(num1Srting);
      const num2 = parseInt(num2String);
      callback(num1 + num2);
    });
  });
}

addTwoNumbers(function(result) {
  console.log(result);
  reader.close();
});