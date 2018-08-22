let madLib2 = (verb, adjective, noun) => {
  return `We shall ${verb} the ${adjective} ${noun}`;
};

exports.isSubstring = (searchString, substring) => {
    if (searchString.includes(substring)) {
      return true;
    }
    else {
      return false;
    }
};

//exports.isSubstring = isSubstring

exports.isPrime = (number) => {
  let i;
  for(i=2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
};

exports.sumOfNPrimes = (n, isPrime) => {
  let arr = [2];

  for(let i=3; arr.length < n; i++) {
    if (isPrime(i)) {
      arr.push(i);
    }
  }
  let sum = 0;
  for(let i=0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum;
};
