let kepek = ["images/hatter/Liverpool_St_crop.jpg","images/hatter/LiverpoolSt_05_crop.jpg", 
"images/hatter/DSC_0921_Copy_crop.jpg", "images/hatter/burger-foto-3_crop.jpg",
"images/hatter/burger-foto-2_crop.jpg", "images/hatter/burger-foto-1_crop.jpg"];

let aktualis = 0;
ReactDOM.render(React.createElement(App), document.getElementById("headerimage_carussel"));

function App() {
  const [kep, setKep] = React.useState(aktualis);
  React.useEffect(() => {
    const lapozo = setInterval(() => {
      if (aktualis < 5) {
        aktualis++;
      } else {
        aktualis = 0;
      }
      console.log(aktualis);
      setKep(aktualis);
    }, 3000); // clearing interval

    return () => clearInterval(lapozo);
  });
  return React.createElement("img", {
    src: kepek[kep],
    style: {
      width: "1300px",
      height: "360px",
      marginLeft: "auto",
      marginRight: "auto"
    }
  });
}