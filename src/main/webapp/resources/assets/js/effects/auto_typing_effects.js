let i = 0,
    j = 0;

const textArray = ["HTML", "CSS", "Javascript"],
    speed = 100,
    target = document.getElementById("type");

function txtnum() {
    j == textArray.length - 1
        ? j = 0
        : j++
}

function type() {
    i < textArray[j].length
        ? (target.innerHTML += textArray[j].charAt(i), i++, setTimeout(type, speed))
        : remove()
}

function remove() {
    0 <= i
        ? (target.innerHTML = target.innerHTML.slice(0, i), i--, setTimeout(remove, speed))
        : (type(), txtnum())
}

type();