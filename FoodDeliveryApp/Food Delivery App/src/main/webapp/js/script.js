gsap.to("header",{
    background: "linear-gradient(120deg,#222831 50%,#EB5B00 10%)",
    backdropFilter: "blur(20px)",
    scrollTrigger:{
        trigger:"nav",
        scroller:"body",
        start:"top -1%",
        end:"top -5%",
        scrub:1
    }
})
gsap.from("#container h1,#container p",{
    opacity:0,
    duration:0.5,
    delay:0.7,
    x:-10
})
gsap.from("#container #right img",{
    duration:0.5,
    opacity:0,
    delay:0.7,
    x:50
})
gsap.from("header",{
    opacity:0,
    duration:0.5,
    delay:0.7,
    y:-10
})
gsap.from("#main-body",{
    opacity:0,
    duration:0.5,
    delay:0.7,
    x:-10
})
gsap.from("#container",{
    opacity:0,
    duration:0.5,
    delay:0.7,
})

