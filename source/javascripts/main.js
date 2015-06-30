$(function() {
    Reveal.initialize({
        controls: true,
        progress: true,
        history: true,
        center: true,
        slideNumber: false,
        mouseWheel: true,
        transition: 'none',

        dependencies: []
    });

    hljs.initHighlightingOnLoad();

    autoProtips();

    Reveal.addEventListener( 'slidechanged', function( event ) {
        autoProtips();
        // event.previousSlide, event.currentSlide, event.indexh, event.indexv
    } );

    function autoProtips() {
        var indices = Reveal.getIndices();
        if(indices.h >= 4 && !Reveal.isAutoSliding()) {
            Reveal.configure({
                autoSlide: 10000,
                transition: 'fade'
            });

            Reveal.toggleAutoSlide();
        }

        if(Reveal.getProgress() === 1) {
            Reveal.slide(4);
        }
    }
});