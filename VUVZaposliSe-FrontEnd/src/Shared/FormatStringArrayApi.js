export const FormatStringArrayApi = (type, data) => {
  let resolverArray = [];
  let arrayToParse = [];
  arrayToParse.push(JSON.parse(data));
  arrayToParse.forEach((element) => {
    element.forEach((id) => {
      resolverArray.push(`${type}=${id} `);
    });
  });
  return resolverArray.join("&");
};
