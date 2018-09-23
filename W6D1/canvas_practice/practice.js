document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  canvas
  let ctx = canvas.getContext('2d');
  // ctx.fillStyle = getRandomColor();
  // ctx.fillRect(100,100,400,300);

  for (let i = 0; i < 100; i++) {
    ctx.beginPath();
    ctx.strokeStyle = getRandomColor();
    ctx.lineWidth = 2;
    ctx.moveTo(getRandPos(), getRandPos());
    ctx.lineTo(getRandPos(), getRandPos());
    ctx.lineTo(getRandPos(), getRandPos());
    ctx.fillStyle = getRandomColor();
    ctx.fill();
    ctx.stroke();
  }

});

function getRandomColor() {
  let r = Math.floor(Math.random() * 256);
  let g = Math.floor(Math.random() * 256);
  let b = Math.floor(Math.random() * 256);

  return 'rgb(' + r + ',' + g + ',' + b + ')';
}

function getRandPos() {
  let position = Math.floor(Math.random() * 500);
  return position;
}
