document.addEventListener("DOMContentLoaded", () => {
    const modalTrigger = document.querySelector(".cd-modal-trigger"),
        transitionLayer = document.querySelector(".cd-transition-layer"),
        transitionBackground = transitionLayer.querySelector(".bg-layer"),
        modalWindow = document.querySelector(".cd-modal");

    function animationEndHandler() {
        const animEnd = () => {
            transitionLayer.classList.contains("closing") && (
                transitionLayer.classList.remove("closing", "opening", "visible")
            )
        };

        transitionBackground.addEventListener("animationend", animEnd),
        transitionBackground.addEventListener("webkitAnimationend", animEnd)
    }
    animationEndHandler(),

    modalTrigger.addEventListener("click", e => {
        const delay = document.querySelector(".no-cssanimations") ? 0 : 600;
        e.preventDefault(),
        transitionLayer.classList.add("visible", "opening");
        setTimeout(() => {
            modalWindow.classList.add("visible")
        }, delay)
    }),

    modalWindow.querySelector(".modal-close").addEventListener("click", e => {
        e.preventDefault(),
        transitionLayer.classList.add("closing"),
        modalWindow.classList.remove("visible")
    })

})

const modalTrigger = document.querySelector(".cd-modal-trigger"),
    transitionLayer = document.querySelector(".cd-transition-layer"),
    transitionBackground = transitionLayer.querySelector(".bg-layer"),
    modalWindow = document.querySelector(".cd-modal");

function pageTransition(nodeList) {
    nodeList.forEach(a => {
        const href = a.getAttribute("href");
        const hash = a.hash || "tmp";

        href && href[0] !== "#" && a.target !== "_blank" && a.href !== `${location.protocol}//${location.hostname}${location.pathname}${hash}` && (
            a.addEventListener("click", e => {
                e.preventDefault(),

                    setTimeout(() => {
                        transitionLayer.classList.contains("visible") && (
                            location.href = href
                        )
                    }, 800),
                    transitionLayer.classList.add("visible", "opening")
            })
        )
    })
}

function inkTransitionInit() {
    const animEnd = () => {
        transitionLayer.classList.contains("closing") && (
            transitionLayer.classList.remove("closing", "opening", "visible", "opened")
        )
    };
    const bgImg = new Image();
    bgImg.src = "ink.png주소",

        bgImg.onload = () => {
            setTimeout(() => {
                transitionLayer.classList.remove("color")
            }, 200),
                setTimeout(() => {
                    transitionLayer.classList.add("closing")
                }, 300)
        },

        transitionBackground.addEventListener("animationend", animEnd),
        transitionBackground.addEventListener("webkitAnimationend", animEnd)
}

inkTransitionInit(),
    pageTransition(document.querySelectorAll("a"))