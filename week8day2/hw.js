function FizzBuzz(array) {
    let result = [];
    for (let i = 0; i < array.length; i++) {
        if ((array[i] % 3 === 0) ^ (array[i] % 5 === 0)) {
            result.push(array[i]);
        }
    }
    return result;
}
