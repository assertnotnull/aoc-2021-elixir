const fs = require("fs");
const file = fs.readFileSync("input", "utf-8");

const out = file
  .split("\n")
  .map((v) => +v)
  //   .map((val, index, arr) => {
  //     if (index > 0) {
  //       if (val > arr[index - 1]) {
  //         return { val, depth: "increase" };
  //       }
  //       return { val, depth: "decrease" };
  //     } else {
  //       return { val, depth: "n/a" };
  //     }
  //   });
  .reduce(
    (acc, val) =>
      val > acc.val
        ? { val, increments: acc.increments + 1 }
        : { val, increments: acc.increments },
    { val: 0, increments: 0 }
  );

console.log(out.increments - 1);
//console.log(out);
// console.log(
//   out.reduce((acc, entry) => {
//     entry.depth === "increase" ? acc + 1 : acc;
//   }, 0)
// );
