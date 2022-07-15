import fina_1 from "../Images/fina_1.webp";
import alca_2 from "../Images/alca_2.jpeg";
import marche_3 from "../Images/marche_3.jpg";
import ipsos_4 from "../Images/ipsos_4.jpg";
import kaufland_5 from "../Images/kaufland_5.jpg";
import a1hrvatska_6 from "../Images/a1hrvatska_6.jpg";
import metro_7 from "../Images/metro_7.webp";
import burgerking_8 from "../Images/burgerking_8.png";
import tifon_9 from "../Images/tifon_9.jpg";
import roto_10 from "../Images/roto_10.png";
export const ImageFinder = (employerId) => {
  let images = [
    "fina_1",
    "alca_2",
    "marche_3",
    "ipsos_4",
    "kaufland_5",
    "a1hrvatska_6",
    "metro_7",
    "burgerking_8",
    "tifon_9",
    "roto_10",
  ];
  let slika;
  images.forEach((element) => {
    let imageCategoryId = element.substring(element.indexOf("_") + 1);
    if (imageCategoryId == employerId) {
      switch (element) {
        case "fina_1":
          slika = fina_1;
          break;
        case "alca_2":
          slika = alca_2;
          break;
        case "marche_3":
          slika = marche_3;
          break;
        case "ipsos_4":
          slika = ipsos_4;
          break;
        case "kaufland_5":
          slika = kaufland_5;
          break;
        case "a1hrvatska_6":
          slika = a1hrvatska_6;
          break;
        case "metro_7":
          slika = metro_7;
          break;
        case "burgerking_8":
          slika = burgerking_8;
          break;
        case "tifon_9":
          slika = tifon_9;
          break;
        case "roto_10":
          slika = roto_10;
          break;
        default:
          break;
      }
    }
  });
  return slika;
};
