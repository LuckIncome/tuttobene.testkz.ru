(function (factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        // Node/CommonJS
        factory(require('jquery'));
    } else {
        // Browser globals
        factory(jQuery);
    }
}(function ($)
{

    var ua = navigator.userAgent,
        iPhone = /iphone/i.test(ua),
        chrome = /chrome/i.test(ua),
        android = /android/i.test(ua),
        caretTimeoutId;

    $.mask = {
        //Predefined character definitions
        definitions: {
            '9': "[0-9]",
            'a': "[A-Za-z]",
            '*': "[A-Za-z0-9]"
        },
        autoclear: true,
        dataName: "rawMaskFn",
        placeholder: '_'
    };

    $.fn.extend({
        //Helper Function for Caret positioning
        caret: function (begin, end) {
            var range;

            if (this.length === 0 || this.is(":hidden") || this.get(0) !== document.activeElement) {
                return;
            }

            if (typeof begin == 'number') {
                end = (typeof end === 'number') ? end : begin;
                return this.each(function () {
                    if (this.setSelectionRange) {
                        this.setSelectionRange(begin, end);
                    } else if (this.createTextRange) {
                        range = this.createTextRange();
                        range.collapse(true);
                        range.moveEnd('character', end);
                        range.moveStart('character', begin);
                        range.select();
                    }
                });
            } else {
                if (this[0].setSelectionRange) {
                    begin = this[0].selectionStart;
                    end = this[0].selectionEnd;
                } else if (document.selection && document.selection.createRange) {
                    range = document.selection.createRange();
                    begin = 0 - range.duplicate().moveStart('character', -100000);
                    end = begin + range.text.length;
                }
                return {begin: begin, end: end};
            }
        },
        unmask: function () {
            return this.trigger("unmask");
        },
        mask: function (mask, settings) {
            var input,
                defs,
                tests,
                partialPosition,
                firstNonMaskPos,
                lastRequiredNonMaskPos,
                len,
                oldVal;

            if (!mask && this.length > 0) {
                input = $(this[0]);
                var fn = input.data($.mask.dataName)
                return fn ? fn() : undefined;
            }

            settings = $.extend({
                autoclear: $.mask.autoclear,
                placeholder: $.mask.placeholder, // Load default placeholder
                completed: null
            }, settings);


            defs = $.mask.definitions;
            tests = [];
            partialPosition = len = mask.length;
            firstNonMaskPos = null;

            mask = String(mask);

            $.each(mask.split(""), function (i, c) {
                if (c == '?') {
                    len--;
                    partialPosition = i;
                } else if (defs[c]) {
                    tests.push(new RegExp(defs[c]));
                    if (firstNonMaskPos === null) {
                        firstNonMaskPos = tests.length - 1;
                    }
                    if (i < partialPosition) {
                        lastRequiredNonMaskPos = tests.length - 1;
                    }
                } else {
                    tests.push(null);
                }
            });

            return this.trigger("unmask").each(function () {
                var input = $(this),
                    buffer = $.map(
                        mask.split(""),
                        function (c, i) {
                            if (c != '?') {
                                return defs[c] ? getPlaceholder(i) : c;
                            }
                        }),
                    defaultBuffer = buffer.join(''),
                    focusText = input.val();

                function tryFireCompleted() {
                    if (!settings.completed) {
                        return;
                    }

                    for (var i = firstNonMaskPos; i <= lastRequiredNonMaskPos; i++) {
                        if (tests[i] && buffer[i] === getPlaceholder(i)) {
                            return;
                        }
                    }
                    settings.completed.call(input);
                }

                function getPlaceholder(i) {
                    if (i < settings.placeholder.length)
                        return settings.placeholder.charAt(i);
                    return settings.placeholder.charAt(0);
                }

                function seekNext(pos) {
                    while (++pos < len && !tests[pos]) ;
                    return pos;
                }

                function seekPrev(pos) {
                    while (--pos >= 0 && !tests[pos]) ;
                    return pos;
                }

                function shiftL(begin, end) {
                    var i,
                        j;

                    if (begin < 0) {
                        return;
                    }

                    for (i = begin, j = seekNext(end); i < len; i++) {
                        if (tests[i]) {
                            if (j < len && tests[i].test(buffer[j])) {
                                buffer[i] = buffer[j];
                                buffer[j] = getPlaceholder(j);
                            } else {
                                break;
                            }

                            j = seekNext(j);
                        }
                    }
                    writeBuffer();
                    input.caret(Math.max(firstNonMaskPos, begin));
                }

                function shiftR(pos) {
                    var i,
                        c,
                        j,
                        t;

                    for (i = pos, c = getPlaceholder(pos); i < len; i++) {
                        if (tests[i]) {
                            j = seekNext(i);
                            t = buffer[i];
                            buffer[i] = c;
                            if (j < len && tests[j].test(t)) {
                                c = t;
                            } else {
                                break;
                            }
                        }
                    }
                }

                function androidInputEvent(e) {
                    var curVal = input.val();
                    var pos = input.caret();
                    if (oldVal && oldVal.length && oldVal.length > curVal.length) {
                        // a deletion or backspace happened
                        checkVal(true);
                        while (pos.begin > 0 && !tests[pos.begin - 1])
                            pos.begin--;
                        if (pos.begin === 0) {
                            while (pos.begin < firstNonMaskPos && !tests[pos.begin])
                                pos.begin++;
                        }
                        input.caret(pos.begin, pos.begin);
                    } else {
                        var pos2 = checkVal(true);
                        var lastEnteredValue = curVal.charAt(pos.begin);
                        if (pos.begin < len) {
                            if (!tests[pos.begin]) {
                                pos.begin++;
                                if (tests[pos.begin].test(lastEnteredValue)) {
                                    pos.begin++;
                                }
                            } else {
                                if (tests[pos.begin].test(lastEnteredValue)) {
                                    pos.begin++;
                                }
                            }
                        }
                        input.caret(pos.begin, pos.begin);
                    }
                    tryFireCompleted();
                }


                function blurEvent(e) {
                    checkVal();

                    if (input.val() != focusText)
                        input.change();
                }

                function keydownEvent(e) {
                    if (input.prop("readonly")) {
                        return;
                    }

                    var k = e.which || e.keyCode,
                        pos,
                        begin,
                        end;
                    oldVal = input.val();
                    //backspace, delete, and escape get special treatment
                    if (k === 8 || k === 46 || (iPhone && k === 127)) {
                        pos = input.caret();
                        begin = pos.begin;
                        end = pos.end;

                        if (end - begin === 0) {
                            begin = k !== 46 ? seekPrev(begin) : (end = seekNext(begin - 1));
                            end = k === 46 ? seekNext(end) : end;
                        }
                        clearBuffer(begin, end);
                        shiftL(begin, end - 1);

                        e.preventDefault();
                    } else if (k === 13) { // enter
                        blurEvent.call(this, e);
                    } else if (k === 27) { // escape
                        input.val(focusText);
                        input.caret(0, checkVal());
                        e.preventDefault();
                    }
                }

                function keypressEvent(e) {
                    if (input.prop("readonly")) {
                        return;
                    }

                    var k = e.which || e.keyCode,
                        pos = input.caret(),
                        p,
                        c,
                        next;

                    if (e.ctrlKey || e.altKey || e.metaKey || k < 32) {//Ignore
                        return;
                    } else if (k && k !== 13) {
                        if (pos.end - pos.begin !== 0) {
                            clearBuffer(pos.begin, pos.end);
                            shiftL(pos.begin, pos.end - 1);
                        }

                        p = seekNext(pos.begin - 1);
                        if (p < len) {
                            c = String.fromCharCode(k);
                            if (tests[p].test(c)) {
                                shiftR(p);

                                buffer[p] = c;
                                writeBuffer();
                                next = seekNext(p);

                                if (android) {
                                    //Path for CSP Violation on FireFox OS 1.1
                                    var proxy = function () {
                                        $.proxy($.fn.caret, input, next)();
                                    };

                                    setTimeout(proxy, 0);
                                } else {
                                    input.caret(next);
                                }
                                if (pos.begin <= lastRequiredNonMaskPos) {
                                    tryFireCompleted();
                                }
                            }
                        }
                        e.preventDefault();
                    }
                }

                function clearBuffer(start, end) {
                    var i;
                    for (i = start; i < end && i < len; i++) {
                        if (tests[i]) {
                            buffer[i] = getPlaceholder(i);
                        }
                    }
                }

                function writeBuffer() {
                    input.val(buffer.join(''));
                }

                function checkVal(allow) {
                    //try to place characters where they belong
                    var test = input.val(),
                        lastMatch = -1,
                        i,
                        c,
                        pos;

                    for (i = 0, pos = 0; i < len; i++) {
                        if (tests[i]) {
                            buffer[i] = getPlaceholder(i);
                            while (pos++ < test.length) {
                                c = test.charAt(pos - 1);
                                if (tests[i].test(c)) {
                                    buffer[i] = c;
                                    lastMatch = i;
                                    break;
                                }
                            }
                            if (pos > test.length) {
                                clearBuffer(i + 1, len);
                                break;
                            }
                        } else {
                            if (buffer[i] === test.charAt(pos)) {
                                pos++;
                            }
                            if (i < partialPosition) {
                                lastMatch = i;
                            }
                        }
                    }
                    if (allow) {
                        writeBuffer();
                    } else if (lastMatch + 1 < partialPosition) {
                        if (settings.autoclear || buffer.join('') === defaultBuffer) {
                            // Invalid value. Remove it and replace it with the
                            // mask, which is the default behavior.
                            if (input.val()) input.val("");
                            clearBuffer(0, len);
                        } else {
                            // Invalid value, but we opt to show the value to the
                            // user and allow them to correct their mistake.
                            writeBuffer();
                        }
                    } else {
                        writeBuffer();
                        input.val(input.val().substring(0, lastMatch + 1));
                    }
                    return (partialPosition ? i : firstNonMaskPos);
                }

                input.data($.mask.dataName, function () {
                    return $.map(buffer, function (c, i) {
                        return tests[i] && c != getPlaceholder(i) ? c : null;
                    }).join('');
                });


                input
                    .one("unmask", function () {
                        input
                            .off(".mask")
                            .removeData($.mask.dataName);
                    })
                    .on("focus.mask", function () {
                        if (input.prop("readonly")) {
                            return;
                        }

                        clearTimeout(caretTimeoutId);
                        var pos;

                        focusText = input.val();

                        pos = checkVal();

                        caretTimeoutId = setTimeout(function () {
                            if (input.get(0) !== document.activeElement) {
                                return;
                            }
                            writeBuffer();
                            if (pos == mask.replace("?", "").length) {
                                input.caret(0, pos);
                            } else {
                                input.caret(pos);
                            }
                        }, 10);
                    })
                    .on("blur.mask", blurEvent)
                    .on("keydown.mask", keydownEvent)
                    .on("keypress.mask", keypressEvent)
                    .on("input.mask paste.mask", function () {
                        if (input.prop("readonly")) {
                            return;
                        }

                        setTimeout(function () {
                            var pos = checkVal(true);
                            input.caret(pos);
                            tryFireCompleted();
                        }, 0);
                    });
                if (chrome && android) {
                    input
                        .off('input.mask')
                        .on('input.mask', androidInputEvent);
                }
                checkVal(); //Perform initial check for existing values
            });
        }
    });
}));




/**
 * jQuery.marquee - scrolling text like old marquee element
 * @author Aamir Afridi - aamirafridi(at)gmail(dot)com / http://aamirafridi.com/jquery/jquery-marquee-plugin
 */
(function (f) {
    f.fn.marquee = function (x) {
        return this.each(function () {
            var a = f.extend({}, f.fn.marquee.defaults, x), b = f(this), c, h, t, u, k, e = 3,
                y = "animation-play-state", n = !1, E = function (a, b, c) {
                    for (var e = ["webkit", "moz", "MS", "o", ""], d = 0; d < e.length; d++) e[d] || (b = b.toLowerCase()), a.addEventListener(e[d] + b, c, !1)
                }, F = function (a) {
                    var b = [], c;
                    for (c in a) a.hasOwnProperty(c) && b.push(c + ":" + a[c]);
                    b.push();
                    return "{" + b.join(",") + "}"
                }, p = {
                    pause: function () {
                        n && a.allowCss3Support ? c.css(y, "paused") : f.fn.pause && c.pause();
                        b.data("runningStatus",
                            "paused");
                        b.trigger("paused")
                    }, resume: function () {
                        n && a.allowCss3Support ? c.css(y, "running") : f.fn.resume && c.resume();
                        b.data("runningStatus", "resumed");
                        b.trigger("resumed")
                    }, toggle: function () {
                        p["resumed" == b.data("runningStatus") ? "pause" : "resume"]()
                    }, destroy: function () {
                        clearTimeout(b.timer);
                        b.find("*").andSelf().unbind();
                        b.html(b.find(".js-marquee:first").html())
                    }
                };
            if ("string" === typeof x) f.isFunction(p[x]) && (c || (c = b.find(".js-marquee-wrapper")), !0 === b.data("css3AnimationIsSupported") && (n = !0), p[x]()); else {
                var v;
                f.each(a, function (c, d) {
                    v = b.attr("data-" + c);
                    if ("undefined" !== typeof v) {
                        switch (v) {
                            case "true":
                                v = !0;
                                break;
                            case "false":
                                v = !1
                        }
                        a[c] = v
                    }
                });
                a.speed && (a.duration = a.speed * parseInt(b.width(), 10));
                u = "up" == a.direction || "down" == a.direction;
                a.gap = a.duplicated ? parseInt(a.gap) : 0;
                b.wrapInner('<div class="js-marquee"></div>');
                var l = b.find(".js-marquee").css({"margin-right": a.gap, "float": "left"});
                a.duplicated && l.clone(!0).appendTo(b);
                b.wrapInner('<div style="width:100000px" class="js-marquee-wrapper"></div>');
                c = b.find(".js-marquee-wrapper");
                if (u) {
                    var m = b.height();
                    c.removeAttr("style");
                    b.height(m);
                    b.find(".js-marquee").css({"float": "none", "margin-bottom": a.gap, "margin-right": 0});
                    a.duplicated && b.find(".js-marquee:last").css({"margin-bottom": 0});
                    var q = b.find(".js-marquee:first").height() + a.gap;
                    a.startVisible && !a.duplicated ? (a._completeDuration = (parseInt(q, 10) + parseInt(m, 10)) / parseInt(m, 10) * a.duration, a.duration *= parseInt(q, 10) / parseInt(m, 10)) : a.duration *= (parseInt(q, 10) + parseInt(m, 10)) / parseInt(m, 10)
                } else k = b.find(".js-marquee:first").width() +
                    a.gap, h = b.width(), a.startVisible && !a.duplicated ? (a._completeDuration = (parseInt(k, 10) + parseInt(h, 10)) / parseInt(h, 10) * a.duration, a.duration *= parseInt(k, 10) / parseInt(h, 10)) : a.duration *= (parseInt(k, 10) + parseInt(h, 10)) / parseInt(h, 10);
                a.duplicated && (a.duration /= 2);
                if (a.allowCss3Support) {
                    var l = document.body || document.createElement("div"),
                        g = "marqueeAnimation-" + Math.floor(1E7 * Math.random()),
                        A = ["Webkit", "Moz", "O", "ms", "Khtml"], B = "animation", d = "", r = "";
                    l.style.animation && (r = "@keyframes " + g + " ", n = !0);
                    if (!1 ===
                        n) for (var z = 0; z < A.length; z++) if (void 0 !== l.style[A[z] + "AnimationName"]) {
                        l = "-" + A[z].toLowerCase() + "-";
                        B = l + B;
                        y = l + y;
                        r = "@" + l + "keyframes " + g + " ";
                        n = !0;
                        break
                    }
                    n && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s infinite " + a.css3easing, b.data("css3AnimationIsSupported", !0))
                }
                var C = function () {
                    c.css("margin-top", "up" == a.direction ? m + "px" : "-" + q + "px")
                }, D = function () {
                    c.css("margin-left", "left" == a.direction ? h + "px" : "-" + k + "px")
                };
                a.duplicated ? (u ? a.startVisible ? c.css("margin-top", 0) : c.css("margin-top", "up" == a.direction ?
                    m + "px" : "-" + (2 * q - a.gap) + "px") : a.startVisible ? c.css("margin-left", 0) : c.css("margin-left", "left" == a.direction ? h + "px" : "-" + (2 * k - a.gap) + "px"), a.startVisible || (e = 1)) : a.startVisible ? e = 2 : u ? C() : D();
                var w = function () {
                    a.duplicated && (1 === e ? (a._originalDuration = a.duration, a.duration = u ? "up" == a.direction ? a.duration + m / (q / a.duration) : 2 * a.duration : "left" == a.direction ? a.duration + h / (k / a.duration) : 2 * a.duration, d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing), e++) : 2 === e && (a.duration = a._originalDuration,
                    d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), e++));
                    u ? a.duplicated ? (2 < e && c.css("margin-top", "up" == a.direction ? 0 : "-" + q + "px"), t = {"margin-top": "up" == a.direction ? "-" + q + "px" : 0}) : a.startVisible ? 2 === e ? (d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing), t = {"margin-top": "up" == a.direction ? "-" + q + "px" : m + "px"}, e++) : 3 === e && (a.duration = a._completeDuration, d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), C()) : (C(), t = {
                        "margin-top": "up" ==
                        a.direction ? "-" + c.height() + "px" : m + "px"
                    }) : a.duplicated ? (2 < e && c.css("margin-left", "left" == a.direction ? 0 : "-" + k + "px"), t = {"margin-left": "left" == a.direction ? "-" + k + "px" : 0}) : a.startVisible ? 2 === e ? (d && (d = g + " " + a.duration / 1E3 + "s " + a.delayBeforeStart / 1E3 + "s " + a.css3easing), t = {"margin-left": "left" == a.direction ? "-" + k + "px" : h + "px"}, e++) : 3 === e && (a.duration = a._completeDuration, d && (g += "0", r = f.trim(r) + "0 ", d = g + " " + a.duration / 1E3 + "s 0s infinite " + a.css3easing), D()) : (D(), t = {
                        "margin-left": "left" == a.direction ? "-" + k + "px" :
                            h + "px"
                    });
                    b.trigger("beforeStarting");
                    if (n) {
                        c.css(B, d);
                        var l = r + " { 100%  " + F(t) + "}", p = c.find("style");
                        0 !== p.length ? p.filter(":last").html(l) : c.append("<style>" + l + "</style>");
                        E(c[0], "AnimationIteration", function () {
                            b.trigger("finished")
                        });
                        E(c[0], "AnimationEnd", function () {
                            w();
                            b.trigger("finished")
                        })
                    } else c.animate(t, a.duration, a.easing, function () {
                        b.trigger("finished");
                        a.pauseOnCycle ? b.timer = setTimeout(w, a.delayBeforeStart) : w()
                    });
                    b.data("runningStatus", "resumed")
                };
                b.bind("pause", p.pause);
                b.bind("resume",
                    p.resume);
                a.pauseOnHover && b.bind("mouseenter mouseleave", p.toggle);
                n && a.allowCss3Support ? w() : b.timer = setTimeout(w, a.delayBeforeStart)
            }
        })
    };
    f.fn.marquee.defaults = {
        allowCss3Support: !0,
        css3easing: "linear",
        easing: "linear",
        delayBeforeStart: 1E3,
        direction: "left",
        duplicated: !1,
        duration: 5E3,
        gap: 20,
        pauseOnCycle: !1,
        pauseOnHover: !1,
        startVisible: !1
    }
})(jQuery);

function openbox(id) {
    display = document.getElementById(id).style.display;

    if (display == 'none') {
        document.getElementById(id).style.display = 'block';
    } else {
        document.getElementById(id).style.display = 'none';
    }
}

$(function () {
    $.mask.definitions['~'] = "[+-]";
    $(".phonee").mask("+7 (999) 999 - 99 - 99");
    $("input[type=tel]").mask("+7 (999) 999 - 99 - 99");

    $("input").blur(function () {
        $("#info").html("Unmasked value: " + $(this).mask());
    }).dblclick(function () {
        $(this).unmask();
    });
});


// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function (event) {
    didScroll = true;
    var top = $(document).scrollTop();
    if (top > 100) $('.header_block').addClass('header_block_2');
    else $('.header_block').removeClass('header_block_2');
});

setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();

    // Make sure they scroll more than delta
    if (Math.abs(lastScrollTop - st) <= delta)
        return;

    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight) {
        // Scroll Down
        $('header').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if (st + $(window).height() < $(document).height()) {
            $('header').removeClass('nav-up').addClass('nav-down');
        }
    }

    lastScrollTop = st;
}

$(document).ready(function () {

    $("a.topLink").click(function () {
        $("html, body").animate({
            scrollTop: $($(this).attr("href")).offset().top + "px"
        }, {
            duration: 500,
            easing: "swing"
        });
        return false;
    });

    var owl2 = $('.owl-carousel2');
    owl2.owlCarousel({
        margin: 0,
        nav: false,
        dots: true,
        autoHeight: true,
        loop: true,
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })

    var owl3 = $('.owl-carousel3');
    owl3.owlCarousel({
        margin: 30,
        nav: false,
        dots: true,
        autoHeight: true,
        loop: false,
        responsive: {
            0: {
                items: 2,
                margin: 15
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    })

    var owl4 = $('.owl-carousel4');
    owl4.owlCarousel({
        margin: 30,
        nav: false,
        dots: true,
        autoHeight: true,
        loop: true,
        responsive: {
            0: {
                items: 2,
                margin: 15
            },
            1000: {
                items: 3
            },
            1200: {
                items: 3
            }
        }
    })
})

AOS.init({
    duration: 2500,
    offset: 0
});


var Application = {

    uploader: null,

    Map: null,

    // Application Init
    init: function () {
        this.ui_widget('.js-widget');
    },

    // Run widgets
    ui_widget: function (selector) {
        $(selector).not('.off').each(function () {

            name = $(this).data('widget');

            if (!empty(name) && !empty(Application[name]) && $.isFunction(Application[name])) {
                Application[name](this);
                $(this).addClass('js-initialized');
            } else {
                console.log('Method [' + name + '] not found. Class: ' + $(this).attr('class'));
            }
        });
    },

    // Create Yandex Map
    create_yandex_map: function (options) {

        Application.Map = {
            instance: null,
            collection: null,
            placemarks: null
        };

        // Init settings
        var $opt = $.extend({
            center: [],
            coord: [],
            zoom: 17,
            placemarks: null,
            iconContent: '',
            balloonContentHeader: '',
            description: '',
            balloonContentFooter: '',
            placemarkStyle: {preset: 'twirl#blueStretchyIcon'},
            controls: ['zoomControl', 'smallZoomControl'],//'typeSelector''mapTools'
            type: 'yandex#map'
        }, options);

        // РЎРѕР·РґР°РµРј РєР°СЂС‚Сѓ
        Application.Map.instance = new ymaps.Map($opt.id, {
            center: $opt.center,
            zoom: $opt.zoom,
            type: $opt.type
        });

        if (!empty($opt.iconImage) && !empty($opt.iconWidth) && !empty($opt.iconHeight)) {
            $opt.placemarkStyle = {
                iconImageHref: $opt.iconImage,
                iconImageSize: [$opt.iconWidth, $opt.iconHeight],
                iconImageOffset: [0, -$opt.iconHeight]
            };
        }

        // РЎРѕР·РґР°РµРј РЅР°Р±РѕСЂ РјР°СЂРєРµСЂРѕРІ
        if (!empty($opt.placemarks)) {

            // РЎРѕР·РґР°РµРј РєРѕР»Р»РµРєС†РёСЋ РјР°СЂРєРµСЂРѕРІ
            Application.Map.collection = new ymaps.GeoObjectCollection({}, {});
            //var myCoords = null;

            Application.Map.placemarks = [];

            // РЎРѕР·РґР°РµРј РјР°СЂРєРµСЂС‹
            $.each($opt.placemarks, function (i) {

                point = this.coord.split(',');
                coord = [point[0], point[1]];
                title = (!empty(this.title)) ? this.title : '';

                if (!empty(this.description)) {
                    balloon = {
                        iconContent: '',
                        balloonContentHeader: title,
                        balloonContentBody: '<div class="map-baloon">' + this.description + '</div>',
                        balloonContentFooter: '',
                        hintContent: title
                    }
                } else {
                    balloon = {hintContent: title};
                }

                myPlacemark = new ymaps.Placemark(coord, balloon, $opt.placemarkStyle);

                // Р”РѕР±Р°РІР»СЏРµРј РјР°СЂРєРµСЂСѓ Р·РЅР°С‡РµРЅРёРµ РјР°СЃС€С‚Р°Р±Р° РґР»СЏ СѓРІРµР»РёС‡РµРЅРёСЏ
                $(myPlacemark).data('zoom', this.zoom);

                myPlacemark.events.add('click', function (e) {

                    if ($(this).data('zoom') > 0) {

                        // Р¦РµРЅС‚СЂРёСЂСѓРµРј РєР°СЂС‚Сѓ РїРѕ РјР°СЂРєРµСЂСѓ Рё СѓСЃС‚Р°РЅР°РІР»РёРІР°РµРј РјР°СЃС€С‚Р°Р±
                        Application.Map.instance.setCenter(this.geometry.getBounds()[0], $(this).data('zoom'), {});

                    }

                }, myPlacemark);

                Application.Map.placemarks[this.id] = myPlacemark;

                Application.Map.collection.add(myPlacemark);
            });

            //console.log(Application.Map.placemarks);

            // Р”РѕР±Р°РІР»СЏРµРј РЅР° РєР°СЂС‚Сѓ РєРѕР»Р»РµРєС†РёСЋ РјР°СЂРєРµСЂРѕРІ
            Application.Map.instance.geoObjects.add(Application.Map.collection);

            // Р—Р°РєСЂС‹С‚РёРµ Р±Р°Р»СѓРЅР° - С†РµРЅС‚СЂРёСЂСѓРµРј РєР°СЂС‚Сѓ РїРѕ РјР°СЂРєРµСЂР°Рј
            Application.Map.instance.events.add('balloonclose', function (e) {
                Application.Map.instance.setBounds(Application.Map.collection.getBounds(), {
                    checkZoomRange: true
                });
            });

            // Р¦РµРЅС‚СЂРёСЂСѓРµРј РєР°СЂС‚Сѓ РїРѕ РјР°СЂРєРµСЂР°Рј
            Application.Map.instance.setBounds(Application.Map.collection.getBounds(), {
                checkZoomRange: true
            });
        }

    },

    // Widget: block_map
    block_map: function (widget) {

        var _map = $('.map', widget);

        // Init Map
        ymaps.ready(function () {

            Application.create_yandex_map({
                id: $(_map).attr('id'),
                placemarks: $(_map).data('placemarks'),
                coord: $(_map).data('coord'),
                zoom: $(_map).data('zoom'),
                description: $(_map).data('description'),
                controls: $(_map).data('controls')
            });

        });

        $(widget).bind('update.map', function (e, city_id) {
            console.log('update: ' + city_id);
        });

        // Select - OnChange
        $('select', widget).on('change', function () {

            city_id = parseInt($(this).val());

            list = $('.block-map .items-list');

            if (city_id == 0) {
                $('div', list).removeClass('hidden').show();
            } else {
                $('div', list).not('.city-' + city_id).hide();
                $('div.city-' + city_id, list).removeClass('hidden').show();
            }

            $(widget).trigger('update.map', city_id);
        });

        // ListItem onClick
        $('.items-list div', widget).on('click', function () {

            if (!$(this).hasClass('selected')) {
                $(this).parent().find('.selected').removeClass('selected');
                $(this).addClass('selected');

                // Р¦РµРЅС‚СЂРёСЂСѓРµРј РєР°СЂС‚Сѓ РїРѕ РјР°СЂРєРµСЂСѓ Рё СѓСЃС‚Р°РЅР°РІР»РёРІР°РµРј РјР°СЃС€С‚Р°Р±
                placemark = Application.Map.placemarks[$(this).data('id')];
                Application.Map.instance.setCenter(placemark.geometry.getBounds()[0], 17, {});

                placemark.balloon.open();

            } else {

                $(this).removeClass('selected');

                // Р¦РµРЅС‚СЂРёСЂСѓРµРј РєР°СЂС‚Сѓ РїРѕ РјР°СЂРєРµСЂР°Рј
                Application.Map.instance.setBounds(Application.Map.collection.getBounds(), {
                    checkZoomRange: true
                });

                Application.Map.instance.balloon.close();
            }
        });

    }

    // End class
}

jQuery(function ($) {

    Application.init();
});

// Show default value for textboxes
function default_textbox(selectors) {
    el = jQuery(selectors);

    if (el.length > 0) {
        jQuery.each(el, function () {
            jQuery(this).attr('default', jQuery(this).val());
        });
    }

    jQuery(selectors).on('focus click', function () {
        if (jQuery(this).val() == jQuery(this).attr('default')) jQuery(this).val('');
    });

    jQuery(selectors).on('blur', function () {
        if (jQuery(this).val() == '') jQuery(this).val(jQuery(this).attr('default'));
    });
}

// Set textbox length
function set_textbox_length(selector) {
    selector = (selector == undefined) ? 'textarea[maxlength]' : selector;
    jQuery(selector).keydown(function (e) {
        val = jQuery(this).text();
        if (val.length >= jQuery(this).attr('maxlength')) {
            e.cancelBubble = true;
            return false;
        }
    });
}

// Check is value defined
function defined(value) {
    return (value != undefined) ? true : false;
}

// Check is value empty
function empty(mixed_var) {
    return (defined(mixed_var) && mixed_var != "" && mixed_var != null && mixed_var != 0 && mixed_var != false) ? false : true;
}
