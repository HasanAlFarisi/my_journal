!function(t){"use strict";function e(t,s,n,i,a,r,c,l){var o,d,f,h,p,m=function(t){r.text(t),r[l?"prepend":"append"](c)};return l?(o=0===i?"":n.slice(-i),d=n.slice(-a)):(o=n.slice(0,i),d=n.slice(0,a)),s<r.html(c)[t]()?0:(m(d),h=r[t](),m(o),p=r[t](),p>h?a:(f=parseInt((i+a)/2,10),o=l?n.slice(-f):n.slice(0,f),m(o),r[t]()===s?f:(r[t]()>s?a=f-1:i=f+1,e(t,s,n,i,a,r,c,l))))}t.fn.truncate=function(s){s&&s.center&&!s.side&&(s.side="center",delete s.center),s&&!/^(left|right|center)$/.test(s.side)&&delete s.side;var n={width:"auto",token:"&hellip;",side:"right",addclass:!1,addtitle:!1,multiline:!1,assumeSameStyle:!1};s=t.extend(n,s);var i,a,r,c;return s.assumeSameStyle&&(a=t(this[0]),i={fontFamily:a.css("fontFamily"),fontSize:a.css("fontSize"),fontStyle:a.css("fontStyle"),fontWeight:a.css("fontWeight"),"font-variant":a.css("font-variant"),"text-indent":a.css("text-indent"),"text-transform":a.css("text-transform"),"letter-spacing":a.css("letter-spacing"),"word-spacing":a.css("word-spacing"),display:"none"},r=t("<span/>").css(i).appendTo("body")),this.each(function(){a=t(this),c=a.text(),s.assumeSameStyle?r.text(c):(i={fontFamily:a.css("fontFamily"),fontSize:a.css("fontSize"),fontStyle:a.css("fontStyle"),fontWeight:a.css("fontWeight"),"font-variant":a.css("font-variant"),"text-indent":a.css("text-indent"),"text-transform":a.css("text-transform"),"letter-spacing":a.css("letter-spacing"),"word-spacing":a.css("word-spacing"),display:"none"},r=t("<span/>").css(i).text(c).appendTo("body"));var n,l,o,d=r.width(),f=parseInt(s.width,10)||a.width(),h="width";if(s.multiline?(r.width(a.width()),h="height",l=r.height(),o=a.height()+1):(l=d,o=f),n={before:"",after:""},l>o){var p,m;r.text(""),"left"===s.side?(p=e(h,o,c,0,c.length,r,s.token,!0),n.after=c.slice(-1*p)):"center"===s.side?(o=parseInt(o/2,10)-1,p=e(h,o,c,0,c.length,r,s.token,!1),m=e(h,o,c,0,c.length,r,"",!0),n.before=c.slice(0,p),n.after=c.slice(-1*m)):"right"===s.side&&(p=e(h,o,c,0,c.length,r,s.token,!1),n.before=c.slice(0,p)),s.addclass&&a.addClass(s.addclass),s.addtitle&&a.attr("title",c),n.before=r.text(n.before).html(),n.after=r.text(n.after).html(),a.empty().html(n.before+s.token+n.after)}s.assumeSameStyle||r.remove()})}}(jQuery);