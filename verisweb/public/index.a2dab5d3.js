var t="undefined"!=typeof globalThis?globalThis:"undefined"!=typeof self?self:"undefined"!=typeof window?window:"undefined"!=typeof global?global:{},e={},n={},r=t.parcelRequirefab0;null==r&&((r=function(t){if(t in e)return e[t].exports;if(t in n){var r=n[t];delete n[t];var i={id:t,exports:{}};return e[t]=i,r.call(i.exports,i,i.exports),i.exports}var s=new Error("Cannot find module '"+t+"'");throw s.code="MODULE_NOT_FOUND",s}).register=function(t,e){n[t]=e},t.parcelRequirefab0=r),r.register("f1q41",(function(e,n){(function(){var r,i="Expected a function",s="__lodash_hash_undefined__",o="__lodash_placeholder__",a=16,u=32,c=64,l=128,h=256,f=1/0,d=9007199254740991,p=NaN,g=4294967295,m=[["ary",l],["bind",1],["bindKey",2],["curry",8],["curryRight",a],["flip",512],["partial",u],["partialRight",c],["rearg",h]],y="[object Arguments]",v="[object Array]",w="[object Boolean]",_="[object Date]",b="[object Error]",E="[object Function]",T="[object GeneratorFunction]",I="[object Map]",C="[object Number]",S="[object Object]",A="[object Promise]",D="[object RegExp]",N="[object Set]",k="[object String]",x="[object Symbol]",R="[object WeakMap]",L="[object ArrayBuffer]",O="[object DataView]",M="[object Float32Array]",V="[object Float64Array]",F="[object Int8Array]",P="[object Int16Array]",U="[object Int32Array]",j="[object Uint8Array]",B="[object Uint8ClampedArray]",q="[object Uint16Array]",$="[object Uint32Array]",z=/\b__p \+= '';/g,K=/\b(__p \+=) '' \+/g,G=/(__e\(.*?\)|\b__t\)) \+\n'';/g,H=/&(?:amp|lt|gt|quot|#39);/g,W=/[&<>"']/g,Q=RegExp(H.source),Y=RegExp(W.source),X=/<%-([\s\S]+?)%>/g,J=/<%([\s\S]+?)%>/g,Z=/<%=([\s\S]+?)%>/g,tt=/\.|\[(?:[^[\]]*|(["'])(?:(?!\1)[^\\]|\\.)*?\1)\]/,et=/^\w*$/,nt=/[^.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|$))/g,rt=/[\\^$.*+?()[\]{}|]/g,it=RegExp(rt.source),st=/^\s+/,ot=/\s/,at=/\{(?:\n\/\* \[wrapped with .+\] \*\/)?\n?/,ut=/\{\n\/\* \[wrapped with (.+)\] \*/,ct=/,? & /,lt=/[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/g,ht=/[()=,{}\[\]\/\s]/,ft=/\\(\\)?/g,dt=/\$\{([^\\}]*(?:\\.[^\\}]*)*)\}/g,pt=/\w*$/,gt=/^[-+]0x[0-9a-f]+$/i,mt=/^0b[01]+$/i,yt=/^\[object .+?Constructor\]$/,vt=/^0o[0-7]+$/i,wt=/^(?:0|[1-9]\d*)$/,_t=/[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,bt=/($^)/,Et=/['\n\r\u2028\u2029\\]/g,Tt="\ud800-\udfff",It="\\u0300-\\u036f\\ufe20-\\ufe2f\\u20d0-\\u20ff",Ct="\\u2700-\\u27bf",St="a-z\\xdf-\\xf6\\xf8-\\xff",At="A-Z\\xc0-\\xd6\\xd8-\\xde",Dt="\\ufe0e\\ufe0f",Nt="\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",kt="['’]",xt="[\ud800-\udfff]",Rt="["+Nt+"]",Lt="["+It+"]",Ot="\\d+",Mt="["+Ct+"]",Vt="["+St+"]",Ft="[^"+Tt+Nt+Ot+Ct+St+At+"]",Pt="\ud83c[\udffb-\udfff]",Ut="[^\ud800-\udfff]",jt="(?:\ud83c[\udde6-\uddff]){2}",Bt="[\ud800-\udbff][\udc00-\udfff]",qt="["+At+"]",$t="\\u200d",zt="(?:"+Vt+"|"+Ft+")",Kt="(?:"+qt+"|"+Ft+")",Gt="(?:['’](?:d|ll|m|re|s|t|ve))?",Ht="(?:['’](?:D|LL|M|RE|S|T|VE))?",Wt="(?:"+Lt+"|"+Pt+")"+"?",Qt="["+Dt+"]?",Yt=Qt+Wt+("(?:"+$t+"(?:"+[Ut,jt,Bt].join("|")+")"+Qt+Wt+")*"),Xt="(?:"+[Mt,jt,Bt].join("|")+")"+Yt,Jt="(?:"+[Ut+Lt+"?",Lt,jt,Bt,xt].join("|")+")",Zt=RegExp(kt,"g"),te=RegExp(Lt,"g"),ee=RegExp(Pt+"(?="+Pt+")|"+Jt+Yt,"g"),ne=RegExp([qt+"?"+Vt+"+"+Gt+"(?="+[Rt,qt,"$"].join("|")+")",Kt+"+"+Ht+"(?="+[Rt,qt+zt,"$"].join("|")+")",qt+"?"+zt+"+"+Gt,qt+"+"+Ht,"\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])","\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])",Ot,Xt].join("|"),"g"),re=RegExp("["+$t+Tt+It+Dt+"]"),ie=/[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,se=["Array","Buffer","DataView","Date","Error","Float32Array","Float64Array","Function","Int8Array","Int16Array","Int32Array","Map","Math","Object","Promise","RegExp","Set","String","Symbol","TypeError","Uint8Array","Uint8ClampedArray","Uint16Array","Uint32Array","WeakMap","_","clearTimeout","isFinite","parseInt","setTimeout"],oe=-1,ae={};ae[M]=ae[V]=ae[F]=ae[P]=ae[U]=ae[j]=ae[B]=ae[q]=ae[$]=!0,ae[y]=ae[v]=ae[L]=ae[w]=ae[O]=ae[_]=ae[b]=ae[E]=ae[I]=ae[C]=ae[S]=ae[D]=ae[N]=ae[k]=ae[R]=!1;var ue={};ue[y]=ue[v]=ue[L]=ue[O]=ue[w]=ue[_]=ue[M]=ue[V]=ue[F]=ue[P]=ue[U]=ue[I]=ue[C]=ue[S]=ue[D]=ue[N]=ue[k]=ue[x]=ue[j]=ue[B]=ue[q]=ue[$]=!0,ue[b]=ue[E]=ue[R]=!1;var ce={"\\":"\\","'":"'","\n":"n","\r":"r","\u2028":"u2028","\u2029":"u2029"},le=parseFloat,he=parseInt,fe="object"==typeof t&&t&&t.Object===Object&&t,de="object"==typeof self&&self&&self.Object===Object&&self,pe=fe||de||Function("return this")(),ge=n&&!n.nodeType&&n,me=ge&&e&&!e.nodeType&&e,ye=me&&me.exports===ge,ve=ye&&fe.process,we=function(){try{var t=me&&me.require&&me.require("util").types;return t||ve&&ve.binding&&ve.binding("util")}catch(t){}}(),_e=we&&we.isArrayBuffer,be=we&&we.isDate,Ee=we&&we.isMap,Te=we&&we.isRegExp,Ie=we&&we.isSet,Ce=we&&we.isTypedArray;function Se(t,e,n){switch(n.length){case 0:return t.call(e);case 1:return t.call(e,n[0]);case 2:return t.call(e,n[0],n[1]);case 3:return t.call(e,n[0],n[1],n[2])}return t.apply(e,n)}function Ae(t,e,n,r){for(var i=-1,s=null==t?0:t.length;++i<s;){var o=t[i];e(r,o,n(o),t)}return r}function De(t,e){for(var n=-1,r=null==t?0:t.length;++n<r&&!1!==e(t[n],n,t););return t}function Ne(t,e){for(var n=null==t?0:t.length;n--&&!1!==e(t[n],n,t););return t}function ke(t,e){for(var n=-1,r=null==t?0:t.length;++n<r;)if(!e(t[n],n,t))return!1;return!0}function xe(t,e){for(var n=-1,r=null==t?0:t.length,i=0,s=[];++n<r;){var o=t[n];e(o,n,t)&&(s[i++]=o)}return s}function Re(t,e){return!!(null==t?0:t.length)&&qe(t,e,0)>-1}function Le(t,e,n){for(var r=-1,i=null==t?0:t.length;++r<i;)if(n(e,t[r]))return!0;return!1}function Oe(t,e){for(var n=-1,r=null==t?0:t.length,i=Array(r);++n<r;)i[n]=e(t[n],n,t);return i}function Me(t,e){for(var n=-1,r=e.length,i=t.length;++n<r;)t[i+n]=e[n];return t}function Ve(t,e,n,r){var i=-1,s=null==t?0:t.length;for(r&&s&&(n=t[++i]);++i<s;)n=e(n,t[i],i,t);return n}function Fe(t,e,n,r){var i=null==t?0:t.length;for(r&&i&&(n=t[--i]);i--;)n=e(n,t[i],i,t);return n}function Pe(t,e){for(var n=-1,r=null==t?0:t.length;++n<r;)if(e(t[n],n,t))return!0;return!1}var Ue=Ge("length");function je(t,e,n){var r;return n(t,(function(t,n,i){if(e(t,n,i))return r=n,!1})),r}function Be(t,e,n,r){for(var i=t.length,s=n+(r?1:-1);r?s--:++s<i;)if(e(t[s],s,t))return s;return-1}function qe(t,e,n){return e==e?function(t,e,n){var r=n-1,i=t.length;for(;++r<i;)if(t[r]===e)return r;return-1}(t,e,n):Be(t,ze,n)}function $e(t,e,n,r){for(var i=n-1,s=t.length;++i<s;)if(r(t[i],e))return i;return-1}function ze(t){return t!=t}function Ke(t,e){var n=null==t?0:t.length;return n?Qe(t,e)/n:p}function Ge(t){return function(e){return null==e?r:e[t]}}function He(t){return function(e){return null==t?r:t[e]}}function We(t,e,n,r,i){return i(t,(function(t,i,s){n=r?(r=!1,t):e(n,t,i,s)})),n}function Qe(t,e){for(var n,i=-1,s=t.length;++i<s;){var o=e(t[i]);o!==r&&(n=n===r?o:n+o)}return n}function Ye(t,e){for(var n=-1,r=Array(t);++n<t;)r[n]=e(n);return r}function Xe(t){return t?t.slice(0,gn(t)+1).replace(st,""):t}function Je(t){return function(e){return t(e)}}function Ze(t,e){return Oe(e,(function(e){return t[e]}))}function tn(t,e){return t.has(e)}function en(t,e){for(var n=-1,r=t.length;++n<r&&qe(e,t[n],0)>-1;);return n}function nn(t,e){for(var n=t.length;n--&&qe(e,t[n],0)>-1;);return n}function rn(t,e){for(var n=t.length,r=0;n--;)t[n]===e&&++r;return r}var sn=He({"À":"A","Á":"A","Â":"A","Ã":"A","Ä":"A","Å":"A","à":"a","á":"a","â":"a","ã":"a","ä":"a","å":"a","Ç":"C","ç":"c","Ð":"D","ð":"d","È":"E","É":"E","Ê":"E","Ë":"E","è":"e","é":"e","ê":"e","ë":"e","Ì":"I","Í":"I","Î":"I","Ï":"I","ì":"i","í":"i","î":"i","ï":"i","Ñ":"N","ñ":"n","Ò":"O","Ó":"O","Ô":"O","Õ":"O","Ö":"O","Ø":"O","ò":"o","ó":"o","ô":"o","õ":"o","ö":"o","ø":"o","Ù":"U","Ú":"U","Û":"U","Ü":"U","ù":"u","ú":"u","û":"u","ü":"u","Ý":"Y","ý":"y","ÿ":"y","Æ":"Ae","æ":"ae","Þ":"Th","þ":"th","ß":"ss","Ā":"A","Ă":"A","Ą":"A","ā":"a","ă":"a","ą":"a","Ć":"C","Ĉ":"C","Ċ":"C","Č":"C","ć":"c","ĉ":"c","ċ":"c","č":"c","Ď":"D","Đ":"D","ď":"d","đ":"d","Ē":"E","Ĕ":"E","Ė":"E","Ę":"E","Ě":"E","ē":"e","ĕ":"e","ė":"e","ę":"e","ě":"e","Ĝ":"G","Ğ":"G","Ġ":"G","Ģ":"G","ĝ":"g","ğ":"g","ġ":"g","ģ":"g","Ĥ":"H","Ħ":"H","ĥ":"h","ħ":"h","Ĩ":"I","Ī":"I","Ĭ":"I","Į":"I","İ":"I","ĩ":"i","ī":"i","ĭ":"i","į":"i","ı":"i","Ĵ":"J","ĵ":"j","Ķ":"K","ķ":"k","ĸ":"k","Ĺ":"L","Ļ":"L","Ľ":"L","Ŀ":"L","Ł":"L","ĺ":"l","ļ":"l","ľ":"l","ŀ":"l","ł":"l","Ń":"N","Ņ":"N","Ň":"N","Ŋ":"N","ń":"n","ņ":"n","ň":"n","ŋ":"n","Ō":"O","Ŏ":"O","Ő":"O","ō":"o","ŏ":"o","ő":"o","Ŕ":"R","Ŗ":"R","Ř":"R","ŕ":"r","ŗ":"r","ř":"r","Ś":"S","Ŝ":"S","Ş":"S","Š":"S","ś":"s","ŝ":"s","ş":"s","š":"s","Ţ":"T","Ť":"T","Ŧ":"T","ţ":"t","ť":"t","ŧ":"t","Ũ":"U","Ū":"U","Ŭ":"U","Ů":"U","Ű":"U","Ų":"U","ũ":"u","ū":"u","ŭ":"u","ů":"u","ű":"u","ų":"u","Ŵ":"W","ŵ":"w","Ŷ":"Y","ŷ":"y","Ÿ":"Y","Ź":"Z","Ż":"Z","Ž":"Z","ź":"z","ż":"z","ž":"z","Ĳ":"IJ","ĳ":"ij","Œ":"Oe","œ":"oe","ŉ":"'n","ſ":"s"}),on=He({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"});function an(t){return"\\"+ce[t]}function un(t){return re.test(t)}function cn(t){var e=-1,n=Array(t.size);return t.forEach((function(t,r){n[++e]=[r,t]})),n}function ln(t,e){return function(n){return t(e(n))}}function hn(t,e){for(var n=-1,r=t.length,i=0,s=[];++n<r;){var a=t[n];a!==e&&a!==o||(t[n]=o,s[i++]=n)}return s}function fn(t){var e=-1,n=Array(t.size);return t.forEach((function(t){n[++e]=t})),n}function dn(t){return un(t)?function(t){var e=ee.lastIndex=0;for(;ee.test(t);)++e;return e}(t):Ue(t)}function pn(t){return un(t)?function(t){return t.match(ee)||[]}(t):function(t){return t.split("")}(t)}function gn(t){for(var e=t.length;e--&&ot.test(t.charAt(e)););return e}var mn=He({"&amp;":"&","&lt;":"<","&gt;":">","&quot;":'"',"&#39;":"'"});var yn=function t(e){var n,ot=(e=null==e?pe:yn.defaults(pe.Object(),e,yn.pick(pe,se))).Array,Tt=e.Date,It=e.Error,Ct=e.Function,St=e.Math,At=e.Object,Dt=e.RegExp,Nt=e.String,kt=e.TypeError,xt=ot.prototype,Rt=Ct.prototype,Lt=At.prototype,Ot=e["__core-js_shared__"],Mt=Rt.toString,Vt=Lt.hasOwnProperty,Ft=0,Pt=(n=/[^.]+$/.exec(Ot&&Ot.keys&&Ot.keys.IE_PROTO||""))?"Symbol(src)_1."+n:"",Ut=Lt.toString,jt=Mt.call(At),Bt=pe._,qt=Dt("^"+Mt.call(Vt).replace(rt,"\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g,"$1.*?")+"$"),$t=ye?e.Buffer:r,zt=e.Symbol,Kt=e.Uint8Array,Gt=$t?$t.allocUnsafe:r,Ht=ln(At.getPrototypeOf,At),Wt=At.create,Qt=Lt.propertyIsEnumerable,Yt=xt.splice,Xt=zt?zt.isConcatSpreadable:r,Jt=zt?zt.iterator:r,ee=zt?zt.toStringTag:r,re=function(){try{var t=fs(At,"defineProperty");return t({},"",{}),t}catch(t){}}(),ce=e.clearTimeout!==pe.clearTimeout&&e.clearTimeout,fe=Tt&&Tt.now!==pe.Date.now&&Tt.now,de=e.setTimeout!==pe.setTimeout&&e.setTimeout,ge=St.ceil,me=St.floor,ve=At.getOwnPropertySymbols,we=$t?$t.isBuffer:r,Ue=e.isFinite,He=xt.join,vn=ln(At.keys,At),wn=St.max,_n=St.min,bn=Tt.now,En=e.parseInt,Tn=St.random,In=xt.reverse,Cn=fs(e,"DataView"),Sn=fs(e,"Map"),An=fs(e,"Promise"),Dn=fs(e,"Set"),Nn=fs(e,"WeakMap"),kn=fs(At,"create"),xn=Nn&&new Nn,Rn={},Ln=Us(Cn),On=Us(Sn),Mn=Us(An),Vn=Us(Dn),Fn=Us(Nn),Pn=zt?zt.prototype:r,Un=Pn?Pn.valueOf:r,jn=Pn?Pn.toString:r;function Bn(t){if(ra(t)&&!Go(t)&&!(t instanceof Kn)){if(t instanceof zn)return t;if(Vt.call(t,"__wrapped__"))return js(t)}return new zn(t)}var qn=function(){function t(){}return function(e){if(!na(e))return{};if(Wt)return Wt(e);t.prototype=e;var n=new t;return t.prototype=r,n}}();function $n(){}function zn(t,e){this.__wrapped__=t,this.__actions__=[],this.__chain__=!!e,this.__index__=0,this.__values__=r}function Kn(t){this.__wrapped__=t,this.__actions__=[],this.__dir__=1,this.__filtered__=!1,this.__iteratees__=[],this.__takeCount__=g,this.__views__=[]}function Gn(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}function Hn(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}function Wn(t){var e=-1,n=null==t?0:t.length;for(this.clear();++e<n;){var r=t[e];this.set(r[0],r[1])}}function Qn(t){var e=-1,n=null==t?0:t.length;for(this.__data__=new Wn;++e<n;)this.add(t[e])}function Yn(t){var e=this.__data__=new Hn(t);this.size=e.size}function Xn(t,e){var n=Go(t),r=!n&&Ko(t),i=!n&&!r&&Yo(t),s=!n&&!r&&!i&&ha(t),o=n||r||i||s,a=o?Ye(t.length,Nt):[],u=a.length;for(var c in t)!e&&!Vt.call(t,c)||o&&("length"==c||i&&("offset"==c||"parent"==c)||s&&("buffer"==c||"byteLength"==c||"byteOffset"==c)||ws(c,u))||a.push(c);return a}function Jn(t){var e=t.length;return e?t[Qr(0,e-1)]:r}function Zn(t,e){return Vs(ki(t),ur(e,0,t.length))}function tr(t){return Vs(ki(t))}function er(t,e,n){(n!==r&&!qo(t[e],n)||n===r&&!(e in t))&&or(t,e,n)}function nr(t,e,n){var i=t[e];Vt.call(t,e)&&qo(i,n)&&(n!==r||e in t)||or(t,e,n)}function rr(t,e){for(var n=t.length;n--;)if(qo(t[n][0],e))return n;return-1}function ir(t,e,n,r){return dr(t,(function(t,i,s){e(r,t,n(t),s)})),r}function sr(t,e){return t&&xi(e,La(e),t)}function or(t,e,n){"__proto__"==e&&re?re(t,e,{configurable:!0,enumerable:!0,value:n,writable:!0}):t[e]=n}function ar(t,e){for(var n=-1,i=e.length,s=ot(i),o=null==t;++n<i;)s[n]=o?r:Da(t,e[n]);return s}function ur(t,e,n){return t==t&&(n!==r&&(t=t<=n?t:n),e!==r&&(t=t>=e?t:e)),t}function cr(t,e,n,i,s,o){var a,u=1&e,c=2&e,l=4&e;if(n&&(a=s?n(t,i,s,o):n(t)),a!==r)return a;if(!na(t))return t;var h=Go(t);if(h){if(a=function(t){var e=t.length,n=new t.constructor(e);e&&"string"==typeof t[0]&&Vt.call(t,"index")&&(n.index=t.index,n.input=t.input);return n}(t),!u)return ki(t,a)}else{var f=gs(t),d=f==E||f==T;if(Yo(t))return Ii(t,u);if(f==S||f==y||d&&!s){if(a=c||d?{}:ys(t),!u)return c?function(t,e){return xi(t,ps(t),e)}(t,function(t,e){return t&&xi(e,Oa(e),t)}(a,t)):function(t,e){return xi(t,ds(t),e)}(t,sr(a,t))}else{if(!ue[f])return s?t:{};a=function(t,e,n){var r=t.constructor;switch(e){case L:return Ci(t);case w:case _:return new r(+t);case O:return function(t,e){var n=e?Ci(t.buffer):t.buffer;return new t.constructor(n,t.byteOffset,t.byteLength)}(t,n);case M:case V:case F:case P:case U:case j:case B:case q:case $:return Si(t,n);case I:return new r;case C:case k:return new r(t);case D:return function(t){var e=new t.constructor(t.source,pt.exec(t));return e.lastIndex=t.lastIndex,e}(t);case N:return new r;case x:return i=t,Un?At(Un.call(i)):{}}var i}(t,f,u)}}o||(o=new Yn);var p=o.get(t);if(p)return p;o.set(t,a),ua(t)?t.forEach((function(r){a.add(cr(r,e,n,r,t,o))})):ia(t)&&t.forEach((function(r,i){a.set(i,cr(r,e,n,i,t,o))}));var g=h?r:(l?c?ss:is:c?Oa:La)(t);return De(g||t,(function(r,i){g&&(r=t[i=r]),nr(a,i,cr(r,e,n,i,t,o))})),a}function lr(t,e,n){var i=n.length;if(null==t)return!i;for(t=At(t);i--;){var s=n[i],o=e[s],a=t[s];if(a===r&&!(s in t)||!o(a))return!1}return!0}function hr(t,e,n){if("function"!=typeof t)throw new kt(i);return Rs((function(){t.apply(r,n)}),e)}function fr(t,e,n,r){var i=-1,s=Re,o=!0,a=t.length,u=[],c=e.length;if(!a)return u;n&&(e=Oe(e,Je(n))),r?(s=Le,o=!1):e.length>=200&&(s=tn,o=!1,e=new Qn(e));t:for(;++i<a;){var l=t[i],h=null==n?l:n(l);if(l=r||0!==l?l:0,o&&h==h){for(var f=c;f--;)if(e[f]===h)continue t;u.push(l)}else s(e,h,r)||u.push(l)}return u}Bn.templateSettings={escape:X,evaluate:J,interpolate:Z,variable:"",imports:{_:Bn}},Bn.prototype=$n.prototype,Bn.prototype.constructor=Bn,zn.prototype=qn($n.prototype),zn.prototype.constructor=zn,Kn.prototype=qn($n.prototype),Kn.prototype.constructor=Kn,Gn.prototype.clear=function(){this.__data__=kn?kn(null):{},this.size=0},Gn.prototype.delete=function(t){var e=this.has(t)&&delete this.__data__[t];return this.size-=e?1:0,e},Gn.prototype.get=function(t){var e=this.__data__;if(kn){var n=e[t];return n===s?r:n}return Vt.call(e,t)?e[t]:r},Gn.prototype.has=function(t){var e=this.__data__;return kn?e[t]!==r:Vt.call(e,t)},Gn.prototype.set=function(t,e){var n=this.__data__;return this.size+=this.has(t)?0:1,n[t]=kn&&e===r?s:e,this},Hn.prototype.clear=function(){this.__data__=[],this.size=0},Hn.prototype.delete=function(t){var e=this.__data__,n=rr(e,t);return!(n<0)&&(n==e.length-1?e.pop():Yt.call(e,n,1),--this.size,!0)},Hn.prototype.get=function(t){var e=this.__data__,n=rr(e,t);return n<0?r:e[n][1]},Hn.prototype.has=function(t){return rr(this.__data__,t)>-1},Hn.prototype.set=function(t,e){var n=this.__data__,r=rr(n,t);return r<0?(++this.size,n.push([t,e])):n[r][1]=e,this},Wn.prototype.clear=function(){this.size=0,this.__data__={hash:new Gn,map:new(Sn||Hn),string:new Gn}},Wn.prototype.delete=function(t){var e=ls(this,t).delete(t);return this.size-=e?1:0,e},Wn.prototype.get=function(t){return ls(this,t).get(t)},Wn.prototype.has=function(t){return ls(this,t).has(t)},Wn.prototype.set=function(t,e){var n=ls(this,t),r=n.size;return n.set(t,e),this.size+=n.size==r?0:1,this},Qn.prototype.add=Qn.prototype.push=function(t){return this.__data__.set(t,s),this},Qn.prototype.has=function(t){return this.__data__.has(t)},Yn.prototype.clear=function(){this.__data__=new Hn,this.size=0},Yn.prototype.delete=function(t){var e=this.__data__,n=e.delete(t);return this.size=e.size,n},Yn.prototype.get=function(t){return this.__data__.get(t)},Yn.prototype.has=function(t){return this.__data__.has(t)},Yn.prototype.set=function(t,e){var n=this.__data__;if(n instanceof Hn){var r=n.__data__;if(!Sn||r.length<199)return r.push([t,e]),this.size=++n.size,this;n=this.__data__=new Wn(r)}return n.set(t,e),this.size=n.size,this};var dr=Oi(br),pr=Oi(Er,!0);function gr(t,e){var n=!0;return dr(t,(function(t,r,i){return n=!!e(t,r,i)})),n}function mr(t,e,n){for(var i=-1,s=t.length;++i<s;){var o=t[i],a=e(o);if(null!=a&&(u===r?a==a&&!la(a):n(a,u)))var u=a,c=o}return c}function yr(t,e){var n=[];return dr(t,(function(t,r,i){e(t,r,i)&&n.push(t)})),n}function vr(t,e,n,r,i){var s=-1,o=t.length;for(n||(n=vs),i||(i=[]);++s<o;){var a=t[s];e>0&&n(a)?e>1?vr(a,e-1,n,r,i):Me(i,a):r||(i[i.length]=a)}return i}var wr=Mi(),_r=Mi(!0);function br(t,e){return t&&wr(t,e,La)}function Er(t,e){return t&&_r(t,e,La)}function Tr(t,e){return xe(e,(function(e){return Zo(t[e])}))}function Ir(t,e){for(var n=0,i=(e=_i(e,t)).length;null!=t&&n<i;)t=t[Ps(e[n++])];return n&&n==i?t:r}function Cr(t,e,n){var r=e(t);return Go(t)?r:Me(r,n(t))}function Sr(t){return null==t?t===r?"[object Undefined]":"[object Null]":ee&&ee in At(t)?function(t){var e=Vt.call(t,ee),n=t[ee];try{t[ee]=r;var i=!0}catch(t){}var s=Ut.call(t);i&&(e?t[ee]=n:delete t[ee]);return s}(t):function(t){return Ut.call(t)}(t)}function Ar(t,e){return t>e}function Dr(t,e){return null!=t&&Vt.call(t,e)}function Nr(t,e){return null!=t&&e in At(t)}function kr(t,e,n){for(var i=n?Le:Re,s=t[0].length,o=t.length,a=o,u=ot(o),c=1/0,l=[];a--;){var h=t[a];a&&e&&(h=Oe(h,Je(e))),c=_n(h.length,c),u[a]=!n&&(e||s>=120&&h.length>=120)?new Qn(a&&h):r}h=t[0];var f=-1,d=u[0];t:for(;++f<s&&l.length<c;){var p=h[f],g=e?e(p):p;if(p=n||0!==p?p:0,!(d?tn(d,g):i(l,g,n))){for(a=o;--a;){var m=u[a];if(!(m?tn(m,g):i(t[a],g,n)))continue t}d&&d.push(g),l.push(p)}}return l}function xr(t,e,n){var i=null==(t=Ds(t,e=_i(e,t)))?t:t[Ps(Xs(e))];return null==i?r:Se(i,t,n)}function Rr(t){return ra(t)&&Sr(t)==y}function Lr(t,e,n,i,s){return t===e||(null==t||null==e||!ra(t)&&!ra(e)?t!=t&&e!=e:function(t,e,n,i,s,o){var a=Go(t),u=Go(e),c=a?v:gs(t),l=u?v:gs(e),h=(c=c==y?S:c)==S,f=(l=l==y?S:l)==S,d=c==l;if(d&&Yo(t)){if(!Yo(e))return!1;a=!0,h=!1}if(d&&!h)return o||(o=new Yn),a||ha(t)?ns(t,e,n,i,s,o):function(t,e,n,r,i,s,o){switch(n){case O:if(t.byteLength!=e.byteLength||t.byteOffset!=e.byteOffset)return!1;t=t.buffer,e=e.buffer;case L:return!(t.byteLength!=e.byteLength||!s(new Kt(t),new Kt(e)));case w:case _:case C:return qo(+t,+e);case b:return t.name==e.name&&t.message==e.message;case D:case k:return t==e+"";case I:var a=cn;case N:var u=1&r;if(a||(a=fn),t.size!=e.size&&!u)return!1;var c=o.get(t);if(c)return c==e;r|=2,o.set(t,e);var l=ns(a(t),a(e),r,i,s,o);return o.delete(t),l;case x:if(Un)return Un.call(t)==Un.call(e)}return!1}(t,e,c,n,i,s,o);if(!(1&n)){var p=h&&Vt.call(t,"__wrapped__"),g=f&&Vt.call(e,"__wrapped__");if(p||g){var m=p?t.value():t,E=g?e.value():e;return o||(o=new Yn),s(m,E,n,i,o)}}return!!d&&(o||(o=new Yn),function(t,e,n,i,s,o){var a=1&n,u=is(t),c=u.length,l=is(e),h=l.length;if(c!=h&&!a)return!1;var f=c;for(;f--;){var d=u[f];if(!(a?d in e:Vt.call(e,d)))return!1}var p=o.get(t),g=o.get(e);if(p&&g)return p==e&&g==t;var m=!0;o.set(t,e),o.set(e,t);var y=a;for(;++f<c;){var v=t[d=u[f]],w=e[d];if(i)var _=a?i(w,v,d,e,t,o):i(v,w,d,t,e,o);if(!(_===r?v===w||s(v,w,n,i,o):_)){m=!1;break}y||(y="constructor"==d)}if(m&&!y){var b=t.constructor,E=e.constructor;b==E||!("constructor"in t)||!("constructor"in e)||"function"==typeof b&&b instanceof b&&"function"==typeof E&&E instanceof E||(m=!1)}return o.delete(t),o.delete(e),m}(t,e,n,i,s,o))}(t,e,n,i,Lr,s))}function Or(t,e,n,i){var s=n.length,o=s,a=!i;if(null==t)return!o;for(t=At(t);s--;){var u=n[s];if(a&&u[2]?u[1]!==t[u[0]]:!(u[0]in t))return!1}for(;++s<o;){var c=(u=n[s])[0],l=t[c],h=u[1];if(a&&u[2]){if(l===r&&!(c in t))return!1}else{var f=new Yn;if(i)var d=i(l,h,c,t,e,f);if(!(d===r?Lr(h,l,3,i,f):d))return!1}}return!0}function Mr(t){return!(!na(t)||(e=t,Pt&&Pt in e))&&(Zo(t)?qt:yt).test(Us(t));var e}function Vr(t){return"function"==typeof t?t:null==t?su:"object"==typeof t?Go(t)?qr(t[0],t[1]):Br(t):pu(t)}function Fr(t){if(!Is(t))return vn(t);var e=[];for(var n in At(t))Vt.call(t,n)&&"constructor"!=n&&e.push(n);return e}function Pr(t){if(!na(t))return function(t){var e=[];if(null!=t)for(var n in At(t))e.push(n);return e}(t);var e=Is(t),n=[];for(var r in t)("constructor"!=r||!e&&Vt.call(t,r))&&n.push(r);return n}function Ur(t,e){return t<e}function jr(t,e){var n=-1,r=Wo(t)?ot(t.length):[];return dr(t,(function(t,i,s){r[++n]=e(t,i,s)})),r}function Br(t){var e=hs(t);return 1==e.length&&e[0][2]?Ss(e[0][0],e[0][1]):function(n){return n===t||Or(n,t,e)}}function qr(t,e){return bs(t)&&Cs(e)?Ss(Ps(t),e):function(n){var i=Da(n,t);return i===r&&i===e?Na(n,t):Lr(e,i,3)}}function $r(t,e,n,i,s){t!==e&&wr(e,(function(o,a){if(s||(s=new Yn),na(o))!function(t,e,n,i,s,o,a){var u=ks(t,n),c=ks(e,n),l=a.get(c);if(l)return void er(t,n,l);var h=o?o(u,c,n+"",t,e,a):r,f=h===r;if(f){var d=Go(c),p=!d&&Yo(c),g=!d&&!p&&ha(c);h=c,d||p||g?Go(u)?h=u:Qo(u)?h=ki(u):p?(f=!1,h=Ii(c,!0)):g?(f=!1,h=Si(c,!0)):h=[]:oa(c)||Ko(c)?(h=u,Ko(u)?h=wa(u):na(u)&&!Zo(u)||(h=ys(c))):f=!1}f&&(a.set(c,h),s(h,c,i,o,a),a.delete(c));er(t,n,h)}(t,e,a,n,$r,i,s);else{var u=i?i(ks(t,a),o,a+"",t,e,s):r;u===r&&(u=o),er(t,a,u)}}),Oa)}function zr(t,e){var n=t.length;if(n)return ws(e+=e<0?n:0,n)?t[e]:r}function Kr(t,e,n){e=e.length?Oe(e,(function(t){return Go(t)?function(e){return Ir(e,1===t.length?t[0]:t)}:t})):[su];var r=-1;e=Oe(e,Je(cs()));var i=jr(t,(function(t,n,i){var s=Oe(e,(function(e){return e(t)}));return{criteria:s,index:++r,value:t}}));return function(t,e){var n=t.length;for(t.sort(e);n--;)t[n]=t[n].value;return t}(i,(function(t,e){return function(t,e,n){var r=-1,i=t.criteria,s=e.criteria,o=i.length,a=n.length;for(;++r<o;){var u=Ai(i[r],s[r]);if(u)return r>=a?u:u*("desc"==n[r]?-1:1)}return t.index-e.index}(t,e,n)}))}function Gr(t,e,n){for(var r=-1,i=e.length,s={};++r<i;){var o=e[r],a=Ir(t,o);n(a,o)&&ti(s,_i(o,t),a)}return s}function Hr(t,e,n,r){var i=r?$e:qe,s=-1,o=e.length,a=t;for(t===e&&(e=ki(e)),n&&(a=Oe(t,Je(n)));++s<o;)for(var u=0,c=e[s],l=n?n(c):c;(u=i(a,l,u,r))>-1;)a!==t&&Yt.call(a,u,1),Yt.call(t,u,1);return t}function Wr(t,e){for(var n=t?e.length:0,r=n-1;n--;){var i=e[n];if(n==r||i!==s){var s=i;ws(i)?Yt.call(t,i,1):fi(t,i)}}return t}function Qr(t,e){return t+me(Tn()*(e-t+1))}function Yr(t,e){var n="";if(!t||e<1||e>d)return n;do{e%2&&(n+=t),(e=me(e/2))&&(t+=t)}while(e);return n}function Xr(t,e){return Ls(As(t,e,su),t+"")}function Jr(t){return Jn(qa(t))}function Zr(t,e){var n=qa(t);return Vs(n,ur(e,0,n.length))}function ti(t,e,n,i){if(!na(t))return t;for(var s=-1,o=(e=_i(e,t)).length,a=o-1,u=t;null!=u&&++s<o;){var c=Ps(e[s]),l=n;if("__proto__"===c||"constructor"===c||"prototype"===c)return t;if(s!=a){var h=u[c];(l=i?i(h,c,u):r)===r&&(l=na(h)?h:ws(e[s+1])?[]:{})}nr(u,c,l),u=u[c]}return t}var ei=xn?function(t,e){return xn.set(t,e),t}:su,ni=re?function(t,e){return re(t,"toString",{configurable:!0,enumerable:!1,value:nu(e),writable:!0})}:su;function ri(t){return Vs(qa(t))}function ii(t,e,n){var r=-1,i=t.length;e<0&&(e=-e>i?0:i+e),(n=n>i?i:n)<0&&(n+=i),i=e>n?0:n-e>>>0,e>>>=0;for(var s=ot(i);++r<i;)s[r]=t[r+e];return s}function si(t,e){var n;return dr(t,(function(t,r,i){return!(n=e(t,r,i))})),!!n}function oi(t,e,n){var r=0,i=null==t?r:t.length;if("number"==typeof e&&e==e&&i<=2147483647){for(;r<i;){var s=r+i>>>1,o=t[s];null!==o&&!la(o)&&(n?o<=e:o<e)?r=s+1:i=s}return i}return ai(t,e,su,n)}function ai(t,e,n,i){var s=0,o=null==t?0:t.length;if(0===o)return 0;for(var a=(e=n(e))!=e,u=null===e,c=la(e),l=e===r;s<o;){var h=me((s+o)/2),f=n(t[h]),d=f!==r,p=null===f,g=f==f,m=la(f);if(a)var y=i||g;else y=l?g&&(i||d):u?g&&d&&(i||!p):c?g&&d&&!p&&(i||!m):!p&&!m&&(i?f<=e:f<e);y?s=h+1:o=h}return _n(o,4294967294)}function ui(t,e){for(var n=-1,r=t.length,i=0,s=[];++n<r;){var o=t[n],a=e?e(o):o;if(!n||!qo(a,u)){var u=a;s[i++]=0===o?0:o}}return s}function ci(t){return"number"==typeof t?t:la(t)?p:+t}function li(t){if("string"==typeof t)return t;if(Go(t))return Oe(t,li)+"";if(la(t))return jn?jn.call(t):"";var e=t+"";return"0"==e&&1/t==-1/0?"-0":e}function hi(t,e,n){var r=-1,i=Re,s=t.length,o=!0,a=[],u=a;if(n)o=!1,i=Le;else if(s>=200){var c=e?null:Yi(t);if(c)return fn(c);o=!1,i=tn,u=new Qn}else u=e?[]:a;t:for(;++r<s;){var l=t[r],h=e?e(l):l;if(l=n||0!==l?l:0,o&&h==h){for(var f=u.length;f--;)if(u[f]===h)continue t;e&&u.push(h),a.push(l)}else i(u,h,n)||(u!==a&&u.push(h),a.push(l))}return a}function fi(t,e){return null==(t=Ds(t,e=_i(e,t)))||delete t[Ps(Xs(e))]}function di(t,e,n,r){return ti(t,e,n(Ir(t,e)),r)}function pi(t,e,n,r){for(var i=t.length,s=r?i:-1;(r?s--:++s<i)&&e(t[s],s,t););return n?ii(t,r?0:s,r?s+1:i):ii(t,r?s+1:0,r?i:s)}function gi(t,e){var n=t;return n instanceof Kn&&(n=n.value()),Ve(e,(function(t,e){return e.func.apply(e.thisArg,Me([t],e.args))}),n)}function mi(t,e,n){var r=t.length;if(r<2)return r?hi(t[0]):[];for(var i=-1,s=ot(r);++i<r;)for(var o=t[i],a=-1;++a<r;)a!=i&&(s[i]=fr(s[i]||o,t[a],e,n));return hi(vr(s,1),e,n)}function yi(t,e,n){for(var i=-1,s=t.length,o=e.length,a={};++i<s;){var u=i<o?e[i]:r;n(a,t[i],u)}return a}function vi(t){return Qo(t)?t:[]}function wi(t){return"function"==typeof t?t:su}function _i(t,e){return Go(t)?t:bs(t,e)?[t]:Fs(_a(t))}var bi=Xr;function Ei(t,e,n){var i=t.length;return n=n===r?i:n,!e&&n>=i?t:ii(t,e,n)}var Ti=ce||function(t){return pe.clearTimeout(t)};function Ii(t,e){if(e)return t.slice();var n=t.length,r=Gt?Gt(n):new t.constructor(n);return t.copy(r),r}function Ci(t){var e=new t.constructor(t.byteLength);return new Kt(e).set(new Kt(t)),e}function Si(t,e){var n=e?Ci(t.buffer):t.buffer;return new t.constructor(n,t.byteOffset,t.length)}function Ai(t,e){if(t!==e){var n=t!==r,i=null===t,s=t==t,o=la(t),a=e!==r,u=null===e,c=e==e,l=la(e);if(!u&&!l&&!o&&t>e||o&&a&&c&&!u&&!l||i&&a&&c||!n&&c||!s)return 1;if(!i&&!o&&!l&&t<e||l&&n&&s&&!i&&!o||u&&n&&s||!a&&s||!c)return-1}return 0}function Di(t,e,n,r){for(var i=-1,s=t.length,o=n.length,a=-1,u=e.length,c=wn(s-o,0),l=ot(u+c),h=!r;++a<u;)l[a]=e[a];for(;++i<o;)(h||i<s)&&(l[n[i]]=t[i]);for(;c--;)l[a++]=t[i++];return l}function Ni(t,e,n,r){for(var i=-1,s=t.length,o=-1,a=n.length,u=-1,c=e.length,l=wn(s-a,0),h=ot(l+c),f=!r;++i<l;)h[i]=t[i];for(var d=i;++u<c;)h[d+u]=e[u];for(;++o<a;)(f||i<s)&&(h[d+n[o]]=t[i++]);return h}function ki(t,e){var n=-1,r=t.length;for(e||(e=ot(r));++n<r;)e[n]=t[n];return e}function xi(t,e,n,i){var s=!n;n||(n={});for(var o=-1,a=e.length;++o<a;){var u=e[o],c=i?i(n[u],t[u],u,n,t):r;c===r&&(c=t[u]),s?or(n,u,c):nr(n,u,c)}return n}function Ri(t,e){return function(n,r){var i=Go(n)?Ae:ir,s=e?e():{};return i(n,t,cs(r,2),s)}}function Li(t){return Xr((function(e,n){var i=-1,s=n.length,o=s>1?n[s-1]:r,a=s>2?n[2]:r;for(o=t.length>3&&"function"==typeof o?(s--,o):r,a&&_s(n[0],n[1],a)&&(o=s<3?r:o,s=1),e=At(e);++i<s;){var u=n[i];u&&t(e,u,i,o)}return e}))}function Oi(t,e){return function(n,r){if(null==n)return n;if(!Wo(n))return t(n,r);for(var i=n.length,s=e?i:-1,o=At(n);(e?s--:++s<i)&&!1!==r(o[s],s,o););return n}}function Mi(t){return function(e,n,r){for(var i=-1,s=At(e),o=r(e),a=o.length;a--;){var u=o[t?a:++i];if(!1===n(s[u],u,s))break}return e}}function Vi(t){return function(e){var n=un(e=_a(e))?pn(e):r,i=n?n[0]:e.charAt(0),s=n?Ei(n,1).join(""):e.slice(1);return i[t]()+s}}function Fi(t){return function(e){return Ve(Za(Ka(e).replace(Zt,"")),t,"")}}function Pi(t){return function(){var e=arguments;switch(e.length){case 0:return new t;case 1:return new t(e[0]);case 2:return new t(e[0],e[1]);case 3:return new t(e[0],e[1],e[2]);case 4:return new t(e[0],e[1],e[2],e[3]);case 5:return new t(e[0],e[1],e[2],e[3],e[4]);case 6:return new t(e[0],e[1],e[2],e[3],e[4],e[5]);case 7:return new t(e[0],e[1],e[2],e[3],e[4],e[5],e[6])}var n=qn(t.prototype),r=t.apply(n,e);return na(r)?r:n}}function Ui(t){return function(e,n,i){var s=At(e);if(!Wo(e)){var o=cs(n,3);e=La(e),n=function(t){return o(s[t],t,s)}}var a=t(e,n,i);return a>-1?s[o?e[a]:a]:r}}function ji(t){return rs((function(e){var n=e.length,s=n,o=zn.prototype.thru;for(t&&e.reverse();s--;){var a=e[s];if("function"!=typeof a)throw new kt(i);if(o&&!u&&"wrapper"==as(a))var u=new zn([],!0)}for(s=u?s:n;++s<n;){var c=as(a=e[s]),l="wrapper"==c?os(a):r;u=l&&Es(l[0])&&424==l[1]&&!l[4].length&&1==l[9]?u[as(l[0])].apply(u,l[3]):1==a.length&&Es(a)?u[c]():u.thru(a)}return function(){var t=arguments,r=t[0];if(u&&1==t.length&&Go(r))return u.plant(r).value();for(var i=0,s=n?e[i].apply(this,t):r;++i<n;)s=e[i].call(this,s);return s}}))}function Bi(t,e,n,i,s,o,a,u,c,h){var f=e&l,d=1&e,p=2&e,g=24&e,m=512&e,y=p?r:Pi(t);return function r(){for(var l=arguments.length,v=ot(l),w=l;w--;)v[w]=arguments[w];if(g)var _=us(r),b=rn(v,_);if(i&&(v=Di(v,i,s,g)),o&&(v=Ni(v,o,a,g)),l-=b,g&&l<h){var E=hn(v,_);return Wi(t,e,Bi,r.placeholder,n,v,E,u,c,h-l)}var T=d?n:this,I=p?T[t]:t;return l=v.length,u?v=Ns(v,u):m&&l>1&&v.reverse(),f&&c<l&&(v.length=c),this&&this!==pe&&this instanceof r&&(I=y||Pi(I)),I.apply(T,v)}}function qi(t,e){return function(n,r){return function(t,e,n,r){return br(t,(function(t,i,s){e(r,n(t),i,s)})),r}(n,t,e(r),{})}}function $i(t,e){return function(n,i){var s;if(n===r&&i===r)return e;if(n!==r&&(s=n),i!==r){if(s===r)return i;"string"==typeof n||"string"==typeof i?(n=li(n),i=li(i)):(n=ci(n),i=ci(i)),s=t(n,i)}return s}}function zi(t){return rs((function(e){return e=Oe(e,Je(cs())),Xr((function(n){var r=this;return t(e,(function(t){return Se(t,r,n)}))}))}))}function Ki(t,e){var n=(e=e===r?" ":li(e)).length;if(n<2)return n?Yr(e,t):e;var i=Yr(e,ge(t/dn(e)));return un(e)?Ei(pn(i),0,t).join(""):i.slice(0,t)}function Gi(t){return function(e,n,i){return i&&"number"!=typeof i&&_s(e,n,i)&&(n=i=r),e=ga(e),n===r?(n=e,e=0):n=ga(n),function(t,e,n,r){for(var i=-1,s=wn(ge((e-t)/(n||1)),0),o=ot(s);s--;)o[r?s:++i]=t,t+=n;return o}(e,n,i=i===r?e<n?1:-1:ga(i),t)}}function Hi(t){return function(e,n){return"string"==typeof e&&"string"==typeof n||(e=va(e),n=va(n)),t(e,n)}}function Wi(t,e,n,i,s,o,a,l,h,f){var d=8&e;e|=d?u:c,4&(e&=~(d?c:u))||(e&=-4);var p=[t,e,s,d?o:r,d?a:r,d?r:o,d?r:a,l,h,f],g=n.apply(r,p);return Es(t)&&xs(g,p),g.placeholder=i,Os(g,t,e)}function Qi(t){var e=St[t];return function(t,n){if(t=va(t),(n=null==n?0:_n(ma(n),292))&&Ue(t)){var r=(_a(t)+"e").split("e");return+((r=(_a(e(r[0]+"e"+(+r[1]+n)))+"e").split("e"))[0]+"e"+(+r[1]-n))}return e(t)}}var Yi=Dn&&1/fn(new Dn([,-0]))[1]==f?function(t){return new Dn(t)}:lu;function Xi(t){return function(e){var n=gs(e);return n==I?cn(e):n==N?function(t){var e=-1,n=Array(t.size);return t.forEach((function(t){n[++e]=[t,t]})),n}(e):function(t,e){return Oe(e,(function(e){return[e,t[e]]}))}(e,t(e))}}function Ji(t,e,n,s,f,d,p,g){var m=2&e;if(!m&&"function"!=typeof t)throw new kt(i);var y=s?s.length:0;if(y||(e&=-97,s=f=r),p=p===r?p:wn(ma(p),0),g=g===r?g:ma(g),y-=f?f.length:0,e&c){var v=s,w=f;s=f=r}var _=m?r:os(t),b=[t,e,n,s,f,v,w,d,p,g];if(_&&function(t,e){var n=t[1],r=e[1],i=n|r,s=i<131,a=r==l&&8==n||r==l&&n==h&&t[7].length<=e[8]||384==r&&e[7].length<=e[8]&&8==n;if(!s&&!a)return t;1&r&&(t[2]=e[2],i|=1&n?0:4);var u=e[3];if(u){var c=t[3];t[3]=c?Di(c,u,e[4]):u,t[4]=c?hn(t[3],o):e[4]}(u=e[5])&&(c=t[5],t[5]=c?Ni(c,u,e[6]):u,t[6]=c?hn(t[5],o):e[6]);(u=e[7])&&(t[7]=u);r&l&&(t[8]=null==t[8]?e[8]:_n(t[8],e[8]));null==t[9]&&(t[9]=e[9]);t[0]=e[0],t[1]=i}(b,_),t=b[0],e=b[1],n=b[2],s=b[3],f=b[4],!(g=b[9]=b[9]===r?m?0:t.length:wn(b[9]-y,0))&&24&e&&(e&=-25),e&&1!=e)E=8==e||e==a?function(t,e,n){var i=Pi(t);return function s(){for(var o=arguments.length,a=ot(o),u=o,c=us(s);u--;)a[u]=arguments[u];var l=o<3&&a[0]!==c&&a[o-1]!==c?[]:hn(a,c);return(o-=l.length)<n?Wi(t,e,Bi,s.placeholder,r,a,l,r,r,n-o):Se(this&&this!==pe&&this instanceof s?i:t,this,a)}}(t,e,g):e!=u&&33!=e||f.length?Bi.apply(r,b):function(t,e,n,r){var i=1&e,s=Pi(t);return function e(){for(var o=-1,a=arguments.length,u=-1,c=r.length,l=ot(c+a),h=this&&this!==pe&&this instanceof e?s:t;++u<c;)l[u]=r[u];for(;a--;)l[u++]=arguments[++o];return Se(h,i?n:this,l)}}(t,e,n,s);else var E=function(t,e,n){var r=1&e,i=Pi(t);return function e(){return(this&&this!==pe&&this instanceof e?i:t).apply(r?n:this,arguments)}}(t,e,n);return Os((_?ei:xs)(E,b),t,e)}function Zi(t,e,n,i){return t===r||qo(t,Lt[n])&&!Vt.call(i,n)?e:t}function ts(t,e,n,i,s,o){return na(t)&&na(e)&&(o.set(e,t),$r(t,e,r,ts,o),o.delete(e)),t}function es(t){return oa(t)?r:t}function ns(t,e,n,i,s,o){var a=1&n,u=t.length,c=e.length;if(u!=c&&!(a&&c>u))return!1;var l=o.get(t),h=o.get(e);if(l&&h)return l==e&&h==t;var f=-1,d=!0,p=2&n?new Qn:r;for(o.set(t,e),o.set(e,t);++f<u;){var g=t[f],m=e[f];if(i)var y=a?i(m,g,f,e,t,o):i(g,m,f,t,e,o);if(y!==r){if(y)continue;d=!1;break}if(p){if(!Pe(e,(function(t,e){if(!tn(p,e)&&(g===t||s(g,t,n,i,o)))return p.push(e)}))){d=!1;break}}else if(g!==m&&!s(g,m,n,i,o)){d=!1;break}}return o.delete(t),o.delete(e),d}function rs(t){return Ls(As(t,r,Gs),t+"")}function is(t){return Cr(t,La,ds)}function ss(t){return Cr(t,Oa,ps)}var os=xn?function(t){return xn.get(t)}:lu;function as(t){for(var e=t.name+"",n=Rn[e],r=Vt.call(Rn,e)?n.length:0;r--;){var i=n[r],s=i.func;if(null==s||s==t)return i.name}return e}function us(t){return(Vt.call(Bn,"placeholder")?Bn:t).placeholder}function cs(){var t=Bn.iteratee||ou;return t=t===ou?Vr:t,arguments.length?t(arguments[0],arguments[1]):t}function ls(t,e){var n,r,i=t.__data__;return("string"==(r=typeof(n=e))||"number"==r||"symbol"==r||"boolean"==r?"__proto__"!==n:null===n)?i["string"==typeof e?"string":"hash"]:i.map}function hs(t){for(var e=La(t),n=e.length;n--;){var r=e[n],i=t[r];e[n]=[r,i,Cs(i)]}return e}function fs(t,e){var n=function(t,e){return null==t?r:t[e]}(t,e);return Mr(n)?n:r}var ds=ve?function(t){return null==t?[]:(t=At(t),xe(ve(t),(function(e){return Qt.call(t,e)})))}:yu,ps=ve?function(t){for(var e=[];t;)Me(e,ds(t)),t=Ht(t);return e}:yu,gs=Sr;function ms(t,e,n){for(var r=-1,i=(e=_i(e,t)).length,s=!1;++r<i;){var o=Ps(e[r]);if(!(s=null!=t&&n(t,o)))break;t=t[o]}return s||++r!=i?s:!!(i=null==t?0:t.length)&&ea(i)&&ws(o,i)&&(Go(t)||Ko(t))}function ys(t){return"function"!=typeof t.constructor||Is(t)?{}:qn(Ht(t))}function vs(t){return Go(t)||Ko(t)||!!(Xt&&t&&t[Xt])}function ws(t,e){var n=typeof t;return!!(e=null==e?d:e)&&("number"==n||"symbol"!=n&&wt.test(t))&&t>-1&&t%1==0&&t<e}function _s(t,e,n){if(!na(n))return!1;var r=typeof e;return!!("number"==r?Wo(n)&&ws(e,n.length):"string"==r&&e in n)&&qo(n[e],t)}function bs(t,e){if(Go(t))return!1;var n=typeof t;return!("number"!=n&&"symbol"!=n&&"boolean"!=n&&null!=t&&!la(t))||(et.test(t)||!tt.test(t)||null!=e&&t in At(e))}function Es(t){var e=as(t),n=Bn[e];if("function"!=typeof n||!(e in Kn.prototype))return!1;if(t===n)return!0;var r=os(n);return!!r&&t===r[0]}(Cn&&gs(new Cn(new ArrayBuffer(1)))!=O||Sn&&gs(new Sn)!=I||An&&gs(An.resolve())!=A||Dn&&gs(new Dn)!=N||Nn&&gs(new Nn)!=R)&&(gs=function(t){var e=Sr(t),n=e==S?t.constructor:r,i=n?Us(n):"";if(i)switch(i){case Ln:return O;case On:return I;case Mn:return A;case Vn:return N;case Fn:return R}return e});var Ts=Ot?Zo:vu;function Is(t){var e=t&&t.constructor;return t===("function"==typeof e&&e.prototype||Lt)}function Cs(t){return t==t&&!na(t)}function Ss(t,e){return function(n){return null!=n&&(n[t]===e&&(e!==r||t in At(n)))}}function As(t,e,n){return e=wn(e===r?t.length-1:e,0),function(){for(var r=arguments,i=-1,s=wn(r.length-e,0),o=ot(s);++i<s;)o[i]=r[e+i];i=-1;for(var a=ot(e+1);++i<e;)a[i]=r[i];return a[e]=n(o),Se(t,this,a)}}function Ds(t,e){return e.length<2?t:Ir(t,ii(e,0,-1))}function Ns(t,e){for(var n=t.length,i=_n(e.length,n),s=ki(t);i--;){var o=e[i];t[i]=ws(o,n)?s[o]:r}return t}function ks(t,e){if(("constructor"!==e||"function"!=typeof t[e])&&"__proto__"!=e)return t[e]}var xs=Ms(ei),Rs=de||function(t,e){return pe.setTimeout(t,e)},Ls=Ms(ni);function Os(t,e,n){var r=e+"";return Ls(t,function(t,e){var n=e.length;if(!n)return t;var r=n-1;return e[r]=(n>1?"& ":"")+e[r],e=e.join(n>2?", ":" "),t.replace(at,"{\n/* [wrapped with "+e+"] */\n")}(r,function(t,e){return De(m,(function(n){var r="_."+n[0];e&n[1]&&!Re(t,r)&&t.push(r)})),t.sort()}(function(t){var e=t.match(ut);return e?e[1].split(ct):[]}(r),n)))}function Ms(t){var e=0,n=0;return function(){var i=bn(),s=16-(i-n);if(n=i,s>0){if(++e>=800)return arguments[0]}else e=0;return t.apply(r,arguments)}}function Vs(t,e){var n=-1,i=t.length,s=i-1;for(e=e===r?i:e;++n<e;){var o=Qr(n,s),a=t[o];t[o]=t[n],t[n]=a}return t.length=e,t}var Fs=function(t){var e=Vo(t,(function(t){return 500===n.size&&n.clear(),t})),n=e.cache;return e}((function(t){var e=[];return 46===t.charCodeAt(0)&&e.push(""),t.replace(nt,(function(t,n,r,i){e.push(r?i.replace(ft,"$1"):n||t)})),e}));function Ps(t){if("string"==typeof t||la(t))return t;var e=t+"";return"0"==e&&1/t==-1/0?"-0":e}function Us(t){if(null!=t){try{return Mt.call(t)}catch(t){}try{return t+""}catch(t){}}return""}function js(t){if(t instanceof Kn)return t.clone();var e=new zn(t.__wrapped__,t.__chain__);return e.__actions__=ki(t.__actions__),e.__index__=t.__index__,e.__values__=t.__values__,e}var Bs=Xr((function(t,e){return Qo(t)?fr(t,vr(e,1,Qo,!0)):[]})),qs=Xr((function(t,e){var n=Xs(e);return Qo(n)&&(n=r),Qo(t)?fr(t,vr(e,1,Qo,!0),cs(n,2)):[]})),$s=Xr((function(t,e){var n=Xs(e);return Qo(n)&&(n=r),Qo(t)?fr(t,vr(e,1,Qo,!0),r,n):[]}));function zs(t,e,n){var r=null==t?0:t.length;if(!r)return-1;var i=null==n?0:ma(n);return i<0&&(i=wn(r+i,0)),Be(t,cs(e,3),i)}function Ks(t,e,n){var i=null==t?0:t.length;if(!i)return-1;var s=i-1;return n!==r&&(s=ma(n),s=n<0?wn(i+s,0):_n(s,i-1)),Be(t,cs(e,3),s,!0)}function Gs(t){return(null==t?0:t.length)?vr(t,1):[]}function Hs(t){return t&&t.length?t[0]:r}var Ws=Xr((function(t){var e=Oe(t,vi);return e.length&&e[0]===t[0]?kr(e):[]})),Qs=Xr((function(t){var e=Xs(t),n=Oe(t,vi);return e===Xs(n)?e=r:n.pop(),n.length&&n[0]===t[0]?kr(n,cs(e,2)):[]})),Ys=Xr((function(t){var e=Xs(t),n=Oe(t,vi);return(e="function"==typeof e?e:r)&&n.pop(),n.length&&n[0]===t[0]?kr(n,r,e):[]}));function Xs(t){var e=null==t?0:t.length;return e?t[e-1]:r}var Js=Xr(Zs);function Zs(t,e){return t&&t.length&&e&&e.length?Hr(t,e):t}var to=rs((function(t,e){var n=null==t?0:t.length,r=ar(t,e);return Wr(t,Oe(e,(function(t){return ws(t,n)?+t:t})).sort(Ai)),r}));function eo(t){return null==t?t:In.call(t)}var no=Xr((function(t){return hi(vr(t,1,Qo,!0))})),ro=Xr((function(t){var e=Xs(t);return Qo(e)&&(e=r),hi(vr(t,1,Qo,!0),cs(e,2))})),io=Xr((function(t){var e=Xs(t);return e="function"==typeof e?e:r,hi(vr(t,1,Qo,!0),r,e)}));function so(t){if(!t||!t.length)return[];var e=0;return t=xe(t,(function(t){if(Qo(t))return e=wn(t.length,e),!0})),Ye(e,(function(e){return Oe(t,Ge(e))}))}function oo(t,e){if(!t||!t.length)return[];var n=so(t);return null==e?n:Oe(n,(function(t){return Se(e,r,t)}))}var ao=Xr((function(t,e){return Qo(t)?fr(t,e):[]})),uo=Xr((function(t){return mi(xe(t,Qo))})),co=Xr((function(t){var e=Xs(t);return Qo(e)&&(e=r),mi(xe(t,Qo),cs(e,2))})),lo=Xr((function(t){var e=Xs(t);return e="function"==typeof e?e:r,mi(xe(t,Qo),r,e)})),ho=Xr(so);var fo=Xr((function(t){var e=t.length,n=e>1?t[e-1]:r;return n="function"==typeof n?(t.pop(),n):r,oo(t,n)}));function po(t){var e=Bn(t);return e.__chain__=!0,e}function go(t,e){return e(t)}var mo=rs((function(t){var e=t.length,n=e?t[0]:0,i=this.__wrapped__,s=function(e){return ar(e,t)};return!(e>1||this.__actions__.length)&&i instanceof Kn&&ws(n)?((i=i.slice(n,+n+(e?1:0))).__actions__.push({func:go,args:[s],thisArg:r}),new zn(i,this.__chain__).thru((function(t){return e&&!t.length&&t.push(r),t}))):this.thru(s)}));var yo=Ri((function(t,e,n){Vt.call(t,n)?++t[n]:or(t,n,1)}));var vo=Ui(zs),wo=Ui(Ks);function _o(t,e){return(Go(t)?De:dr)(t,cs(e,3))}function bo(t,e){return(Go(t)?Ne:pr)(t,cs(e,3))}var Eo=Ri((function(t,e,n){Vt.call(t,n)?t[n].push(e):or(t,n,[e])}));var To=Xr((function(t,e,n){var r=-1,i="function"==typeof e,s=Wo(t)?ot(t.length):[];return dr(t,(function(t){s[++r]=i?Se(e,t,n):xr(t,e,n)})),s})),Io=Ri((function(t,e,n){or(t,n,e)}));function Co(t,e){return(Go(t)?Oe:jr)(t,cs(e,3))}var So=Ri((function(t,e,n){t[n?0:1].push(e)}),(function(){return[[],[]]}));var Ao=Xr((function(t,e){if(null==t)return[];var n=e.length;return n>1&&_s(t,e[0],e[1])?e=[]:n>2&&_s(e[0],e[1],e[2])&&(e=[e[0]]),Kr(t,vr(e,1),[])})),Do=fe||function(){return pe.Date.now()};function No(t,e,n){return e=n?r:e,e=t&&null==e?t.length:e,Ji(t,l,r,r,r,r,e)}function ko(t,e){var n;if("function"!=typeof e)throw new kt(i);return t=ma(t),function(){return--t>0&&(n=e.apply(this,arguments)),t<=1&&(e=r),n}}var xo=Xr((function(t,e,n){var r=1;if(n.length){var i=hn(n,us(xo));r|=u}return Ji(t,r,e,n,i)})),Ro=Xr((function(t,e,n){var r=3;if(n.length){var i=hn(n,us(Ro));r|=u}return Ji(e,r,t,n,i)}));function Lo(t,e,n){var s,o,a,u,c,l,h=0,f=!1,d=!1,p=!0;if("function"!=typeof t)throw new kt(i);function g(e){var n=s,i=o;return s=o=r,h=e,u=t.apply(i,n)}function m(t){return h=t,c=Rs(v,e),f?g(t):u}function y(t){var n=t-l;return l===r||n>=e||n<0||d&&t-h>=a}function v(){var t=Do();if(y(t))return w(t);c=Rs(v,function(t){var n=e-(t-l);return d?_n(n,a-(t-h)):n}(t))}function w(t){return c=r,p&&s?g(t):(s=o=r,u)}function _(){var t=Do(),n=y(t);if(s=arguments,o=this,l=t,n){if(c===r)return m(l);if(d)return Ti(c),c=Rs(v,e),g(l)}return c===r&&(c=Rs(v,e)),u}return e=va(e)||0,na(n)&&(f=!!n.leading,a=(d="maxWait"in n)?wn(va(n.maxWait)||0,e):a,p="trailing"in n?!!n.trailing:p),_.cancel=function(){c!==r&&Ti(c),h=0,s=l=o=c=r},_.flush=function(){return c===r?u:w(Do())},_}var Oo=Xr((function(t,e){return hr(t,1,e)})),Mo=Xr((function(t,e,n){return hr(t,va(e)||0,n)}));function Vo(t,e){if("function"!=typeof t||null!=e&&"function"!=typeof e)throw new kt(i);var n=function(){var r=arguments,i=e?e.apply(this,r):r[0],s=n.cache;if(s.has(i))return s.get(i);var o=t.apply(this,r);return n.cache=s.set(i,o)||s,o};return n.cache=new(Vo.Cache||Wn),n}function Fo(t){if("function"!=typeof t)throw new kt(i);return function(){var e=arguments;switch(e.length){case 0:return!t.call(this);case 1:return!t.call(this,e[0]);case 2:return!t.call(this,e[0],e[1]);case 3:return!t.call(this,e[0],e[1],e[2])}return!t.apply(this,e)}}Vo.Cache=Wn;var Po=bi((function(t,e){var n=(e=1==e.length&&Go(e[0])?Oe(e[0],Je(cs())):Oe(vr(e,1),Je(cs()))).length;return Xr((function(r){for(var i=-1,s=_n(r.length,n);++i<s;)r[i]=e[i].call(this,r[i]);return Se(t,this,r)}))})),Uo=Xr((function(t,e){var n=hn(e,us(Uo));return Ji(t,u,r,e,n)})),jo=Xr((function(t,e){var n=hn(e,us(jo));return Ji(t,c,r,e,n)})),Bo=rs((function(t,e){return Ji(t,h,r,r,r,e)}));function qo(t,e){return t===e||t!=t&&e!=e}var $o=Hi(Ar),zo=Hi((function(t,e){return t>=e})),Ko=Rr(function(){return arguments}())?Rr:function(t){return ra(t)&&Vt.call(t,"callee")&&!Qt.call(t,"callee")},Go=ot.isArray,Ho=_e?Je(_e):function(t){return ra(t)&&Sr(t)==L};function Wo(t){return null!=t&&ea(t.length)&&!Zo(t)}function Qo(t){return ra(t)&&Wo(t)}var Yo=we||vu,Xo=be?Je(be):function(t){return ra(t)&&Sr(t)==_};function Jo(t){if(!ra(t))return!1;var e=Sr(t);return e==b||"[object DOMException]"==e||"string"==typeof t.message&&"string"==typeof t.name&&!oa(t)}function Zo(t){if(!na(t))return!1;var e=Sr(t);return e==E||e==T||"[object AsyncFunction]"==e||"[object Proxy]"==e}function ta(t){return"number"==typeof t&&t==ma(t)}function ea(t){return"number"==typeof t&&t>-1&&t%1==0&&t<=d}function na(t){var e=typeof t;return null!=t&&("object"==e||"function"==e)}function ra(t){return null!=t&&"object"==typeof t}var ia=Ee?Je(Ee):function(t){return ra(t)&&gs(t)==I};function sa(t){return"number"==typeof t||ra(t)&&Sr(t)==C}function oa(t){if(!ra(t)||Sr(t)!=S)return!1;var e=Ht(t);if(null===e)return!0;var n=Vt.call(e,"constructor")&&e.constructor;return"function"==typeof n&&n instanceof n&&Mt.call(n)==jt}var aa=Te?Je(Te):function(t){return ra(t)&&Sr(t)==D};var ua=Ie?Je(Ie):function(t){return ra(t)&&gs(t)==N};function ca(t){return"string"==typeof t||!Go(t)&&ra(t)&&Sr(t)==k}function la(t){return"symbol"==typeof t||ra(t)&&Sr(t)==x}var ha=Ce?Je(Ce):function(t){return ra(t)&&ea(t.length)&&!!ae[Sr(t)]};var fa=Hi(Ur),da=Hi((function(t,e){return t<=e}));function pa(t){if(!t)return[];if(Wo(t))return ca(t)?pn(t):ki(t);if(Jt&&t[Jt])return function(t){for(var e,n=[];!(e=t.next()).done;)n.push(e.value);return n}(t[Jt]());var e=gs(t);return(e==I?cn:e==N?fn:qa)(t)}function ga(t){return t?(t=va(t))===f||t===-1/0?17976931348623157e292*(t<0?-1:1):t==t?t:0:0===t?t:0}function ma(t){var e=ga(t),n=e%1;return e==e?n?e-n:e:0}function ya(t){return t?ur(ma(t),0,g):0}function va(t){if("number"==typeof t)return t;if(la(t))return p;if(na(t)){var e="function"==typeof t.valueOf?t.valueOf():t;t=na(e)?e+"":e}if("string"!=typeof t)return 0===t?t:+t;t=Xe(t);var n=mt.test(t);return n||vt.test(t)?he(t.slice(2),n?2:8):gt.test(t)?p:+t}function wa(t){return xi(t,Oa(t))}function _a(t){return null==t?"":li(t)}var ba=Li((function(t,e){if(Is(e)||Wo(e))xi(e,La(e),t);else for(var n in e)Vt.call(e,n)&&nr(t,n,e[n])})),Ea=Li((function(t,e){xi(e,Oa(e),t)})),Ta=Li((function(t,e,n,r){xi(e,Oa(e),t,r)})),Ia=Li((function(t,e,n,r){xi(e,La(e),t,r)})),Ca=rs(ar);var Sa=Xr((function(t,e){t=At(t);var n=-1,i=e.length,s=i>2?e[2]:r;for(s&&_s(e[0],e[1],s)&&(i=1);++n<i;)for(var o=e[n],a=Oa(o),u=-1,c=a.length;++u<c;){var l=a[u],h=t[l];(h===r||qo(h,Lt[l])&&!Vt.call(t,l))&&(t[l]=o[l])}return t})),Aa=Xr((function(t){return t.push(r,ts),Se(Va,r,t)}));function Da(t,e,n){var i=null==t?r:Ir(t,e);return i===r?n:i}function Na(t,e){return null!=t&&ms(t,e,Nr)}var ka=qi((function(t,e,n){null!=e&&"function"!=typeof e.toString&&(e=Ut.call(e)),t[e]=n}),nu(su)),xa=qi((function(t,e,n){null!=e&&"function"!=typeof e.toString&&(e=Ut.call(e)),Vt.call(t,e)?t[e].push(n):t[e]=[n]}),cs),Ra=Xr(xr);function La(t){return Wo(t)?Xn(t):Fr(t)}function Oa(t){return Wo(t)?Xn(t,!0):Pr(t)}var Ma=Li((function(t,e,n){$r(t,e,n)})),Va=Li((function(t,e,n,r){$r(t,e,n,r)})),Fa=rs((function(t,e){var n={};if(null==t)return n;var r=!1;e=Oe(e,(function(e){return e=_i(e,t),r||(r=e.length>1),e})),xi(t,ss(t),n),r&&(n=cr(n,7,es));for(var i=e.length;i--;)fi(n,e[i]);return n}));var Pa=rs((function(t,e){return null==t?{}:function(t,e){return Gr(t,e,(function(e,n){return Na(t,n)}))}(t,e)}));function Ua(t,e){if(null==t)return{};var n=Oe(ss(t),(function(t){return[t]}));return e=cs(e),Gr(t,n,(function(t,n){return e(t,n[0])}))}var ja=Xi(La),Ba=Xi(Oa);function qa(t){return null==t?[]:Ze(t,La(t))}var $a=Fi((function(t,e,n){return e=e.toLowerCase(),t+(n?za(e):e)}));function za(t){return Ja(_a(t).toLowerCase())}function Ka(t){return(t=_a(t))&&t.replace(_t,sn).replace(te,"")}var Ga=Fi((function(t,e,n){return t+(n?"-":"")+e.toLowerCase()})),Ha=Fi((function(t,e,n){return t+(n?" ":"")+e.toLowerCase()})),Wa=Vi("toLowerCase");var Qa=Fi((function(t,e,n){return t+(n?"_":"")+e.toLowerCase()}));var Ya=Fi((function(t,e,n){return t+(n?" ":"")+Ja(e)}));var Xa=Fi((function(t,e,n){return t+(n?" ":"")+e.toUpperCase()})),Ja=Vi("toUpperCase");function Za(t,e,n){return t=_a(t),(e=n?r:e)===r?function(t){return ie.test(t)}(t)?function(t){return t.match(ne)||[]}(t):function(t){return t.match(lt)||[]}(t):t.match(e)||[]}var tu=Xr((function(t,e){try{return Se(t,r,e)}catch(t){return Jo(t)?t:new It(t)}})),eu=rs((function(t,e){return De(e,(function(e){e=Ps(e),or(t,e,xo(t[e],t))})),t}));function nu(t){return function(){return t}}var ru=ji(),iu=ji(!0);function su(t){return t}function ou(t){return Vr("function"==typeof t?t:cr(t,1))}var au=Xr((function(t,e){return function(n){return xr(n,t,e)}})),uu=Xr((function(t,e){return function(n){return xr(t,n,e)}}));function cu(t,e,n){var r=La(e),i=Tr(e,r);null!=n||na(e)&&(i.length||!r.length)||(n=e,e=t,t=this,i=Tr(e,La(e)));var s=!(na(n)&&"chain"in n&&!n.chain),o=Zo(t);return De(i,(function(n){var r=e[n];t[n]=r,o&&(t.prototype[n]=function(){var e=this.__chain__;if(s||e){var n=t(this.__wrapped__),i=n.__actions__=ki(this.__actions__);return i.push({func:r,args:arguments,thisArg:t}),n.__chain__=e,n}return r.apply(t,Me([this.value()],arguments))})})),t}function lu(){}var hu=zi(Oe),fu=zi(ke),du=zi(Pe);function pu(t){return bs(t)?Ge(Ps(t)):function(t){return function(e){return Ir(e,t)}}(t)}var gu=Gi(),mu=Gi(!0);function yu(){return[]}function vu(){return!1}var wu=$i((function(t,e){return t+e}),0),_u=Qi("ceil"),bu=$i((function(t,e){return t/e}),1),Eu=Qi("floor");var Tu,Iu=$i((function(t,e){return t*e}),1),Cu=Qi("round"),Su=$i((function(t,e){return t-e}),0);return Bn.after=function(t,e){if("function"!=typeof e)throw new kt(i);return t=ma(t),function(){if(--t<1)return e.apply(this,arguments)}},Bn.ary=No,Bn.assign=ba,Bn.assignIn=Ea,Bn.assignInWith=Ta,Bn.assignWith=Ia,Bn.at=Ca,Bn.before=ko,Bn.bind=xo,Bn.bindAll=eu,Bn.bindKey=Ro,Bn.castArray=function(){if(!arguments.length)return[];var t=arguments[0];return Go(t)?t:[t]},Bn.chain=po,Bn.chunk=function(t,e,n){e=(n?_s(t,e,n):e===r)?1:wn(ma(e),0);var i=null==t?0:t.length;if(!i||e<1)return[];for(var s=0,o=0,a=ot(ge(i/e));s<i;)a[o++]=ii(t,s,s+=e);return a},Bn.compact=function(t){for(var e=-1,n=null==t?0:t.length,r=0,i=[];++e<n;){var s=t[e];s&&(i[r++]=s)}return i},Bn.concat=function(){var t=arguments.length;if(!t)return[];for(var e=ot(t-1),n=arguments[0],r=t;r--;)e[r-1]=arguments[r];return Me(Go(n)?ki(n):[n],vr(e,1))},Bn.cond=function(t){var e=null==t?0:t.length,n=cs();return t=e?Oe(t,(function(t){if("function"!=typeof t[1])throw new kt(i);return[n(t[0]),t[1]]})):[],Xr((function(n){for(var r=-1;++r<e;){var i=t[r];if(Se(i[0],this,n))return Se(i[1],this,n)}}))},Bn.conforms=function(t){return function(t){var e=La(t);return function(n){return lr(n,t,e)}}(cr(t,1))},Bn.constant=nu,Bn.countBy=yo,Bn.create=function(t,e){var n=qn(t);return null==e?n:sr(n,e)},Bn.curry=function t(e,n,i){var s=Ji(e,8,r,r,r,r,r,n=i?r:n);return s.placeholder=t.placeholder,s},Bn.curryRight=function t(e,n,i){var s=Ji(e,a,r,r,r,r,r,n=i?r:n);return s.placeholder=t.placeholder,s},Bn.debounce=Lo,Bn.defaults=Sa,Bn.defaultsDeep=Aa,Bn.defer=Oo,Bn.delay=Mo,Bn.difference=Bs,Bn.differenceBy=qs,Bn.differenceWith=$s,Bn.drop=function(t,e,n){var i=null==t?0:t.length;return i?ii(t,(e=n||e===r?1:ma(e))<0?0:e,i):[]},Bn.dropRight=function(t,e,n){var i=null==t?0:t.length;return i?ii(t,0,(e=i-(e=n||e===r?1:ma(e)))<0?0:e):[]},Bn.dropRightWhile=function(t,e){return t&&t.length?pi(t,cs(e,3),!0,!0):[]},Bn.dropWhile=function(t,e){return t&&t.length?pi(t,cs(e,3),!0):[]},Bn.fill=function(t,e,n,i){var s=null==t?0:t.length;return s?(n&&"number"!=typeof n&&_s(t,e,n)&&(n=0,i=s),function(t,e,n,i){var s=t.length;for((n=ma(n))<0&&(n=-n>s?0:s+n),(i=i===r||i>s?s:ma(i))<0&&(i+=s),i=n>i?0:ya(i);n<i;)t[n++]=e;return t}(t,e,n,i)):[]},Bn.filter=function(t,e){return(Go(t)?xe:yr)(t,cs(e,3))},Bn.flatMap=function(t,e){return vr(Co(t,e),1)},Bn.flatMapDeep=function(t,e){return vr(Co(t,e),f)},Bn.flatMapDepth=function(t,e,n){return n=n===r?1:ma(n),vr(Co(t,e),n)},Bn.flatten=Gs,Bn.flattenDeep=function(t){return(null==t?0:t.length)?vr(t,f):[]},Bn.flattenDepth=function(t,e){return(null==t?0:t.length)?vr(t,e=e===r?1:ma(e)):[]},Bn.flip=function(t){return Ji(t,512)},Bn.flow=ru,Bn.flowRight=iu,Bn.fromPairs=function(t){for(var e=-1,n=null==t?0:t.length,r={};++e<n;){var i=t[e];r[i[0]]=i[1]}return r},Bn.functions=function(t){return null==t?[]:Tr(t,La(t))},Bn.functionsIn=function(t){return null==t?[]:Tr(t,Oa(t))},Bn.groupBy=Eo,Bn.initial=function(t){return(null==t?0:t.length)?ii(t,0,-1):[]},Bn.intersection=Ws,Bn.intersectionBy=Qs,Bn.intersectionWith=Ys,Bn.invert=ka,Bn.invertBy=xa,Bn.invokeMap=To,Bn.iteratee=ou,Bn.keyBy=Io,Bn.keys=La,Bn.keysIn=Oa,Bn.map=Co,Bn.mapKeys=function(t,e){var n={};return e=cs(e,3),br(t,(function(t,r,i){or(n,e(t,r,i),t)})),n},Bn.mapValues=function(t,e){var n={};return e=cs(e,3),br(t,(function(t,r,i){or(n,r,e(t,r,i))})),n},Bn.matches=function(t){return Br(cr(t,1))},Bn.matchesProperty=function(t,e){return qr(t,cr(e,1))},Bn.memoize=Vo,Bn.merge=Ma,Bn.mergeWith=Va,Bn.method=au,Bn.methodOf=uu,Bn.mixin=cu,Bn.negate=Fo,Bn.nthArg=function(t){return t=ma(t),Xr((function(e){return zr(e,t)}))},Bn.omit=Fa,Bn.omitBy=function(t,e){return Ua(t,Fo(cs(e)))},Bn.once=function(t){return ko(2,t)},Bn.orderBy=function(t,e,n,i){return null==t?[]:(Go(e)||(e=null==e?[]:[e]),Go(n=i?r:n)||(n=null==n?[]:[n]),Kr(t,e,n))},Bn.over=hu,Bn.overArgs=Po,Bn.overEvery=fu,Bn.overSome=du,Bn.partial=Uo,Bn.partialRight=jo,Bn.partition=So,Bn.pick=Pa,Bn.pickBy=Ua,Bn.property=pu,Bn.propertyOf=function(t){return function(e){return null==t?r:Ir(t,e)}},Bn.pull=Js,Bn.pullAll=Zs,Bn.pullAllBy=function(t,e,n){return t&&t.length&&e&&e.length?Hr(t,e,cs(n,2)):t},Bn.pullAllWith=function(t,e,n){return t&&t.length&&e&&e.length?Hr(t,e,r,n):t},Bn.pullAt=to,Bn.range=gu,Bn.rangeRight=mu,Bn.rearg=Bo,Bn.reject=function(t,e){return(Go(t)?xe:yr)(t,Fo(cs(e,3)))},Bn.remove=function(t,e){var n=[];if(!t||!t.length)return n;var r=-1,i=[],s=t.length;for(e=cs(e,3);++r<s;){var o=t[r];e(o,r,t)&&(n.push(o),i.push(r))}return Wr(t,i),n},Bn.rest=function(t,e){if("function"!=typeof t)throw new kt(i);return Xr(t,e=e===r?e:ma(e))},Bn.reverse=eo,Bn.sampleSize=function(t,e,n){return e=(n?_s(t,e,n):e===r)?1:ma(e),(Go(t)?Zn:Zr)(t,e)},Bn.set=function(t,e,n){return null==t?t:ti(t,e,n)},Bn.setWith=function(t,e,n,i){return i="function"==typeof i?i:r,null==t?t:ti(t,e,n,i)},Bn.shuffle=function(t){return(Go(t)?tr:ri)(t)},Bn.slice=function(t,e,n){var i=null==t?0:t.length;return i?(n&&"number"!=typeof n&&_s(t,e,n)?(e=0,n=i):(e=null==e?0:ma(e),n=n===r?i:ma(n)),ii(t,e,n)):[]},Bn.sortBy=Ao,Bn.sortedUniq=function(t){return t&&t.length?ui(t):[]},Bn.sortedUniqBy=function(t,e){return t&&t.length?ui(t,cs(e,2)):[]},Bn.split=function(t,e,n){return n&&"number"!=typeof n&&_s(t,e,n)&&(e=n=r),(n=n===r?g:n>>>0)?(t=_a(t))&&("string"==typeof e||null!=e&&!aa(e))&&!(e=li(e))&&un(t)?Ei(pn(t),0,n):t.split(e,n):[]},Bn.spread=function(t,e){if("function"!=typeof t)throw new kt(i);return e=null==e?0:wn(ma(e),0),Xr((function(n){var r=n[e],i=Ei(n,0,e);return r&&Me(i,r),Se(t,this,i)}))},Bn.tail=function(t){var e=null==t?0:t.length;return e?ii(t,1,e):[]},Bn.take=function(t,e,n){return t&&t.length?ii(t,0,(e=n||e===r?1:ma(e))<0?0:e):[]},Bn.takeRight=function(t,e,n){var i=null==t?0:t.length;return i?ii(t,(e=i-(e=n||e===r?1:ma(e)))<0?0:e,i):[]},Bn.takeRightWhile=function(t,e){return t&&t.length?pi(t,cs(e,3),!1,!0):[]},Bn.takeWhile=function(t,e){return t&&t.length?pi(t,cs(e,3)):[]},Bn.tap=function(t,e){return e(t),t},Bn.throttle=function(t,e,n){var r=!0,s=!0;if("function"!=typeof t)throw new kt(i);return na(n)&&(r="leading"in n?!!n.leading:r,s="trailing"in n?!!n.trailing:s),Lo(t,e,{leading:r,maxWait:e,trailing:s})},Bn.thru=go,Bn.toArray=pa,Bn.toPairs=ja,Bn.toPairsIn=Ba,Bn.toPath=function(t){return Go(t)?Oe(t,Ps):la(t)?[t]:ki(Fs(_a(t)))},Bn.toPlainObject=wa,Bn.transform=function(t,e,n){var r=Go(t),i=r||Yo(t)||ha(t);if(e=cs(e,4),null==n){var s=t&&t.constructor;n=i?r?new s:[]:na(t)&&Zo(s)?qn(Ht(t)):{}}return(i?De:br)(t,(function(t,r,i){return e(n,t,r,i)})),n},Bn.unary=function(t){return No(t,1)},Bn.union=no,Bn.unionBy=ro,Bn.unionWith=io,Bn.uniq=function(t){return t&&t.length?hi(t):[]},Bn.uniqBy=function(t,e){return t&&t.length?hi(t,cs(e,2)):[]},Bn.uniqWith=function(t,e){return e="function"==typeof e?e:r,t&&t.length?hi(t,r,e):[]},Bn.unset=function(t,e){return null==t||fi(t,e)},Bn.unzip=so,Bn.unzipWith=oo,Bn.update=function(t,e,n){return null==t?t:di(t,e,wi(n))},Bn.updateWith=function(t,e,n,i){return i="function"==typeof i?i:r,null==t?t:di(t,e,wi(n),i)},Bn.values=qa,Bn.valuesIn=function(t){return null==t?[]:Ze(t,Oa(t))},Bn.without=ao,Bn.words=Za,Bn.wrap=function(t,e){return Uo(wi(e),t)},Bn.xor=uo,Bn.xorBy=co,Bn.xorWith=lo,Bn.zip=ho,Bn.zipObject=function(t,e){return yi(t||[],e||[],nr)},Bn.zipObjectDeep=function(t,e){return yi(t||[],e||[],ti)},Bn.zipWith=fo,Bn.entries=ja,Bn.entriesIn=Ba,Bn.extend=Ea,Bn.extendWith=Ta,cu(Bn,Bn),Bn.add=wu,Bn.attempt=tu,Bn.camelCase=$a,Bn.capitalize=za,Bn.ceil=_u,Bn.clamp=function(t,e,n){return n===r&&(n=e,e=r),n!==r&&(n=(n=va(n))==n?n:0),e!==r&&(e=(e=va(e))==e?e:0),ur(va(t),e,n)},Bn.clone=function(t){return cr(t,4)},Bn.cloneDeep=function(t){return cr(t,5)},Bn.cloneDeepWith=function(t,e){return cr(t,5,e="function"==typeof e?e:r)},Bn.cloneWith=function(t,e){return cr(t,4,e="function"==typeof e?e:r)},Bn.conformsTo=function(t,e){return null==e||lr(t,e,La(e))},Bn.deburr=Ka,Bn.defaultTo=function(t,e){return null==t||t!=t?e:t},Bn.divide=bu,Bn.endsWith=function(t,e,n){t=_a(t),e=li(e);var i=t.length,s=n=n===r?i:ur(ma(n),0,i);return(n-=e.length)>=0&&t.slice(n,s)==e},Bn.eq=qo,Bn.escape=function(t){return(t=_a(t))&&Y.test(t)?t.replace(W,on):t},Bn.escapeRegExp=function(t){return(t=_a(t))&&it.test(t)?t.replace(rt,"\\$&"):t},Bn.every=function(t,e,n){var i=Go(t)?ke:gr;return n&&_s(t,e,n)&&(e=r),i(t,cs(e,3))},Bn.find=vo,Bn.findIndex=zs,Bn.findKey=function(t,e){return je(t,cs(e,3),br)},Bn.findLast=wo,Bn.findLastIndex=Ks,Bn.findLastKey=function(t,e){return je(t,cs(e,3),Er)},Bn.floor=Eu,Bn.forEach=_o,Bn.forEachRight=bo,Bn.forIn=function(t,e){return null==t?t:wr(t,cs(e,3),Oa)},Bn.forInRight=function(t,e){return null==t?t:_r(t,cs(e,3),Oa)},Bn.forOwn=function(t,e){return t&&br(t,cs(e,3))},Bn.forOwnRight=function(t,e){return t&&Er(t,cs(e,3))},Bn.get=Da,Bn.gt=$o,Bn.gte=zo,Bn.has=function(t,e){return null!=t&&ms(t,e,Dr)},Bn.hasIn=Na,Bn.head=Hs,Bn.identity=su,Bn.includes=function(t,e,n,r){t=Wo(t)?t:qa(t),n=n&&!r?ma(n):0;var i=t.length;return n<0&&(n=wn(i+n,0)),ca(t)?n<=i&&t.indexOf(e,n)>-1:!!i&&qe(t,e,n)>-1},Bn.indexOf=function(t,e,n){var r=null==t?0:t.length;if(!r)return-1;var i=null==n?0:ma(n);return i<0&&(i=wn(r+i,0)),qe(t,e,i)},Bn.inRange=function(t,e,n){return e=ga(e),n===r?(n=e,e=0):n=ga(n),function(t,e,n){return t>=_n(e,n)&&t<wn(e,n)}(t=va(t),e,n)},Bn.invoke=Ra,Bn.isArguments=Ko,Bn.isArray=Go,Bn.isArrayBuffer=Ho,Bn.isArrayLike=Wo,Bn.isArrayLikeObject=Qo,Bn.isBoolean=function(t){return!0===t||!1===t||ra(t)&&Sr(t)==w},Bn.isBuffer=Yo,Bn.isDate=Xo,Bn.isElement=function(t){return ra(t)&&1===t.nodeType&&!oa(t)},Bn.isEmpty=function(t){if(null==t)return!0;if(Wo(t)&&(Go(t)||"string"==typeof t||"function"==typeof t.splice||Yo(t)||ha(t)||Ko(t)))return!t.length;var e=gs(t);if(e==I||e==N)return!t.size;if(Is(t))return!Fr(t).length;for(var n in t)if(Vt.call(t,n))return!1;return!0},Bn.isEqual=function(t,e){return Lr(t,e)},Bn.isEqualWith=function(t,e,n){var i=(n="function"==typeof n?n:r)?n(t,e):r;return i===r?Lr(t,e,r,n):!!i},Bn.isError=Jo,Bn.isFinite=function(t){return"number"==typeof t&&Ue(t)},Bn.isFunction=Zo,Bn.isInteger=ta,Bn.isLength=ea,Bn.isMap=ia,Bn.isMatch=function(t,e){return t===e||Or(t,e,hs(e))},Bn.isMatchWith=function(t,e,n){return n="function"==typeof n?n:r,Or(t,e,hs(e),n)},Bn.isNaN=function(t){return sa(t)&&t!=+t},Bn.isNative=function(t){if(Ts(t))throw new It("Unsupported core-js use. Try https://npms.io/search?q=ponyfill.");return Mr(t)},Bn.isNil=function(t){return null==t},Bn.isNull=function(t){return null===t},Bn.isNumber=sa,Bn.isObject=na,Bn.isObjectLike=ra,Bn.isPlainObject=oa,Bn.isRegExp=aa,Bn.isSafeInteger=function(t){return ta(t)&&t>=-9007199254740991&&t<=d},Bn.isSet=ua,Bn.isString=ca,Bn.isSymbol=la,Bn.isTypedArray=ha,Bn.isUndefined=function(t){return t===r},Bn.isWeakMap=function(t){return ra(t)&&gs(t)==R},Bn.isWeakSet=function(t){return ra(t)&&"[object WeakSet]"==Sr(t)},Bn.join=function(t,e){return null==t?"":He.call(t,e)},Bn.kebabCase=Ga,Bn.last=Xs,Bn.lastIndexOf=function(t,e,n){var i=null==t?0:t.length;if(!i)return-1;var s=i;return n!==r&&(s=(s=ma(n))<0?wn(i+s,0):_n(s,i-1)),e==e?function(t,e,n){for(var r=n+1;r--;)if(t[r]===e)return r;return r}(t,e,s):Be(t,ze,s,!0)},Bn.lowerCase=Ha,Bn.lowerFirst=Wa,Bn.lt=fa,Bn.lte=da,Bn.max=function(t){return t&&t.length?mr(t,su,Ar):r},Bn.maxBy=function(t,e){return t&&t.length?mr(t,cs(e,2),Ar):r},Bn.mean=function(t){return Ke(t,su)},Bn.meanBy=function(t,e){return Ke(t,cs(e,2))},Bn.min=function(t){return t&&t.length?mr(t,su,Ur):r},Bn.minBy=function(t,e){return t&&t.length?mr(t,cs(e,2),Ur):r},Bn.stubArray=yu,Bn.stubFalse=vu,Bn.stubObject=function(){return{}},Bn.stubString=function(){return""},Bn.stubTrue=function(){return!0},Bn.multiply=Iu,Bn.nth=function(t,e){return t&&t.length?zr(t,ma(e)):r},Bn.noConflict=function(){return pe._===this&&(pe._=Bt),this},Bn.noop=lu,Bn.now=Do,Bn.pad=function(t,e,n){t=_a(t);var r=(e=ma(e))?dn(t):0;if(!e||r>=e)return t;var i=(e-r)/2;return Ki(me(i),n)+t+Ki(ge(i),n)},Bn.padEnd=function(t,e,n){t=_a(t);var r=(e=ma(e))?dn(t):0;return e&&r<e?t+Ki(e-r,n):t},Bn.padStart=function(t,e,n){t=_a(t);var r=(e=ma(e))?dn(t):0;return e&&r<e?Ki(e-r,n)+t:t},Bn.parseInt=function(t,e,n){return n||null==e?e=0:e&&(e=+e),En(_a(t).replace(st,""),e||0)},Bn.random=function(t,e,n){if(n&&"boolean"!=typeof n&&_s(t,e,n)&&(e=n=r),n===r&&("boolean"==typeof e?(n=e,e=r):"boolean"==typeof t&&(n=t,t=r)),t===r&&e===r?(t=0,e=1):(t=ga(t),e===r?(e=t,t=0):e=ga(e)),t>e){var i=t;t=e,e=i}if(n||t%1||e%1){var s=Tn();return _n(t+s*(e-t+le("1e-"+((s+"").length-1))),e)}return Qr(t,e)},Bn.reduce=function(t,e,n){var r=Go(t)?Ve:We,i=arguments.length<3;return r(t,cs(e,4),n,i,dr)},Bn.reduceRight=function(t,e,n){var r=Go(t)?Fe:We,i=arguments.length<3;return r(t,cs(e,4),n,i,pr)},Bn.repeat=function(t,e,n){return e=(n?_s(t,e,n):e===r)?1:ma(e),Yr(_a(t),e)},Bn.replace=function(){var t=arguments,e=_a(t[0]);return t.length<3?e:e.replace(t[1],t[2])},Bn.result=function(t,e,n){var i=-1,s=(e=_i(e,t)).length;for(s||(s=1,t=r);++i<s;){var o=null==t?r:t[Ps(e[i])];o===r&&(i=s,o=n),t=Zo(o)?o.call(t):o}return t},Bn.round=Cu,Bn.runInContext=t,Bn.sample=function(t){return(Go(t)?Jn:Jr)(t)},Bn.size=function(t){if(null==t)return 0;if(Wo(t))return ca(t)?dn(t):t.length;var e=gs(t);return e==I||e==N?t.size:Fr(t).length},Bn.snakeCase=Qa,Bn.some=function(t,e,n){var i=Go(t)?Pe:si;return n&&_s(t,e,n)&&(e=r),i(t,cs(e,3))},Bn.sortedIndex=function(t,e){return oi(t,e)},Bn.sortedIndexBy=function(t,e,n){return ai(t,e,cs(n,2))},Bn.sortedIndexOf=function(t,e){var n=null==t?0:t.length;if(n){var r=oi(t,e);if(r<n&&qo(t[r],e))return r}return-1},Bn.sortedLastIndex=function(t,e){return oi(t,e,!0)},Bn.sortedLastIndexBy=function(t,e,n){return ai(t,e,cs(n,2),!0)},Bn.sortedLastIndexOf=function(t,e){if(null==t?0:t.length){var n=oi(t,e,!0)-1;if(qo(t[n],e))return n}return-1},Bn.startCase=Ya,Bn.startsWith=function(t,e,n){return t=_a(t),n=null==n?0:ur(ma(n),0,t.length),e=li(e),t.slice(n,n+e.length)==e},Bn.subtract=Su,Bn.sum=function(t){return t&&t.length?Qe(t,su):0},Bn.sumBy=function(t,e){return t&&t.length?Qe(t,cs(e,2)):0},Bn.template=function(t,e,n){var i=Bn.templateSettings;n&&_s(t,e,n)&&(e=r),t=_a(t),e=Ta({},e,i,Zi);var s,o,a=Ta({},e.imports,i.imports,Zi),u=La(a),c=Ze(a,u),l=0,h=e.interpolate||bt,f="__p += '",d=Dt((e.escape||bt).source+"|"+h.source+"|"+(h===Z?dt:bt).source+"|"+(e.evaluate||bt).source+"|$","g"),p="//# sourceURL="+(Vt.call(e,"sourceURL")?(e.sourceURL+"").replace(/\s/g," "):"lodash.templateSources["+ ++oe+"]")+"\n";t.replace(d,(function(e,n,r,i,a,u){return r||(r=i),f+=t.slice(l,u).replace(Et,an),n&&(s=!0,f+="' +\n__e("+n+") +\n'"),a&&(o=!0,f+="';\n"+a+";\n__p += '"),r&&(f+="' +\n((__t = ("+r+")) == null ? '' : __t) +\n'"),l=u+e.length,e})),f+="';\n";var g=Vt.call(e,"variable")&&e.variable;if(g){if(ht.test(g))throw new It("Invalid `variable` option passed into `_.template`")}else f="with (obj) {\n"+f+"\n}\n";f=(o?f.replace(z,""):f).replace(K,"$1").replace(G,"$1;"),f="function("+(g||"obj")+") {\n"+(g?"":"obj || (obj = {});\n")+"var __t, __p = ''"+(s?", __e = _.escape":"")+(o?", __j = Array.prototype.join;\nfunction print() { __p += __j.call(arguments, '') }\n":";\n")+f+"return __p\n}";var m=tu((function(){return Ct(u,p+"return "+f).apply(r,c)}));if(m.source=f,Jo(m))throw m;return m},Bn.times=function(t,e){if((t=ma(t))<1||t>d)return[];var n=g,r=_n(t,g);e=cs(e),t-=g;for(var i=Ye(r,e);++n<t;)e(n);return i},Bn.toFinite=ga,Bn.toInteger=ma,Bn.toLength=ya,Bn.toLower=function(t){return _a(t).toLowerCase()},Bn.toNumber=va,Bn.toSafeInteger=function(t){return t?ur(ma(t),-9007199254740991,d):0===t?t:0},Bn.toString=_a,Bn.toUpper=function(t){return _a(t).toUpperCase()},Bn.trim=function(t,e,n){if((t=_a(t))&&(n||e===r))return Xe(t);if(!t||!(e=li(e)))return t;var i=pn(t),s=pn(e);return Ei(i,en(i,s),nn(i,s)+1).join("")},Bn.trimEnd=function(t,e,n){if((t=_a(t))&&(n||e===r))return t.slice(0,gn(t)+1);if(!t||!(e=li(e)))return t;var i=pn(t);return Ei(i,0,nn(i,pn(e))+1).join("")},Bn.trimStart=function(t,e,n){if((t=_a(t))&&(n||e===r))return t.replace(st,"");if(!t||!(e=li(e)))return t;var i=pn(t);return Ei(i,en(i,pn(e))).join("")},Bn.truncate=function(t,e){var n=30,i="...";if(na(e)){var s="separator"in e?e.separator:s;n="length"in e?ma(e.length):n,i="omission"in e?li(e.omission):i}var o=(t=_a(t)).length;if(un(t)){var a=pn(t);o=a.length}if(n>=o)return t;var u=n-dn(i);if(u<1)return i;var c=a?Ei(a,0,u).join(""):t.slice(0,u);if(s===r)return c+i;if(a&&(u+=c.length-u),aa(s)){if(t.slice(u).search(s)){var l,h=c;for(s.global||(s=Dt(s.source,_a(pt.exec(s))+"g")),s.lastIndex=0;l=s.exec(h);)var f=l.index;c=c.slice(0,f===r?u:f)}}else if(t.indexOf(li(s),u)!=u){var d=c.lastIndexOf(s);d>-1&&(c=c.slice(0,d))}return c+i},Bn.unescape=function(t){return(t=_a(t))&&Q.test(t)?t.replace(H,mn):t},Bn.uniqueId=function(t){var e=++Ft;return _a(t)+e},Bn.upperCase=Xa,Bn.upperFirst=Ja,Bn.each=_o,Bn.eachRight=bo,Bn.first=Hs,cu(Bn,(Tu={},br(Bn,(function(t,e){Vt.call(Bn.prototype,e)||(Tu[e]=t)})),Tu),{chain:!1}),Bn.VERSION="4.17.21",De(["bind","bindKey","curry","curryRight","partial","partialRight"],(function(t){Bn[t].placeholder=Bn})),De(["drop","take"],(function(t,e){Kn.prototype[t]=function(n){n=n===r?1:wn(ma(n),0);var i=this.__filtered__&&!e?new Kn(this):this.clone();return i.__filtered__?i.__takeCount__=_n(n,i.__takeCount__):i.__views__.push({size:_n(n,g),type:t+(i.__dir__<0?"Right":"")}),i},Kn.prototype[t+"Right"]=function(e){return this.reverse()[t](e).reverse()}})),De(["filter","map","takeWhile"],(function(t,e){var n=e+1,r=1==n||3==n;Kn.prototype[t]=function(t){var e=this.clone();return e.__iteratees__.push({iteratee:cs(t,3),type:n}),e.__filtered__=e.__filtered__||r,e}})),De(["head","last"],(function(t,e){var n="take"+(e?"Right":"");Kn.prototype[t]=function(){return this[n](1).value()[0]}})),De(["initial","tail"],(function(t,e){var n="drop"+(e?"":"Right");Kn.prototype[t]=function(){return this.__filtered__?new Kn(this):this[n](1)}})),Kn.prototype.compact=function(){return this.filter(su)},Kn.prototype.find=function(t){return this.filter(t).head()},Kn.prototype.findLast=function(t){return this.reverse().find(t)},Kn.prototype.invokeMap=Xr((function(t,e){return"function"==typeof t?new Kn(this):this.map((function(n){return xr(n,t,e)}))})),Kn.prototype.reject=function(t){return this.filter(Fo(cs(t)))},Kn.prototype.slice=function(t,e){t=ma(t);var n=this;return n.__filtered__&&(t>0||e<0)?new Kn(n):(t<0?n=n.takeRight(-t):t&&(n=n.drop(t)),e!==r&&(n=(e=ma(e))<0?n.dropRight(-e):n.take(e-t)),n)},Kn.prototype.takeRightWhile=function(t){return this.reverse().takeWhile(t).reverse()},Kn.prototype.toArray=function(){return this.take(g)},br(Kn.prototype,(function(t,e){var n=/^(?:filter|find|map|reject)|While$/.test(e),i=/^(?:head|last)$/.test(e),s=Bn[i?"take"+("last"==e?"Right":""):e],o=i||/^find/.test(e);s&&(Bn.prototype[e]=function(){var e=this.__wrapped__,a=i?[1]:arguments,u=e instanceof Kn,c=a[0],l=u||Go(e),h=function(t){var e=s.apply(Bn,Me([t],a));return i&&f?e[0]:e};l&&n&&"function"==typeof c&&1!=c.length&&(u=l=!1);var f=this.__chain__,d=!!this.__actions__.length,p=o&&!f,g=u&&!d;if(!o&&l){e=g?e:new Kn(this);var m=t.apply(e,a);return m.__actions__.push({func:go,args:[h],thisArg:r}),new zn(m,f)}return p&&g?t.apply(this,a):(m=this.thru(h),p?i?m.value()[0]:m.value():m)})})),De(["pop","push","shift","sort","splice","unshift"],(function(t){var e=xt[t],n=/^(?:push|sort|unshift)$/.test(t)?"tap":"thru",r=/^(?:pop|shift)$/.test(t);Bn.prototype[t]=function(){var t=arguments;if(r&&!this.__chain__){var i=this.value();return e.apply(Go(i)?i:[],t)}return this[n]((function(n){return e.apply(Go(n)?n:[],t)}))}})),br(Kn.prototype,(function(t,e){var n=Bn[e];if(n){var r=n.name+"";Vt.call(Rn,r)||(Rn[r]=[]),Rn[r].push({name:e,func:n})}})),Rn[Bi(r,2).name]=[{name:"wrapper",func:r}],Kn.prototype.clone=function(){var t=new Kn(this.__wrapped__);return t.__actions__=ki(this.__actions__),t.__dir__=this.__dir__,t.__filtered__=this.__filtered__,t.__iteratees__=ki(this.__iteratees__),t.__takeCount__=this.__takeCount__,t.__views__=ki(this.__views__),t},Kn.prototype.reverse=function(){if(this.__filtered__){var t=new Kn(this);t.__dir__=-1,t.__filtered__=!0}else(t=this.clone()).__dir__*=-1;return t},Kn.prototype.value=function(){var t=this.__wrapped__.value(),e=this.__dir__,n=Go(t),r=e<0,i=n?t.length:0,s=function(t,e,n){var r=-1,i=n.length;for(;++r<i;){var s=n[r],o=s.size;switch(s.type){case"drop":t+=o;break;case"dropRight":e-=o;break;case"take":e=_n(e,t+o);break;case"takeRight":t=wn(t,e-o)}}return{start:t,end:e}}(0,i,this.__views__),o=s.start,a=s.end,u=a-o,c=r?a:o-1,l=this.__iteratees__,h=l.length,f=0,d=_n(u,this.__takeCount__);if(!n||!r&&i==u&&d==u)return gi(t,this.__actions__);var p=[];t:for(;u--&&f<d;){for(var g=-1,m=t[c+=e];++g<h;){var y=l[g],v=y.iteratee,w=y.type,_=v(m);if(2==w)m=_;else if(!_){if(1==w)continue t;break t}}p[f++]=m}return p},Bn.prototype.at=mo,Bn.prototype.chain=function(){return po(this)},Bn.prototype.commit=function(){return new zn(this.value(),this.__chain__)},Bn.prototype.next=function(){this.__values__===r&&(this.__values__=pa(this.value()));var t=this.__index__>=this.__values__.length;return{done:t,value:t?r:this.__values__[this.__index__++]}},Bn.prototype.plant=function(t){for(var e,n=this;n instanceof $n;){var i=js(n);i.__index__=0,i.__values__=r,e?s.__wrapped__=i:e=i;var s=i;n=n.__wrapped__}return s.__wrapped__=t,e},Bn.prototype.reverse=function(){var t=this.__wrapped__;if(t instanceof Kn){var e=t;return this.__actions__.length&&(e=new Kn(this)),(e=e.reverse()).__actions__.push({func:go,args:[eo],thisArg:r}),new zn(e,this.__chain__)}return this.thru(eo)},Bn.prototype.toJSON=Bn.prototype.valueOf=Bn.prototype.value=function(){return gi(this.__wrapped__,this.__actions__)},Bn.prototype.first=Bn.prototype.head,Jt&&(Bn.prototype[Jt]=function(){return this}),Bn}();"function"==typeof define&&"object"==typeof define.amd&&define.amd?(pe._=yn,define((function(){return yn}))):me?((me.exports=yn)._=yn,ge._=yn):pe._=yn}).call(this)}));
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
var i,s,o,a=i={};function u(){throw new Error("setTimeout has not been defined")}function c(){throw new Error("clearTimeout has not been defined")}function l(t){if(s===setTimeout)return setTimeout(t,0);if((s===u||!s)&&setTimeout)return s=setTimeout,setTimeout(t,0);try{return s(t,0)}catch(e){try{return s.call(null,t,0)}catch(e){return s.call(this,t,0)}}}!function(){try{s="function"==typeof setTimeout?setTimeout:u}catch(t){s=u}try{o="function"==typeof clearTimeout?clearTimeout:c}catch(t){o=c}}();var h,f=[],d=!1,p=-1;function g(){d&&h&&(d=!1,h.length?f=h.concat(f):p=-1,f.length&&m())}function m(){if(!d){var t=l(g);d=!0;for(var e=f.length;e;){for(h=f,f=[];++p<e;)h&&h[p].run();p=-1,e=f.length}h=null,d=!1,function(t){if(o===clearTimeout)return clearTimeout(t);if((o===c||!o)&&clearTimeout)return o=clearTimeout,clearTimeout(t);try{o(t)}catch(e){try{return o.call(null,t)}catch(e){return o.call(this,t)}}}(t)}}function y(t,e){this.fun=t,this.array=e}function v(){}a.nextTick=function(t){var e=new Array(arguments.length-1);if(arguments.length>1)for(var n=1;n<arguments.length;n++)e[n-1]=arguments[n];f.push(new y(t,e)),1!==f.length||d||l(m)},y.prototype.run=function(){this.fun.apply(null,this.array)},a.title="browser",a.browser=!0,a.env={},a.argv=[],a.version="",a.versions={},a.on=v,a.addListener=v,a.once=v,a.off=v,a.removeListener=v,a.removeAllListeners=v,a.emit=v,a.prependListener=v,a.prependOnceListener=v,a.listeners=function(t){return[]},a.binding=function(t){throw new Error("process.binding is not supported")},a.cwd=function(){return"/"},a.chdir=function(t){throw new Error("process.chdir is not supported")},a.umask=function(){return 0};const w=function(t){const e=[];let n=0;for(let r=0;r<t.length;r++){let i=t.charCodeAt(r);i<128?e[n++]=i:i<2048?(e[n++]=i>>6|192,e[n++]=63&i|128):55296==(64512&i)&&r+1<t.length&&56320==(64512&t.charCodeAt(r+1))?(i=65536+((1023&i)<<10)+(1023&t.charCodeAt(++r)),e[n++]=i>>18|240,e[n++]=i>>12&63|128,e[n++]=i>>6&63|128,e[n++]=63&i|128):(e[n++]=i>>12|224,e[n++]=i>>6&63|128,e[n++]=63&i|128)}return e},_={byteToCharMap_:null,charToByteMap_:null,byteToCharMapWebSafe_:null,charToByteMapWebSafe_:null,ENCODED_VALS_BASE:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",get ENCODED_VALS(){return this.ENCODED_VALS_BASE+"+/="},get ENCODED_VALS_WEBSAFE(){return this.ENCODED_VALS_BASE+"-_."},HAS_NATIVE_SUPPORT:"function"==typeof atob,encodeByteArray(t,e){if(!Array.isArray(t))throw Error("encodeByteArray takes an array as a parameter");this.init_();const n=e?this.byteToCharMapWebSafe_:this.byteToCharMap_,r=[];for(let e=0;e<t.length;e+=3){const i=t[e],s=e+1<t.length,o=s?t[e+1]:0,a=e+2<t.length,u=a?t[e+2]:0,c=i>>2,l=(3&i)<<4|o>>4;let h=(15&o)<<2|u>>6,f=63&u;a||(f=64,s||(h=64)),r.push(n[c],n[l],n[h],n[f])}return r.join("")},encodeString(t,e){return this.HAS_NATIVE_SUPPORT&&!e?btoa(t):this.encodeByteArray(w(t),e)},decodeString(t,e){return this.HAS_NATIVE_SUPPORT&&!e?atob(t):function(t){const e=[];let n=0,r=0;for(;n<t.length;){const i=t[n++];if(i<128)e[r++]=String.fromCharCode(i);else if(i>191&&i<224){const s=t[n++];e[r++]=String.fromCharCode((31&i)<<6|63&s)}else if(i>239&&i<365){const s=((7&i)<<18|(63&t[n++])<<12|(63&t[n++])<<6|63&t[n++])-65536;e[r++]=String.fromCharCode(55296+(s>>10)),e[r++]=String.fromCharCode(56320+(1023&s))}else{const s=t[n++],o=t[n++];e[r++]=String.fromCharCode((15&i)<<12|(63&s)<<6|63&o)}}return e.join("")}(this.decodeStringToByteArray(t,e))},decodeStringToByteArray(t,e){this.init_();const n=e?this.charToByteMapWebSafe_:this.charToByteMap_,r=[];for(let e=0;e<t.length;){const i=n[t.charAt(e++)],s=e<t.length?n[t.charAt(e)]:0;++e;const o=e<t.length?n[t.charAt(e)]:64;++e;const a=e<t.length?n[t.charAt(e)]:64;if(++e,null==i||null==s||null==o||null==a)throw Error();const u=i<<2|s>>4;if(r.push(u),64!==o){const t=s<<4&240|o>>2;if(r.push(t),64!==a){const t=o<<6&192|a;r.push(t)}}}return r},init_(){if(!this.byteToCharMap_){this.byteToCharMap_={},this.charToByteMap_={},this.byteToCharMapWebSafe_={},this.charToByteMapWebSafe_={};for(let t=0;t<this.ENCODED_VALS.length;t++)this.byteToCharMap_[t]=this.ENCODED_VALS.charAt(t),this.charToByteMap_[this.byteToCharMap_[t]]=t,this.byteToCharMapWebSafe_[t]=this.ENCODED_VALS_WEBSAFE.charAt(t),this.charToByteMapWebSafe_[this.byteToCharMapWebSafe_[t]]=t,t>=this.ENCODED_VALS_BASE.length&&(this.charToByteMap_[this.ENCODED_VALS_WEBSAFE.charAt(t)]=t,this.charToByteMapWebSafe_[this.ENCODED_VALS.charAt(t)]=t)}}},b=function(t){return function(t){const e=w(t);return _.encodeByteArray(e,!0)}(t).replace(/\./g,"")},E=function(t){try{return _.decodeString(t,!0)}catch(t){console.error("base64Decode failed: ",t)}return null};
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function T(){try{return"object"==typeof indexedDB}catch(t){return!1}}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const I=()=>function(){if("undefined"!=typeof self)return self;if("undefined"!=typeof window)return window;if(void 0!==t)return t;throw new Error("Unable to locate global object.")}().__FIREBASE_DEFAULTS__,C=()=>{try{return I()||(()=>{if(void 0===i||void 0===i.env)return})()||(()=>{if("undefined"==typeof document)return;let t;try{t=document.cookie.match(/__FIREBASE_DEFAULTS__=([^;]+)/)}catch(t){return}const e=t&&E(t[1]);return e&&JSON.parse(e)})()}catch(t){return void console.info(`Unable to get __FIREBASE_DEFAULTS__ due to: ${t}`)}},S=t=>{const e=(t=>{var e,n;return null===(n=null===(e=C())||void 0===e?void 0:e.emulatorHosts)||void 0===n?void 0:n[t]})(t);if(!e)return;const n=e.lastIndexOf(":");if(n<=0||n+1===e.length)throw new Error(`Invalid host ${e} with no separate hostname and port!`);const r=parseInt(e.substring(n+1),10);return"["===e[0]?[e.substring(1,n-1),r]:[e.substring(0,n),r]};
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class A{constructor(){this.reject=()=>{},this.resolve=()=>{},this.promise=new Promise(((t,e)=>{this.resolve=t,this.reject=e}))}wrapCallback(t){return(e,n)=>{e?this.reject(e):this.resolve(n),"function"==typeof t&&(this.promise.catch((()=>{})),1===t.length?t(e):t(e,n))}}}
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function D(t,e){if(t.uid)throw new Error('The "uid" field is no longer supported by mockUserToken. Please use "sub" instead for Firebase Auth User ID.');const n=e||"demo-project",r=t.iat||0,i=t.sub||t.user_id;if(!i)throw new Error("mockUserToken must contain 'sub' or 'user_id' field!");const s=Object.assign({iss:`https://securetoken.google.com/${n}`,aud:n,iat:r,exp:r+3600,auth_time:r,sub:i,user_id:i,firebase:{sign_in_provider:"custom",identities:{}}},t);return[b(JSON.stringify({alg:"none",type:"JWT"})),b(JSON.stringify(s)),""].join(".")}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class N extends Error{constructor(t,e,n){super(e),this.code=t,this.customData=n,this.name="FirebaseError",Object.setPrototypeOf(this,N.prototype),Error.captureStackTrace&&Error.captureStackTrace(this,k.prototype.create)}}class k{constructor(t,e,n){this.service=t,this.serviceName=e,this.errors=n}create(t,...e){const n=e[0]||{},r=`${this.service}/${t}`,i=this.errors[t],s=i?function(t,e){return t.replace(x,((t,n)=>{const r=e[n];return null!=r?String(r):`<${n}?>`}))}(i,n):"Error",o=`${this.serviceName}: ${s} (${r}).`;return new N(r,o,n)}}const x=/\{\$([^}]+)}/g;
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function R(t,e){if(t===e)return!0;const n=Object.keys(t),r=Object.keys(e);for(const i of n){if(!r.includes(i))return!1;const n=t[i],s=e[i];if(L(n)&&L(s)){if(!R(n,s))return!1}else if(n!==s)return!1}for(const t of r)if(!n.includes(t))return!1;return!0}function L(t){return null!==t&&"object"==typeof t}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
function O(t){return t&&t._delegate?t._delegate:t}class M{constructor(t,e,n){this.name=t,this.instanceFactory=e,this.type=n,this.multipleInstances=!1,this.serviceProps={},this.instantiationMode="LAZY",this.onInstanceCreated=null}setInstantiationMode(t){return this.instantiationMode=t,this}setMultipleInstances(t){return this.multipleInstances=t,this}setServiceProps(t){return this.serviceProps=t,this}setInstanceCreatedCallback(t){return this.onInstanceCreated=t,this}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const V="[DEFAULT]";
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class F{constructor(t,e){this.name=t,this.container=e,this.component=null,this.instances=new Map,this.instancesDeferred=new Map,this.instancesOptions=new Map,this.onInitCallbacks=new Map}get(t){const e=this.normalizeInstanceIdentifier(t);if(!this.instancesDeferred.has(e)){const t=new A;if(this.instancesDeferred.set(e,t),this.isInitialized(e)||this.shouldAutoInitialize())try{const n=this.getOrInitializeService({instanceIdentifier:e});n&&t.resolve(n)}catch(t){}}return this.instancesDeferred.get(e).promise}getImmediate(t){var e;const n=this.normalizeInstanceIdentifier(null==t?void 0:t.identifier),r=null!==(e=null==t?void 0:t.optional)&&void 0!==e&&e;if(!this.isInitialized(n)&&!this.shouldAutoInitialize()){if(r)return null;throw Error(`Service ${this.name} is not available`)}try{return this.getOrInitializeService({instanceIdentifier:n})}catch(t){if(r)return null;throw t}}getComponent(){return this.component}setComponent(t){if(t.name!==this.name)throw Error(`Mismatching Component ${t.name} for Provider ${this.name}.`);if(this.component)throw Error(`Component for ${this.name} has already been provided`);if(this.component=t,this.shouldAutoInitialize()){if(function(t){return"EAGER"===t.instantiationMode}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */(t))try{this.getOrInitializeService({instanceIdentifier:V})}catch(t){}for(const[t,e]of this.instancesDeferred.entries()){const n=this.normalizeInstanceIdentifier(t);try{const t=this.getOrInitializeService({instanceIdentifier:n});e.resolve(t)}catch(t){}}}}clearInstance(t=V){this.instancesDeferred.delete(t),this.instancesOptions.delete(t),this.instances.delete(t)}async delete(){const t=Array.from(this.instances.values());await Promise.all([...t.filter((t=>"INTERNAL"in t)).map((t=>t.INTERNAL.delete())),...t.filter((t=>"_delete"in t)).map((t=>t._delete()))])}isComponentSet(){return null!=this.component}isInitialized(t=V){return this.instances.has(t)}getOptions(t=V){return this.instancesOptions.get(t)||{}}initialize(t={}){const{options:e={}}=t,n=this.normalizeInstanceIdentifier(t.instanceIdentifier);if(this.isInitialized(n))throw Error(`${this.name}(${n}) has already been initialized`);if(!this.isComponentSet())throw Error(`Component ${this.name} has not been registered yet`);const r=this.getOrInitializeService({instanceIdentifier:n,options:e});for(const[t,e]of this.instancesDeferred.entries()){n===this.normalizeInstanceIdentifier(t)&&e.resolve(r)}return r}onInit(t,e){var n;const r=this.normalizeInstanceIdentifier(e),i=null!==(n=this.onInitCallbacks.get(r))&&void 0!==n?n:new Set;i.add(t),this.onInitCallbacks.set(r,i);const s=this.instances.get(r);return s&&t(s,r),()=>{i.delete(t)}}invokeOnInitCallbacks(t,e){const n=this.onInitCallbacks.get(e);if(n)for(const r of n)try{r(t,e)}catch(t){}}getOrInitializeService({instanceIdentifier:t,options:e={}}){let n=this.instances.get(t);if(!n&&this.component&&(n=this.component.instanceFactory(this.container,{instanceIdentifier:(r=t,r===V?void 0:r),options:e}),this.instances.set(t,n),this.instancesOptions.set(t,e),this.invokeOnInitCallbacks(n,t),this.component.onInstanceCreated))try{this.component.onInstanceCreated(this.container,t,n)}catch(t){}var r;return n||null}normalizeInstanceIdentifier(t=V){return this.component?this.component.multipleInstances?t:V:t}shouldAutoInitialize(){return!!this.component&&"EXPLICIT"!==this.component.instantiationMode}}class P{constructor(t){this.name=t,this.providers=new Map}addComponent(t){const e=this.getProvider(t.name);if(e.isComponentSet())throw new Error(`Component ${t.name} has already been registered with ${this.name}`);e.setComponent(t)}addOrOverwriteComponent(t){this.getProvider(t.name).isComponentSet()&&this.providers.delete(t.name),this.addComponent(t)}getProvider(t){if(this.providers.has(t))return this.providers.get(t);const e=new F(t,this);return this.providers.set(t,e),e}getProviders(){return Array.from(this.providers.values())}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const U=[];var j,B;(B=j||(j={}))[B.DEBUG=0]="DEBUG",B[B.VERBOSE=1]="VERBOSE",B[B.INFO=2]="INFO",B[B.WARN=3]="WARN",B[B.ERROR=4]="ERROR",B[B.SILENT=5]="SILENT";const q={debug:j.DEBUG,verbose:j.VERBOSE,info:j.INFO,warn:j.WARN,error:j.ERROR,silent:j.SILENT},$=j.INFO,z={[j.DEBUG]:"log",[j.VERBOSE]:"log",[j.INFO]:"info",[j.WARN]:"warn",[j.ERROR]:"error"},K=(t,e,...n)=>{if(e<t.logLevel)return;const r=(new Date).toISOString(),i=z[e];if(!i)throw new Error(`Attempted to log a message with an invalid logType (value: ${e})`);console[i](`[${r}]  ${t.name}:`,...n)};class G{constructor(t){this.name=t,this._logLevel=$,this._logHandler=K,this._userLogHandler=null,U.push(this)}get logLevel(){return this._logLevel}set logLevel(t){if(!(t in j))throw new TypeError(`Invalid value "${t}" assigned to \`logLevel\``);this._logLevel=t}setLogLevel(t){this._logLevel="string"==typeof t?q[t]:t}get logHandler(){return this._logHandler}set logHandler(t){if("function"!=typeof t)throw new TypeError("Value assigned to `logHandler` must be a function");this._logHandler=t}get userLogHandler(){return this._userLogHandler}set userLogHandler(t){this._userLogHandler=t}debug(...t){this._userLogHandler&&this._userLogHandler(this,j.DEBUG,...t),this._logHandler(this,j.DEBUG,...t)}log(...t){this._userLogHandler&&this._userLogHandler(this,j.VERBOSE,...t),this._logHandler(this,j.VERBOSE,...t)}info(...t){this._userLogHandler&&this._userLogHandler(this,j.INFO,...t),this._logHandler(this,j.INFO,...t)}warn(...t){this._userLogHandler&&this._userLogHandler(this,j.WARN,...t),this._logHandler(this,j.WARN,...t)}error(...t){this._userLogHandler&&this._userLogHandler(this,j.ERROR,...t),this._logHandler(this,j.ERROR,...t)}}let H,W;const Q=new WeakMap,Y=new WeakMap,X=new WeakMap,J=new WeakMap,Z=new WeakMap;let tt={get(t,e,n){if(t instanceof IDBTransaction){if("done"===e)return Y.get(t);if("objectStoreNames"===e)return t.objectStoreNames||X.get(t);if("store"===e)return n.objectStoreNames[1]?void 0:n.objectStore(n.objectStoreNames[0])}return rt(t[e])},set:(t,e,n)=>(t[e]=n,!0),has:(t,e)=>t instanceof IDBTransaction&&("done"===e||"store"===e)||e in t};function et(t){return t!==IDBDatabase.prototype.transaction||"objectStoreNames"in IDBTransaction.prototype?(W||(W=[IDBCursor.prototype.advance,IDBCursor.prototype.continue,IDBCursor.prototype.continuePrimaryKey])).includes(t)?function(...e){return t.apply(it(this),e),rt(Q.get(this))}:function(...e){return rt(t.apply(it(this),e))}:function(e,...n){const r=t.call(it(this),e,...n);return X.set(r,e.sort?e.sort():[e]),rt(r)}}function nt(t){return"function"==typeof t?et(t):(t instanceof IDBTransaction&&function(t){if(Y.has(t))return;const e=new Promise(((e,n)=>{const r=()=>{t.removeEventListener("complete",i),t.removeEventListener("error",s),t.removeEventListener("abort",s)},i=()=>{e(),r()},s=()=>{n(t.error||new DOMException("AbortError","AbortError")),r()};t.addEventListener("complete",i),t.addEventListener("error",s),t.addEventListener("abort",s)}));Y.set(t,e)}(t),e=t,(H||(H=[IDBDatabase,IDBObjectStore,IDBIndex,IDBCursor,IDBTransaction])).some((t=>e instanceof t))?new Proxy(t,tt):t);var e}function rt(t){if(t instanceof IDBRequest)return function(t){const e=new Promise(((e,n)=>{const r=()=>{t.removeEventListener("success",i),t.removeEventListener("error",s)},i=()=>{e(rt(t.result)),r()},s=()=>{n(t.error),r()};t.addEventListener("success",i),t.addEventListener("error",s)}));return e.then((e=>{e instanceof IDBCursor&&Q.set(e,t)})).catch((()=>{})),Z.set(e,t),e}(t);if(J.has(t))return J.get(t);const e=nt(t);return e!==t&&(J.set(t,e),Z.set(e,t)),e}const it=t=>Z.get(t);function st(t,e,{blocked:n,upgrade:r,blocking:i,terminated:s}={}){const o=indexedDB.open(t,e),a=rt(o);return r&&o.addEventListener("upgradeneeded",(t=>{r(rt(o.result),t.oldVersion,t.newVersion,rt(o.transaction))})),n&&o.addEventListener("blocked",(()=>n())),a.then((t=>{s&&t.addEventListener("close",(()=>s())),i&&t.addEventListener("versionchange",(()=>i()))})).catch((()=>{})),a}const ot=["get","getKey","getAll","getAllKeys","count"],at=["put","add","delete","clear"],ut=new Map;function ct(t,e){if(!(t instanceof IDBDatabase)||e in t||"string"!=typeof e)return;if(ut.get(e))return ut.get(e);const n=e.replace(/FromIndex$/,""),r=e!==n,i=at.includes(n);if(!(n in(r?IDBIndex:IDBObjectStore).prototype)||!i&&!ot.includes(n))return;const s=async function(t,...e){const s=this.transaction(t,i?"readwrite":"readonly");let o=s.store;return r&&(o=o.index(e.shift())),(await Promise.all([o[n](...e),i&&s.done]))[0]};return ut.set(e,s),s}tt=(t=>({...t,get:(e,n,r)=>ct(e,n)||t.get(e,n,r),has:(e,n)=>!!ct(e,n)||t.has(e,n)}))(tt);
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class lt{constructor(t){this.container=t}getPlatformInfoString(){return this.container.getProviders().map((t=>{if(function(t){const e=t.getComponent();return"VERSION"===(null==e?void 0:e.type)}(t)){const e=t.getImmediate();return`${e.library}/${e.version}`}return null})).filter((t=>t)).join(" ")}}const ht="@firebase/app",ft="0.9.0",dt=new G("@firebase/app"),pt="[DEFAULT]",gt={[ht]:"fire-core","@firebase/app-compat":"fire-core-compat","@firebase/analytics":"fire-analytics","@firebase/analytics-compat":"fire-analytics-compat","@firebase/app-check":"fire-app-check","@firebase/app-check-compat":"fire-app-check-compat","@firebase/auth":"fire-auth","@firebase/auth-compat":"fire-auth-compat","@firebase/database":"fire-rtdb","@firebase/database-compat":"fire-rtdb-compat","@firebase/functions":"fire-fn","@firebase/functions-compat":"fire-fn-compat","@firebase/installations":"fire-iid","@firebase/installations-compat":"fire-iid-compat","@firebase/messaging":"fire-fcm","@firebase/messaging-compat":"fire-fcm-compat","@firebase/performance":"fire-perf","@firebase/performance-compat":"fire-perf-compat","@firebase/remote-config":"fire-rc","@firebase/remote-config-compat":"fire-rc-compat","@firebase/storage":"fire-gcs","@firebase/storage-compat":"fire-gcs-compat","@firebase/firestore":"fire-fst","@firebase/firestore-compat":"fire-fst-compat","fire-js":"fire-js",firebase:"fire-js-all"},mt=new Map,yt=new Map;function vt(t,e){try{t.container.addComponent(e)}catch(n){dt.debug(`Component ${e.name} failed to register with FirebaseApp ${t.name}`,n)}}function wt(t){const e=t.name;if(yt.has(e))return dt.debug(`There were multiple attempts to register component ${e}.`),!1;yt.set(e,t);for(const e of mt.values())vt(e,t);return!0}function _t(t,e){const n=t.container.getProvider("heartbeat").getImmediate({optional:!0});return n&&n.triggerHeartbeat(),t.container.getProvider(e)}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const bt=new k("app","Firebase",{"no-app":"No Firebase App '{$appName}' has been created - call Firebase App.initializeApp()","bad-app-name":"Illegal App name: '{$appName}","duplicate-app":"Firebase App named '{$appName}' already exists with different options or config","app-deleted":"Firebase App named '{$appName}' already deleted","no-options":"Need to provide options, when not being deployed to hosting via source.","invalid-app-argument":"firebase.{$appName}() takes either no argument or a Firebase App instance.","invalid-log-argument":"First argument to `onLog` must be null or a function.","idb-open":"Error thrown when opening IndexedDB. Original error: {$originalErrorMessage}.","idb-get":"Error thrown when reading from IndexedDB. Original error: {$originalErrorMessage}.","idb-set":"Error thrown when writing to IndexedDB. Original error: {$originalErrorMessage}.","idb-delete":"Error thrown when deleting from IndexedDB. Original error: {$originalErrorMessage}."});
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Et{constructor(t,e,n){this._isDeleted=!1,this._options=Object.assign({},t),this._config=Object.assign({},e),this._name=e.name,this._automaticDataCollectionEnabled=e.automaticDataCollectionEnabled,this._container=n,this.container.addComponent(new M("app",(()=>this),"PUBLIC"))}get automaticDataCollectionEnabled(){return this.checkDestroyed(),this._automaticDataCollectionEnabled}set automaticDataCollectionEnabled(t){this.checkDestroyed(),this._automaticDataCollectionEnabled=t}get name(){return this.checkDestroyed(),this._name}get options(){return this.checkDestroyed(),this._options}get config(){return this.checkDestroyed(),this._config}get container(){return this._container}get isDeleted(){return this._isDeleted}set isDeleted(t){this._isDeleted=t}checkDestroyed(){if(this.isDeleted)throw bt.create("app-deleted",{appName:this._name})}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Tt(t,e={}){let n=t;if("object"!=typeof e){e={name:e}}const r=Object.assign({name:pt,automaticDataCollectionEnabled:!1},e),i=r.name;if("string"!=typeof i||!i)throw bt.create("bad-app-name",{appName:String(i)});var s;if(n||(n=null===(s=C())||void 0===s?void 0:s.config),!n)throw bt.create("no-options");const o=mt.get(i);if(o){if(R(n,o.options)&&R(r,o.config))return o;throw bt.create("duplicate-app",{appName:i})}const a=new P(i);for(const t of yt.values())a.addComponent(t);const u=new Et(n,r,a);return mt.set(i,u),u}function It(t=pt){const e=mt.get(t);if(!e&&t===pt)return Tt();if(!e)throw bt.create("no-app",{appName:t});return e}function Ct(t,e,n){var r;let i=null!==(r=gt[t])&&void 0!==r?r:t;n&&(i+=`-${n}`);const s=i.match(/\s|\//),o=e.match(/\s|\//);if(s||o){const t=[`Unable to register library "${i}" with version "${e}":`];return s&&t.push(`library name "${i}" contains illegal characters (whitespace or "/")`),s&&o&&t.push("and"),o&&t.push(`version name "${e}" contains illegal characters (whitespace or "/")`),void dt.warn(t.join(" "))}wt(new M(`${i}-version`,(()=>({library:i,version:e})),"VERSION"))}
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const St="firebase-heartbeat-store";let At=null;function Dt(){return At||(At=st("firebase-heartbeat-database",1,{upgrade:(t,e)=>{if(0===e)t.createObjectStore(St)}}).catch((t=>{throw bt.create("idb-open",{originalErrorMessage:t.message})}))),At}async function Nt(t,e){try{const n=(await Dt()).transaction(St,"readwrite"),r=n.objectStore(St);return await r.put(e,kt(t)),n.done}catch(t){if(t instanceof N)dt.warn(t.message);else{const e=bt.create("idb-set",{originalErrorMessage:null==t?void 0:t.message});dt.warn(e.message)}}}function kt(t){return`${t.name}!${t.options.appId}`}
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class xt{constructor(t){this.container=t,this._heartbeatsCache=null;const e=this.container.getProvider("app").getImmediate();this._storage=new Lt(e),this._heartbeatsCachePromise=this._storage.read().then((t=>(this._heartbeatsCache=t,t)))}async triggerHeartbeat(){const t=this.container.getProvider("platform-logger").getImmediate().getPlatformInfoString(),e=Rt();if(null===this._heartbeatsCache&&(this._heartbeatsCache=await this._heartbeatsCachePromise),this._heartbeatsCache.lastSentHeartbeatDate!==e&&!this._heartbeatsCache.heartbeats.some((t=>t.date===e)))return this._heartbeatsCache.heartbeats.push({date:e,agent:t}),this._heartbeatsCache.heartbeats=this._heartbeatsCache.heartbeats.filter((t=>{const e=new Date(t.date).valueOf();return Date.now()-e<=2592e6})),this._storage.overwrite(this._heartbeatsCache)}async getHeartbeatsHeader(){if(null===this._heartbeatsCache&&await this._heartbeatsCachePromise,null===this._heartbeatsCache||0===this._heartbeatsCache.heartbeats.length)return"";const t=Rt(),{heartbeatsToSend:e,unsentEntries:n}=function(t,e=1024){const n=[];let r=t.slice();for(const i of t){const t=n.find((t=>t.agent===i.agent));if(t){if(t.dates.push(i.date),Ot(n)>e){t.dates.pop();break}}else if(n.push({agent:i.agent,dates:[i.date]}),Ot(n)>e){n.pop();break}r=r.slice(1)}return{heartbeatsToSend:n,unsentEntries:r}}(this._heartbeatsCache.heartbeats),r=b(JSON.stringify({version:2,heartbeats:e}));return this._heartbeatsCache.lastSentHeartbeatDate=t,n.length>0?(this._heartbeatsCache.heartbeats=n,await this._storage.overwrite(this._heartbeatsCache)):(this._heartbeatsCache.heartbeats=[],this._storage.overwrite(this._heartbeatsCache)),r}}function Rt(){return(new Date).toISOString().substring(0,10)}class Lt{constructor(t){this.app=t,this._canUseIndexedDBPromise=this.runIndexedDBEnvironmentCheck()}async runIndexedDBEnvironmentCheck(){return!!T()&&new Promise(((t,e)=>{try{let n=!0;const r="validate-browser-context-for-indexeddb-analytics-module",i=self.indexedDB.open(r);i.onsuccess=()=>{i.result.close(),n||self.indexedDB.deleteDatabase(r),t(!0)},i.onupgradeneeded=()=>{n=!1},i.onerror=()=>{var t;e((null===(t=i.error)||void 0===t?void 0:t.message)||"")}}catch(t){e(t)}})).then((()=>!0)).catch((()=>!1))}async read(){if(await this._canUseIndexedDBPromise){return await async function(t){try{return(await Dt()).transaction(St).objectStore(St).get(kt(t))}catch(t){if(t instanceof N)dt.warn(t.message);else{const e=bt.create("idb-get",{originalErrorMessage:null==t?void 0:t.message});dt.warn(e.message)}}}(this.app)||{heartbeats:[]}}return{heartbeats:[]}}async overwrite(t){var e;if(await this._canUseIndexedDBPromise){const n=await this.read();return Nt(this.app,{lastSentHeartbeatDate:null!==(e=t.lastSentHeartbeatDate)&&void 0!==e?e:n.lastSentHeartbeatDate,heartbeats:t.heartbeats})}}async add(t){var e;if(await this._canUseIndexedDBPromise){const n=await this.read();return Nt(this.app,{lastSentHeartbeatDate:null!==(e=t.lastSentHeartbeatDate)&&void 0!==e?e:n.lastSentHeartbeatDate,heartbeats:[...n.heartbeats,...t.heartbeats]})}}}function Ot(t){return b(JSON.stringify({version:2,heartbeats:t})).length}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */var Mt;Mt="",wt(new M("platform-logger",(t=>new lt(t)),"PRIVATE")),wt(new M("heartbeat",(t=>new xt(t)),"PRIVATE")),Ct(ht,ft,Mt),Ct(ht,ft,"esm2017"),Ct("fire-js","");var Vt,Ft="undefined"!=typeof globalThis?globalThis:"undefined"!=typeof window?window:void 0!==t?t:"undefined"!=typeof self?self:{},Pt={},Ut=Ut||{},jt=Ft||self;function Bt(){}function qt(t){var e=typeof t;return"array"==(e="object"!=e?e:t?Array.isArray(t)?"array":e:"null")||"object"==e&&"number"==typeof t.length}function $t(t){var e=typeof t;return"object"==e&&null!=t||"function"==e}var zt="closure_uid_"+(1e9*Math.random()>>>0),Kt=0;function Gt(t,e,n){return t.call.apply(t.bind,arguments)}function Ht(t,e,n){if(!t)throw Error();if(2<arguments.length){var r=Array.prototype.slice.call(arguments,2);return function(){var n=Array.prototype.slice.call(arguments);return Array.prototype.unshift.apply(n,r),t.apply(e,n)}}return function(){return t.apply(e,arguments)}}function Wt(t,e,n){return(Wt=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?Gt:Ht).apply(null,arguments)}function Qt(t,e){var n=Array.prototype.slice.call(arguments,1);return function(){var e=n.slice();return e.push.apply(e,arguments),t.apply(this,e)}}function Yt(t,e){function n(){}n.prototype=e.prototype,t.X=e.prototype,t.prototype=new n,t.prototype.constructor=t,t.Wb=function(t,n,r){for(var i=Array(arguments.length-2),s=2;s<arguments.length;s++)i[s-2]=arguments[s];return e.prototype[n].apply(t,i)}}function Xt(){this.s=this.s,this.o=this.o}Xt.prototype.s=!1,Xt.prototype.na=function(){var t;!this.s&&(this.s=!0,this.M(),0)&&(t=this,Object.prototype.hasOwnProperty.call(t,zt)&&t[zt]||(t[zt]=++Kt))},Xt.prototype.M=function(){if(this.o)for(;this.o.length;)this.o.shift()()};const Jt=Array.prototype.indexOf?function(t,e){return Array.prototype.indexOf.call(t,e,void 0)}:function(t,e){if("string"==typeof t)return"string"!=typeof e||1!=e.length?-1:t.indexOf(e,0);for(let n=0;n<t.length;n++)if(n in t&&t[n]===e)return n;return-1};function Zt(t){const e=t.length;if(0<e){const n=Array(e);for(let r=0;r<e;r++)n[r]=t[r];return n}return[]}function te(t,e){for(let e=1;e<arguments.length;e++){const n=arguments[e];if(qt(n)){const e=t.length||0,r=n.length||0;t.length=e+r;for(let i=0;i<r;i++)t[e+i]=n[i]}else t.push(n)}}function ee(t,e){this.type=t,this.g=this.target=e,this.defaultPrevented=!1}ee.prototype.h=function(){this.defaultPrevented=!0};var ne=function(){if(!jt.addEventListener||!Object.defineProperty)return!1;var t=!1,e=Object.defineProperty({},"passive",{get:function(){t=!0}});try{jt.addEventListener("test",Bt,e),jt.removeEventListener("test",Bt,e)}catch(t){}return t}();function re(t){return/^[\s\xa0]*$/.test(t)}var ie=String.prototype.trim?function(t){return t.trim()}:function(t){return/^[\s\xa0]*([\s\S]*?)[\s\xa0]*$/.exec(t)[1]};function se(t,e){return t<e?-1:t>e?1:0}function oe(){var t=jt.navigator;return t&&(t=t.userAgent)?t:""}function ae(t){return-1!=oe().indexOf(t)}function ue(t){return ue[" "](t),t}ue[" "]=Bt;var ce,le,he=ae("Opera"),fe=ae("Trident")||ae("MSIE"),de=ae("Edge"),pe=de||fe,ge=ae("Gecko")&&!(-1!=oe().toLowerCase().indexOf("webkit")&&!ae("Edge"))&&!(ae("Trident")||ae("MSIE"))&&!ae("Edge"),me=-1!=oe().toLowerCase().indexOf("webkit")&&!ae("Edge");function ye(){var t=jt.document;return t?t.documentMode:void 0}t:{var ve="",we=(le=oe(),ge?/rv:([^\);]+)(\)|;)/.exec(le):de?/Edge\/([\d\.]+)/.exec(le):fe?/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(le):me?/WebKit\/(\S+)/.exec(le):he?/(?:Version)[ \/]?(\S+)/.exec(le):void 0);if(we&&(ve=we?we[1]:""),fe){var _e=ye();if(null!=_e&&_e>parseFloat(ve)){ce=String(_e);break t}}ce=ve}var be,Ee={};function Te(){return function(t){var e=Ee;return Object.prototype.hasOwnProperty.call(e,9)?e[9]:e[9]=t(9)}((function(){let t=0;const e=ie(String(ce)).split("."),n=ie("9").split("."),r=Math.max(e.length,n.length);for(let o=0;0==t&&o<r;o++){var i=e[o]||"",s=n[o]||"";do{if(i=/(\d*)(\D*)(.*)/.exec(i)||["","","",""],s=/(\d*)(\D*)(.*)/.exec(s)||["","","",""],0==i[0].length&&0==s[0].length)break;t=se(0==i[1].length?0:parseInt(i[1],10),0==s[1].length?0:parseInt(s[1],10))||se(0==i[2].length,0==s[2].length)||se(i[2],s[2]),i=i[3],s=s[3]}while(0==t)}return 0<=t}))}if(jt.document&&fe){var Ie=ye();be=Ie||(parseInt(ce,10)||void 0)}else be=void 0;var Ce=be;function Se(t,e){if(ee.call(this,t?t.type:""),this.relatedTarget=this.g=this.target=null,this.button=this.screenY=this.screenX=this.clientY=this.clientX=0,this.key="",this.metaKey=this.shiftKey=this.altKey=this.ctrlKey=!1,this.state=null,this.pointerId=0,this.pointerType="",this.i=null,t){var n=this.type=t.type,r=t.changedTouches&&t.changedTouches.length?t.changedTouches[0]:null;if(this.target=t.target||t.srcElement,this.g=e,e=t.relatedTarget){if(ge){t:{try{ue(e.nodeName);var i=!0;break t}catch(t){}i=!1}i||(e=null)}}else"mouseover"==n?e=t.fromElement:"mouseout"==n&&(e=t.toElement);this.relatedTarget=e,r?(this.clientX=void 0!==r.clientX?r.clientX:r.pageX,this.clientY=void 0!==r.clientY?r.clientY:r.pageY,this.screenX=r.screenX||0,this.screenY=r.screenY||0):(this.clientX=void 0!==t.clientX?t.clientX:t.pageX,this.clientY=void 0!==t.clientY?t.clientY:t.pageY,this.screenX=t.screenX||0,this.screenY=t.screenY||0),this.button=t.button,this.key=t.key||"",this.ctrlKey=t.ctrlKey,this.altKey=t.altKey,this.shiftKey=t.shiftKey,this.metaKey=t.metaKey,this.pointerId=t.pointerId||0,this.pointerType="string"==typeof t.pointerType?t.pointerType:Ae[t.pointerType]||"",this.state=t.state,this.i=t,t.defaultPrevented&&Se.X.h.call(this)}}Yt(Se,ee);var Ae={2:"touch",3:"pen",4:"mouse"};Se.prototype.h=function(){Se.X.h.call(this);var t=this.i;t.preventDefault?t.preventDefault():t.returnValue=!1};var De="closure_listenable_"+(1e6*Math.random()|0),Ne=0;function ke(t,e,n,r,i){this.listener=t,this.proxy=null,this.src=e,this.type=n,this.capture=!!r,this.ha=i,this.key=++Ne,this.ba=this.ea=!1}function xe(t){t.ba=!0,t.listener=null,t.proxy=null,t.src=null,t.ha=null}function Re(t,e,n){for(const r in t)e.call(n,t[r],r,t)}function Le(t){const e={};for(const n in t)e[n]=t[n];return e}const Oe="constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" ");function Me(t,e){let n,r;for(let e=1;e<arguments.length;e++){for(n in r=arguments[e],r)t[n]=r[n];for(let e=0;e<Oe.length;e++)n=Oe[e],Object.prototype.hasOwnProperty.call(r,n)&&(t[n]=r[n])}}function Ve(t){this.src=t,this.g={},this.h=0}function Fe(t,e){var n=e.type;if(n in t.g){var r,i=t.g[n],s=Jt(i,e);(r=0<=s)&&Array.prototype.splice.call(i,s,1),r&&(xe(e),0==t.g[n].length&&(delete t.g[n],t.h--))}}function Pe(t,e,n,r){for(var i=0;i<t.length;++i){var s=t[i];if(!s.ba&&s.listener==e&&s.capture==!!n&&s.ha==r)return i}return-1}Ve.prototype.add=function(t,e,n,r,i){var s=t.toString();(t=this.g[s])||(t=this.g[s]=[],this.h++);var o=Pe(t,e,r,i);return-1<o?(e=t[o],n||(e.ea=!1)):((e=new ke(e,this.src,s,!!r,i)).ea=n,t.push(e)),e};var Ue="closure_lm_"+(1e6*Math.random()|0),je={};function Be(t,e,n,r,i){if(r&&r.once)return $e(t,e,n,r,i);if(Array.isArray(e)){for(var s=0;s<e.length;s++)Be(t,e[s],n,r,i);return null}return n=Ye(n),t&&t[De]?t.N(e,n,$t(r)?!!r.capture:!!r,i):qe(t,e,n,!1,r,i)}function qe(t,e,n,r,i,s){if(!e)throw Error("Invalid event type");var o=$t(i)?!!i.capture:!!i,a=We(t);if(a||(t[Ue]=a=new Ve(t)),(n=a.add(e,n,r,o,s)).proxy)return n;if(r=function(){function t(n){return e.call(t.src,t.listener,n)}const e=He;return t}(),n.proxy=r,r.src=t,r.listener=n,t.addEventListener)ne||(i=o),void 0===i&&(i=!1),t.addEventListener(e.toString(),r,i);else if(t.attachEvent)t.attachEvent(Ge(e.toString()),r);else{if(!t.addListener||!t.removeListener)throw Error("addEventListener and attachEvent are unavailable.");t.addListener(r)}return n}function $e(t,e,n,r,i){if(Array.isArray(e)){for(var s=0;s<e.length;s++)$e(t,e[s],n,r,i);return null}return n=Ye(n),t&&t[De]?t.O(e,n,$t(r)?!!r.capture:!!r,i):qe(t,e,n,!0,r,i)}function ze(t,e,n,r,i){if(Array.isArray(e))for(var s=0;s<e.length;s++)ze(t,e[s],n,r,i);else r=$t(r)?!!r.capture:!!r,n=Ye(n),t&&t[De]?(t=t.i,(e=String(e).toString())in t.g&&(-1<(n=Pe(s=t.g[e],n,r,i))&&(xe(s[n]),Array.prototype.splice.call(s,n,1),0==s.length&&(delete t.g[e],t.h--)))):t&&(t=We(t))&&(e=t.g[e.toString()],t=-1,e&&(t=Pe(e,n,r,i)),(n=-1<t?e[t]:null)&&Ke(n))}function Ke(t){if("number"!=typeof t&&t&&!t.ba){var e=t.src;if(e&&e[De])Fe(e.i,t);else{var n=t.type,r=t.proxy;e.removeEventListener?e.removeEventListener(n,r,t.capture):e.detachEvent?e.detachEvent(Ge(n),r):e.addListener&&e.removeListener&&e.removeListener(r),(n=We(e))?(Fe(n,t),0==n.h&&(n.src=null,e[Ue]=null)):xe(t)}}}function Ge(t){return t in je?je[t]:je[t]="on"+t}function He(t,e){if(t.ba)t=!0;else{e=new Se(e,this);var n=t.listener,r=t.ha||t.src;t.ea&&Ke(t),t=n.call(r,e)}return t}function We(t){return(t=t[Ue])instanceof Ve?t:null}var Qe="__closure_events_fn_"+(1e9*Math.random()>>>0);function Ye(t){return"function"==typeof t?t:(t[Qe]||(t[Qe]=function(e){return t.handleEvent(e)}),t[Qe])}function Xe(){Xt.call(this),this.i=new Ve(this),this.P=this,this.I=null}function Je(t,e){var n,r=t.I;if(r)for(n=[];r;r=r.I)n.push(r);if(t=t.P,r=e.type||e,"string"==typeof e)e=new ee(e,t);else if(e instanceof ee)e.target=e.target||t;else{var i=e;Me(e=new ee(r,t),i)}if(i=!0,n)for(var s=n.length-1;0<=s;s--){var o=e.g=n[s];i=Ze(o,r,!0,e)&&i}if(i=Ze(o=e.g=t,r,!0,e)&&i,i=Ze(o,r,!1,e)&&i,n)for(s=0;s<n.length;s++)i=Ze(o=e.g=n[s],r,!1,e)&&i}function Ze(t,e,n,r){if(!(e=t.i.g[String(e)]))return!0;e=e.concat();for(var i=!0,s=0;s<e.length;++s){var o=e[s];if(o&&!o.ba&&o.capture==n){var a=o.listener,u=o.ha||o.src;o.ea&&Fe(t.i,o),i=!1!==a.call(u,r)&&i}}return i&&!r.defaultPrevented}Yt(Xe,Xt),Xe.prototype[De]=!0,Xe.prototype.removeEventListener=function(t,e,n,r){ze(this,t,e,n,r)},Xe.prototype.M=function(){if(Xe.X.M.call(this),this.i){var t,e=this.i;for(t in e.g){for(var n=e.g[t],r=0;r<n.length;r++)xe(n[r]);delete e.g[t],e.h--}}this.I=null},Xe.prototype.N=function(t,e,n,r){return this.i.add(String(t),e,!1,n,r)},Xe.prototype.O=function(t,e,n,r){return this.i.add(String(t),e,!0,n,r)};var tn=jt.JSON.stringify;function en(){var t=cn;let e=null;return t.g&&(e=t.g,t.g=t.g.next,t.g||(t.h=null),e.next=null),e}var nn,rn=new class{constructor(t,e){this.i=t,this.j=e,this.h=0,this.g=null}get(){let t;return 0<this.h?(this.h--,t=this.g,this.g=t.next,t.next=null):t=this.i(),t}}((()=>new sn),(t=>t.reset()));class sn{constructor(){this.next=this.g=this.h=null}set(t,e){this.h=t,this.g=e,this.next=null}reset(){this.next=this.g=this.h=null}}function on(t){jt.setTimeout((()=>{throw t}),0)}function an(t,e){nn||function(){var t=jt.Promise.resolve(void 0);nn=function(){t.then(ln)}}(),un||(nn(),un=!0),cn.add(t,e)}var un=!1,cn=new class{constructor(){this.h=this.g=null}add(t,e){const n=rn.get();n.set(t,e),this.h?this.h.next=n:this.g=n,this.h=n}};function ln(){for(var t;t=en();){try{t.h.call(t.g)}catch(t){on(t)}var e=rn;e.j(t),100>e.h&&(e.h++,t.next=e.g,e.g=t)}un=!1}function hn(t,e){Xe.call(this),this.h=t||1,this.g=e||jt,this.j=Wt(this.lb,this),this.l=Date.now()}function fn(t){t.ca=!1,t.R&&(t.g.clearTimeout(t.R),t.R=null)}function dn(t,e,n){if("function"==typeof t)n&&(t=Wt(t,n));else{if(!t||"function"!=typeof t.handleEvent)throw Error("Invalid listener argument");t=Wt(t.handleEvent,t)}return 2147483647<Number(e)?-1:jt.setTimeout(t,e||0)}function pn(t){t.g=dn((()=>{t.g=null,t.i&&(t.i=!1,pn(t))}),t.j);const e=t.h;t.h=null,t.m.apply(null,e)}Yt(hn,Xe),(Vt=hn.prototype).ca=!1,Vt.R=null,Vt.lb=function(){if(this.ca){var t=Date.now()-this.l;0<t&&t<.8*this.h?this.R=this.g.setTimeout(this.j,this.h-t):(this.R&&(this.g.clearTimeout(this.R),this.R=null),Je(this,"tick"),this.ca&&(fn(this),this.start()))}},Vt.start=function(){this.ca=!0,this.R||(this.R=this.g.setTimeout(this.j,this.h),this.l=Date.now())},Vt.M=function(){hn.X.M.call(this),fn(this),delete this.g};class gn extends Xt{constructor(t,e){super(),this.m=t,this.j=e,this.h=null,this.i=!1,this.g=null}l(t){this.h=arguments,this.g?this.i=!0:pn(this)}M(){super.M(),this.g&&(jt.clearTimeout(this.g),this.g=null,this.i=!1,this.h=null)}}function mn(t){Xt.call(this),this.h=t,this.g={}}Yt(mn,Xt);var yn=[];function vn(t,e,n,r){Array.isArray(n)||(n&&(yn[0]=n.toString()),n=yn);for(var i=0;i<n.length;i++){var s=Be(e,n[i],r||t.handleEvent,!1,t.h||t);if(!s)break;t.g[s.key]=s}}function wn(t){Re(t.g,(function(t,e){this.g.hasOwnProperty(e)&&Ke(t)}),t),t.g={}}function _n(){this.g=!0}function bn(t,e,n,r){t.info((function(){return"XMLHTTP TEXT ("+e+"): "+function(t,e){if(!t.g)return e;if(!e)return null;try{var n=JSON.parse(e);if(n)for(t=0;t<n.length;t++)if(Array.isArray(n[t])){var r=n[t];if(!(2>r.length)){var i=r[1];if(Array.isArray(i)&&!(1>i.length)){var s=i[0];if("noop"!=s&&"stop"!=s&&"close"!=s)for(var o=1;o<i.length;o++)i[o]=""}}}return tn(n)}catch(t){return e}}(t,n)+(r?" "+r:"")}))}mn.prototype.M=function(){mn.X.M.call(this),wn(this)},mn.prototype.handleEvent=function(){throw Error("EventHandler.handleEvent not implemented")},_n.prototype.Aa=function(){this.g=!1},_n.prototype.info=function(){};var En={},Tn=null;function In(){return Tn=Tn||new Xe}function Cn(t){ee.call(this,En.Pa,t)}function Sn(t){const e=In();Je(e,new Cn(e))}function An(t,e){ee.call(this,En.STAT_EVENT,t),this.stat=e}function Dn(t){const e=In();Je(e,new An(e,t))}function Nn(t,e){ee.call(this,En.Qa,t),this.size=e}function kn(t,e){if("function"!=typeof t)throw Error("Fn must not be null and must be a function");return jt.setTimeout((function(){t()}),e)}En.Pa="serverreachability",Yt(Cn,ee),En.STAT_EVENT="statevent",Yt(An,ee),En.Qa="timingevent",Yt(Nn,ee);var xn={NO_ERROR:0,mb:1,zb:2,yb:3,tb:4,xb:5,Ab:6,Ma:7,TIMEOUT:8,Db:9},Rn={rb:"complete",Nb:"success",Na:"error",Ma:"abort",Fb:"ready",Gb:"readystatechange",TIMEOUT:"timeout",Bb:"incrementaldata",Eb:"progress",ub:"downloadprogress",Vb:"uploadprogress"};function Ln(){}function On(t){return t.h||(t.h=t.i())}function Mn(){}Ln.prototype.h=null;var Vn,Fn={OPEN:"a",qb:"b",Na:"c",Cb:"d"};function Pn(){ee.call(this,"d")}function Un(){ee.call(this,"c")}function jn(){}function Bn(t,e,n,r){this.l=t,this.j=e,this.m=n,this.U=r||1,this.S=new mn(this),this.O=$n,t=pe?125:void 0,this.T=new hn(t),this.H=null,this.i=!1,this.s=this.A=this.v=this.K=this.F=this.V=this.B=null,this.D=[],this.g=null,this.C=0,this.o=this.u=null,this.Y=-1,this.I=!1,this.N=0,this.L=null,this.$=this.J=this.Z=this.P=!1,this.h=new qn}function qn(){this.i=null,this.g="",this.h=!1}Yt(Pn,ee),Yt(Un,ee),Yt(jn,Ln),jn.prototype.g=function(){return new XMLHttpRequest},jn.prototype.i=function(){return{}},Vn=new jn;var $n=45e3,zn={},Kn={};function Gn(t,e,n){t.K=1,t.v=hr(or(e)),t.s=n,t.P=!0,Hn(t,null)}function Hn(t,e){t.F=Date.now(),Xn(t),t.A=or(t.v);var n=t.A,r=t.U;Array.isArray(r)||(r=[String(r)]),Ir(n.i,"t",r),t.C=0,n=t.l.H,t.h=new qn,t.g=Ti(t.l,n?e:null,!t.s),0<t.N&&(t.L=new gn(Wt(t.La,t,t.g),t.N)),vn(t.S,t.g,"readystatechange",t.ib),e=t.H?Le(t.H):{},t.s?(t.u||(t.u="POST"),e["Content-Type"]="application/x-www-form-urlencoded",t.g.da(t.A,t.u,t.s,e)):(t.u="GET",t.g.da(t.A,t.u,null,e)),Sn(),function(t,e,n,r,i,s){t.info((function(){if(t.g)if(s)for(var o="",a=s.split("&"),u=0;u<a.length;u++){var c=a[u].split("=");if(1<c.length){var l=c[0];c=c[1];var h=l.split("_");o=2<=h.length&&"type"==h[1]?o+(l+"=")+c+"&":o+(l+"=redacted&")}}else o=null;else o=s;return"XMLHTTP REQ ("+r+") [attempt "+i+"]: "+e+"\n"+n+"\n"+o}))}(t.j,t.u,t.A,t.m,t.U,t.s)}function Wn(t){return!!t.g&&("GET"==t.u&&2!=t.K&&t.l.Da)}function Qn(t,e,n){let r,i=!0;for(;!t.I&&t.C<n.length;){if(r=Yn(t,n),r==Kn){4==e&&(t.o=4,Dn(14),i=!1),bn(t.j,t.m,null,"[Incomplete Response]");break}if(r==zn){t.o=4,Dn(15),bn(t.j,t.m,n,"[Invalid Chunk]"),i=!1;break}bn(t.j,t.m,r,null),nr(t,r)}Wn(t)&&r!=Kn&&r!=zn&&(t.h.g="",t.C=0),4!=e||0!=n.length||t.h.h||(t.o=1,Dn(16),i=!1),t.i=t.i&&i,i?0<n.length&&!t.$&&(t.$=!0,(e=t.l).g==t&&e.$&&!e.K&&(e.j.info("Great, no buffering proxy detected. Bytes received: "+n.length),gi(e),e.K=!0,Dn(11))):(bn(t.j,t.m,n,"[Invalid Chunked Response]"),er(t),tr(t))}function Yn(t,e){var n=t.C,r=e.indexOf("\n",n);return-1==r?Kn:(n=Number(e.substring(n,r)),isNaN(n)?zn:(r+=1)+n>e.length?Kn:(e=e.substr(r,n),t.C=r+n,e))}function Xn(t){t.V=Date.now()+t.O,Jn(t,t.O)}function Jn(t,e){if(null!=t.B)throw Error("WatchDog timer not null");t.B=kn(Wt(t.gb,t),e)}function Zn(t){t.B&&(jt.clearTimeout(t.B),t.B=null)}function tr(t){0==t.l.G||t.I||vi(t.l,t)}function er(t){Zn(t);var e=t.L;e&&"function"==typeof e.na&&e.na(),t.L=null,fn(t.T),wn(t.S),t.g&&(e=t.g,t.g=null,e.abort(),e.na())}function nr(t,e){try{var n=t.l;if(0!=n.G&&(n.g==t||kr(n.h,t)))if(!t.J&&kr(n.h,t)&&3==n.G){try{var r=n.Fa.g.parse(e)}catch(t){r=null}if(Array.isArray(r)&&3==r.length){var i=r;if(0==i[0]){t:if(!n.u){if(n.g){if(!(n.g.F+3e3<t.F))break t;yi(n),ai(n)}pi(n),Dn(18)}}else n.Ba=i[1],0<n.Ba-n.T&&37500>i[2]&&n.L&&0==n.A&&!n.v&&(n.v=kn(Wt(n.cb,n),6e3));if(1>=Nr(n.h)&&n.ja){try{n.ja()}catch(t){}n.ja=void 0}}else _i(n,11)}else if((t.J||n.g==t)&&yi(n),!re(e))for(i=n.Fa.g.parse(e),e=0;e<i.length;e++){let c=i[e];if(n.T=c[0],c=c[1],2==n.G)if("c"==c[0]){n.I=c[1],n.ka=c[2];const e=c[3];null!=e&&(n.ma=e,n.j.info("VER="+n.ma));const i=c[4];null!=i&&(n.Ca=i,n.j.info("SVER="+n.Ca));const l=c[5];null!=l&&"number"==typeof l&&0<l&&(r=1.5*l,n.J=r,n.j.info("backChannelRequestTimeoutMs_="+r)),r=n;const h=t.g;if(h){const t=h.g?h.g.getResponseHeader("X-Client-Wire-Protocol"):null;if(t){var s=r.h;s.g||-1==t.indexOf("spdy")&&-1==t.indexOf("quic")&&-1==t.indexOf("h2")||(s.j=s.l,s.g=new Set,s.h&&(xr(s,s.h),s.h=null))}if(r.D){const t=h.g?h.g.getResponseHeader("X-HTTP-Session-Id"):null;t&&(r.za=t,lr(r.F,r.D,t))}}n.G=3,n.l&&n.l.xa(),n.$&&(n.P=Date.now()-t.F,n.j.info("Handshake RTT: "+n.P+"ms"));var o=t;if((r=n).sa=Ei(r,r.H?r.ka:null,r.V),o.J){Rr(r.h,o);var a=o,u=r.J;u&&a.setTimeout(u),a.B&&(Zn(a),Xn(a)),r.g=o}else di(r);0<n.i.length&&ci(n)}else"stop"!=c[0]&&"close"!=c[0]||_i(n,7);else 3==n.G&&("stop"==c[0]||"close"==c[0]?"stop"==c[0]?_i(n,7):oi(n):"noop"!=c[0]&&n.l&&n.l.wa(c),n.A=0)}Sn()}catch(t){}}function rr(t,e){if(t.forEach&&"function"==typeof t.forEach)t.forEach(e,void 0);else if(qt(t)||"string"==typeof t)Array.prototype.forEach.call(t,e,void 0);else for(var n=function(t){if(t.oa&&"function"==typeof t.oa)return t.oa();if(!t.W||"function"!=typeof t.W){if("undefined"!=typeof Map&&t instanceof Map)return Array.from(t.keys());if(!("undefined"!=typeof Set&&t instanceof Set)){if(qt(t)||"string"==typeof t){var e=[];t=t.length;for(var n=0;n<t;n++)e.push(n);return e}e=[],n=0;for(const r in t)e[n++]=r;return e}}}(t),r=function(t){if(t.W&&"function"==typeof t.W)return t.W();if("undefined"!=typeof Map&&t instanceof Map||"undefined"!=typeof Set&&t instanceof Set)return Array.from(t.values());if("string"==typeof t)return t.split("");if(qt(t)){for(var e=[],n=t.length,r=0;r<n;r++)e.push(t[r]);return e}for(r in e=[],n=0,t)e[n++]=t[r];return e}(t),i=r.length,s=0;s<i;s++)e.call(void 0,r[s],n&&n[s],t)}(Vt=Bn.prototype).setTimeout=function(t){this.O=t},Vt.ib=function(t){t=t.target;const e=this.L;e&&3==ti(t)?e.l():this.La(t)},Vt.La=function(t){try{if(t==this.g)t:{const l=ti(this.g);var e=this.g.Ea();this.g.aa();if(!(3>l)&&(3!=l||pe||this.g&&(this.h.h||this.g.fa()||ei(this.g)))){this.I||4!=l||7==e||Sn(),Zn(this);var n=this.g.aa();this.Y=n;e:if(Wn(this)){var r=ei(this.g);t="";var i=r.length,s=4==ti(this.g);if(!this.h.i){if("undefined"==typeof TextDecoder){er(this),tr(this);var o="";break e}this.h.i=new jt.TextDecoder}for(e=0;e<i;e++)this.h.h=!0,t+=this.h.i.decode(r[e],{stream:s&&e==i-1});r.splice(0,i),this.h.g+=t,this.C=0,o=this.h.g}else o=this.g.fa();if(this.i=200==n,function(t,e,n,r,i,s,o){t.info((function(){return"XMLHTTP RESP ("+r+") [ attempt "+i+"]: "+e+"\n"+n+"\n"+s+" "+o}))}(this.j,this.u,this.A,this.m,this.U,l,n),this.i){if(this.Z&&!this.J){e:{if(this.g){var a,u=this.g;if((a=u.g?u.g.getResponseHeader("X-HTTP-Initial-Response"):null)&&!re(a)){var c=a;break e}}c=null}if(!(n=c)){this.i=!1,this.o=3,Dn(12),er(this),tr(this);break t}bn(this.j,this.m,n,"Initial handshake response via X-HTTP-Initial-Response"),this.J=!0,nr(this,n)}this.P?(Qn(this,l,o),pe&&this.i&&3==l&&(vn(this.S,this.T,"tick",this.hb),this.T.start())):(bn(this.j,this.m,o,null),nr(this,o)),4==l&&er(this),this.i&&!this.I&&(4==l?vi(this.l,this):(this.i=!1,Xn(this)))}else 400==n&&0<o.indexOf("Unknown SID")?(this.o=3,Dn(12)):(this.o=0,Dn(13)),er(this),tr(this)}}}catch(t){}},Vt.hb=function(){if(this.g){var t=ti(this.g),e=this.g.fa();this.C<e.length&&(Zn(this),Qn(this,t,e),this.i&&4!=t&&Xn(this))}},Vt.cancel=function(){this.I=!0,er(this)},Vt.gb=function(){this.B=null;const t=Date.now();0<=t-this.V?(function(t,e){t.info((function(){return"TIMEOUT: "+e}))}(this.j,this.A),2!=this.K&&(Sn(),Dn(17)),er(this),this.o=2,tr(this)):Jn(this,this.V-t)};var ir=RegExp("^(?:([^:/?#.]+):)?(?://(?:([^\\\\/?#]*)@)?([^\\\\/?#]*?)(?::([0-9]+))?(?=[\\\\/?#]|$))?([^?#]+)?(?:\\?([^#]*))?(?:#([\\s\\S]*))?$");function sr(t,e){if(this.g=this.s=this.j="",this.m=null,this.o=this.l="",this.h=!1,t instanceof sr){this.h=void 0!==e?e:t.h,ar(this,t.j),this.s=t.s,this.g=t.g,ur(this,t.m),this.l=t.l,e=t.i;var n=new _r;n.i=e.i,e.g&&(n.g=new Map(e.g),n.h=e.h),cr(this,n),this.o=t.o}else t&&(n=String(t).match(ir))?(this.h=!!e,ar(this,n[1]||"",!0),this.s=fr(n[2]||""),this.g=fr(n[3]||"",!0),ur(this,n[4]),this.l=fr(n[5]||"",!0),cr(this,n[6]||"",!0),this.o=fr(n[7]||"")):(this.h=!!e,this.i=new _r(null,this.h))}function or(t){return new sr(t)}function ar(t,e,n){t.j=n?fr(e,!0):e,t.j&&(t.j=t.j.replace(/:$/,""))}function ur(t,e){if(e){if(e=Number(e),isNaN(e)||0>e)throw Error("Bad port number "+e);t.m=e}else t.m=null}function cr(t,e,n){e instanceof _r?(t.i=e,function(t,e){e&&!t.j&&(br(t),t.i=null,t.g.forEach((function(t,e){var n=e.toLowerCase();e!=n&&(Er(this,e),Ir(this,n,t))}),t)),t.j=e}(t.i,t.h)):(n||(e=dr(e,vr)),t.i=new _r(e,t.h))}function lr(t,e,n){t.i.set(e,n)}function hr(t){return lr(t,"zx",Math.floor(2147483648*Math.random()).toString(36)+Math.abs(Math.floor(2147483648*Math.random())^Date.now()).toString(36)),t}function fr(t,e){return t?e?decodeURI(t.replace(/%25/g,"%2525")):decodeURIComponent(t):""}function dr(t,e,n){return"string"==typeof t?(t=encodeURI(t).replace(e,pr),n&&(t=t.replace(/%25([0-9a-fA-F]{2})/g,"%$1")),t):null}function pr(t){return"%"+((t=t.charCodeAt(0))>>4&15).toString(16)+(15&t).toString(16)}sr.prototype.toString=function(){var t=[],e=this.j;e&&t.push(dr(e,gr,!0),":");var n=this.g;return(n||"file"==e)&&(t.push("//"),(e=this.s)&&t.push(dr(e,gr,!0),"@"),t.push(encodeURIComponent(String(n)).replace(/%25([0-9a-fA-F]{2})/g,"%$1")),null!=(n=this.m)&&t.push(":",String(n))),(n=this.l)&&(this.g&&"/"!=n.charAt(0)&&t.push("/"),t.push(dr(n,"/"==n.charAt(0)?yr:mr,!0))),(n=this.i.toString())&&t.push("?",n),(n=this.o)&&t.push("#",dr(n,wr)),t.join("")};var gr=/[#\/\?@]/g,mr=/[#\?:]/g,yr=/[#\?]/g,vr=/[#\?@]/g,wr=/#/g;function _r(t,e){this.h=this.g=null,this.i=t||null,this.j=!!e}function br(t){t.g||(t.g=new Map,t.h=0,t.i&&function(t,e){if(t){t=t.split("&");for(var n=0;n<t.length;n++){var r=t[n].indexOf("="),i=null;if(0<=r){var s=t[n].substring(0,r);i=t[n].substring(r+1)}else s=t[n];e(s,i?decodeURIComponent(i.replace(/\+/g," ")):"")}}}(t.i,(function(e,n){t.add(decodeURIComponent(e.replace(/\+/g," ")),n)})))}function Er(t,e){br(t),e=Cr(t,e),t.g.has(e)&&(t.i=null,t.h-=t.g.get(e).length,t.g.delete(e))}function Tr(t,e){return br(t),e=Cr(t,e),t.g.has(e)}function Ir(t,e,n){Er(t,e),0<n.length&&(t.i=null,t.g.set(Cr(t,e),Zt(n)),t.h+=n.length)}function Cr(t,e){return e=String(e),t.j&&(e=e.toLowerCase()),e}(Vt=_r.prototype).add=function(t,e){br(this),this.i=null,t=Cr(this,t);var n=this.g.get(t);return n||this.g.set(t,n=[]),n.push(e),this.h+=1,this},Vt.forEach=function(t,e){br(this),this.g.forEach((function(n,r){n.forEach((function(n){t.call(e,n,r,this)}),this)}),this)},Vt.oa=function(){br(this);const t=Array.from(this.g.values()),e=Array.from(this.g.keys()),n=[];for(let r=0;r<e.length;r++){const i=t[r];for(let t=0;t<i.length;t++)n.push(e[r])}return n},Vt.W=function(t){br(this);let e=[];if("string"==typeof t)Tr(this,t)&&(e=e.concat(this.g.get(Cr(this,t))));else{t=Array.from(this.g.values());for(let n=0;n<t.length;n++)e=e.concat(t[n])}return e},Vt.set=function(t,e){return br(this),this.i=null,Tr(this,t=Cr(this,t))&&(this.h-=this.g.get(t).length),this.g.set(t,[e]),this.h+=1,this},Vt.get=function(t,e){return t&&0<(t=this.W(t)).length?String(t[0]):e},Vt.toString=function(){if(this.i)return this.i;if(!this.g)return"";const t=[],e=Array.from(this.g.keys());for(var n=0;n<e.length;n++){var r=e[n];const s=encodeURIComponent(String(r)),o=this.W(r);for(r=0;r<o.length;r++){var i=s;""!==o[r]&&(i+="="+encodeURIComponent(String(o[r]))),t.push(i)}}return this.i=t.join("&")};function Sr(t){this.l=t||Ar,jt.PerformanceNavigationTiming?t=0<(t=jt.performance.getEntriesByType("navigation")).length&&("hq"==t[0].nextHopProtocol||"h2"==t[0].nextHopProtocol):t=!!(jt.g&&jt.g.Ga&&jt.g.Ga()&&jt.g.Ga().$b),this.j=t?this.l:1,this.g=null,1<this.j&&(this.g=new Set),this.h=null,this.i=[]}var Ar=10;function Dr(t){return!!t.h||!!t.g&&t.g.size>=t.j}function Nr(t){return t.h?1:t.g?t.g.size:0}function kr(t,e){return t.h?t.h==e:!!t.g&&t.g.has(e)}function xr(t,e){t.g?t.g.add(e):t.h=e}function Rr(t,e){t.h&&t.h==e?t.h=null:t.g&&t.g.has(e)&&t.g.delete(e)}function Lr(t){if(null!=t.h)return t.i.concat(t.h.D);if(null!=t.g&&0!==t.g.size){let e=t.i;for(const n of t.g.values())e=e.concat(n.D);return e}return Zt(t.i)}function Or(){}function Mr(){this.g=new Or}function Vr(t,e,n){const r=n||"";try{rr(t,(function(t,n){let i=t;$t(t)&&(i=tn(t)),e.push(r+n+"="+encodeURIComponent(i))}))}catch(t){throw e.push(r+"type="+encodeURIComponent("_badmap")),t}}function Fr(t,e,n,r,i){try{e.onload=null,e.onerror=null,e.onabort=null,e.ontimeout=null,i(r)}catch(t){}}function Pr(t){this.l=t.ac||null,this.j=t.jb||!1}function Ur(t,e){Xe.call(this),this.D=t,this.u=e,this.m=void 0,this.readyState=jr,this.status=0,this.responseType=this.responseText=this.response=this.statusText="",this.onreadystatechange=null,this.v=new Headers,this.h=null,this.C="GET",this.B="",this.g=!1,this.A=this.j=this.l=null}Sr.prototype.cancel=function(){if(this.i=Lr(this),this.h)this.h.cancel(),this.h=null;else if(this.g&&0!==this.g.size){for(const t of this.g.values())t.cancel();this.g.clear()}},Or.prototype.stringify=function(t){return jt.JSON.stringify(t,void 0)},Or.prototype.parse=function(t){return jt.JSON.parse(t,void 0)},Yt(Pr,Ln),Pr.prototype.g=function(){return new Ur(this.l,this.j)},Pr.prototype.i=function(t){return function(){return t}}({}),Yt(Ur,Xe);var jr=0;function Br(t){t.j.read().then(t.Ta.bind(t)).catch(t.ga.bind(t))}function qr(t){t.readyState=4,t.l=null,t.j=null,t.A=null,$r(t)}function $r(t){t.onreadystatechange&&t.onreadystatechange.call(t)}(Vt=Ur.prototype).open=function(t,e){if(this.readyState!=jr)throw this.abort(),Error("Error reopening a connection");this.C=t,this.B=e,this.readyState=1,$r(this)},Vt.send=function(t){if(1!=this.readyState)throw this.abort(),Error("need to call open() first. ");this.g=!0;const e={headers:this.v,method:this.C,credentials:this.m,cache:void 0};t&&(e.body=t),(this.D||jt).fetch(new Request(this.B,e)).then(this.Wa.bind(this),this.ga.bind(this))},Vt.abort=function(){this.response=this.responseText="",this.v=new Headers,this.status=0,this.j&&this.j.cancel("Request was aborted.").catch((()=>{})),1<=this.readyState&&this.g&&4!=this.readyState&&(this.g=!1,qr(this)),this.readyState=jr},Vt.Wa=function(t){if(this.g&&(this.l=t,this.h||(this.status=this.l.status,this.statusText=this.l.statusText,this.h=t.headers,this.readyState=2,$r(this)),this.g&&(this.readyState=3,$r(this),this.g)))if("arraybuffer"===this.responseType)t.arrayBuffer().then(this.Ua.bind(this),this.ga.bind(this));else if(void 0!==jt.ReadableStream&&"body"in t){if(this.j=t.body.getReader(),this.u){if(this.responseType)throw Error('responseType must be empty for "streamBinaryChunks" mode responses.');this.response=[]}else this.response=this.responseText="",this.A=new TextDecoder;Br(this)}else t.text().then(this.Va.bind(this),this.ga.bind(this))},Vt.Ta=function(t){if(this.g){if(this.u&&t.value)this.response.push(t.value);else if(!this.u){var e=t.value?t.value:new Uint8Array(0);(e=this.A.decode(e,{stream:!t.done}))&&(this.response=this.responseText+=e)}t.done?qr(this):$r(this),3==this.readyState&&Br(this)}},Vt.Va=function(t){this.g&&(this.response=this.responseText=t,qr(this))},Vt.Ua=function(t){this.g&&(this.response=t,qr(this))},Vt.ga=function(){this.g&&qr(this)},Vt.setRequestHeader=function(t,e){this.v.append(t,e)},Vt.getResponseHeader=function(t){return this.h&&this.h.get(t.toLowerCase())||""},Vt.getAllResponseHeaders=function(){if(!this.h)return"";const t=[],e=this.h.entries();for(var n=e.next();!n.done;)n=n.value,t.push(n[0]+": "+n[1]),n=e.next();return t.join("\r\n")},Object.defineProperty(Ur.prototype,"withCredentials",{get:function(){return"include"===this.m},set:function(t){this.m=t?"include":"same-origin"}});var zr=jt.JSON.parse;function Kr(t){Xe.call(this),this.headers=new Map,this.u=t||null,this.h=!1,this.C=this.g=null,this.H="",this.m=0,this.j="",this.l=this.F=this.v=this.D=!1,this.B=0,this.A=null,this.J=Gr,this.K=this.L=!1}Yt(Kr,Xe);var Gr="",Hr=/^https?$/i,Wr=["POST","PUT"];function Qr(t,e){t.h=!1,t.g&&(t.l=!0,t.g.abort(),t.l=!1),t.j=e,t.m=5,Yr(t),Jr(t)}function Yr(t){t.D||(t.D=!0,Je(t,"complete"),Je(t,"error"))}function Xr(t){if(t.h&&void 0!==Ut&&(!t.C[1]||4!=ti(t)||2!=t.aa()))if(t.v&&4==ti(t))dn(t.Ha,0,t);else if(Je(t,"readystatechange"),4==ti(t)){t.h=!1;try{const a=t.aa();t:switch(a){case 200:case 201:case 202:case 204:case 206:case 304:case 1223:var e=!0;break t;default:e=!1}var n;if(!(n=e)){var r;if(r=0===a){var i=String(t.H).match(ir)[1]||null;if(!i&&jt.self&&jt.self.location){var s=jt.self.location.protocol;i=s.substr(0,s.length-1)}r=!Hr.test(i?i.toLowerCase():"")}n=r}if(n)Je(t,"complete"),Je(t,"success");else{t.m=6;try{var o=2<ti(t)?t.g.statusText:""}catch(t){o=""}t.j=o+" ["+t.aa()+"]",Yr(t)}}finally{Jr(t)}}}function Jr(t,e){if(t.g){Zr(t);const n=t.g,r=t.C[0]?Bt:null;t.g=null,t.C=null,e||Je(t,"ready");try{n.onreadystatechange=r}catch(t){}}}function Zr(t){t.g&&t.K&&(t.g.ontimeout=null),t.A&&(jt.clearTimeout(t.A),t.A=null)}function ti(t){return t.g?t.g.readyState:0}function ei(t){try{if(!t.g)return null;if("response"in t.g)return t.g.response;switch(t.J){case Gr:case"text":return t.g.responseText;case"arraybuffer":if("mozResponseArrayBuffer"in t.g)return t.g.mozResponseArrayBuffer}return null}catch(t){return null}}function ni(t){let e="";return Re(t,(function(t,n){e+=n,e+=":",e+=t,e+="\r\n"})),e}function ri(t,e,n){t:{for(r in n){var r=!1;break t}r=!0}r||(n=ni(n),"string"==typeof t?null!=n&&encodeURIComponent(String(n)):lr(t,e,n))}function ii(t,e,n){return n&&n.internalChannelParams&&n.internalChannelParams[t]||e}function si(t){this.Ca=0,this.i=[],this.j=new _n,this.ka=this.sa=this.F=this.V=this.g=this.za=this.D=this.ia=this.o=this.S=this.s=null,this.ab=this.U=0,this.Za=ii("failFast",!1,t),this.L=this.v=this.u=this.m=this.l=null,this.Y=!0,this.pa=this.Ba=this.T=-1,this.Z=this.A=this.C=0,this.Xa=ii("baseRetryDelayMs",5e3,t),this.bb=ii("retryDelaySeedMs",1e4,t),this.$a=ii("forwardChannelMaxRetries",2,t),this.ta=ii("forwardChannelRequestTimeoutMs",2e4,t),this.ra=t&&t.xmlHttpFactory||void 0,this.Da=t&&t.Zb||!1,this.J=void 0,this.H=t&&t.supportsCrossDomainXhr||!1,this.I="",this.h=new Sr(t&&t.concurrentRequestLimit),this.Fa=new Mr,this.O=t&&t.fastHandshake||!1,this.N=t&&t.encodeInitMessageHeaders||!1,this.O&&this.N&&(this.N=!1),this.Ya=t&&t.Xb||!1,t&&t.Aa&&this.j.Aa(),t&&t.forceLongPolling&&(this.Y=!1),this.$=!this.O&&this.Y&&t&&t.detectBufferingProxy||!1,this.ja=void 0,this.P=0,this.K=!1,this.la=this.B=null}function oi(t){if(ui(t),3==t.G){var e=t.U++,n=or(t.F);lr(n,"SID",t.I),lr(n,"RID",e),lr(n,"TYPE","terminate"),hi(t,n),(e=new Bn(t,t.j,e,void 0)).K=2,e.v=hr(or(n)),n=!1,jt.navigator&&jt.navigator.sendBeacon&&(n=jt.navigator.sendBeacon(e.v.toString(),"")),!n&&jt.Image&&((new Image).src=e.v,n=!0),n||(e.g=Ti(e.l,null),e.g.da(e.v)),e.F=Date.now(),Xn(e)}bi(t)}function ai(t){t.g&&(gi(t),t.g.cancel(),t.g=null)}function ui(t){ai(t),t.u&&(jt.clearTimeout(t.u),t.u=null),yi(t),t.h.cancel(),t.m&&("number"==typeof t.m&&jt.clearTimeout(t.m),t.m=null)}function ci(t){Dr(t.h)||t.m||(t.m=!0,an(t.Ja,t),t.C=0)}function li(t,e){var n;n=e?e.m:t.U++;const r=or(t.F);lr(r,"SID",t.I),lr(r,"RID",n),lr(r,"AID",t.T),hi(t,r),t.o&&t.s&&ri(r,t.o,t.s),n=new Bn(t,t.j,n,t.C+1),null===t.o&&(n.H=t.s),e&&(t.i=e.D.concat(t.i)),e=fi(t,n,1e3),n.setTimeout(Math.round(.5*t.ta)+Math.round(.5*t.ta*Math.random())),xr(t.h,n),Gn(n,r,e)}function hi(t,e){t.ia&&Re(t.ia,(function(t,n){lr(e,n,t)})),t.l&&rr({},(function(t,n){lr(e,n,t)}))}function fi(t,e,n){n=Math.min(t.i.length,n);var r=t.l?Wt(t.l.Ra,t.l,t):null;t:{var i=t.i;let e=-1;for(;;){const t=["count="+n];-1==e?0<n?(e=i[0].h,t.push("ofs="+e)):e=0:t.push("ofs="+e);let s=!0;for(let o=0;o<n;o++){let n=i[o].h;const a=i[o].g;if(n-=e,0>n)e=Math.max(0,i[o].h-100),s=!1;else try{Vr(a,t,"req"+n+"_")}catch(t){r&&r(a)}}if(s){r=t.join("&");break t}}}return t=t.i.splice(0,n),e.D=t,r}function di(t){t.g||t.u||(t.Z=1,an(t.Ia,t),t.A=0)}function pi(t){return!(t.g||t.u||3<=t.A)&&(t.Z++,t.u=kn(Wt(t.Ia,t),wi(t,t.A)),t.A++,!0)}function gi(t){null!=t.B&&(jt.clearTimeout(t.B),t.B=null)}function mi(t){t.g=new Bn(t,t.j,"rpc",t.Z),null===t.o&&(t.g.H=t.s),t.g.N=0;var e=or(t.sa);lr(e,"RID","rpc"),lr(e,"SID",t.I),lr(e,"CI",t.L?"0":"1"),lr(e,"AID",t.T),lr(e,"TYPE","xmlhttp"),hi(t,e),t.o&&t.s&&ri(e,t.o,t.s),t.J&&t.g.setTimeout(t.J);var n=t.g;t=t.ka,n.K=1,n.v=hr(or(e)),n.s=null,n.P=!0,Hn(n,t)}function yi(t){null!=t.v&&(jt.clearTimeout(t.v),t.v=null)}function vi(t,e){var n=null;if(t.g==e){yi(t),gi(t),t.g=null;var r=2}else{if(!kr(t.h,e))return;n=e.D,Rr(t.h,e),r=1}if(0!=t.G)if(t.pa=e.Y,e.i)if(1==r){n=e.s?e.s.length:0,e=Date.now()-e.F;var i=t.C;Je(r=In(),new Nn(r,n)),ci(t)}else di(t);else if(3==(i=e.o)||0==i&&0<t.pa||!(1==r&&function(t,e){return!(Nr(t.h)>=t.h.j-(t.m?1:0)||(t.m?(t.i=e.D.concat(t.i),0):1==t.G||2==t.G||t.C>=(t.Za?0:t.$a)||(t.m=kn(Wt(t.Ja,t,e),wi(t,t.C)),t.C++,0)))}(t,e)||2==r&&pi(t)))switch(n&&0<n.length&&(e=t.h,e.i=e.i.concat(n)),i){case 1:_i(t,5);break;case 4:_i(t,10);break;case 3:_i(t,6);break;default:_i(t,2)}}function wi(t,e){let n=t.Xa+Math.floor(Math.random()*t.bb);return t.l||(n*=2),n*e}function _i(t,e){if(t.j.info("Error code "+e),2==e){var n=null;t.l&&(n=null);var r=Wt(t.kb,t);n||(n=new sr("//www.google.com/images/cleardot.gif"),jt.location&&"http"==jt.location.protocol||ar(n,"https"),hr(n)),function(t,e){const n=new _n;if(jt.Image){const r=new Image;r.onload=Qt(Fr,n,r,"TestLoadImage: loaded",!0,e),r.onerror=Qt(Fr,n,r,"TestLoadImage: error",!1,e),r.onabort=Qt(Fr,n,r,"TestLoadImage: abort",!1,e),r.ontimeout=Qt(Fr,n,r,"TestLoadImage: timeout",!1,e),jt.setTimeout((function(){r.ontimeout&&r.ontimeout()}),1e4),r.src=t}else e(!1)}(n.toString(),r)}else Dn(2);t.G=0,t.l&&t.l.va(e),bi(t),ui(t)}function bi(t){if(t.G=0,t.la=[],t.l){const e=Lr(t.h);0==e.length&&0==t.i.length||(te(t.la,e),te(t.la,t.i),t.h.i.length=0,Zt(t.i),t.i.length=0),t.l.ua()}}function Ei(t,e,n){var r=n instanceof sr?or(n):new sr(n,void 0);if(""!=r.g)e&&(r.g=e+"."+r.g),ur(r,r.m);else{var i=jt.location;r=i.protocol,e=e?e+"."+i.hostname:i.hostname,i=+i.port;var s=new sr(null,void 0);r&&ar(s,r),e&&(s.g=e),i&&ur(s,i),n&&(s.l=n),r=s}return n=t.D,e=t.za,n&&e&&lr(r,n,e),lr(r,"VER",t.ma),hi(t,r),r}function Ti(t,e,n){if(e&&!t.H)throw Error("Can't create secondary domain capable XhrIo object.");return(e=n&&t.Da&&!t.ra?new Kr(new Pr({jb:!0})):new Kr(t.ra)).Ka(t.H),e}function Ii(){}function Ci(){if(fe&&!(10<=Number(Ce)))throw Error("Environmental error: no available transport.")}function Si(t,e){Xe.call(this),this.g=new si(e),this.l=t,this.h=e&&e.messageUrlParams||null,t=e&&e.messageHeaders||null,e&&e.clientProtocolHeaderRequired&&(t?t["X-Client-Protocol"]="webchannel":t={"X-Client-Protocol":"webchannel"}),this.g.s=t,t=e&&e.initMessageHeaders||null,e&&e.messageContentType&&(t?t["X-WebChannel-Content-Type"]=e.messageContentType:t={"X-WebChannel-Content-Type":e.messageContentType}),e&&e.ya&&(t?t["X-WebChannel-Client-Profile"]=e.ya:t={"X-WebChannel-Client-Profile":e.ya}),this.g.S=t,(t=e&&e.Yb)&&!re(t)&&(this.g.o=t),this.A=e&&e.supportsCrossDomainXhr||!1,this.v=e&&e.sendRawJson||!1,(e=e&&e.httpSessionIdParam)&&!re(e)&&(this.g.D=e,null!==(t=this.h)&&e in t&&(e in(t=this.h)&&delete t[e])),this.j=new Ni(this)}function Ai(t){Pn.call(this);var e=t.__sm__;if(e){t:{for(const n in e){t=n;break t}t=void 0}(this.i=t)&&(t=this.i,e=null!==e&&t in e?e[t]:void 0),this.data=e}else this.data=t}function Di(){Un.call(this),this.status=1}function Ni(t){this.g=t}(Vt=Kr.prototype).Ka=function(t){this.L=t},Vt.da=function(t,e,n,r){if(this.g)throw Error("[goog.net.XhrIo] Object is active with another request="+this.H+"; newUri="+t);e=e?e.toUpperCase():"GET",this.H=t,this.j="",this.m=0,this.D=!1,this.h=!0,this.g=this.u?this.u.g():Vn.g(),this.C=this.u?On(this.u):On(Vn),this.g.onreadystatechange=Wt(this.Ha,this);try{this.F=!0,this.g.open(e,String(t),!0),this.F=!1}catch(t){return void Qr(this,t)}if(t=n||"",n=new Map(this.headers),r)if(Object.getPrototypeOf(r)===Object.prototype)for(var i in r)n.set(i,r[i]);else{if("function"!=typeof r.keys||"function"!=typeof r.get)throw Error("Unknown input type for opt_headers: "+String(r));for(const t of r.keys())n.set(t,r.get(t))}r=Array.from(n.keys()).find((t=>"content-type"==t.toLowerCase())),i=jt.FormData&&t instanceof jt.FormData,!(0<=Jt(Wr,e))||r||i||n.set("Content-Type","application/x-www-form-urlencoded;charset=utf-8");for(const[t,e]of n)this.g.setRequestHeader(t,e);this.J&&(this.g.responseType=this.J),"withCredentials"in this.g&&this.g.withCredentials!==this.L&&(this.g.withCredentials=this.L);try{Zr(this),0<this.B&&((this.K=function(t){return fe&&Te()&&"number"==typeof t.timeout&&void 0!==t.ontimeout}(this.g))?(this.g.timeout=this.B,this.g.ontimeout=Wt(this.qa,this)):this.A=dn(this.qa,this.B,this)),this.v=!0,this.g.send(t),this.v=!1}catch(t){Qr(this,t)}},Vt.qa=function(){void 0!==Ut&&this.g&&(this.j="Timed out after "+this.B+"ms, aborting",this.m=8,Je(this,"timeout"),this.abort(8))},Vt.abort=function(t){this.g&&this.h&&(this.h=!1,this.l=!0,this.g.abort(),this.l=!1,this.m=t||7,Je(this,"complete"),Je(this,"abort"),Jr(this))},Vt.M=function(){this.g&&(this.h&&(this.h=!1,this.l=!0,this.g.abort(),this.l=!1),Jr(this,!0)),Kr.X.M.call(this)},Vt.Ha=function(){this.s||(this.F||this.v||this.l?Xr(this):this.fb())},Vt.fb=function(){Xr(this)},Vt.aa=function(){try{return 2<ti(this)?this.g.status:-1}catch(t){return-1}},Vt.fa=function(){try{return this.g?this.g.responseText:""}catch(t){return""}},Vt.Sa=function(t){if(this.g){var e=this.g.responseText;return t&&0==e.indexOf(t)&&(e=e.substring(t.length)),zr(e)}},Vt.Ea=function(){return this.m},Vt.Oa=function(){return"string"==typeof this.j?this.j:String(this.j)},(Vt=si.prototype).ma=8,Vt.G=1,Vt.Ja=function(t){if(this.m)if(this.m=null,1==this.G){if(!t){this.U=Math.floor(1e5*Math.random()),t=this.U++;const i=new Bn(this,this.j,t,void 0);let s=this.s;if(this.S&&(s?(s=Le(s),Me(s,this.S)):s=this.S),null!==this.o||this.N||(i.H=s,s=null),this.O)t:{for(var e=0,n=0;n<this.i.length;n++){var r=this.i[n];if(void 0===(r="__data__"in r.g&&"string"==typeof(r=r.g.__data__)?r.length:void 0))break;if(4096<(e+=r)){e=n;break t}if(4096===e||n===this.i.length-1){e=n+1;break t}}e=1e3}else e=1e3;e=fi(this,i,e),lr(n=or(this.F),"RID",t),lr(n,"CVER",22),this.D&&lr(n,"X-HTTP-Session-Id",this.D),hi(this,n),s&&(this.N?e="headers="+encodeURIComponent(String(ni(s)))+"&"+e:this.o&&ri(n,this.o,s)),xr(this.h,i),this.Ya&&lr(n,"TYPE","init"),this.O?(lr(n,"$req",e),lr(n,"SID","null"),i.Z=!0,Gn(i,n,null)):Gn(i,n,e),this.G=2}}else 3==this.G&&(t?li(this,t):0==this.i.length||Dr(this.h)||li(this))},Vt.Ia=function(){if(this.u=null,mi(this),this.$&&!(this.K||null==this.g||0>=this.P)){var t=2*this.P;this.j.info("BP detection timer enabled: "+t),this.B=kn(Wt(this.eb,this),t)}},Vt.eb=function(){this.B&&(this.B=null,this.j.info("BP detection timeout reached."),this.j.info("Buffering proxy detected and switch to long-polling!"),this.L=!1,this.K=!0,Dn(10),ai(this),mi(this))},Vt.cb=function(){null!=this.v&&(this.v=null,ai(this),pi(this),Dn(19))},Vt.kb=function(t){t?(this.j.info("Successfully pinged google.com"),Dn(2)):(this.j.info("Failed to ping google.com"),Dn(1))},(Vt=Ii.prototype).xa=function(){},Vt.wa=function(){},Vt.va=function(){},Vt.ua=function(){},Vt.Ra=function(){},Ci.prototype.g=function(t,e){return new Si(t,e)},Yt(Si,Xe),Si.prototype.m=function(){this.g.l=this.j,this.A&&(this.g.H=!0);var t=this.g,e=this.l,n=this.h||void 0;Dn(0),t.V=e,t.ia=n||{},t.L=t.Y,t.F=Ei(t,null,t.V),ci(t)},Si.prototype.close=function(){oi(this.g)},Si.prototype.u=function(t){var e=this.g;if("string"==typeof t){var n={};n.__data__=t,t=n}else this.v&&((n={}).__data__=tn(t),t=n);e.i.push(new class{constructor(t,e){this.h=t,this.g=e}}(e.ab++,t)),3==e.G&&ci(e)},Si.prototype.M=function(){this.g.l=null,delete this.j,oi(this.g),delete this.g,Si.X.M.call(this)},Yt(Ai,Pn),Yt(Di,Un),Yt(Ni,Ii),Ni.prototype.xa=function(){Je(this.g,"a")},Ni.prototype.wa=function(t){Je(this.g,new Ai(t))},Ni.prototype.va=function(t){Je(this.g,new Di)},Ni.prototype.ua=function(){Je(this.g,"b")},Ci.prototype.createWebChannel=Ci.prototype.g,Si.prototype.send=Si.prototype.u,Si.prototype.open=Si.prototype.m,Si.prototype.close=Si.prototype.close,xn.NO_ERROR=0,xn.TIMEOUT=8,xn.HTTP_ERROR=6,Rn.COMPLETE="complete",Mn.EventType=Fn,Fn.OPEN="a",Fn.CLOSE="b",Fn.ERROR="c",Fn.MESSAGE="d",Xe.prototype.listen=Xe.prototype.N,Kr.prototype.listenOnce=Kr.prototype.O,Kr.prototype.getLastError=Kr.prototype.Oa,Kr.prototype.getLastErrorCode=Kr.prototype.Ea,Kr.prototype.getStatus=Kr.prototype.aa,Kr.prototype.getResponseJson=Kr.prototype.Sa,Kr.prototype.getResponseText=Kr.prototype.fa,Kr.prototype.send=Kr.prototype.da,Kr.prototype.setWithCredentials=Kr.prototype.Ka;var ki=Pt.createWebChannelTransport=function(){return new Ci},xi=Pt.getStatEventTarget=function(){return In()},Ri=Pt.ErrorCode=xn,Li=Pt.EventType=Rn,Oi=Pt.Event=En,Mi=Pt.Stat={sb:0,vb:1,wb:2,Pb:3,Ub:4,Rb:5,Sb:6,Qb:7,Ob:8,Tb:9,PROXY:10,NOPROXY:11,Mb:12,Ib:13,Jb:14,Hb:15,Kb:16,Lb:17,ob:18,nb:19,pb:20},Vi=Pt.FetchXmlHttpFactory=Pr,Fi=Pt.WebChannel=Mn,Pi=Pt.XhrIo=Kr;const Ui="@firebase/firestore";
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ji{constructor(t){this.uid=t}isAuthenticated(){return null!=this.uid}toKey(){return this.isAuthenticated()?"uid:"+this.uid:"anonymous-user"}isEqual(t){return t.uid===this.uid}}ji.UNAUTHENTICATED=new ji(null),ji.GOOGLE_CREDENTIALS=new ji("google-credentials-uid"),ji.FIRST_PARTY=new ji("first-party-uid"),ji.MOCK_USER=new ji("mock-user");
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
let Bi="9.15.0";
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const qi=new G("@firebase/firestore");function $i(){return qi.logLevel}function zi(t,...e){if(qi.logLevel<=j.DEBUG){const n=e.map(Hi);qi.debug(`Firestore (${Bi}): ${t}`,...n)}}function Ki(t,...e){if(qi.logLevel<=j.ERROR){const n=e.map(Hi);qi.error(`Firestore (${Bi}): ${t}`,...n)}}function Gi(t,...e){if(qi.logLevel<=j.WARN){const n=e.map(Hi);qi.warn(`Firestore (${Bi}): ${t}`,...n)}}function Hi(t){if("string"==typeof t)return t;try{return e=t,JSON.stringify(e)}catch(e){return t}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */var e}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Wi(t="Unexpected state"){const e=`FIRESTORE (${Bi}) INTERNAL ASSERTION FAILED: `+t;throw Ki(e),new Error(e)}function Qi(t,e){t||Wi()}function Yi(t,e){return t}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const Xi={OK:"ok",CANCELLED:"cancelled",UNKNOWN:"unknown",INVALID_ARGUMENT:"invalid-argument",DEADLINE_EXCEEDED:"deadline-exceeded",NOT_FOUND:"not-found",ALREADY_EXISTS:"already-exists",PERMISSION_DENIED:"permission-denied",UNAUTHENTICATED:"unauthenticated",RESOURCE_EXHAUSTED:"resource-exhausted",FAILED_PRECONDITION:"failed-precondition",ABORTED:"aborted",OUT_OF_RANGE:"out-of-range",UNIMPLEMENTED:"unimplemented",INTERNAL:"internal",UNAVAILABLE:"unavailable",DATA_LOSS:"data-loss"};class Ji extends N{constructor(t,e){super(t,e),this.code=t,this.message=e,this.toString=()=>`${this.name}: [code=${this.code}]: ${this.message}`}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Zi{constructor(){this.promise=new Promise(((t,e)=>{this.resolve=t,this.reject=e}))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ts{constructor(t,e){this.user=e,this.type="OAuth",this.headers=new Map,this.headers.set("Authorization",`Bearer ${t}`)}}class es{getToken(){return Promise.resolve(null)}invalidateToken(){}start(t,e){t.enqueueRetryable((()=>e(ji.UNAUTHENTICATED)))}shutdown(){}}class ns{constructor(t){this.token=t,this.changeListener=null}getToken(){return Promise.resolve(this.token)}invalidateToken(){}start(t,e){this.changeListener=e,t.enqueueRetryable((()=>e(this.token.user)))}shutdown(){this.changeListener=null}}class rs{constructor(t){this.t=t,this.currentUser=ji.UNAUTHENTICATED,this.i=0,this.forceRefresh=!1,this.auth=null}start(t,e){let n=this.i;const r=t=>this.i!==n?(n=this.i,e(t)):Promise.resolve();let i=new Zi;this.o=()=>{this.i++,this.currentUser=this.u(),i.resolve(),i=new Zi,t.enqueueRetryable((()=>r(this.currentUser)))};const s=()=>{const e=i;t.enqueueRetryable((async()=>{await e.promise,await r(this.currentUser)}))},o=t=>{zi("FirebaseAuthCredentialsProvider","Auth detected"),this.auth=t,this.auth.addAuthTokenListener(this.o),s()};this.t.onInit((t=>o(t))),setTimeout((()=>{if(!this.auth){const t=this.t.getImmediate({optional:!0});t?o(t):(zi("FirebaseAuthCredentialsProvider","Auth not yet detected"),i.resolve(),i=new Zi)}}),0),s()}getToken(){const t=this.i,e=this.forceRefresh;return this.forceRefresh=!1,this.auth?this.auth.getToken(e).then((e=>this.i!==t?(zi("FirebaseAuthCredentialsProvider","getToken aborted due to token change."),this.getToken()):e?(Qi("string"==typeof e.accessToken),new ts(e.accessToken,this.currentUser)):null)):Promise.resolve(null)}invalidateToken(){this.forceRefresh=!0}shutdown(){this.auth&&this.auth.removeAuthTokenListener(this.o)}u(){const t=this.auth&&this.auth.getUid();return Qi(null===t||"string"==typeof t),new ji(t)}}class is{constructor(t,e,n,r){this.h=t,this.l=e,this.m=n,this.g=r,this.type="FirstParty",this.user=ji.FIRST_PARTY,this.p=new Map}I(){return this.g?this.g():(Qi(!("object"!=typeof this.h||null===this.h||!this.h.auth||!this.h.auth.getAuthHeaderValueForFirstParty)),this.h.auth.getAuthHeaderValueForFirstParty([]))}get headers(){this.p.set("X-Goog-AuthUser",this.l);const t=this.I();return t&&this.p.set("Authorization",t),this.m&&this.p.set("X-Goog-Iam-Authorization-Token",this.m),this.p}}class ss{constructor(t,e,n,r){this.h=t,this.l=e,this.m=n,this.g=r}getToken(){return Promise.resolve(new is(this.h,this.l,this.m,this.g))}start(t,e){t.enqueueRetryable((()=>e(ji.FIRST_PARTY)))}shutdown(){}invalidateToken(){}}class os{constructor(t){this.value=t,this.type="AppCheck",this.headers=new Map,t&&t.length>0&&this.headers.set("x-firebase-appcheck",this.value)}}class as{constructor(t){this.T=t,this.forceRefresh=!1,this.appCheck=null,this.A=null}start(t,e){const n=t=>{null!=t.error&&zi("FirebaseAppCheckTokenProvider",`Error getting App Check token; using placeholder token instead. Error: ${t.error.message}`);const n=t.token!==this.A;return this.A=t.token,zi("FirebaseAppCheckTokenProvider",`Received ${n?"new":"existing"} token.`),n?e(t.token):Promise.resolve()};this.o=e=>{t.enqueueRetryable((()=>n(e)))};const r=t=>{zi("FirebaseAppCheckTokenProvider","AppCheck detected"),this.appCheck=t,this.appCheck.addTokenListener(this.o)};this.T.onInit((t=>r(t))),setTimeout((()=>{if(!this.appCheck){const t=this.T.getImmediate({optional:!0});t?r(t):zi("FirebaseAppCheckTokenProvider","AppCheck not yet detected")}}),0)}getToken(){const t=this.forceRefresh;return this.forceRefresh=!1,this.appCheck?this.appCheck.getToken(t).then((t=>t?(Qi("string"==typeof t.token),this.A=t.token,new os(t.token)):null)):Promise.resolve(null)}invalidateToken(){this.forceRefresh=!0}shutdown(){this.appCheck&&this.appCheck.removeTokenListener(this.o)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
function us(t){const e="undefined"!=typeof self&&(self.crypto||self.msCrypto),n=new Uint8Array(t);if(e&&"function"==typeof e.getRandomValues)e.getRandomValues(n);else for(let e=0;e<t;e++)n[e]=Math.floor(256*Math.random());return n}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class cs{static R(){const t="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",e=Math.floor(256/t.length)*t.length;let n="";for(;n.length<20;){const r=us(40);for(let i=0;i<r.length;++i)n.length<20&&r[i]<e&&(n+=t.charAt(r[i]%t.length))}return n}}function ls(t,e){return t<e?-1:t>e?1:0}function hs(t,e,n){return t.length===e.length&&t.every(((t,r)=>n(t,e[r])))}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class fs{constructor(t,e){if(this.seconds=t,this.nanoseconds=e,e<0)throw new Ji(Xi.INVALID_ARGUMENT,"Timestamp nanoseconds out of range: "+e);if(e>=1e9)throw new Ji(Xi.INVALID_ARGUMENT,"Timestamp nanoseconds out of range: "+e);if(t<-62135596800)throw new Ji(Xi.INVALID_ARGUMENT,"Timestamp seconds out of range: "+t);if(t>=253402300800)throw new Ji(Xi.INVALID_ARGUMENT,"Timestamp seconds out of range: "+t)}static now(){return fs.fromMillis(Date.now())}static fromDate(t){return fs.fromMillis(t.getTime())}static fromMillis(t){const e=Math.floor(t/1e3),n=Math.floor(1e6*(t-1e3*e));return new fs(e,n)}toDate(){return new Date(this.toMillis())}toMillis(){return 1e3*this.seconds+this.nanoseconds/1e6}_compareTo(t){return this.seconds===t.seconds?ls(this.nanoseconds,t.nanoseconds):ls(this.seconds,t.seconds)}isEqual(t){return t.seconds===this.seconds&&t.nanoseconds===this.nanoseconds}toString(){return"Timestamp(seconds="+this.seconds+", nanoseconds="+this.nanoseconds+")"}toJSON(){return{seconds:this.seconds,nanoseconds:this.nanoseconds}}valueOf(){const t=this.seconds- -62135596800;return String(t).padStart(12,"0")+"."+String(this.nanoseconds).padStart(9,"0")}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ds{constructor(t){this.timestamp=t}static fromTimestamp(t){return new ds(t)}static min(){return new ds(new fs(0,0))}static max(){return new ds(new fs(253402300799,999999999))}compareTo(t){return this.timestamp._compareTo(t.timestamp)}isEqual(t){return this.timestamp.isEqual(t.timestamp)}toMicroseconds(){return 1e6*this.timestamp.seconds+this.timestamp.nanoseconds/1e3}toString(){return"SnapshotVersion("+this.timestamp.toString()+")"}toTimestamp(){return this.timestamp}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ps{constructor(t,e,n){void 0===e?e=0:e>t.length&&Wi(),void 0===n?n=t.length-e:n>t.length-e&&Wi(),this.segments=t,this.offset=e,this.len=n}get length(){return this.len}isEqual(t){return 0===ps.comparator(this,t)}child(t){const e=this.segments.slice(this.offset,this.limit());return t instanceof ps?t.forEach((t=>{e.push(t)})):e.push(t),this.construct(e)}limit(){return this.offset+this.length}popFirst(t){return t=void 0===t?1:t,this.construct(this.segments,this.offset+t,this.length-t)}popLast(){return this.construct(this.segments,this.offset,this.length-1)}firstSegment(){return this.segments[this.offset]}lastSegment(){return this.get(this.length-1)}get(t){return this.segments[this.offset+t]}isEmpty(){return 0===this.length}isPrefixOf(t){if(t.length<this.length)return!1;for(let e=0;e<this.length;e++)if(this.get(e)!==t.get(e))return!1;return!0}isImmediateParentOf(t){if(this.length+1!==t.length)return!1;for(let e=0;e<this.length;e++)if(this.get(e)!==t.get(e))return!1;return!0}forEach(t){for(let e=this.offset,n=this.limit();e<n;e++)t(this.segments[e])}toArray(){return this.segments.slice(this.offset,this.limit())}static comparator(t,e){const n=Math.min(t.length,e.length);for(let r=0;r<n;r++){const n=t.get(r),i=e.get(r);if(n<i)return-1;if(n>i)return 1}return t.length<e.length?-1:t.length>e.length?1:0}}class gs extends ps{construct(t,e,n){return new gs(t,e,n)}canonicalString(){return this.toArray().join("/")}toString(){return this.canonicalString()}static fromString(...t){const e=[];for(const n of t){if(n.indexOf("//")>=0)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid segment (${n}). Paths must not contain // in them.`);e.push(...n.split("/").filter((t=>t.length>0)))}return new gs(e)}static emptyPath(){return new gs([])}}const ms=/^[_a-zA-Z][_a-zA-Z0-9]*$/;class ys extends ps{construct(t,e,n){return new ys(t,e,n)}static isValidIdentifier(t){return ms.test(t)}canonicalString(){return this.toArray().map((t=>(t=t.replace(/\\/g,"\\\\").replace(/`/g,"\\`"),ys.isValidIdentifier(t)||(t="`"+t+"`"),t))).join(".")}toString(){return this.canonicalString()}isKeyField(){return 1===this.length&&"__name__"===this.get(0)}static keyField(){return new ys(["__name__"])}static fromServerFormat(t){const e=[];let n="",r=0;const i=()=>{if(0===n.length)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid field path (${t}). Paths must not be empty, begin with '.', end with '.', or contain '..'`);e.push(n),n=""};let s=!1;for(;r<t.length;){const e=t[r];if("\\"===e){if(r+1===t.length)throw new Ji(Xi.INVALID_ARGUMENT,"Path has trailing escape character: "+t);const e=t[r+1];if("\\"!==e&&"."!==e&&"`"!==e)throw new Ji(Xi.INVALID_ARGUMENT,"Path has invalid escape sequence: "+t);n+=e,r+=2}else"`"===e?(s=!s,r++):"."!==e||s?(n+=e,r++):(i(),r++)}if(i(),s)throw new Ji(Xi.INVALID_ARGUMENT,"Unterminated ` in path: "+t);return new ys(e)}static emptyPath(){return new ys([])}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class vs{constructor(t){this.path=t}static fromPath(t){return new vs(gs.fromString(t))}static fromName(t){return new vs(gs.fromString(t).popFirst(5))}static empty(){return new vs(gs.emptyPath())}get collectionGroup(){return this.path.popLast().lastSegment()}hasCollectionId(t){return this.path.length>=2&&this.path.get(this.path.length-2)===t}getCollectionGroup(){return this.path.get(this.path.length-2)}getCollectionPath(){return this.path.popLast()}isEqual(t){return null!==t&&0===gs.comparator(this.path,t.path)}toString(){return this.path.toString()}static comparator(t,e){return gs.comparator(t.path,e.path)}static isDocumentKey(t){return t.length%2==0}static fromSegments(t){return new vs(new gs(t.slice()))}}
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ws{constructor(t,e,n,r){this.indexId=t,this.collectionGroup=e,this.fields=n,this.indexState=r}}ws.UNKNOWN_ID=-1;function _s(t,e){const n=t.toTimestamp().seconds,r=t.toTimestamp().nanoseconds+1,i=ds.fromTimestamp(1e9===r?new fs(n+1,0):new fs(n,r));return new Es(i,vs.empty(),e)}function bs(t){return new Es(t.readTime,t.key,-1)}class Es{constructor(t,e,n){this.readTime=t,this.documentKey=e,this.largestBatchId=n}static min(){return new Es(ds.min(),vs.empty(),-1)}static max(){return new Es(ds.max(),vs.empty(),-1)}}function Ts(t,e){let n=t.readTime.compareTo(e.readTime);return 0!==n?n:(n=vs.comparator(t.documentKey,e.documentKey),0!==n?n:ls(t.largestBatchId,e.largestBatchId))}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const Is="The current tab is not in the required state to perform this operation. It might be necessary to refresh the browser tab.";class Cs{constructor(){this.onCommittedListeners=[]}addOnCommittedListener(t){this.onCommittedListeners.push(t)}raiseOnCommittedEvent(){this.onCommittedListeners.forEach((t=>t()))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */async function Ss(t){if(t.code!==Xi.FAILED_PRECONDITION||t.message!==Is)throw t;zi("LocalStore","Unexpectedly lost primary lease")}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class As{constructor(t){this.nextCallback=null,this.catchCallback=null,this.result=void 0,this.error=void 0,this.isDone=!1,this.callbackAttached=!1,t((t=>{this.isDone=!0,this.result=t,this.nextCallback&&this.nextCallback(t)}),(t=>{this.isDone=!0,this.error=t,this.catchCallback&&this.catchCallback(t)}))}catch(t){return this.next(void 0,t)}next(t,e){return this.callbackAttached&&Wi(),this.callbackAttached=!0,this.isDone?this.error?this.wrapFailure(e,this.error):this.wrapSuccess(t,this.result):new As(((n,r)=>{this.nextCallback=e=>{this.wrapSuccess(t,e).next(n,r)},this.catchCallback=t=>{this.wrapFailure(e,t).next(n,r)}}))}toPromise(){return new Promise(((t,e)=>{this.next(t,e)}))}wrapUserFunction(t){try{const e=t();return e instanceof As?e:As.resolve(e)}catch(t){return As.reject(t)}}wrapSuccess(t,e){return t?this.wrapUserFunction((()=>t(e))):As.resolve(e)}wrapFailure(t,e){return t?this.wrapUserFunction((()=>t(e))):As.reject(e)}static resolve(t){return new As(((e,n)=>{e(t)}))}static reject(t){return new As(((e,n)=>{n(t)}))}static waitFor(t){return new As(((e,n)=>{let r=0,i=0,s=!1;t.forEach((t=>{++r,t.next((()=>{++i,s&&i===r&&e()}),(t=>n(t)))})),s=!0,i===r&&e()}))}static or(t){let e=As.resolve(!1);for(const n of t)e=e.next((t=>t?As.resolve(t):n()));return e}static forEach(t,e){const n=[];return t.forEach(((t,r)=>{n.push(e.call(this,t,r))})),this.waitFor(n)}static mapArray(t,e){return new As(((n,r)=>{const i=t.length,s=new Array(i);let o=0;for(let a=0;a<i;a++){const u=a;e(t[u]).next((t=>{s[u]=t,++o,o===i&&n(s)}),(t=>r(t)))}}))}static doWhile(t,e){return new As(((n,r)=>{const i=()=>{!0===t()?e().next((()=>{i()}),r):n()};i()}))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Ds(t){return"IndexedDbTransactionError"===t.name}
/**
 * @license
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Ns{constructor(t,e){this.previousValue=t,e&&(e.sequenceNumberHandler=t=>this.ut(t),this.ct=t=>e.writeSequenceNumber(t))}ut(t){return this.previousValue=Math.max(t,this.previousValue),this.previousValue}next(){const t=++this.previousValue;return this.ct&&this.ct(t),t}}Ns.at=-1;
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class ks{constructor(t,e,n,r,i,s,o,a){this.databaseId=t,this.appId=e,this.persistenceKey=n,this.host=r,this.ssl=i,this.forceLongPolling=s,this.autoDetectLongPolling=o,this.useFetchStreams=a}}class xs{constructor(t,e){this.projectId=t,this.database=e||"(default)"}static empty(){return new xs("","")}get isDefaultDatabase(){return"(default)"===this.database}isEqual(t){return t instanceof xs&&t.projectId===this.projectId&&t.database===this.database}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Rs(t){let e=0;for(const n in t)Object.prototype.hasOwnProperty.call(t,n)&&e++;return e}function Ls(t,e){for(const n in t)Object.prototype.hasOwnProperty.call(t,n)&&e(n,t[n])}function Os(t){for(const e in t)if(Object.prototype.hasOwnProperty.call(t,e))return!1;return!0}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Ms(t){return null==t}function Vs(t){return 0===t&&1/t==-1/0}function Fs(t){return"number"==typeof t&&Number.isInteger(t)&&!Vs(t)&&t<=Number.MAX_SAFE_INTEGER&&t>=Number.MIN_SAFE_INTEGER}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Ps{constructor(t){this.binaryString=t}static fromBase64String(t){const e=atob(t);return new Ps(e)}static fromUint8Array(t){const e=function(t){let e="";for(let n=0;n<t.length;++n)e+=String.fromCharCode(t[n]);return e}(t);return new Ps(e)}[Symbol.iterator](){let t=0;return{next:()=>t<this.binaryString.length?{value:this.binaryString.charCodeAt(t++),done:!1}:{value:void 0,done:!0}}}toBase64(){var t;return t=this.binaryString,btoa(t)}toUint8Array(){return function(t){const e=new Uint8Array(t.length);for(let n=0;n<t.length;n++)e[n]=t.charCodeAt(n);return e}(this.binaryString)}approximateByteSize(){return 2*this.binaryString.length}compareTo(t){return ls(this.binaryString,t.binaryString)}isEqual(t){return this.binaryString===t.binaryString}}Ps.EMPTY_BYTE_STRING=new Ps("");const Us=new RegExp(/^\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.(\d+))?Z$/);function js(t){if(Qi(!!t),"string"==typeof t){let e=0;const n=Us.exec(t);if(Qi(!!n),n[1]){let t=n[1];t=(t+"000000000").substr(0,9),e=Number(t)}const r=new Date(t);return{seconds:Math.floor(r.getTime()/1e3),nanos:e}}return{seconds:Bs(t.seconds),nanos:Bs(t.nanos)}}function Bs(t){return"number"==typeof t?t:"string"==typeof t?Number(t):0}function qs(t){return"string"==typeof t?Ps.fromBase64String(t):Ps.fromUint8Array(t)}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function $s(t){var e,n;return"server_timestamp"===(null===(n=((null===(e=null==t?void 0:t.mapValue)||void 0===e?void 0:e.fields)||{}).__type__)||void 0===n?void 0:n.stringValue)}function zs(t){const e=t.mapValue.fields.__previous_value__;return $s(e)?zs(e):e}function Ks(t){const e=js(t.mapValue.fields.__local_write_time__.timestampValue);return new fs(e.seconds,e.nanos)}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const Gs={mapValue:{fields:{__type__:{stringValue:"__max__"}}}};function Hs(t){return"nullValue"in t?0:"booleanValue"in t?1:"integerValue"in t||"doubleValue"in t?2:"timestampValue"in t?3:"stringValue"in t?5:"bytesValue"in t?6:"referenceValue"in t?7:"geoPointValue"in t?8:"arrayValue"in t?9:"mapValue"in t?$s(t)?4:ao(t)?9007199254740991:10:Wi()}function Ws(t,e){if(t===e)return!0;const n=Hs(t);if(n!==Hs(e))return!1;switch(n){case 0:case 9007199254740991:return!0;case 1:return t.booleanValue===e.booleanValue;case 4:return Ks(t).isEqual(Ks(e));case 3:return function(t,e){if("string"==typeof t.timestampValue&&"string"==typeof e.timestampValue&&t.timestampValue.length===e.timestampValue.length)return t.timestampValue===e.timestampValue;const n=js(t.timestampValue),r=js(e.timestampValue);return n.seconds===r.seconds&&n.nanos===r.nanos}(t,e);case 5:return t.stringValue===e.stringValue;case 6:return function(t,e){return qs(t.bytesValue).isEqual(qs(e.bytesValue))}(t,e);case 7:return t.referenceValue===e.referenceValue;case 8:return function(t,e){return Bs(t.geoPointValue.latitude)===Bs(e.geoPointValue.latitude)&&Bs(t.geoPointValue.longitude)===Bs(e.geoPointValue.longitude)}(t,e);case 2:return function(t,e){if("integerValue"in t&&"integerValue"in e)return Bs(t.integerValue)===Bs(e.integerValue);if("doubleValue"in t&&"doubleValue"in e){const n=Bs(t.doubleValue),r=Bs(e.doubleValue);return n===r?Vs(n)===Vs(r):isNaN(n)&&isNaN(r)}return!1}(t,e);case 9:return hs(t.arrayValue.values||[],e.arrayValue.values||[],Ws);case 10:return function(t,e){const n=t.mapValue.fields||{},r=e.mapValue.fields||{};if(Rs(n)!==Rs(r))return!1;for(const t in n)if(n.hasOwnProperty(t)&&(void 0===r[t]||!Ws(n[t],r[t])))return!1;return!0}(t,e);default:return Wi()}}function Qs(t,e){return void 0!==(t.values||[]).find((t=>Ws(t,e)))}function Ys(t,e){if(t===e)return 0;const n=Hs(t),r=Hs(e);if(n!==r)return ls(n,r);switch(n){case 0:case 9007199254740991:return 0;case 1:return ls(t.booleanValue,e.booleanValue);case 2:return function(t,e){const n=Bs(t.integerValue||t.doubleValue),r=Bs(e.integerValue||e.doubleValue);return n<r?-1:n>r?1:n===r?0:isNaN(n)?isNaN(r)?0:-1:1}(t,e);case 3:return Xs(t.timestampValue,e.timestampValue);case 4:return Xs(Ks(t),Ks(e));case 5:return ls(t.stringValue,e.stringValue);case 6:return function(t,e){const n=qs(t),r=qs(e);return n.compareTo(r)}(t.bytesValue,e.bytesValue);case 7:return function(t,e){const n=t.split("/"),r=e.split("/");for(let t=0;t<n.length&&t<r.length;t++){const e=ls(n[t],r[t]);if(0!==e)return e}return ls(n.length,r.length)}(t.referenceValue,e.referenceValue);case 8:return function(t,e){const n=ls(Bs(t.latitude),Bs(e.latitude));return 0!==n?n:ls(Bs(t.longitude),Bs(e.longitude))}(t.geoPointValue,e.geoPointValue);case 9:return function(t,e){const n=t.values||[],r=e.values||[];for(let t=0;t<n.length&&t<r.length;++t){const e=Ys(n[t],r[t]);if(e)return e}return ls(n.length,r.length)}(t.arrayValue,e.arrayValue);case 10:return function(t,e){if(t===Gs.mapValue&&e===Gs.mapValue)return 0;if(t===Gs.mapValue)return 1;if(e===Gs.mapValue)return-1;const n=t.fields||{},r=Object.keys(n),i=e.fields||{},s=Object.keys(i);r.sort(),s.sort();for(let t=0;t<r.length&&t<s.length;++t){const e=ls(r[t],s[t]);if(0!==e)return e;const o=Ys(n[r[t]],i[s[t]]);if(0!==o)return o}return ls(r.length,s.length)}(t.mapValue,e.mapValue);default:throw Wi()}}function Xs(t,e){if("string"==typeof t&&"string"==typeof e&&t.length===e.length)return ls(t,e);const n=js(t),r=js(e),i=ls(n.seconds,r.seconds);return 0!==i?i:ls(n.nanos,r.nanos)}function Js(t){return Zs(t)}function Zs(t){var e,n;return"nullValue"in t?"null":"booleanValue"in t?""+t.booleanValue:"integerValue"in t?""+t.integerValue:"doubleValue"in t?""+t.doubleValue:"timestampValue"in t?function(t){const e=js(t);return`time(${e.seconds},${e.nanos})`}(t.timestampValue):"stringValue"in t?t.stringValue:"bytesValue"in t?qs(t.bytesValue).toBase64():"referenceValue"in t?(n=t.referenceValue,vs.fromName(n).toString()):"geoPointValue"in t?`geo(${(e=t.geoPointValue).latitude},${e.longitude})`:"arrayValue"in t?function(t){let e="[",n=!0;for(const r of t.values||[])n?n=!1:e+=",",e+=Zs(r);return e+"]"}(t.arrayValue):"mapValue"in t?function(t){const e=Object.keys(t.fields||{}).sort();let n="{",r=!0;for(const i of e)r?r=!1:n+=",",n+=`${i}:${Zs(t.fields[i])}`;return n+"}"}(t.mapValue):Wi()}function to(t,e){return{referenceValue:`projects/${t.projectId}/databases/${t.database}/documents/${e.path.canonicalString()}`}}function eo(t){return!!t&&"integerValue"in t}function no(t){return!!t&&"arrayValue"in t}function ro(t){return!!t&&"nullValue"in t}function io(t){return!!t&&"doubleValue"in t&&isNaN(Number(t.doubleValue))}function so(t){return!!t&&"mapValue"in t}function oo(t){if(t.geoPointValue)return{geoPointValue:Object.assign({},t.geoPointValue)};if(t.timestampValue&&"object"==typeof t.timestampValue)return{timestampValue:Object.assign({},t.timestampValue)};if(t.mapValue){const e={mapValue:{fields:{}}};return Ls(t.mapValue.fields,((t,n)=>e.mapValue.fields[t]=oo(n))),e}if(t.arrayValue){const e={arrayValue:{values:[]}};for(let n=0;n<(t.arrayValue.values||[]).length;++n)e.arrayValue.values[n]=oo(t.arrayValue.values[n]);return e}return Object.assign({},t)}function ao(t){return"__max__"===(((t.mapValue||{}).fields||{}).__type__||{}).stringValue}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class uo{constructor(t,e){this.position=t,this.inclusive=e}}function co(t,e,n){let r=0;for(let i=0;i<t.position.length;i++){const s=e[i],o=t.position[i];if(r=s.field.isKeyField()?vs.comparator(vs.fromName(o.referenceValue),n.key):Ys(o,n.data.field(s.field)),"desc"===s.dir&&(r*=-1),0!==r)break}return r}function lo(t,e){if(null===t)return null===e;if(null===e)return!1;if(t.inclusive!==e.inclusive||t.position.length!==e.position.length)return!1;for(let n=0;n<t.position.length;n++)if(!Ws(t.position[n],e.position[n]))return!1;return!0}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ho{}class fo extends ho{constructor(t,e,n){super(),this.field=t,this.op=e,this.value=n}static create(t,e,n){return t.isKeyField()?"in"===e||"not-in"===e?this.createKeyFieldInFilter(t,e,n):new bo(t,e,n):"array-contains"===e?new Co(t,n):"in"===e?new So(t,n):"not-in"===e?new Ao(t,n):"array-contains-any"===e?new Do(t,n):new fo(t,e,n)}static createKeyFieldInFilter(t,e,n){return"in"===e?new Eo(t,n):new To(t,n)}matches(t){const e=t.data.field(this.field);return"!="===this.op?null!==e&&this.matchesComparison(Ys(e,this.value)):null!==e&&Hs(this.value)===Hs(e)&&this.matchesComparison(Ys(e,this.value))}matchesComparison(t){switch(this.op){case"<":return t<0;case"<=":return t<=0;case"==":return 0===t;case"!=":return 0!==t;case">":return t>0;case">=":return t>=0;default:return Wi()}}isInequality(){return["<","<=",">",">=","!=","not-in"].indexOf(this.op)>=0}getFlattenedFilters(){return[this]}getFilters(){return[this]}getFirstInequalityField(){return this.isInequality()?this.field:null}}class po extends ho{constructor(t,e){super(),this.filters=t,this.op=e,this.ht=null}static create(t,e){return new po(t,e)}matches(t){return go(this)?void 0===this.filters.find((e=>!e.matches(t))):void 0!==this.filters.find((e=>e.matches(t)))}getFlattenedFilters(){return null!==this.ht||(this.ht=this.filters.reduce(((t,e)=>t.concat(e.getFlattenedFilters())),[])),this.ht}getFilters(){return Object.assign([],this.filters)}getFirstInequalityField(){const t=this.lt((t=>t.isInequality()));return null!==t?t.field:null}lt(t){for(const e of this.getFlattenedFilters())if(t(e))return e;return null}}function go(t){return"and"===t.op}function mo(t){return yo(t)&&go(t)}function yo(t){for(const e of t.filters)if(e instanceof po)return!1;return!0}function vo(t){if(t instanceof fo)return t.field.canonicalString()+t.op.toString()+Js(t.value);{const e=t.filters.map((t=>vo(t))).join(",");return`${t.op}(${e})`}}function wo(t,e){return t instanceof fo?function(t,e){return e instanceof fo&&t.op===e.op&&t.field.isEqual(e.field)&&Ws(t.value,e.value)}(t,e):t instanceof po?function(t,e){return e instanceof po&&t.op===e.op&&t.filters.length===e.filters.length&&t.filters.reduce(((t,n,r)=>t&&wo(n,e.filters[r])),!0)}(t,e):void Wi()}function _o(t){return t instanceof fo?function(t){return`${t.field.canonicalString()} ${t.op} ${Js(t.value)}`}(t):t instanceof po?function(t){return t.op.toString()+" {"+t.getFilters().map(_o).join(" ,")+"}"}(t):"Filter"}class bo extends fo{constructor(t,e,n){super(t,e,n),this.key=vs.fromName(n.referenceValue)}matches(t){const e=vs.comparator(t.key,this.key);return this.matchesComparison(e)}}class Eo extends fo{constructor(t,e){super(t,"in",e),this.keys=Io("in",e)}matches(t){return this.keys.some((e=>e.isEqual(t.key)))}}class To extends fo{constructor(t,e){super(t,"not-in",e),this.keys=Io("not-in",e)}matches(t){return!this.keys.some((e=>e.isEqual(t.key)))}}function Io(t,e){var n;return((null===(n=e.arrayValue)||void 0===n?void 0:n.values)||[]).map((t=>vs.fromName(t.referenceValue)))}class Co extends fo{constructor(t,e){super(t,"array-contains",e)}matches(t){const e=t.data.field(this.field);return no(e)&&Qs(e.arrayValue,this.value)}}class So extends fo{constructor(t,e){super(t,"in",e)}matches(t){const e=t.data.field(this.field);return null!==e&&Qs(this.value.arrayValue,e)}}class Ao extends fo{constructor(t,e){super(t,"not-in",e)}matches(t){if(Qs(this.value.arrayValue,{nullValue:"NULL_VALUE"}))return!1;const e=t.data.field(this.field);return null!==e&&!Qs(this.value.arrayValue,e)}}class Do extends fo{constructor(t,e){super(t,"array-contains-any",e)}matches(t){const e=t.data.field(this.field);return!(!no(e)||!e.arrayValue.values)&&e.arrayValue.values.some((t=>Qs(this.value.arrayValue,t)))}}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class No{constructor(t,e="asc"){this.field=t,this.dir=e}}function ko(t,e){return t.dir===e.dir&&t.field.isEqual(e.field)}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class xo{constructor(t,e){this.comparator=t,this.root=e||Lo.EMPTY}insert(t,e){return new xo(this.comparator,this.root.insert(t,e,this.comparator).copy(null,null,Lo.BLACK,null,null))}remove(t){return new xo(this.comparator,this.root.remove(t,this.comparator).copy(null,null,Lo.BLACK,null,null))}get(t){let e=this.root;for(;!e.isEmpty();){const n=this.comparator(t,e.key);if(0===n)return e.value;n<0?e=e.left:n>0&&(e=e.right)}return null}indexOf(t){let e=0,n=this.root;for(;!n.isEmpty();){const r=this.comparator(t,n.key);if(0===r)return e+n.left.size;r<0?n=n.left:(e+=n.left.size+1,n=n.right)}return-1}isEmpty(){return this.root.isEmpty()}get size(){return this.root.size}minKey(){return this.root.minKey()}maxKey(){return this.root.maxKey()}inorderTraversal(t){return this.root.inorderTraversal(t)}forEach(t){this.inorderTraversal(((e,n)=>(t(e,n),!1)))}toString(){const t=[];return this.inorderTraversal(((e,n)=>(t.push(`${e}:${n}`),!1))),`{${t.join(", ")}}`}reverseTraversal(t){return this.root.reverseTraversal(t)}getIterator(){return new Ro(this.root,null,this.comparator,!1)}getIteratorFrom(t){return new Ro(this.root,t,this.comparator,!1)}getReverseIterator(){return new Ro(this.root,null,this.comparator,!0)}getReverseIteratorFrom(t){return new Ro(this.root,t,this.comparator,!0)}}class Ro{constructor(t,e,n,r){this.isReverse=r,this.nodeStack=[];let i=1;for(;!t.isEmpty();)if(i=e?n(t.key,e):1,e&&r&&(i*=-1),i<0)t=this.isReverse?t.left:t.right;else{if(0===i){this.nodeStack.push(t);break}this.nodeStack.push(t),t=this.isReverse?t.right:t.left}}getNext(){let t=this.nodeStack.pop();const e={key:t.key,value:t.value};if(this.isReverse)for(t=t.left;!t.isEmpty();)this.nodeStack.push(t),t=t.right;else for(t=t.right;!t.isEmpty();)this.nodeStack.push(t),t=t.left;return e}hasNext(){return this.nodeStack.length>0}peek(){if(0===this.nodeStack.length)return null;const t=this.nodeStack[this.nodeStack.length-1];return{key:t.key,value:t.value}}}class Lo{constructor(t,e,n,r,i){this.key=t,this.value=e,this.color=null!=n?n:Lo.RED,this.left=null!=r?r:Lo.EMPTY,this.right=null!=i?i:Lo.EMPTY,this.size=this.left.size+1+this.right.size}copy(t,e,n,r,i){return new Lo(null!=t?t:this.key,null!=e?e:this.value,null!=n?n:this.color,null!=r?r:this.left,null!=i?i:this.right)}isEmpty(){return!1}inorderTraversal(t){return this.left.inorderTraversal(t)||t(this.key,this.value)||this.right.inorderTraversal(t)}reverseTraversal(t){return this.right.reverseTraversal(t)||t(this.key,this.value)||this.left.reverseTraversal(t)}min(){return this.left.isEmpty()?this:this.left.min()}minKey(){return this.min().key}maxKey(){return this.right.isEmpty()?this.key:this.right.maxKey()}insert(t,e,n){let r=this;const i=n(t,r.key);return r=i<0?r.copy(null,null,null,r.left.insert(t,e,n),null):0===i?r.copy(null,e,null,null,null):r.copy(null,null,null,null,r.right.insert(t,e,n)),r.fixUp()}removeMin(){if(this.left.isEmpty())return Lo.EMPTY;let t=this;return t.left.isRed()||t.left.left.isRed()||(t=t.moveRedLeft()),t=t.copy(null,null,null,t.left.removeMin(),null),t.fixUp()}remove(t,e){let n,r=this;if(e(t,r.key)<0)r.left.isEmpty()||r.left.isRed()||r.left.left.isRed()||(r=r.moveRedLeft()),r=r.copy(null,null,null,r.left.remove(t,e),null);else{if(r.left.isRed()&&(r=r.rotateRight()),r.right.isEmpty()||r.right.isRed()||r.right.left.isRed()||(r=r.moveRedRight()),0===e(t,r.key)){if(r.right.isEmpty())return Lo.EMPTY;n=r.right.min(),r=r.copy(n.key,n.value,null,null,r.right.removeMin())}r=r.copy(null,null,null,null,r.right.remove(t,e))}return r.fixUp()}isRed(){return this.color}fixUp(){let t=this;return t.right.isRed()&&!t.left.isRed()&&(t=t.rotateLeft()),t.left.isRed()&&t.left.left.isRed()&&(t=t.rotateRight()),t.left.isRed()&&t.right.isRed()&&(t=t.colorFlip()),t}moveRedLeft(){let t=this.colorFlip();return t.right.left.isRed()&&(t=t.copy(null,null,null,null,t.right.rotateRight()),t=t.rotateLeft(),t=t.colorFlip()),t}moveRedRight(){let t=this.colorFlip();return t.left.left.isRed()&&(t=t.rotateRight(),t=t.colorFlip()),t}rotateLeft(){const t=this.copy(null,null,Lo.RED,null,this.right.left);return this.right.copy(null,null,this.color,t,null)}rotateRight(){const t=this.copy(null,null,Lo.RED,this.left.right,null);return this.left.copy(null,null,this.color,null,t)}colorFlip(){const t=this.left.copy(null,null,!this.left.color,null,null),e=this.right.copy(null,null,!this.right.color,null,null);return this.copy(null,null,!this.color,t,e)}checkMaxDepth(){const t=this.check();return Math.pow(2,t)<=this.size+1}check(){if(this.isRed()&&this.left.isRed())throw Wi();if(this.right.isRed())throw Wi();const t=this.left.check();if(t!==this.right.check())throw Wi();return t+(this.isRed()?0:1)}}Lo.EMPTY=null,Lo.RED=!0,Lo.BLACK=!1,Lo.EMPTY=new class{constructor(){this.size=0}get key(){throw Wi()}get value(){throw Wi()}get color(){throw Wi()}get left(){throw Wi()}get right(){throw Wi()}copy(t,e,n,r,i){return this}insert(t,e,n){return new Lo(t,e)}remove(t,e){return this}isEmpty(){return!0}inorderTraversal(t){return!1}reverseTraversal(t){return!1}minKey(){return null}maxKey(){return null}isRed(){return!1}checkMaxDepth(){return!0}check(){return 0}};
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Oo{constructor(t){this.comparator=t,this.data=new xo(this.comparator)}has(t){return null!==this.data.get(t)}first(){return this.data.minKey()}last(){return this.data.maxKey()}get size(){return this.data.size}indexOf(t){return this.data.indexOf(t)}forEach(t){this.data.inorderTraversal(((e,n)=>(t(e),!1)))}forEachInRange(t,e){const n=this.data.getIteratorFrom(t[0]);for(;n.hasNext();){const r=n.getNext();if(this.comparator(r.key,t[1])>=0)return;e(r.key)}}forEachWhile(t,e){let n;for(n=void 0!==e?this.data.getIteratorFrom(e):this.data.getIterator();n.hasNext();)if(!t(n.getNext().key))return}firstAfterOrEqual(t){const e=this.data.getIteratorFrom(t);return e.hasNext()?e.getNext().key:null}getIterator(){return new Mo(this.data.getIterator())}getIteratorFrom(t){return new Mo(this.data.getIteratorFrom(t))}add(t){return this.copy(this.data.remove(t).insert(t,!0))}delete(t){return this.has(t)?this.copy(this.data.remove(t)):this}isEmpty(){return this.data.isEmpty()}unionWith(t){let e=this;return e.size<t.size&&(e=t,t=this),t.forEach((t=>{e=e.add(t)})),e}isEqual(t){if(!(t instanceof Oo))return!1;if(this.size!==t.size)return!1;const e=this.data.getIterator(),n=t.data.getIterator();for(;e.hasNext();){const t=e.getNext().key,r=n.getNext().key;if(0!==this.comparator(t,r))return!1}return!0}toArray(){const t=[];return this.forEach((e=>{t.push(e)})),t}toString(){const t=[];return this.forEach((e=>t.push(e))),"SortedSet("+t.toString()+")"}copy(t){const e=new Oo(this.comparator);return e.data=t,e}}class Mo{constructor(t){this.iter=t}getNext(){return this.iter.getNext().key}hasNext(){return this.iter.hasNext()}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Vo{constructor(t){this.fields=t,t.sort(ys.comparator)}static empty(){return new Vo([])}unionWith(t){let e=new Oo(ys.comparator);for(const t of this.fields)e=e.add(t);for(const n of t)e=e.add(n);return new Vo(e.toArray())}covers(t){for(const e of this.fields)if(e.isPrefixOf(t))return!0;return!1}isEqual(t){return hs(this.fields,t.fields,((t,e)=>t.isEqual(e)))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Fo{constructor(t){this.value=t}static empty(){return new Fo({mapValue:{}})}field(t){if(t.isEmpty())return this.value;{let e=this.value;for(let n=0;n<t.length-1;++n)if(e=(e.mapValue.fields||{})[t.get(n)],!so(e))return null;return e=(e.mapValue.fields||{})[t.lastSegment()],e||null}}set(t,e){this.getFieldsMap(t.popLast())[t.lastSegment()]=oo(e)}setAll(t){let e=ys.emptyPath(),n={},r=[];t.forEach(((t,i)=>{if(!e.isImmediateParentOf(i)){const t=this.getFieldsMap(e);this.applyChanges(t,n,r),n={},r=[],e=i.popLast()}t?n[i.lastSegment()]=oo(t):r.push(i.lastSegment())}));const i=this.getFieldsMap(e);this.applyChanges(i,n,r)}delete(t){const e=this.field(t.popLast());so(e)&&e.mapValue.fields&&delete e.mapValue.fields[t.lastSegment()]}isEqual(t){return Ws(this.value,t.value)}getFieldsMap(t){let e=this.value;e.mapValue.fields||(e.mapValue={fields:{}});for(let n=0;n<t.length;++n){let r=e.mapValue.fields[t.get(n)];so(r)&&r.mapValue.fields||(r={mapValue:{fields:{}}},e.mapValue.fields[t.get(n)]=r),e=r}return e.mapValue.fields}applyChanges(t,e,n){Ls(e,((e,n)=>t[e]=n));for(const e of n)delete t[e]}clone(){return new Fo(oo(this.value))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Po{constructor(t,e,n,r,i,s,o){this.key=t,this.documentType=e,this.version=n,this.readTime=r,this.createTime=i,this.data=s,this.documentState=o}static newInvalidDocument(t){return new Po(t,0,ds.min(),ds.min(),ds.min(),Fo.empty(),0)}static newFoundDocument(t,e,n,r){return new Po(t,1,e,ds.min(),n,r,0)}static newNoDocument(t,e){return new Po(t,2,e,ds.min(),ds.min(),Fo.empty(),0)}static newUnknownDocument(t,e){return new Po(t,3,e,ds.min(),ds.min(),Fo.empty(),2)}convertToFoundDocument(t,e){return!this.createTime.isEqual(ds.min())||2!==this.documentType&&0!==this.documentType||(this.createTime=t),this.version=t,this.documentType=1,this.data=e,this.documentState=0,this}convertToNoDocument(t){return this.version=t,this.documentType=2,this.data=Fo.empty(),this.documentState=0,this}convertToUnknownDocument(t){return this.version=t,this.documentType=3,this.data=Fo.empty(),this.documentState=2,this}setHasCommittedMutations(){return this.documentState=2,this}setHasLocalMutations(){return this.documentState=1,this.version=ds.min(),this}setReadTime(t){return this.readTime=t,this}get hasLocalMutations(){return 1===this.documentState}get hasCommittedMutations(){return 2===this.documentState}get hasPendingWrites(){return this.hasLocalMutations||this.hasCommittedMutations}isValidDocument(){return 0!==this.documentType}isFoundDocument(){return 1===this.documentType}isNoDocument(){return 2===this.documentType}isUnknownDocument(){return 3===this.documentType}isEqual(t){return t instanceof Po&&this.key.isEqual(t.key)&&this.version.isEqual(t.version)&&this.documentType===t.documentType&&this.documentState===t.documentState&&this.data.isEqual(t.data)}mutableCopy(){return new Po(this.key,this.documentType,this.version,this.readTime,this.createTime,this.data.clone(),this.documentState)}toString(){return`Document(${this.key}, ${this.version}, ${JSON.stringify(this.data.value)}, {createTime: ${this.createTime}}), {documentType: ${this.documentType}}), {documentState: ${this.documentState}})`}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Uo{constructor(t,e=null,n=[],r=[],i=null,s=null,o=null){this.path=t,this.collectionGroup=e,this.orderBy=n,this.filters=r,this.limit=i,this.startAt=s,this.endAt=o,this.ft=null}}function jo(t,e=null,n=[],r=[],i=null,s=null,o=null){return new Uo(t,e,n,r,i,s,o)}function Bo(t){const e=Yi(t);if(null===e.ft){let t=e.path.canonicalString();null!==e.collectionGroup&&(t+="|cg:"+e.collectionGroup),t+="|f:",t+=e.filters.map((t=>vo(t))).join(","),t+="|ob:",t+=e.orderBy.map((t=>function(t){return t.field.canonicalString()+t.dir}(t))).join(","),Ms(e.limit)||(t+="|l:",t+=e.limit),e.startAt&&(t+="|lb:",t+=e.startAt.inclusive?"b:":"a:",t+=e.startAt.position.map((t=>Js(t))).join(",")),e.endAt&&(t+="|ub:",t+=e.endAt.inclusive?"a:":"b:",t+=e.endAt.position.map((t=>Js(t))).join(",")),e.ft=t}return e.ft}function qo(t,e){if(t.limit!==e.limit)return!1;if(t.orderBy.length!==e.orderBy.length)return!1;for(let n=0;n<t.orderBy.length;n++)if(!ko(t.orderBy[n],e.orderBy[n]))return!1;if(t.filters.length!==e.filters.length)return!1;for(let n=0;n<t.filters.length;n++)if(!wo(t.filters[n],e.filters[n]))return!1;return t.collectionGroup===e.collectionGroup&&!!t.path.isEqual(e.path)&&!!lo(t.startAt,e.startAt)&&lo(t.endAt,e.endAt)}function $o(t){return vs.isDocumentKey(t.path)&&null===t.collectionGroup&&0===t.filters.length}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class zo{constructor(t,e=null,n=[],r=[],i=null,s="F",o=null,a=null){this.path=t,this.collectionGroup=e,this.explicitOrderBy=n,this.filters=r,this.limit=i,this.limitType=s,this.startAt=o,this.endAt=a,this.dt=null,this._t=null,this.startAt,this.endAt}}function Ko(t,e,n,r,i,s,o,a){return new zo(t,e,n,r,i,s,o,a)}function Go(t){return new zo(t)}function Ho(t){return 0===t.filters.length&&null===t.limit&&null==t.startAt&&null==t.endAt&&(0===t.explicitOrderBy.length||1===t.explicitOrderBy.length&&t.explicitOrderBy[0].field.isKeyField())}function Wo(t){return t.explicitOrderBy.length>0?t.explicitOrderBy[0].field:null}function Qo(t){for(const e of t.filters){const t=e.getFirstInequalityField();if(null!==t)return t}return null}function Yo(t){return null!==t.collectionGroup}function Xo(t){const e=Yi(t);if(null===e.dt){e.dt=[];const t=Qo(e),n=Wo(e);if(null!==t&&null===n)t.isKeyField()||e.dt.push(new No(t)),e.dt.push(new No(ys.keyField(),"asc"));else{let t=!1;for(const n of e.explicitOrderBy)e.dt.push(n),n.field.isKeyField()&&(t=!0);if(!t){const t=e.explicitOrderBy.length>0?e.explicitOrderBy[e.explicitOrderBy.length-1].dir:"asc";e.dt.push(new No(ys.keyField(),t))}}}return e.dt}function Jo(t){const e=Yi(t);if(!e._t)if("F"===e.limitType)e._t=jo(e.path,e.collectionGroup,Xo(e),e.filters,e.limit,e.startAt,e.endAt);else{const t=[];for(const n of Xo(e)){const e="desc"===n.dir?"asc":"desc";t.push(new No(n.field,e))}const n=e.endAt?new uo(e.endAt.position,e.endAt.inclusive):null,r=e.startAt?new uo(e.startAt.position,e.startAt.inclusive):null;e._t=jo(e.path,e.collectionGroup,t,e.filters,e.limit,n,r)}return e._t}function Zo(t,e){e.getFirstInequalityField(),Qo(t);const n=t.filters.concat([e]);return new zo(t.path,t.collectionGroup,t.explicitOrderBy.slice(),n,t.limit,t.limitType,t.startAt,t.endAt)}function ta(t,e,n){return new zo(t.path,t.collectionGroup,t.explicitOrderBy.slice(),t.filters.slice(),e,n,t.startAt,t.endAt)}function ea(t,e){return qo(Jo(t),Jo(e))&&t.limitType===e.limitType}function na(t){return`${Bo(Jo(t))}|lt:${t.limitType}`}function ra(t){return`Query(target=${function(t){let e=t.path.canonicalString();return null!==t.collectionGroup&&(e+=" collectionGroup="+t.collectionGroup),t.filters.length>0&&(e+=`, filters: [${t.filters.map((t=>_o(t))).join(", ")}]`),Ms(t.limit)||(e+=", limit: "+t.limit),t.orderBy.length>0&&(e+=`, orderBy: [${t.orderBy.map((t=>function(t){return`${t.field.canonicalString()} (${t.dir})`}(t))).join(", ")}]`),t.startAt&&(e+=", startAt: ",e+=t.startAt.inclusive?"b:":"a:",e+=t.startAt.position.map((t=>Js(t))).join(",")),t.endAt&&(e+=", endAt: ",e+=t.endAt.inclusive?"a:":"b:",e+=t.endAt.position.map((t=>Js(t))).join(",")),`Target(${e})`}(Jo(t))}; limitType=${t.limitType})`}function ia(t,e){return e.isFoundDocument()&&function(t,e){const n=e.key.path;return null!==t.collectionGroup?e.key.hasCollectionId(t.collectionGroup)&&t.path.isPrefixOf(n):vs.isDocumentKey(t.path)?t.path.isEqual(n):t.path.isImmediateParentOf(n)}(t,e)&&function(t,e){for(const n of Xo(t))if(!n.field.isKeyField()&&null===e.data.field(n.field))return!1;return!0}(t,e)&&function(t,e){for(const n of t.filters)if(!n.matches(e))return!1;return!0}(t,e)&&function(t,e){return!(t.startAt&&!function(t,e,n){const r=co(t,e,n);return t.inclusive?r<=0:r<0}(t.startAt,Xo(t),e))&&!(t.endAt&&!function(t,e,n){const r=co(t,e,n);return t.inclusive?r>=0:r>0}(t.endAt,Xo(t),e))}(t,e)}function sa(t){return t.collectionGroup||(t.path.length%2==1?t.path.lastSegment():t.path.get(t.path.length-2))}function oa(t){return(e,n)=>{let r=!1;for(const i of Xo(t)){const t=aa(i,e,n);if(0!==t)return t;r=r||i.field.isKeyField()}return 0}}function aa(t,e,n){const r=t.field.isKeyField()?vs.comparator(e.key,n.key):function(t,e,n){const r=e.data.field(t),i=n.data.field(t);return null!==r&&null!==i?Ys(r,i):Wi()}(t.field,e,n);switch(t.dir){case"asc":return r;case"desc":return-1*r;default:return Wi()}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function ua(t,e){if(t.wt){if(isNaN(e))return{doubleValue:"NaN"};if(e===1/0)return{doubleValue:"Infinity"};if(e===-1/0)return{doubleValue:"-Infinity"}}return{doubleValue:Vs(e)?"-0":e}}function ca(t){return{integerValue:""+t}}function la(t,e){return Fs(e)?ca(e):ua(t,e)}
/**
 * @license
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ha{constructor(){this._=void 0}}function fa(t,e,n){return t instanceof ga?function(t,e){const n={fields:{__type__:{stringValue:"server_timestamp"},__local_write_time__:{timestampValue:{seconds:t.seconds,nanos:t.nanoseconds}}}};return e&&(n.fields.__previous_value__=e),{mapValue:n}}(n,e):t instanceof ma?ya(t,e):t instanceof va?wa(t,e):function(t,e){const n=pa(t,e),r=ba(n)+ba(t.gt);return eo(n)&&eo(t.gt)?ca(r):ua(t.yt,r)}(t,e)}function da(t,e,n){return t instanceof ma?ya(t,e):t instanceof va?wa(t,e):n}function pa(t,e){var n;return t instanceof _a?eo(n=e)||function(t){return!!t&&"doubleValue"in t}(n)?e:{integerValue:0}:null}class ga extends ha{}class ma extends ha{constructor(t){super(),this.elements=t}}function ya(t,e){const n=Ea(e);for(const e of t.elements)n.some((t=>Ws(t,e)))||n.push(e);return{arrayValue:{values:n}}}class va extends ha{constructor(t){super(),this.elements=t}}function wa(t,e){let n=Ea(e);for(const e of t.elements)n=n.filter((t=>!Ws(t,e)));return{arrayValue:{values:n}}}class _a extends ha{constructor(t,e){super(),this.yt=t,this.gt=e}}function ba(t){return Bs(t.integerValue||t.doubleValue)}function Ea(t){return no(t)&&t.arrayValue.values?t.arrayValue.values.slice():[]}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Ta{constructor(t,e){this.updateTime=t,this.exists=e}static none(){return new Ta}static exists(t){return new Ta(void 0,t)}static updateTime(t){return new Ta(t)}get isNone(){return void 0===this.updateTime&&void 0===this.exists}isEqual(t){return this.exists===t.exists&&(this.updateTime?!!t.updateTime&&this.updateTime.isEqual(t.updateTime):!t.updateTime)}}function Ia(t,e){return void 0!==t.updateTime?e.isFoundDocument()&&e.version.isEqual(t.updateTime):void 0===t.exists||t.exists===e.isFoundDocument()}class Ca{}function Sa(t,e){if(!t.hasLocalMutations||e&&0===e.fields.length)return null;if(null===e)return t.isNoDocument()?new Ma(t.key,Ta.none()):new ka(t.key,t.data,Ta.none());{const n=t.data,r=Fo.empty();let i=new Oo(ys.comparator);for(let t of e.fields)if(!i.has(t)){let e=n.field(t);null===e&&t.length>1&&(t=t.popLast(),e=n.field(t)),null===e?r.delete(t):r.set(t,e),i=i.add(t)}return new xa(t.key,r,new Vo(i.toArray()),Ta.none())}}function Aa(t,e,n){t instanceof ka?function(t,e,n){const r=t.value.clone(),i=La(t.fieldTransforms,e,n.transformResults);r.setAll(i),e.convertToFoundDocument(n.version,r).setHasCommittedMutations()}(t,e,n):t instanceof xa?function(t,e,n){if(!Ia(t.precondition,e))return void e.convertToUnknownDocument(n.version);const r=La(t.fieldTransforms,e,n.transformResults),i=e.data;i.setAll(Ra(t)),i.setAll(r),e.convertToFoundDocument(n.version,i).setHasCommittedMutations()}(t,e,n):function(t,e,n){e.convertToNoDocument(n.version).setHasCommittedMutations()}(0,e,n)}function Da(t,e,n,r){return t instanceof ka?function(t,e,n,r){if(!Ia(t.precondition,e))return n;const i=t.value.clone(),s=Oa(t.fieldTransforms,r,e);return i.setAll(s),e.convertToFoundDocument(e.version,i).setHasLocalMutations(),null}(t,e,n,r):t instanceof xa?function(t,e,n,r){if(!Ia(t.precondition,e))return n;const i=Oa(t.fieldTransforms,r,e),s=e.data;return s.setAll(Ra(t)),s.setAll(i),e.convertToFoundDocument(e.version,s).setHasLocalMutations(),null===n?null:n.unionWith(t.fieldMask.fields).unionWith(t.fieldTransforms.map((t=>t.field)))}(t,e,n,r):function(t,e,n){return Ia(t.precondition,e)?(e.convertToNoDocument(e.version).setHasLocalMutations(),null):n}(t,e,n)}function Na(t,e){return t.type===e.type&&!!t.key.isEqual(e.key)&&!!t.precondition.isEqual(e.precondition)&&!!function(t,e){return void 0===t&&void 0===e||!(!t||!e)&&hs(t,e,((t,e)=>function(t,e){return t.field.isEqual(e.field)&&function(t,e){return t instanceof ma&&e instanceof ma||t instanceof va&&e instanceof va?hs(t.elements,e.elements,Ws):t instanceof _a&&e instanceof _a?Ws(t.gt,e.gt):t instanceof ga&&e instanceof ga}(t.transform,e.transform)}(t,e)))}(t.fieldTransforms,e.fieldTransforms)&&(0===t.type?t.value.isEqual(e.value):1!==t.type||t.data.isEqual(e.data)&&t.fieldMask.isEqual(e.fieldMask))}class ka extends Ca{constructor(t,e,n,r=[]){super(),this.key=t,this.value=e,this.precondition=n,this.fieldTransforms=r,this.type=0}getFieldMask(){return null}}class xa extends Ca{constructor(t,e,n,r,i=[]){super(),this.key=t,this.data=e,this.fieldMask=n,this.precondition=r,this.fieldTransforms=i,this.type=1}getFieldMask(){return this.fieldMask}}function Ra(t){const e=new Map;return t.fieldMask.fields.forEach((n=>{if(!n.isEmpty()){const r=t.data.field(n);e.set(n,r)}})),e}function La(t,e,n){const r=new Map;Qi(t.length===n.length);for(let i=0;i<n.length;i++){const s=t[i],o=s.transform,a=e.data.field(s.field);r.set(s.field,da(o,a,n[i]))}return r}function Oa(t,e,n){const r=new Map;for(const i of t){const t=i.transform,s=n.data.field(i.field);r.set(i.field,fa(t,s,e))}return r}class Ma extends Ca{constructor(t,e){super(),this.key=t,this.precondition=e,this.type=2,this.fieldTransforms=[]}getFieldMask(){return null}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Va{constructor(t){this.count=t}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */var Fa,Pa;function Ua(t){if(void 0===t)return Ki("GRPC error has no .code"),Xi.UNKNOWN;switch(t){case Fa.OK:return Xi.OK;case Fa.CANCELLED:return Xi.CANCELLED;case Fa.UNKNOWN:return Xi.UNKNOWN;case Fa.DEADLINE_EXCEEDED:return Xi.DEADLINE_EXCEEDED;case Fa.RESOURCE_EXHAUSTED:return Xi.RESOURCE_EXHAUSTED;case Fa.INTERNAL:return Xi.INTERNAL;case Fa.UNAVAILABLE:return Xi.UNAVAILABLE;case Fa.UNAUTHENTICATED:return Xi.UNAUTHENTICATED;case Fa.INVALID_ARGUMENT:return Xi.INVALID_ARGUMENT;case Fa.NOT_FOUND:return Xi.NOT_FOUND;case Fa.ALREADY_EXISTS:return Xi.ALREADY_EXISTS;case Fa.PERMISSION_DENIED:return Xi.PERMISSION_DENIED;case Fa.FAILED_PRECONDITION:return Xi.FAILED_PRECONDITION;case Fa.ABORTED:return Xi.ABORTED;case Fa.OUT_OF_RANGE:return Xi.OUT_OF_RANGE;case Fa.UNIMPLEMENTED:return Xi.UNIMPLEMENTED;case Fa.DATA_LOSS:return Xi.DATA_LOSS;default:return Wi()}}(Pa=Fa||(Fa={}))[Pa.OK=0]="OK",Pa[Pa.CANCELLED=1]="CANCELLED",Pa[Pa.UNKNOWN=2]="UNKNOWN",Pa[Pa.INVALID_ARGUMENT=3]="INVALID_ARGUMENT",Pa[Pa.DEADLINE_EXCEEDED=4]="DEADLINE_EXCEEDED",Pa[Pa.NOT_FOUND=5]="NOT_FOUND",Pa[Pa.ALREADY_EXISTS=6]="ALREADY_EXISTS",Pa[Pa.PERMISSION_DENIED=7]="PERMISSION_DENIED",Pa[Pa.UNAUTHENTICATED=16]="UNAUTHENTICATED",Pa[Pa.RESOURCE_EXHAUSTED=8]="RESOURCE_EXHAUSTED",Pa[Pa.FAILED_PRECONDITION=9]="FAILED_PRECONDITION",Pa[Pa.ABORTED=10]="ABORTED",Pa[Pa.OUT_OF_RANGE=11]="OUT_OF_RANGE",Pa[Pa.UNIMPLEMENTED=12]="UNIMPLEMENTED",Pa[Pa.INTERNAL=13]="INTERNAL",Pa[Pa.UNAVAILABLE=14]="UNAVAILABLE",Pa[Pa.DATA_LOSS=15]="DATA_LOSS";
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class ja{constructor(t,e){this.mapKeyFn=t,this.equalsFn=e,this.inner={},this.innerSize=0}get(t){const e=this.mapKeyFn(t),n=this.inner[e];if(void 0!==n)for(const[e,r]of n)if(this.equalsFn(e,t))return r}has(t){return void 0!==this.get(t)}set(t,e){const n=this.mapKeyFn(t),r=this.inner[n];if(void 0===r)return this.inner[n]=[[t,e]],void this.innerSize++;for(let n=0;n<r.length;n++)if(this.equalsFn(r[n][0],t))return void(r[n]=[t,e]);r.push([t,e]),this.innerSize++}delete(t){const e=this.mapKeyFn(t),n=this.inner[e];if(void 0===n)return!1;for(let r=0;r<n.length;r++)if(this.equalsFn(n[r][0],t))return 1===n.length?delete this.inner[e]:n.splice(r,1),this.innerSize--,!0;return!1}forEach(t){Ls(this.inner,((e,n)=>{for(const[e,r]of n)t(e,r)}))}isEmpty(){return Os(this.inner)}size(){return this.innerSize}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const Ba=new xo(vs.comparator);function qa(){return Ba}const $a=new xo(vs.comparator);function za(...t){let e=$a;for(const n of t)e=e.insert(n.key,n);return e}function Ka(t){let e=$a;return t.forEach(((t,n)=>e=e.insert(t,n.overlayedDocument))),e}function Ga(){return Wa()}function Ha(){return Wa()}function Wa(){return new ja((t=>t.toString()),((t,e)=>t.isEqual(e)))}new xo(vs.comparator);const Qa=new Oo(vs.comparator);function Ya(...t){let e=Qa;for(const n of t)e=e.add(n);return e}const Xa=new Oo(ls);function Ja(){return Xa}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Za{constructor(t,e,n,r,i){this.snapshotVersion=t,this.targetChanges=e,this.targetMismatches=n,this.documentUpdates=r,this.resolvedLimboDocuments=i}static createSynthesizedRemoteEventForCurrentChange(t,e,n){const r=new Map;return r.set(t,tu.createSynthesizedTargetChangeForCurrentChange(t,e,n)),new Za(ds.min(),r,Ja(),qa(),Ya())}}class tu{constructor(t,e,n,r,i){this.resumeToken=t,this.current=e,this.addedDocuments=n,this.modifiedDocuments=r,this.removedDocuments=i}static createSynthesizedTargetChangeForCurrentChange(t,e,n){return new tu(n,e,Ya(),Ya(),Ya())}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class eu{constructor(t,e,n,r){this.It=t,this.removedTargetIds=e,this.key=n,this.Tt=r}}class nu{constructor(t,e){this.targetId=t,this.Et=e}}class ru{constructor(t,e,n=Ps.EMPTY_BYTE_STRING,r=null){this.state=t,this.targetIds=e,this.resumeToken=n,this.cause=r}}class iu{constructor(){this.At=0,this.Rt=au(),this.bt=Ps.EMPTY_BYTE_STRING,this.Pt=!1,this.vt=!0}get current(){return this.Pt}get resumeToken(){return this.bt}get Vt(){return 0!==this.At}get St(){return this.vt}Dt(t){t.approximateByteSize()>0&&(this.vt=!0,this.bt=t)}Ct(){let t=Ya(),e=Ya(),n=Ya();return this.Rt.forEach(((r,i)=>{switch(i){case 0:t=t.add(r);break;case 2:e=e.add(r);break;case 1:n=n.add(r);break;default:Wi()}})),new tu(this.bt,this.Pt,t,e,n)}xt(){this.vt=!1,this.Rt=au()}Nt(t,e){this.vt=!0,this.Rt=this.Rt.insert(t,e)}kt(t){this.vt=!0,this.Rt=this.Rt.remove(t)}Ot(){this.At+=1}Mt(){this.At-=1}Ft(){this.vt=!0,this.Pt=!0}}class su{constructor(t){this.$t=t,this.Bt=new Map,this.Lt=qa(),this.qt=ou(),this.Ut=new Oo(ls)}Kt(t){for(const e of t.It)t.Tt&&t.Tt.isFoundDocument()?this.Gt(e,t.Tt):this.Qt(e,t.key,t.Tt);for(const e of t.removedTargetIds)this.Qt(e,t.key,t.Tt)}jt(t){this.forEachTarget(t,(e=>{const n=this.Wt(e);switch(t.state){case 0:this.zt(e)&&n.Dt(t.resumeToken);break;case 1:n.Mt(),n.Vt||n.xt(),n.Dt(t.resumeToken);break;case 2:n.Mt(),n.Vt||this.removeTarget(e);break;case 3:this.zt(e)&&(n.Ft(),n.Dt(t.resumeToken));break;case 4:this.zt(e)&&(this.Ht(e),n.Dt(t.resumeToken));break;default:Wi()}}))}forEachTarget(t,e){t.targetIds.length>0?t.targetIds.forEach(e):this.Bt.forEach(((t,n)=>{this.zt(n)&&e(n)}))}Jt(t){const e=t.targetId,n=t.Et.count,r=this.Yt(e);if(r){const t=r.target;if($o(t))if(0===n){const n=new vs(t.path);this.Qt(e,n,Po.newNoDocument(n,ds.min()))}else Qi(1===n);else this.Xt(e)!==n&&(this.Ht(e),this.Ut=this.Ut.add(e))}}Zt(t){const e=new Map;this.Bt.forEach(((n,r)=>{const i=this.Yt(r);if(i){if(n.current&&$o(i.target)){const e=new vs(i.target.path);null!==this.Lt.get(e)||this.te(r,e)||this.Qt(r,e,Po.newNoDocument(e,t))}n.St&&(e.set(r,n.Ct()),n.xt())}}));let n=Ya();this.qt.forEach(((t,e)=>{let r=!0;e.forEachWhile((t=>{const e=this.Yt(t);return!e||2===e.purpose||(r=!1,!1)})),r&&(n=n.add(t))})),this.Lt.forEach(((e,n)=>n.setReadTime(t)));const r=new Za(t,e,this.Ut,this.Lt,n);return this.Lt=qa(),this.qt=ou(),this.Ut=new Oo(ls),r}Gt(t,e){if(!this.zt(t))return;const n=this.te(t,e.key)?2:0;this.Wt(t).Nt(e.key,n),this.Lt=this.Lt.insert(e.key,e),this.qt=this.qt.insert(e.key,this.ee(e.key).add(t))}Qt(t,e,n){if(!this.zt(t))return;const r=this.Wt(t);this.te(t,e)?r.Nt(e,1):r.kt(e),this.qt=this.qt.insert(e,this.ee(e).delete(t)),n&&(this.Lt=this.Lt.insert(e,n))}removeTarget(t){this.Bt.delete(t)}Xt(t){const e=this.Wt(t).Ct();return this.$t.getRemoteKeysForTarget(t).size+e.addedDocuments.size-e.removedDocuments.size}Ot(t){this.Wt(t).Ot()}Wt(t){let e=this.Bt.get(t);return e||(e=new iu,this.Bt.set(t,e)),e}ee(t){let e=this.qt.get(t);return e||(e=new Oo(ls),this.qt=this.qt.insert(t,e)),e}zt(t){const e=null!==this.Yt(t);return e||zi("WatchChangeAggregator","Detected inactive target",t),e}Yt(t){const e=this.Bt.get(t);return e&&e.Vt?null:this.$t.ne(t)}Ht(t){this.Bt.set(t,new iu),this.$t.getRemoteKeysForTarget(t).forEach((e=>{this.Qt(t,e,null)}))}te(t,e){return this.$t.getRemoteKeysForTarget(t).has(e)}}function ou(){return new xo(vs.comparator)}function au(){return new xo(vs.comparator)}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const uu={asc:"ASCENDING",desc:"DESCENDING"},cu={"<":"LESS_THAN","<=":"LESS_THAN_OR_EQUAL",">":"GREATER_THAN",">=":"GREATER_THAN_OR_EQUAL","==":"EQUAL","!=":"NOT_EQUAL","array-contains":"ARRAY_CONTAINS",in:"IN","not-in":"NOT_IN","array-contains-any":"ARRAY_CONTAINS_ANY"},lu={and:"AND",or:"OR"};class hu{constructor(t,e){this.databaseId=t,this.wt=e}}function fu(t,e){return t.wt?`${new Date(1e3*e.seconds).toISOString().replace(/\.\d*/,"").replace("Z","")}.${("000000000"+e.nanoseconds).slice(-9)}Z`:{seconds:""+e.seconds,nanos:e.nanoseconds}}function du(t,e){return t.wt?e.toBase64():e.toUint8Array()}function pu(t){return Qi(!!t),ds.fromTimestamp(function(t){const e=js(t);return new fs(e.seconds,e.nanos)}(t))}function gu(t,e){return function(t){return new gs(["projects",t.projectId,"databases",t.database])}(t).child("documents").child(e).canonicalString()}function mu(t){const e=gs.fromString(t);return Qi(Ru(e)),e}function yu(t,e){const n=mu(e);if(n.get(1)!==t.databaseId.projectId)throw new Ji(Xi.INVALID_ARGUMENT,"Tried to deserialize key from different project: "+n.get(1)+" vs "+t.databaseId.projectId);if(n.get(3)!==t.databaseId.database)throw new Ji(Xi.INVALID_ARGUMENT,"Tried to deserialize key from different database: "+n.get(3)+" vs "+t.databaseId.database);return new vs(bu(n))}function vu(t,e){return gu(t.databaseId,e)}function wu(t){const e=mu(t);return 4===e.length?gs.emptyPath():bu(e)}function _u(t){return new gs(["projects",t.databaseId.projectId,"databases",t.databaseId.database]).canonicalString()}function bu(t){return Qi(t.length>4&&"documents"===t.get(4)),t.popFirst(5)}function Eu(t,e){return{documents:[vu(t,e.path)]}}function Tu(t,e){const n={structuredQuery:{}},r=e.path;null!==e.collectionGroup?(n.parent=vu(t,r),n.structuredQuery.from=[{collectionId:e.collectionGroup,allDescendants:!0}]):(n.parent=vu(t,r.popLast()),n.structuredQuery.from=[{collectionId:r.lastSegment()}]);const i=function(t){if(0!==t.length)return xu(po.create(t,"and"))}(e.filters);i&&(n.structuredQuery.where=i);const s=function(t){if(0!==t.length)return t.map((t=>function(t){return{field:Nu(t.field),direction:Su(t.dir)}}(t)))}(e.orderBy);s&&(n.structuredQuery.orderBy=s);const o=function(t,e){return t.wt||Ms(e)?e:{value:e}}(t,e.limit);var a;return null!==o&&(n.structuredQuery.limit=o),e.startAt&&(n.structuredQuery.startAt={before:(a=e.startAt).inclusive,values:a.position}),e.endAt&&(n.structuredQuery.endAt=function(t){return{before:!t.inclusive,values:t.position}}(e.endAt)),n}function Iu(t){let e=wu(t.parent);const n=t.structuredQuery,r=n.from?n.from.length:0;let i=null;if(r>0){Qi(1===r);const t=n.from[0];t.allDescendants?i=t.collectionId:e=e.child(t.collectionId)}let s=[];n.where&&(s=function(t){const e=Cu(t);return e instanceof po&&mo(e)?e.getFilters():[e]}(n.where));let o=[];n.orderBy&&(o=n.orderBy.map((t=>function(t){return new No(ku(t.field),function(t){switch(t){case"ASCENDING":return"asc";case"DESCENDING":return"desc";default:return}}(t.direction))}(t))));let a=null;n.limit&&(a=function(t){let e;return e="object"==typeof t?t.value:t,Ms(e)?null:e}(n.limit));let u=null;n.startAt&&(u=function(t){const e=!!t.before,n=t.values||[];return new uo(n,e)}(n.startAt));let c=null;return n.endAt&&(c=function(t){const e=!t.before,n=t.values||[];return new uo(n,e)}(n.endAt)),Ko(e,i,o,s,a,"F",u,c)}function Cu(t){return void 0!==t.unaryFilter?function(t){switch(t.unaryFilter.op){case"IS_NAN":const e=ku(t.unaryFilter.field);return fo.create(e,"==",{doubleValue:NaN});case"IS_NULL":const n=ku(t.unaryFilter.field);return fo.create(n,"==",{nullValue:"NULL_VALUE"});case"IS_NOT_NAN":const r=ku(t.unaryFilter.field);return fo.create(r,"!=",{doubleValue:NaN});case"IS_NOT_NULL":const i=ku(t.unaryFilter.field);return fo.create(i,"!=",{nullValue:"NULL_VALUE"});default:return Wi()}}(t):void 0!==t.fieldFilter?function(t){return fo.create(ku(t.fieldFilter.field),function(t){switch(t){case"EQUAL":return"==";case"NOT_EQUAL":return"!=";case"GREATER_THAN":return">";case"GREATER_THAN_OR_EQUAL":return">=";case"LESS_THAN":return"<";case"LESS_THAN_OR_EQUAL":return"<=";case"ARRAY_CONTAINS":return"array-contains";case"IN":return"in";case"NOT_IN":return"not-in";case"ARRAY_CONTAINS_ANY":return"array-contains-any";default:return Wi()}}(t.fieldFilter.op),t.fieldFilter.value)}(t):void 0!==t.compositeFilter?function(t){return po.create(t.compositeFilter.filters.map((t=>Cu(t))),function(t){switch(t){case"AND":return"and";case"OR":return"or";default:return Wi()}}(t.compositeFilter.op))}(t):Wi()}function Su(t){return uu[t]}function Au(t){return cu[t]}function Du(t){return lu[t]}function Nu(t){return{fieldPath:t.canonicalString()}}function ku(t){return ys.fromServerFormat(t.fieldPath)}function xu(t){return t instanceof fo?function(t){if("=="===t.op){if(io(t.value))return{unaryFilter:{field:Nu(t.field),op:"IS_NAN"}};if(ro(t.value))return{unaryFilter:{field:Nu(t.field),op:"IS_NULL"}}}else if("!="===t.op){if(io(t.value))return{unaryFilter:{field:Nu(t.field),op:"IS_NOT_NAN"}};if(ro(t.value))return{unaryFilter:{field:Nu(t.field),op:"IS_NOT_NULL"}}}return{fieldFilter:{field:Nu(t.field),op:Au(t.op),value:t.value}}}(t):t instanceof po?function(t){const e=t.getFilters().map((t=>xu(t)));return 1===e.length?e[0]:{compositeFilter:{op:Du(t.op),filters:e}}}(t):Wi()}function Ru(t){return t.length>=4&&"projects"===t.get(0)&&"databases"===t.get(2)}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const Lu=["mutationQueues","mutations","documentMutations","remoteDocuments","targets","owner","targetGlobal","targetDocuments","clientMetadata","remoteDocumentGlobal","collectionParents","bundles","namedQueries"],Ou=["mutationQueues","mutations","documentMutations","remoteDocumentsV14","targets","owner","targetGlobal","targetDocuments","clientMetadata","remoteDocumentGlobal","collectionParents","bundles","namedQueries","documentOverlays"],Mu=Ou;
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Vu{constructor(t,e,n,r){this.batchId=t,this.localWriteTime=e,this.baseMutations=n,this.mutations=r}applyToRemoteDocument(t,e){const n=e.mutationResults;for(let e=0;e<this.mutations.length;e++){const r=this.mutations[e];r.key.isEqual(t.key)&&Aa(r,t,n[e])}}applyToLocalView(t,e){for(const n of this.baseMutations)n.key.isEqual(t.key)&&(e=Da(n,t,e,this.localWriteTime));for(const n of this.mutations)n.key.isEqual(t.key)&&(e=Da(n,t,e,this.localWriteTime));return e}applyToLocalDocumentSet(t,e){const n=Ha();return this.mutations.forEach((r=>{const i=t.get(r.key),s=i.overlayedDocument;let o=this.applyToLocalView(s,i.mutatedFields);o=e.has(r.key)?null:o;const a=Sa(s,o);null!==a&&n.set(r.key,a),s.isValidDocument()||s.convertToNoDocument(ds.min())})),n}keys(){return this.mutations.reduce(((t,e)=>t.add(e.key)),Ya())}isEqual(t){return this.batchId===t.batchId&&hs(this.mutations,t.mutations,((t,e)=>Na(t,e)))&&hs(this.baseMutations,t.baseMutations,((t,e)=>Na(t,e)))}}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Fu{constructor(t,e){this.largestBatchId=t,this.mutation=e}getKey(){return this.mutation.key}isEqual(t){return null!==t&&this.mutation===t.mutation}toString(){return`Overlay{\n      largestBatchId: ${this.largestBatchId},\n      mutation: ${this.mutation.toString()}\n    }`}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Pu{constructor(t,e,n,r,i=ds.min(),s=ds.min(),o=Ps.EMPTY_BYTE_STRING){this.target=t,this.targetId=e,this.purpose=n,this.sequenceNumber=r,this.snapshotVersion=i,this.lastLimboFreeSnapshotVersion=s,this.resumeToken=o}withSequenceNumber(t){return new Pu(this.target,this.targetId,this.purpose,t,this.snapshotVersion,this.lastLimboFreeSnapshotVersion,this.resumeToken)}withResumeToken(t,e){return new Pu(this.target,this.targetId,this.purpose,this.sequenceNumber,e,this.lastLimboFreeSnapshotVersion,t)}withLastLimboFreeSnapshotVersion(t){return new Pu(this.target,this.targetId,this.purpose,this.sequenceNumber,this.snapshotVersion,t,this.resumeToken)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Uu{constructor(t){this.ie=t}}function ju(t){const e=Iu({parent:t.parent,structuredQuery:t.structuredQuery});return"LAST"===t.limitType?ta(e,e.limit,"L"):e}
/**
 * @license
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Bu{constructor(){}ue(t,e){this.ce(t,e),e.ae()}ce(t,e){if("nullValue"in t)this.he(e,5);else if("booleanValue"in t)this.he(e,10),e.le(t.booleanValue?1:0);else if("integerValue"in t)this.he(e,15),e.le(Bs(t.integerValue));else if("doubleValue"in t){const n=Bs(t.doubleValue);isNaN(n)?this.he(e,13):(this.he(e,15),Vs(n)?e.le(0):e.le(n))}else if("timestampValue"in t){const n=t.timestampValue;this.he(e,20),"string"==typeof n?e.fe(n):(e.fe(`${n.seconds||""}`),e.le(n.nanos||0))}else if("stringValue"in t)this.de(t.stringValue,e),this._e(e);else if("bytesValue"in t)this.he(e,30),e.we(qs(t.bytesValue)),this._e(e);else if("referenceValue"in t)this.me(t.referenceValue,e);else if("geoPointValue"in t){const n=t.geoPointValue;this.he(e,45),e.le(n.latitude||0),e.le(n.longitude||0)}else"mapValue"in t?ao(t)?this.he(e,Number.MAX_SAFE_INTEGER):(this.ge(t.mapValue,e),this._e(e)):"arrayValue"in t?(this.ye(t.arrayValue,e),this._e(e)):Wi()}de(t,e){this.he(e,25),this.pe(t,e)}pe(t,e){e.fe(t)}ge(t,e){const n=t.fields||{};this.he(e,55);for(const t of Object.keys(n))this.de(t,e),this.ce(n[t],e)}ye(t,e){const n=t.values||[];this.he(e,50);for(const t of n)this.ce(t,e)}me(t,e){this.he(e,37),vs.fromName(t).path.forEach((t=>{this.he(e,60),this.pe(t,e)}))}he(t,e){t.le(e)}_e(t){t.le(2)}}Bu.Ie=new Bu;
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class qu{constructor(){this.Je=new $u}addToCollectionParentIndex(t,e){return this.Je.add(e),As.resolve()}getCollectionParents(t,e){return As.resolve(this.Je.getEntries(e))}addFieldIndex(t,e){return As.resolve()}deleteFieldIndex(t,e){return As.resolve()}getDocumentsMatchingTarget(t,e){return As.resolve(null)}getIndexType(t,e){return As.resolve(0)}getFieldIndexes(t,e){return As.resolve([])}getNextCollectionGroupToUpdate(t){return As.resolve(null)}getMinOffset(t,e){return As.resolve(Es.min())}getMinOffsetFromCollectionGroup(t,e){return As.resolve(Es.min())}updateCollectionGroup(t,e,n){return As.resolve()}updateIndexEntries(t,e){return As.resolve()}}class $u{constructor(){this.index={}}add(t){const e=t.lastSegment(),n=t.popLast(),r=this.index[e]||new Oo(gs.comparator),i=!r.has(n);return this.index[e]=r.add(n),i}has(t){const e=t.lastSegment(),n=t.popLast(),r=this.index[e];return r&&r.has(n)}getEntries(t){return(this.index[t]||new Oo(gs.comparator)).toArray()}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */new Uint8Array(0);class zu{constructor(t,e,n){this.cacheSizeCollectionThreshold=t,this.percentileToCollect=e,this.maximumSequenceNumbersToCollect=n}static withCacheSize(t){return new zu(t,zu.DEFAULT_COLLECTION_PERCENTILE,zu.DEFAULT_MAX_SEQUENCE_NUMBERS_TO_COLLECT)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */zu.DEFAULT_COLLECTION_PERCENTILE=10,zu.DEFAULT_MAX_SEQUENCE_NUMBERS_TO_COLLECT=1e3,zu.DEFAULT=new zu(41943040,zu.DEFAULT_COLLECTION_PERCENTILE,zu.DEFAULT_MAX_SEQUENCE_NUMBERS_TO_COLLECT),zu.DISABLED=new zu(-1,0,0);
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Ku{constructor(t){this.bn=t}next(){return this.bn+=2,this.bn}static Pn(){return new Ku(0)}static vn(){return new Ku(-1)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Gu{constructor(){this.changes=new ja((t=>t.toString()),((t,e)=>t.isEqual(e))),this.changesApplied=!1}addEntry(t){this.assertNotApplied(),this.changes.set(t.key,t)}removeEntry(t,e){this.assertNotApplied(),this.changes.set(t,Po.newInvalidDocument(t).setReadTime(e))}getEntry(t,e){this.assertNotApplied();const n=this.changes.get(e);return void 0!==n?As.resolve(n):this.getFromCache(t,e)}getEntries(t,e){return this.getAllFromCache(t,e)}apply(t){return this.assertNotApplied(),this.changesApplied=!0,this.applyChanges(t)}assertNotApplied(){}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Hu{constructor(t,e){this.overlayedDocument=t,this.mutatedFields=e}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Wu{constructor(t,e,n,r){this.remoteDocumentCache=t,this.mutationQueue=e,this.documentOverlayCache=n,this.indexManager=r}getDocument(t,e){let n=null;return this.documentOverlayCache.getOverlay(t,e).next((r=>(n=r,this.remoteDocumentCache.getEntry(t,e)))).next((t=>(null!==n&&Da(n.mutation,t,Vo.empty(),fs.now()),t)))}getDocuments(t,e){return this.remoteDocumentCache.getEntries(t,e).next((e=>this.getLocalViewOfDocuments(t,e,Ya()).next((()=>e))))}getLocalViewOfDocuments(t,e,n=Ya()){const r=Ga();return this.populateOverlays(t,r,e).next((()=>this.computeViews(t,e,r,n).next((t=>{let e=za();return t.forEach(((t,n)=>{e=e.insert(t,n.overlayedDocument)})),e}))))}getOverlayedDocuments(t,e){const n=Ga();return this.populateOverlays(t,n,e).next((()=>this.computeViews(t,e,n,Ya())))}populateOverlays(t,e,n){const r=[];return n.forEach((t=>{e.has(t)||r.push(t)})),this.documentOverlayCache.getOverlays(t,r).next((t=>{t.forEach(((t,n)=>{e.set(t,n)}))}))}computeViews(t,e,n,r){let i=qa();const s=Wa(),o=Wa();return e.forEach(((t,e)=>{const o=n.get(e.key);r.has(e.key)&&(void 0===o||o.mutation instanceof xa)?i=i.insert(e.key,e):void 0!==o&&(s.set(e.key,o.mutation.getFieldMask()),Da(o.mutation,e,o.mutation.getFieldMask(),fs.now()))})),this.recalculateAndSaveOverlays(t,i).next((t=>(t.forEach(((t,e)=>s.set(t,e))),e.forEach(((t,e)=>{var n;return o.set(t,new Hu(e,null!==(n=s.get(t))&&void 0!==n?n:null))})),o)))}recalculateAndSaveOverlays(t,e){const n=Wa();let r=new xo(((t,e)=>t-e)),i=Ya();return this.mutationQueue.getAllMutationBatchesAffectingDocumentKeys(t,e).next((t=>{for(const i of t)i.keys().forEach((t=>{const s=e.get(t);if(null===s)return;let o=n.get(t)||Vo.empty();o=i.applyToLocalView(s,o),n.set(t,o);const a=(r.get(i.batchId)||Ya()).add(t);r=r.insert(i.batchId,a)}))})).next((()=>{const s=[],o=r.getReverseIterator();for(;o.hasNext();){const r=o.getNext(),a=r.key,u=r.value,c=Ha();u.forEach((t=>{if(!i.has(t)){const r=Sa(e.get(t),n.get(t));null!==r&&c.set(t,r),i=i.add(t)}})),s.push(this.documentOverlayCache.saveOverlays(t,a,c))}return As.waitFor(s)})).next((()=>n))}recalculateAndSaveOverlaysForDocumentKeys(t,e){return this.remoteDocumentCache.getEntries(t,e).next((e=>this.recalculateAndSaveOverlays(t,e)))}getDocumentsMatchingQuery(t,e,n){return function(t){return vs.isDocumentKey(t.path)&&null===t.collectionGroup&&0===t.filters.length}(e)?this.getDocumentsMatchingDocumentQuery(t,e.path):Yo(e)?this.getDocumentsMatchingCollectionGroupQuery(t,e,n):this.getDocumentsMatchingCollectionQuery(t,e,n)}getNextDocuments(t,e,n,r){return this.remoteDocumentCache.getAllFromCollectionGroup(t,e,n,r).next((i=>{const s=r-i.size>0?this.documentOverlayCache.getOverlaysForCollectionGroup(t,e,n.largestBatchId,r-i.size):As.resolve(Ga());let o=-1,a=i;return s.next((e=>As.forEach(e,((e,n)=>(o<n.largestBatchId&&(o=n.largestBatchId),i.get(e)?As.resolve():this.remoteDocumentCache.getEntry(t,e).next((t=>{a=a.insert(e,t)}))))).next((()=>this.populateOverlays(t,e,i))).next((()=>this.computeViews(t,a,e,Ya()))).next((t=>({batchId:o,changes:Ka(t)})))))}))}getDocumentsMatchingDocumentQuery(t,e){return this.getDocument(t,new vs(e)).next((t=>{let e=za();return t.isFoundDocument()&&(e=e.insert(t.key,t)),e}))}getDocumentsMatchingCollectionGroupQuery(t,e,n){const r=e.collectionGroup;let i=za();return this.indexManager.getCollectionParents(t,r).next((s=>As.forEach(s,(s=>{const o=function(t,e){return new zo(e,null,t.explicitOrderBy.slice(),t.filters.slice(),t.limit,t.limitType,t.startAt,t.endAt)}(e,s.child(r));return this.getDocumentsMatchingCollectionQuery(t,o,n).next((t=>{t.forEach(((t,e)=>{i=i.insert(t,e)}))}))})).next((()=>i))))}getDocumentsMatchingCollectionQuery(t,e,n){let r;return this.remoteDocumentCache.getAllFromCollection(t,e.path,n).next((i=>(r=i,this.documentOverlayCache.getOverlaysForCollection(t,e.path,n.largestBatchId)))).next((t=>{t.forEach(((t,e)=>{const n=e.getKey();null===r.get(n)&&(r=r.insert(n,Po.newInvalidDocument(n)))}));let n=za();return r.forEach(((r,i)=>{const s=t.get(r);void 0!==s&&Da(s.mutation,i,Vo.empty(),fs.now()),ia(e,i)&&(n=n.insert(r,i))})),n}))}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Qu{constructor(t){this.yt=t,this.Zn=new Map,this.ts=new Map}getBundleMetadata(t,e){return As.resolve(this.Zn.get(e))}saveBundleMetadata(t,e){var n;return this.Zn.set(e.id,{id:(n=e).id,version:n.version,createTime:pu(n.createTime)}),As.resolve()}getNamedQuery(t,e){return As.resolve(this.ts.get(e))}saveNamedQuery(t,e){return this.ts.set(e.name,function(t){return{name:t.name,query:ju(t.bundledQuery),readTime:pu(t.readTime)}}(e)),As.resolve()}}
/**
 * @license
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Yu{constructor(){this.overlays=new xo(vs.comparator),this.es=new Map}getOverlay(t,e){return As.resolve(this.overlays.get(e))}getOverlays(t,e){const n=Ga();return As.forEach(e,(e=>this.getOverlay(t,e).next((t=>{null!==t&&n.set(e,t)})))).next((()=>n))}saveOverlays(t,e,n){return n.forEach(((n,r)=>{this.oe(t,e,r)})),As.resolve()}removeOverlaysForBatchId(t,e,n){const r=this.es.get(n);return void 0!==r&&(r.forEach((t=>this.overlays=this.overlays.remove(t))),this.es.delete(n)),As.resolve()}getOverlaysForCollection(t,e,n){const r=Ga(),i=e.length+1,s=new vs(e.child("")),o=this.overlays.getIteratorFrom(s);for(;o.hasNext();){const t=o.getNext().value,s=t.getKey();if(!e.isPrefixOf(s.path))break;s.path.length===i&&t.largestBatchId>n&&r.set(t.getKey(),t)}return As.resolve(r)}getOverlaysForCollectionGroup(t,e,n,r){let i=new xo(((t,e)=>t-e));const s=this.overlays.getIterator();for(;s.hasNext();){const t=s.getNext().value;if(t.getKey().getCollectionGroup()===e&&t.largestBatchId>n){let e=i.get(t.largestBatchId);null===e&&(e=Ga(),i=i.insert(t.largestBatchId,e)),e.set(t.getKey(),t)}}const o=Ga(),a=i.getIterator();for(;a.hasNext()&&(a.getNext().value.forEach(((t,e)=>o.set(t,e))),!(o.size()>=r)););return As.resolve(o)}oe(t,e,n){const r=this.overlays.get(n.key);if(null!==r){const t=this.es.get(r.largestBatchId).delete(n.key);this.es.set(r.largestBatchId,t)}this.overlays=this.overlays.insert(n.key,new Fu(e,n));let i=this.es.get(e);void 0===i&&(i=Ya(),this.es.set(e,i)),this.es.set(e,i.add(n.key))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Xu{constructor(){this.ns=new Oo(Ju.ss),this.rs=new Oo(Ju.os)}isEmpty(){return this.ns.isEmpty()}addReference(t,e){const n=new Ju(t,e);this.ns=this.ns.add(n),this.rs=this.rs.add(n)}us(t,e){t.forEach((t=>this.addReference(t,e)))}removeReference(t,e){this.cs(new Ju(t,e))}hs(t,e){t.forEach((t=>this.removeReference(t,e)))}ls(t){const e=new vs(new gs([])),n=new Ju(e,t),r=new Ju(e,t+1),i=[];return this.rs.forEachInRange([n,r],(t=>{this.cs(t),i.push(t.key)})),i}fs(){this.ns.forEach((t=>this.cs(t)))}cs(t){this.ns=this.ns.delete(t),this.rs=this.rs.delete(t)}ds(t){const e=new vs(new gs([])),n=new Ju(e,t),r=new Ju(e,t+1);let i=Ya();return this.rs.forEachInRange([n,r],(t=>{i=i.add(t.key)})),i}containsKey(t){const e=new Ju(t,0),n=this.ns.firstAfterOrEqual(e);return null!==n&&t.isEqual(n.key)}}class Ju{constructor(t,e){this.key=t,this._s=e}static ss(t,e){return vs.comparator(t.key,e.key)||ls(t._s,e._s)}static os(t,e){return ls(t._s,e._s)||vs.comparator(t.key,e.key)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Zu{constructor(t,e){this.indexManager=t,this.referenceDelegate=e,this.mutationQueue=[],this.ws=1,this.gs=new Oo(Ju.ss)}checkEmpty(t){return As.resolve(0===this.mutationQueue.length)}addMutationBatch(t,e,n,r){const i=this.ws;this.ws++,this.mutationQueue.length>0&&this.mutationQueue[this.mutationQueue.length-1];const s=new Vu(i,e,n,r);this.mutationQueue.push(s);for(const e of r)this.gs=this.gs.add(new Ju(e.key,i)),this.indexManager.addToCollectionParentIndex(t,e.key.path.popLast());return As.resolve(s)}lookupMutationBatch(t,e){return As.resolve(this.ys(e))}getNextMutationBatchAfterBatchId(t,e){const n=e+1,r=this.ps(n),i=r<0?0:r;return As.resolve(this.mutationQueue.length>i?this.mutationQueue[i]:null)}getHighestUnacknowledgedBatchId(){return As.resolve(0===this.mutationQueue.length?-1:this.ws-1)}getAllMutationBatches(t){return As.resolve(this.mutationQueue.slice())}getAllMutationBatchesAffectingDocumentKey(t,e){const n=new Ju(e,0),r=new Ju(e,Number.POSITIVE_INFINITY),i=[];return this.gs.forEachInRange([n,r],(t=>{const e=this.ys(t._s);i.push(e)})),As.resolve(i)}getAllMutationBatchesAffectingDocumentKeys(t,e){let n=new Oo(ls);return e.forEach((t=>{const e=new Ju(t,0),r=new Ju(t,Number.POSITIVE_INFINITY);this.gs.forEachInRange([e,r],(t=>{n=n.add(t._s)}))})),As.resolve(this.Is(n))}getAllMutationBatchesAffectingQuery(t,e){const n=e.path,r=n.length+1;let i=n;vs.isDocumentKey(i)||(i=i.child(""));const s=new Ju(new vs(i),0);let o=new Oo(ls);return this.gs.forEachWhile((t=>{const e=t.key.path;return!!n.isPrefixOf(e)&&(e.length===r&&(o=o.add(t._s)),!0)}),s),As.resolve(this.Is(o))}Is(t){const e=[];return t.forEach((t=>{const n=this.ys(t);null!==n&&e.push(n)})),e}removeMutationBatch(t,e){Qi(0===this.Ts(e.batchId,"removed")),this.mutationQueue.shift();let n=this.gs;return As.forEach(e.mutations,(r=>{const i=new Ju(r.key,e.batchId);return n=n.delete(i),this.referenceDelegate.markPotentiallyOrphaned(t,r.key)})).next((()=>{this.gs=n}))}An(t){}containsKey(t,e){const n=new Ju(e,0),r=this.gs.firstAfterOrEqual(n);return As.resolve(e.isEqual(r&&r.key))}performConsistencyCheck(t){return this.mutationQueue.length,As.resolve()}Ts(t,e){return this.ps(t)}ps(t){return 0===this.mutationQueue.length?0:t-this.mutationQueue[0].batchId}ys(t){const e=this.ps(t);return e<0||e>=this.mutationQueue.length?null:this.mutationQueue[e]}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class tc{constructor(t){this.Es=t,this.docs=new xo(vs.comparator),this.size=0}setIndexManager(t){this.indexManager=t}addEntry(t,e){const n=e.key,r=this.docs.get(n),i=r?r.size:0,s=this.Es(e);return this.docs=this.docs.insert(n,{document:e.mutableCopy(),size:s}),this.size+=s-i,this.indexManager.addToCollectionParentIndex(t,n.path.popLast())}removeEntry(t){const e=this.docs.get(t);e&&(this.docs=this.docs.remove(t),this.size-=e.size)}getEntry(t,e){const n=this.docs.get(e);return As.resolve(n?n.document.mutableCopy():Po.newInvalidDocument(e))}getEntries(t,e){let n=qa();return e.forEach((t=>{const e=this.docs.get(t);n=n.insert(t,e?e.document.mutableCopy():Po.newInvalidDocument(t))})),As.resolve(n)}getAllFromCollection(t,e,n){let r=qa();const i=new vs(e.child("")),s=this.docs.getIteratorFrom(i);for(;s.hasNext();){const{key:t,value:{document:i}}=s.getNext();if(!e.isPrefixOf(t.path))break;t.path.length>e.length+1||Ts(bs(i),n)<=0||(r=r.insert(i.key,i.mutableCopy()))}return As.resolve(r)}getAllFromCollectionGroup(t,e,n,r){Wi()}As(t,e){return As.forEach(this.docs,(t=>e(t)))}newChangeBuffer(t){return new ec(this)}getSize(t){return As.resolve(this.size)}}class ec extends Gu{constructor(t){super(),this.Yn=t}applyChanges(t){const e=[];return this.changes.forEach(((n,r)=>{r.isValidDocument()?e.push(this.Yn.addEntry(t,r)):this.Yn.removeEntry(n)})),As.waitFor(e)}getFromCache(t,e){return this.Yn.getEntry(t,e)}getAllFromCache(t,e){return this.Yn.getEntries(t,e)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class nc{constructor(t){this.persistence=t,this.Rs=new ja((t=>Bo(t)),qo),this.lastRemoteSnapshotVersion=ds.min(),this.highestTargetId=0,this.bs=0,this.Ps=new Xu,this.targetCount=0,this.vs=Ku.Pn()}forEachTarget(t,e){return this.Rs.forEach(((t,n)=>e(n))),As.resolve()}getLastRemoteSnapshotVersion(t){return As.resolve(this.lastRemoteSnapshotVersion)}getHighestSequenceNumber(t){return As.resolve(this.bs)}allocateTargetId(t){return this.highestTargetId=this.vs.next(),As.resolve(this.highestTargetId)}setTargetsMetadata(t,e,n){return n&&(this.lastRemoteSnapshotVersion=n),e>this.bs&&(this.bs=e),As.resolve()}Dn(t){this.Rs.set(t.target,t);const e=t.targetId;e>this.highestTargetId&&(this.vs=new Ku(e),this.highestTargetId=e),t.sequenceNumber>this.bs&&(this.bs=t.sequenceNumber)}addTargetData(t,e){return this.Dn(e),this.targetCount+=1,As.resolve()}updateTargetData(t,e){return this.Dn(e),As.resolve()}removeTargetData(t,e){return this.Rs.delete(e.target),this.Ps.ls(e.targetId),this.targetCount-=1,As.resolve()}removeTargets(t,e,n){let r=0;const i=[];return this.Rs.forEach(((s,o)=>{o.sequenceNumber<=e&&null===n.get(o.targetId)&&(this.Rs.delete(s),i.push(this.removeMatchingKeysForTargetId(t,o.targetId)),r++)})),As.waitFor(i).next((()=>r))}getTargetCount(t){return As.resolve(this.targetCount)}getTargetData(t,e){const n=this.Rs.get(e)||null;return As.resolve(n)}addMatchingKeys(t,e,n){return this.Ps.us(e,n),As.resolve()}removeMatchingKeys(t,e,n){this.Ps.hs(e,n);const r=this.persistence.referenceDelegate,i=[];return r&&e.forEach((e=>{i.push(r.markPotentiallyOrphaned(t,e))})),As.waitFor(i)}removeMatchingKeysForTargetId(t,e){return this.Ps.ls(e),As.resolve()}getMatchingKeysForTargetId(t,e){const n=this.Ps.ds(e);return As.resolve(n)}containsKey(t,e){return As.resolve(this.Ps.containsKey(e))}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class rc{constructor(t,e){this.Vs={},this.overlays={},this.Ss=new Ns(0),this.Ds=!1,this.Ds=!0,this.referenceDelegate=t(this),this.Cs=new nc(this),this.indexManager=new qu,this.remoteDocumentCache=function(t){return new tc(t)}((t=>this.referenceDelegate.xs(t))),this.yt=new Uu(e),this.Ns=new Qu(this.yt)}start(){return Promise.resolve()}shutdown(){return this.Ds=!1,Promise.resolve()}get started(){return this.Ds}setDatabaseDeletedListener(){}setNetworkEnabled(){}getIndexManager(t){return this.indexManager}getDocumentOverlayCache(t){let e=this.overlays[t.toKey()];return e||(e=new Yu,this.overlays[t.toKey()]=e),e}getMutationQueue(t,e){let n=this.Vs[t.toKey()];return n||(n=new Zu(e,this.referenceDelegate),this.Vs[t.toKey()]=n),n}getTargetCache(){return this.Cs}getRemoteDocumentCache(){return this.remoteDocumentCache}getBundleCache(){return this.Ns}runTransaction(t,e,n){zi("MemoryPersistence","Starting transaction:",t);const r=new ic(this.Ss.next());return this.referenceDelegate.ks(),n(r).next((t=>this.referenceDelegate.Os(r).next((()=>t)))).toPromise().then((t=>(r.raiseOnCommittedEvent(),t)))}Ms(t,e){return As.or(Object.values(this.Vs).map((n=>()=>n.containsKey(t,e))))}}class ic extends Cs{constructor(t){super(),this.currentSequenceNumber=t}}class sc{constructor(t){this.persistence=t,this.Fs=new Xu,this.$s=null}static Bs(t){return new sc(t)}get Ls(){if(this.$s)return this.$s;throw Wi()}addReference(t,e,n){return this.Fs.addReference(n,e),this.Ls.delete(n.toString()),As.resolve()}removeReference(t,e,n){return this.Fs.removeReference(n,e),this.Ls.add(n.toString()),As.resolve()}markPotentiallyOrphaned(t,e){return this.Ls.add(e.toString()),As.resolve()}removeTarget(t,e){this.Fs.ls(e.targetId).forEach((t=>this.Ls.add(t.toString())));const n=this.persistence.getTargetCache();return n.getMatchingKeysForTargetId(t,e.targetId).next((t=>{t.forEach((t=>this.Ls.add(t.toString())))})).next((()=>n.removeTargetData(t,e)))}ks(){this.$s=new Set}Os(t){const e=this.persistence.getRemoteDocumentCache().newChangeBuffer();return As.forEach(this.Ls,(n=>{const r=vs.fromPath(n);return this.qs(t,r).next((t=>{t||e.removeEntry(r,ds.min())}))})).next((()=>(this.$s=null,e.apply(t))))}updateLimboDocument(t,e){return this.qs(t,e).next((t=>{t?this.Ls.delete(e.toString()):this.Ls.add(e.toString())}))}xs(t){return 0}qs(t,e){return As.or([()=>As.resolve(this.Fs.containsKey(e)),()=>this.persistence.getTargetCache().containsKey(t,e),()=>this.persistence.Ms(t,e)])}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class oc{constructor(t,e,n,r){this.targetId=t,this.fromCache=e,this.Si=n,this.Di=r}static Ci(t,e){let n=Ya(),r=Ya();for(const t of e.docChanges)switch(t.type){case 0:n=n.add(t.doc.key);break;case 1:r=r.add(t.doc.key)}return new oc(t,e.fromCache,n,r)}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ac{constructor(){this.xi=!1}initialize(t,e){this.Ni=t,this.indexManager=e,this.xi=!0}getDocumentsMatchingQuery(t,e,n,r){return this.ki(t,e).next((i=>i||this.Oi(t,e,r,n))).next((n=>n||this.Mi(t,e)))}ki(t,e){if(Ho(e))return As.resolve(null);let n=Jo(e);return this.indexManager.getIndexType(t,n).next((r=>0===r?null:(null!==e.limit&&1===r&&(e=ta(e,null,"F"),n=Jo(e)),this.indexManager.getDocumentsMatchingTarget(t,n).next((r=>{const i=Ya(...r);return this.Ni.getDocuments(t,i).next((r=>this.indexManager.getMinOffset(t,n).next((n=>{const s=this.Fi(e,r);return this.$i(e,s,i,n.readTime)?this.ki(t,ta(e,null,"F")):this.Bi(t,s,e,n)}))))})))))}Oi(t,e,n,r){return Ho(e)||r.isEqual(ds.min())?this.Mi(t,e):this.Ni.getDocuments(t,n).next((i=>{const s=this.Fi(e,i);return this.$i(e,s,n,r)?this.Mi(t,e):($i()<=j.DEBUG&&zi("QueryEngine","Re-using previous result from %s to execute query: %s",r.toString(),ra(e)),this.Bi(t,s,e,_s(r,-1)))}))}Fi(t,e){let n=new Oo(oa(t));return e.forEach(((e,r)=>{ia(t,r)&&(n=n.add(r))})),n}$i(t,e,n,r){if(null===t.limit)return!1;if(n.size!==e.size)return!0;const i="F"===t.limitType?e.last():e.first();return!!i&&(i.hasPendingWrites||i.version.compareTo(r)>0)}Mi(t,e){return $i()<=j.DEBUG&&zi("QueryEngine","Using full collection scan to execute query:",ra(e)),this.Ni.getDocumentsMatchingQuery(t,e,Es.min())}Bi(t,e,n,r){return this.Ni.getDocumentsMatchingQuery(t,n,r).next((t=>(e.forEach((e=>{t=t.insert(e.key,e)})),t)))}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class uc{constructor(t,e,n,r){this.persistence=t,this.Li=e,this.yt=r,this.qi=new xo(ls),this.Ui=new ja((t=>Bo(t)),qo),this.Ki=new Map,this.Gi=t.getRemoteDocumentCache(),this.Cs=t.getTargetCache(),this.Ns=t.getBundleCache(),this.Qi(n)}Qi(t){this.documentOverlayCache=this.persistence.getDocumentOverlayCache(t),this.indexManager=this.persistence.getIndexManager(t),this.mutationQueue=this.persistence.getMutationQueue(t,this.indexManager),this.localDocuments=new Wu(this.Gi,this.mutationQueue,this.documentOverlayCache,this.indexManager),this.Gi.setIndexManager(this.indexManager),this.Li.initialize(this.localDocuments,this.indexManager)}collectGarbage(t){return this.persistence.runTransaction("Collect garbage","readwrite-primary",(e=>t.collect(e,this.qi)))}}function cc(t,e,n,r){return new uc(t,e,n,r)}async function lc(t,e){const n=Yi(t);return await n.persistence.runTransaction("Handle user change","readonly",(t=>{let r;return n.mutationQueue.getAllMutationBatches(t).next((i=>(r=i,n.Qi(e),n.mutationQueue.getAllMutationBatches(t)))).next((e=>{const i=[],s=[];let o=Ya();for(const t of r){i.push(t.batchId);for(const e of t.mutations)o=o.add(e.key)}for(const t of e){s.push(t.batchId);for(const e of t.mutations)o=o.add(e.key)}return n.localDocuments.getDocuments(t,o).next((t=>({ji:t,removedBatchIds:i,addedBatchIds:s})))}))}))}function hc(t){const e=Yi(t);return e.persistence.runTransaction("Get last remote snapshot version","readonly",(t=>e.Cs.getLastRemoteSnapshotVersion(t)))}function fc(t,e,n){let r=Ya(),i=Ya();return n.forEach((t=>r=r.add(t))),e.getEntries(t,r).next((t=>{let r=qa();return n.forEach(((n,s)=>{const o=t.get(n);s.isFoundDocument()!==o.isFoundDocument()&&(i=i.add(n)),s.isNoDocument()&&s.version.isEqual(ds.min())?(e.removeEntry(n,s.readTime),r=r.insert(n,s)):!o.isValidDocument()||s.version.compareTo(o.version)>0||0===s.version.compareTo(o.version)&&o.hasPendingWrites?(e.addEntry(s),r=r.insert(n,s)):zi("LocalStore","Ignoring outdated watch update for ",n,". Current version:",o.version," Watch version:",s.version)})),{Wi:r,zi:i}}))}function dc(t,e){const n=Yi(t);return n.persistence.runTransaction("Allocate target","readwrite",(t=>{let r;return n.Cs.getTargetData(t,e).next((i=>i?(r=i,As.resolve(r)):n.Cs.allocateTargetId(t).next((i=>(r=new Pu(e,i,0,t.currentSequenceNumber),n.Cs.addTargetData(t,r).next((()=>r)))))))})).then((t=>{const r=n.qi.get(t.targetId);return(null===r||t.snapshotVersion.compareTo(r.snapshotVersion)>0)&&(n.qi=n.qi.insert(t.targetId,t),n.Ui.set(e,t.targetId)),t}))}async function pc(t,e,n){const r=Yi(t),i=r.qi.get(e),s=n?"readwrite":"readwrite-primary";try{n||await r.persistence.runTransaction("Release target",s,(t=>r.persistence.referenceDelegate.removeTarget(t,i)))}catch(t){if(!Ds(t))throw t;zi("LocalStore",`Failed to update sequence numbers for target ${e}: ${t}`)}r.qi=r.qi.remove(e),r.Ui.delete(i.target)}function gc(t,e,n){const r=Yi(t);let i=ds.min(),s=Ya();return r.persistence.runTransaction("Execute query","readonly",(t=>function(t,e,n){const r=Yi(t),i=r.Ui.get(n);return void 0!==i?As.resolve(r.qi.get(i)):r.Cs.getTargetData(e,n)}(r,t,Jo(e)).next((e=>{if(e)return i=e.lastLimboFreeSnapshotVersion,r.Cs.getMatchingKeysForTargetId(t,e.targetId).next((t=>{s=t}))})).next((()=>r.Li.getDocumentsMatchingQuery(t,e,n?i:ds.min(),n?s:Ya()))).next((t=>(mc(r,sa(e),t),{documents:t,Hi:s})))))}function mc(t,e,n){let r=t.Ki.get(e)||ds.min();n.forEach(((t,e)=>{e.readTime.compareTo(r)>0&&(r=e.readTime)})),t.Ki.set(e,r)}class yc{constructor(){this.activeTargetIds=Ja()}er(t){this.activeTargetIds=this.activeTargetIds.add(t)}nr(t){this.activeTargetIds=this.activeTargetIds.delete(t)}tr(){const t={activeTargetIds:this.activeTargetIds.toArray(),updateTimeMs:Date.now()};return JSON.stringify(t)}}class vc{constructor(){this.Lr=new yc,this.qr={},this.onlineStateHandler=null,this.sequenceNumberHandler=null}addPendingMutation(t){}updateMutationState(t,e,n){}addLocalQueryTarget(t){return this.Lr.er(t),this.qr[t]||"not-current"}updateQueryState(t,e,n){this.qr[t]=e}removeLocalQueryTarget(t){this.Lr.nr(t)}isLocalQueryTarget(t){return this.Lr.activeTargetIds.has(t)}clearQueryState(t){delete this.qr[t]}getAllActiveQueryTargets(){return this.Lr.activeTargetIds}isActiveQueryTarget(t){return this.Lr.activeTargetIds.has(t)}start(){return this.Lr=new yc,Promise.resolve()}handleUserChange(t,e,n){}setOnlineState(t){}shutdown(){}writeSequenceNumber(t){}notifyBundleLoaded(t){}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class wc{Ur(t){}shutdown(){}}
/**
 * @license
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class _c{constructor(){this.Kr=()=>this.Gr(),this.Qr=()=>this.jr(),this.Wr=[],this.zr()}Ur(t){this.Wr.push(t)}shutdown(){window.removeEventListener("online",this.Kr),window.removeEventListener("offline",this.Qr)}zr(){window.addEventListener("online",this.Kr),window.addEventListener("offline",this.Qr)}Gr(){zi("ConnectivityMonitor","Network connectivity changed: AVAILABLE");for(const t of this.Wr)t(0)}jr(){zi("ConnectivityMonitor","Network connectivity changed: UNAVAILABLE");for(const t of this.Wr)t(1)}static C(){return"undefined"!=typeof window&&void 0!==window.addEventListener&&void 0!==window.removeEventListener}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const bc={BatchGetDocuments:"batchGet",Commit:"commit",RunQuery:"runQuery",RunAggregationQuery:"runAggregationQuery"};
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Ec{constructor(t){this.Hr=t.Hr,this.Jr=t.Jr}Yr(t){this.Xr=t}Zr(t){this.eo=t}onMessage(t){this.no=t}close(){this.Jr()}send(t){this.Hr(t)}so(){this.Xr()}io(t){this.eo(t)}ro(t){this.no(t)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Tc extends class{constructor(t){this.databaseInfo=t,this.databaseId=t.databaseId;const e=t.ssl?"https":"http";this.oo=e+"://"+t.host,this.uo="projects/"+this.databaseId.projectId+"/databases/"+this.databaseId.database+"/documents"}get co(){return!1}ao(t,e,n,r,i){const s=this.ho(t,e);zi("RestConnection","Sending: ",s,n);const o={};return this.lo(o,r,i),this.fo(t,s,o,n).then((t=>(zi("RestConnection","Received: ",t),t)),(e=>{throw Gi("RestConnection",`${t} failed with error: `,e,"url: ",s,"request:",n),e}))}_o(t,e,n,r,i,s){return this.ao(t,e,n,r,i)}lo(t,e,n){t["X-Goog-Api-Client"]="gl-js/ fire/"+Bi,t["Content-Type"]="text/plain",this.databaseInfo.appId&&(t["X-Firebase-GMPID"]=this.databaseInfo.appId),e&&e.headers.forEach(((e,n)=>t[n]=e)),n&&n.headers.forEach(((e,n)=>t[n]=e))}ho(t,e){const n=bc[t];return`${this.oo}/v1/${e}:${n}`}}{constructor(t){super(t),this.forceLongPolling=t.forceLongPolling,this.autoDetectLongPolling=t.autoDetectLongPolling,this.useFetchStreams=t.useFetchStreams}fo(t,e,n,r){return new Promise(((i,s)=>{const o=new Pi;o.setWithCredentials(!0),o.listenOnce(Li.COMPLETE,(()=>{try{switch(o.getLastErrorCode()){case Ri.NO_ERROR:const e=o.getResponseJson();zi("Connection","XHR received:",JSON.stringify(e)),i(e);break;case Ri.TIMEOUT:zi("Connection",'RPC "'+t+'" timed out'),s(new Ji(Xi.DEADLINE_EXCEEDED,"Request time out"));break;case Ri.HTTP_ERROR:const n=o.getStatus();if(zi("Connection",'RPC "'+t+'" failed with status:',n,"response text:",o.getResponseText()),n>0){let t=o.getResponseJson();Array.isArray(t)&&(t=t[0]);const e=null==t?void 0:t.error;if(e&&e.status&&e.message){const t=function(t){const e=t.toLowerCase().replace(/_/g,"-");return Object.values(Xi).indexOf(e)>=0?e:Xi.UNKNOWN}(e.status);s(new Ji(t,e.message))}else s(new Ji(Xi.UNKNOWN,"Server responded with status "+o.getStatus()))}else s(new Ji(Xi.UNAVAILABLE,"Connection failed."));break;default:Wi()}}finally{zi("Connection",'RPC "'+t+'" completed.')}}));const a=JSON.stringify(r);o.send(e,"POST",a,n,15)}))}wo(t,e,n){const r=[this.oo,"/","google.firestore.v1.Firestore","/",t,"/channel"],i=ki(),s=xi(),o={httpSessionIdParam:"gsessionid",initMessageHeaders:{},messageUrlParams:{database:`projects/${this.databaseId.projectId}/databases/${this.databaseId.database}`},sendRawJson:!0,supportsCrossDomainXhr:!0,internalChannelParams:{forwardChannelRequestTimeoutMs:6e5},forceLongPolling:this.forceLongPolling,detectBufferingProxy:this.autoDetectLongPolling};this.useFetchStreams&&(o.xmlHttpFactory=new Vi({})),this.lo(o.initMessageHeaders,e,n),o.encodeInitMessageHeaders=!0;const a=r.join("");zi("Connection","Creating WebChannel: "+a,o);const u=i.createWebChannel(a,o);let c=!1,l=!1;const h=new Ec({Hr:t=>{l?zi("Connection","Not sending because WebChannel is closed:",t):(c||(zi("Connection","Opening WebChannel transport."),u.open(),c=!0),zi("Connection","WebChannel sending:",t),u.send(t))},Jr:()=>u.close()}),f=(t,e,n)=>{t.listen(e,(t=>{try{n(t)}catch(t){setTimeout((()=>{throw t}),0)}}))};return f(u,Fi.EventType.OPEN,(()=>{l||zi("Connection","WebChannel transport opened.")})),f(u,Fi.EventType.CLOSE,(()=>{l||(l=!0,zi("Connection","WebChannel transport closed"),h.io())})),f(u,Fi.EventType.ERROR,(t=>{l||(l=!0,Gi("Connection","WebChannel transport errored:",t),h.io(new Ji(Xi.UNAVAILABLE,"The operation could not be completed")))})),f(u,Fi.EventType.MESSAGE,(t=>{var e;if(!l){const n=t.data[0];Qi(!!n);const r=n,i=r.error||(null===(e=r[0])||void 0===e?void 0:e.error);if(i){zi("Connection","WebChannel received error:",i);const t=i.status;let e=function(t){const e=Fa[t];if(void 0!==e)return Ua(e)}(t),n=i.message;void 0===e&&(e=Xi.INTERNAL,n="Unknown error status: "+t+" with message "+i.message),l=!0,h.io(new Ji(e,n)),u.close()}else zi("Connection","WebChannel received:",n),h.ro(n)}})),f(s,Oi.STAT_EVENT,(t=>{t.stat===Mi.PROXY?zi("Connection","Detected buffering proxy"):t.stat===Mi.NOPROXY&&zi("Connection","Detected no buffering proxy")})),setTimeout((()=>{h.so()}),0),h}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Ic(){return"undefined"!=typeof document?document:null}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Cc(t){return new hu(t,!0)}class Sc{constructor(t,e,n=1e3,r=1.5,i=6e4){this.Hs=t,this.timerId=e,this.mo=n,this.yo=r,this.po=i,this.Io=0,this.To=null,this.Eo=Date.now(),this.reset()}reset(){this.Io=0}Ao(){this.Io=this.po}Ro(t){this.cancel();const e=Math.floor(this.Io+this.bo()),n=Math.max(0,Date.now()-this.Eo),r=Math.max(0,e-n);r>0&&zi("ExponentialBackoff",`Backing off for ${r} ms (base delay: ${this.Io} ms, delay with jitter: ${e} ms, last attempt: ${n} ms ago)`),this.To=this.Hs.enqueueAfterDelay(this.timerId,r,(()=>(this.Eo=Date.now(),t()))),this.Io*=this.yo,this.Io<this.mo&&(this.Io=this.mo),this.Io>this.po&&(this.Io=this.po)}Po(){null!==this.To&&(this.To.skipDelay(),this.To=null)}cancel(){null!==this.To&&(this.To.cancel(),this.To=null)}bo(){return(Math.random()-.5)*this.Io}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Ac{constructor(t,e,n,r,i,s,o,a){this.Hs=t,this.vo=n,this.Vo=r,this.connection=i,this.authCredentialsProvider=s,this.appCheckCredentialsProvider=o,this.listener=a,this.state=0,this.So=0,this.Do=null,this.Co=null,this.stream=null,this.xo=new Sc(t,e)}No(){return 1===this.state||5===this.state||this.ko()}ko(){return 2===this.state||3===this.state}start(){4!==this.state?this.auth():this.Oo()}async stop(){this.No()&&await this.close(0)}Mo(){this.state=0,this.xo.reset()}Fo(){this.ko()&&null===this.Do&&(this.Do=this.Hs.enqueueAfterDelay(this.vo,6e4,(()=>this.$o())))}Bo(t){this.Lo(),this.stream.send(t)}async $o(){if(this.ko())return this.close(0)}Lo(){this.Do&&(this.Do.cancel(),this.Do=null)}qo(){this.Co&&(this.Co.cancel(),this.Co=null)}async close(t,e){this.Lo(),this.qo(),this.xo.cancel(),this.So++,4!==t?this.xo.reset():e&&e.code===Xi.RESOURCE_EXHAUSTED?(Ki(e.toString()),Ki("Using maximum backoff delay to prevent overloading the backend."),this.xo.Ao()):e&&e.code===Xi.UNAUTHENTICATED&&3!==this.state&&(this.authCredentialsProvider.invalidateToken(),this.appCheckCredentialsProvider.invalidateToken()),null!==this.stream&&(this.Uo(),this.stream.close(),this.stream=null),this.state=t,await this.listener.Zr(e)}Uo(){}auth(){this.state=1;const t=this.Ko(this.So),e=this.So;Promise.all([this.authCredentialsProvider.getToken(),this.appCheckCredentialsProvider.getToken()]).then((([t,n])=>{this.So===e&&this.Go(t,n)}),(e=>{t((()=>{const t=new Ji(Xi.UNKNOWN,"Fetching auth token failed: "+e.message);return this.Qo(t)}))}))}Go(t,e){const n=this.Ko(this.So);this.stream=this.jo(t,e),this.stream.Yr((()=>{n((()=>(this.state=2,this.Co=this.Hs.enqueueAfterDelay(this.Vo,1e4,(()=>(this.ko()&&(this.state=3),Promise.resolve()))),this.listener.Yr())))})),this.stream.Zr((t=>{n((()=>this.Qo(t)))})),this.stream.onMessage((t=>{n((()=>this.onMessage(t)))}))}Oo(){this.state=5,this.xo.Ro((async()=>{this.state=0,this.start()}))}Qo(t){return zi("PersistentStream",`close with error: ${t}`),this.stream=null,this.close(4,t)}Ko(t){return e=>{this.Hs.enqueueAndForget((()=>this.So===t?e():(zi("PersistentStream","stream callback skipped by getCloseGuardedDispatcher."),Promise.resolve())))}}}class Dc extends Ac{constructor(t,e,n,r,i,s){super(t,"listen_stream_connection_backoff","listen_stream_idle","health_check_timeout",e,n,r,s),this.yt=i}jo(t,e){return this.connection.wo("Listen",t,e)}onMessage(t){this.xo.reset();const e=function(t,e){let n;if("targetChange"in e){e.targetChange;const r=function(t){return"NO_CHANGE"===t?0:"ADD"===t?1:"REMOVE"===t?2:"CURRENT"===t?3:"RESET"===t?4:Wi()}(e.targetChange.targetChangeType||"NO_CHANGE"),i=e.targetChange.targetIds||[],s=function(t,e){return t.wt?(Qi(void 0===e||"string"==typeof e),Ps.fromBase64String(e||"")):(Qi(void 0===e||e instanceof Uint8Array),Ps.fromUint8Array(e||new Uint8Array))}(t,e.targetChange.resumeToken),o=e.targetChange.cause,a=o&&function(t){const e=void 0===t.code?Xi.UNKNOWN:Ua(t.code);return new Ji(e,t.message||"")}(o);n=new ru(r,i,s,a||null)}else if("documentChange"in e){e.documentChange;const r=e.documentChange;r.document,r.document.name,r.document.updateTime;const i=yu(t,r.document.name),s=pu(r.document.updateTime),o=r.document.createTime?pu(r.document.createTime):ds.min(),a=new Fo({mapValue:{fields:r.document.fields}}),u=Po.newFoundDocument(i,s,o,a),c=r.targetIds||[],l=r.removedTargetIds||[];n=new eu(c,l,u.key,u)}else if("documentDelete"in e){e.documentDelete;const r=e.documentDelete;r.document;const i=yu(t,r.document),s=r.readTime?pu(r.readTime):ds.min(),o=Po.newNoDocument(i,s),a=r.removedTargetIds||[];n=new eu([],a,o.key,o)}else if("documentRemove"in e){e.documentRemove;const r=e.documentRemove;r.document;const i=yu(t,r.document),s=r.removedTargetIds||[];n=new eu([],s,i,null)}else{if(!("filter"in e))return Wi();{e.filter;const t=e.filter;t.targetId;const r=t.count||0,i=new Va(r),s=t.targetId;n=new nu(s,i)}}return n}(this.yt,t),n=function(t){if(!("targetChange"in t))return ds.min();const e=t.targetChange;return e.targetIds&&e.targetIds.length?ds.min():e.readTime?pu(e.readTime):ds.min()}(t);return this.listener.Wo(e,n)}zo(t){const e={};e.database=_u(this.yt),e.addTarget=function(t,e){let n;const r=e.target;return n=$o(r)?{documents:Eu(t,r)}:{query:Tu(t,r)},n.targetId=e.targetId,e.resumeToken.approximateByteSize()>0?n.resumeToken=du(t,e.resumeToken):e.snapshotVersion.compareTo(ds.min())>0&&(n.readTime=fu(t,e.snapshotVersion.toTimestamp())),n}(this.yt,t);const n=function(t,e){const n=function(t,e){switch(e){case 0:return null;case 1:return"existence-filter-mismatch";case 2:return"limbo-document";default:return Wi()}}(0,e.purpose);return null==n?null:{"goog-listen-tags":n}}(this.yt,t);n&&(e.labels=n),this.Bo(e)}Ho(t){const e={};e.database=_u(this.yt),e.removeTarget=t,this.Bo(e)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Nc extends class{}{constructor(t,e,n,r){super(),this.authCredentials=t,this.appCheckCredentials=e,this.connection=n,this.yt=r,this.nu=!1}su(){if(this.nu)throw new Ji(Xi.FAILED_PRECONDITION,"The client has already been terminated.")}ao(t,e,n){return this.su(),Promise.all([this.authCredentials.getToken(),this.appCheckCredentials.getToken()]).then((([r,i])=>this.connection.ao(t,e,n,r,i))).catch((t=>{throw"FirebaseError"===t.name?(t.code===Xi.UNAUTHENTICATED&&(this.authCredentials.invalidateToken(),this.appCheckCredentials.invalidateToken()),t):new Ji(Xi.UNKNOWN,t.toString())}))}_o(t,e,n,r){return this.su(),Promise.all([this.authCredentials.getToken(),this.appCheckCredentials.getToken()]).then((([i,s])=>this.connection._o(t,e,n,i,s,r))).catch((t=>{throw"FirebaseError"===t.name?(t.code===Xi.UNAUTHENTICATED&&(this.authCredentials.invalidateToken(),this.appCheckCredentials.invalidateToken()),t):new Ji(Xi.UNKNOWN,t.toString())}))}terminate(){this.nu=!0}}class kc{constructor(t,e){this.asyncQueue=t,this.onlineStateHandler=e,this.state="Unknown",this.iu=0,this.ru=null,this.ou=!0}uu(){0===this.iu&&(this.cu("Unknown"),this.ru=this.asyncQueue.enqueueAfterDelay("online_state_timeout",1e4,(()=>(this.ru=null,this.au("Backend didn't respond within 10 seconds."),this.cu("Offline"),Promise.resolve()))))}hu(t){"Online"===this.state?this.cu("Unknown"):(this.iu++,this.iu>=1&&(this.lu(),this.au(`Connection failed 1 times. Most recent error: ${t.toString()}`),this.cu("Offline")))}set(t){this.lu(),this.iu=0,"Online"===t&&(this.ou=!1),this.cu(t)}cu(t){t!==this.state&&(this.state=t,this.onlineStateHandler(t))}au(t){const e=`Could not reach Cloud Firestore backend. ${t}\nThis typically indicates that your device does not have a healthy Internet connection at the moment. The client will operate in offline mode until it is able to successfully connect to the backend.`;this.ou?(Ki(e),this.ou=!1):zi("OnlineStateTracker",e)}lu(){null!==this.ru&&(this.ru.cancel(),this.ru=null)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class xc{constructor(t,e,n,r,i){this.localStore=t,this.datastore=e,this.asyncQueue=n,this.remoteSyncer={},this.fu=[],this.du=new Map,this._u=new Set,this.wu=[],this.mu=i,this.mu.Ur((t=>{n.enqueueAndForget((async()=>{jc(this)&&(zi("RemoteStore","Restarting streams for network reachability change."),await async function(t){const e=Yi(t);e._u.add(4),await Lc(e),e.gu.set("Unknown"),e._u.delete(4),await Rc(e)}(this))}))})),this.gu=new kc(n,r)}}async function Rc(t){if(jc(t))for(const e of t.wu)await e(!0)}async function Lc(t){for(const e of t.wu)await e(!1)}function Oc(t,e){const n=Yi(t);n.du.has(e.targetId)||(n.du.set(e.targetId,e),Uc(n)?Pc(n):Wc(n).ko()&&Vc(n,e))}function Mc(t,e){const n=Yi(t),r=Wc(n);n.du.delete(e),r.ko()&&Fc(n,e),0===n.du.size&&(r.ko()?r.Fo():jc(n)&&n.gu.set("Unknown"))}function Vc(t,e){t.yu.Ot(e.targetId),Wc(t).zo(e)}function Fc(t,e){t.yu.Ot(e),Wc(t).Ho(e)}function Pc(t){t.yu=new su({getRemoteKeysForTarget:e=>t.remoteSyncer.getRemoteKeysForTarget(e),ne:e=>t.du.get(e)||null}),Wc(t).start(),t.gu.uu()}function Uc(t){return jc(t)&&!Wc(t).No()&&t.du.size>0}function jc(t){return 0===Yi(t)._u.size}function Bc(t){t.yu=void 0}async function qc(t){t.du.forEach(((e,n)=>{Vc(t,e)}))}async function $c(t,e){Bc(t),Uc(t)?(t.gu.hu(e),Pc(t)):t.gu.set("Unknown")}async function zc(t,e,n){if(t.gu.set("Online"),e instanceof ru&&2===e.state&&e.cause)try{await async function(t,e){const n=e.cause;for(const r of e.targetIds)t.du.has(r)&&(await t.remoteSyncer.rejectListen(r,n),t.du.delete(r),t.yu.removeTarget(r))}(t,e)}catch(n){zi("RemoteStore","Failed to remove targets %s: %s ",e.targetIds.join(","),n),await Kc(t,n)}else if(e instanceof eu?t.yu.Kt(e):e instanceof nu?t.yu.Jt(e):t.yu.jt(e),!n.isEqual(ds.min()))try{const e=await hc(t.localStore);n.compareTo(e)>=0&&await function(t,e){const n=t.yu.Zt(e);return n.targetChanges.forEach(((n,r)=>{if(n.resumeToken.approximateByteSize()>0){const i=t.du.get(r);i&&t.du.set(r,i.withResumeToken(n.resumeToken,e))}})),n.targetMismatches.forEach((e=>{const n=t.du.get(e);if(!n)return;t.du.set(e,n.withResumeToken(Ps.EMPTY_BYTE_STRING,n.snapshotVersion)),Fc(t,e);const r=new Pu(n.target,e,1,n.sequenceNumber);Vc(t,r)})),t.remoteSyncer.applyRemoteEvent(n)}(t,n)}catch(e){zi("RemoteStore","Failed to raise snapshot:",e),await Kc(t,e)}}async function Kc(t,e,n){if(!Ds(e))throw e;t._u.add(1),await Lc(t),t.gu.set("Offline"),n||(n=()=>hc(t.localStore)),t.asyncQueue.enqueueRetryable((async()=>{zi("RemoteStore","Retrying IndexedDB access"),await n(),t._u.delete(1),await Rc(t)}))}async function Gc(t,e){const n=Yi(t);n.asyncQueue.verifyOperationInProgress(),zi("RemoteStore","RemoteStore received new credentials");const r=jc(n);n._u.add(3),await Lc(n),r&&n.gu.set("Unknown"),await n.remoteSyncer.handleCredentialChange(e),n._u.delete(3),await Rc(n)}async function Hc(t,e){const n=Yi(t);e?(n._u.delete(2),await Rc(n)):e||(n._u.add(2),await Lc(n),n.gu.set("Unknown"))}function Wc(t){return t.pu||(t.pu=function(t,e,n){const r=Yi(t);return r.su(),new Dc(e,r.connection,r.authCredentials,r.appCheckCredentials,r.yt,n)}(t.datastore,t.asyncQueue,{Yr:qc.bind(null,t),Zr:$c.bind(null,t),Wo:zc.bind(null,t)}),t.wu.push((async e=>{e?(t.pu.Mo(),Uc(t)?Pc(t):t.gu.set("Unknown")):(await t.pu.stop(),Bc(t))}))),t.pu}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Qc{constructor(t,e,n,r,i){this.asyncQueue=t,this.timerId=e,this.targetTimeMs=n,this.op=r,this.removalCallback=i,this.deferred=new Zi,this.then=this.deferred.promise.then.bind(this.deferred.promise),this.deferred.promise.catch((t=>{}))}static createAndSchedule(t,e,n,r,i){const s=Date.now()+n,o=new Qc(t,e,s,r,i);return o.start(n),o}start(t){this.timerHandle=setTimeout((()=>this.handleDelayElapsed()),t)}skipDelay(){return this.handleDelayElapsed()}cancel(t){null!==this.timerHandle&&(this.clearTimeout(),this.deferred.reject(new Ji(Xi.CANCELLED,"Operation cancelled"+(t?": "+t:""))))}handleDelayElapsed(){this.asyncQueue.enqueueAndForget((()=>null!==this.timerHandle?(this.clearTimeout(),this.op().then((t=>this.deferred.resolve(t)))):Promise.resolve()))}clearTimeout(){null!==this.timerHandle&&(this.removalCallback(this),clearTimeout(this.timerHandle),this.timerHandle=null)}}function Yc(t,e){if(Ki("AsyncQueue",`${e}: ${t}`),Ds(t))return new Ji(Xi.UNAVAILABLE,`${e}: ${t}`);throw t}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Xc{constructor(t){this.comparator=t?(e,n)=>t(e,n)||vs.comparator(e.key,n.key):(t,e)=>vs.comparator(t.key,e.key),this.keyedMap=za(),this.sortedSet=new xo(this.comparator)}static emptySet(t){return new Xc(t.comparator)}has(t){return null!=this.keyedMap.get(t)}get(t){return this.keyedMap.get(t)}first(){return this.sortedSet.minKey()}last(){return this.sortedSet.maxKey()}isEmpty(){return this.sortedSet.isEmpty()}indexOf(t){const e=this.keyedMap.get(t);return e?this.sortedSet.indexOf(e):-1}get size(){return this.sortedSet.size}forEach(t){this.sortedSet.inorderTraversal(((e,n)=>(t(e),!1)))}add(t){const e=this.delete(t.key);return e.copy(e.keyedMap.insert(t.key,t),e.sortedSet.insert(t,null))}delete(t){const e=this.get(t);return e?this.copy(this.keyedMap.remove(t),this.sortedSet.remove(e)):this}isEqual(t){if(!(t instanceof Xc))return!1;if(this.size!==t.size)return!1;const e=this.sortedSet.getIterator(),n=t.sortedSet.getIterator();for(;e.hasNext();){const t=e.getNext().key,r=n.getNext().key;if(!t.isEqual(r))return!1}return!0}toString(){const t=[];return this.forEach((e=>{t.push(e.toString())})),0===t.length?"DocumentSet ()":"DocumentSet (\n  "+t.join("  \n")+"\n)"}copy(t,e){const n=new Xc;return n.comparator=this.comparator,n.keyedMap=t,n.sortedSet=e,n}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Jc{constructor(){this.Tu=new xo(vs.comparator)}track(t){const e=t.doc.key,n=this.Tu.get(e);n?0!==t.type&&3===n.type?this.Tu=this.Tu.insert(e,t):3===t.type&&1!==n.type?this.Tu=this.Tu.insert(e,{type:n.type,doc:t.doc}):2===t.type&&2===n.type?this.Tu=this.Tu.insert(e,{type:2,doc:t.doc}):2===t.type&&0===n.type?this.Tu=this.Tu.insert(e,{type:0,doc:t.doc}):1===t.type&&0===n.type?this.Tu=this.Tu.remove(e):1===t.type&&2===n.type?this.Tu=this.Tu.insert(e,{type:1,doc:n.doc}):0===t.type&&1===n.type?this.Tu=this.Tu.insert(e,{type:2,doc:t.doc}):Wi():this.Tu=this.Tu.insert(e,t)}Eu(){const t=[];return this.Tu.inorderTraversal(((e,n)=>{t.push(n)})),t}}class Zc{constructor(t,e,n,r,i,s,o,a,u){this.query=t,this.docs=e,this.oldDocs=n,this.docChanges=r,this.mutatedKeys=i,this.fromCache=s,this.syncStateChanged=o,this.excludesMetadataChanges=a,this.hasCachedResults=u}static fromInitialDocuments(t,e,n,r,i){const s=[];return e.forEach((t=>{s.push({type:0,doc:t})})),new Zc(t,e,Xc.emptySet(e),s,n,r,!0,!1,i)}get hasPendingWrites(){return!this.mutatedKeys.isEmpty()}isEqual(t){if(!(this.fromCache===t.fromCache&&this.hasCachedResults===t.hasCachedResults&&this.syncStateChanged===t.syncStateChanged&&this.mutatedKeys.isEqual(t.mutatedKeys)&&ea(this.query,t.query)&&this.docs.isEqual(t.docs)&&this.oldDocs.isEqual(t.oldDocs)))return!1;const e=this.docChanges,n=t.docChanges;if(e.length!==n.length)return!1;for(let t=0;t<e.length;t++)if(e[t].type!==n[t].type||!e[t].doc.isEqual(n[t].doc))return!1;return!0}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class tl{constructor(){this.Au=void 0,this.listeners=[]}}class el{constructor(){this.queries=new ja((t=>na(t)),ea),this.onlineState="Unknown",this.Ru=new Set}}async function nl(t,e){const n=Yi(t),r=e.query;let i=!1,s=n.queries.get(r);if(s||(i=!0,s=new tl),i)try{s.Au=await n.onListen(r)}catch(t){const n=Yc(t,`Initialization of query '${ra(e.query)}' failed`);return void e.onError(n)}n.queries.set(r,s),s.listeners.push(e),e.bu(n.onlineState),s.Au&&e.Pu(s.Au)&&ol(n)}async function rl(t,e){const n=Yi(t),r=e.query;let i=!1;const s=n.queries.get(r);if(s){const t=s.listeners.indexOf(e);t>=0&&(s.listeners.splice(t,1),i=0===s.listeners.length)}if(i)return n.queries.delete(r),n.onUnlisten(r)}function il(t,e){const n=Yi(t);let r=!1;for(const t of e){const e=t.query,i=n.queries.get(e);if(i){for(const e of i.listeners)e.Pu(t)&&(r=!0);i.Au=t}}r&&ol(n)}function sl(t,e,n){const r=Yi(t),i=r.queries.get(e);if(i)for(const t of i.listeners)t.onError(n);r.queries.delete(e)}function ol(t){t.Ru.forEach((t=>{t.next()}))}class al{constructor(t,e,n){this.query=t,this.vu=e,this.Vu=!1,this.Su=null,this.onlineState="Unknown",this.options=n||{}}Pu(t){if(!this.options.includeMetadataChanges){const e=[];for(const n of t.docChanges)3!==n.type&&e.push(n);t=new Zc(t.query,t.docs,t.oldDocs,e,t.mutatedKeys,t.fromCache,t.syncStateChanged,!0,t.hasCachedResults)}let e=!1;return this.Vu?this.Du(t)&&(this.vu.next(t),e=!0):this.Cu(t,this.onlineState)&&(this.xu(t),e=!0),this.Su=t,e}onError(t){this.vu.error(t)}bu(t){this.onlineState=t;let e=!1;return this.Su&&!this.Vu&&this.Cu(this.Su,t)&&(this.xu(this.Su),e=!0),e}Cu(t,e){if(!t.fromCache)return!0;const n="Offline"!==e;return(!this.options.Nu||!n)&&(!t.docs.isEmpty()||t.hasCachedResults||"Offline"===e)}Du(t){if(t.docChanges.length>0)return!0;const e=this.Su&&this.Su.hasPendingWrites!==t.hasPendingWrites;return!(!t.syncStateChanged&&!e)&&!0===this.options.includeMetadataChanges}xu(t){t=Zc.fromInitialDocuments(t.query,t.docs,t.mutatedKeys,t.fromCache,t.hasCachedResults),this.Vu=!0,this.vu.next(t)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class ul{constructor(t){this.key=t}}class cl{constructor(t){this.key=t}}class ll{constructor(t,e){this.query=t,this.qu=e,this.Uu=null,this.hasCachedResults=!1,this.current=!1,this.Ku=Ya(),this.mutatedKeys=Ya(),this.Gu=oa(t),this.Qu=new Xc(this.Gu)}get ju(){return this.qu}Wu(t,e){const n=e?e.zu:new Jc,r=e?e.Qu:this.Qu;let i=e?e.mutatedKeys:this.mutatedKeys,s=r,o=!1;const a="F"===this.query.limitType&&r.size===this.query.limit?r.last():null,u="L"===this.query.limitType&&r.size===this.query.limit?r.first():null;if(t.inorderTraversal(((t,e)=>{const c=r.get(t),l=ia(this.query,e)?e:null,h=!!c&&this.mutatedKeys.has(c.key),f=!!l&&(l.hasLocalMutations||this.mutatedKeys.has(l.key)&&l.hasCommittedMutations);let d=!1;c&&l?c.data.isEqual(l.data)?h!==f&&(n.track({type:3,doc:l}),d=!0):this.Hu(c,l)||(n.track({type:2,doc:l}),d=!0,(a&&this.Gu(l,a)>0||u&&this.Gu(l,u)<0)&&(o=!0)):!c&&l?(n.track({type:0,doc:l}),d=!0):c&&!l&&(n.track({type:1,doc:c}),d=!0,(a||u)&&(o=!0)),d&&(l?(s=s.add(l),i=f?i.add(t):i.delete(t)):(s=s.delete(t),i=i.delete(t)))})),null!==this.query.limit)for(;s.size>this.query.limit;){const t="F"===this.query.limitType?s.last():s.first();s=s.delete(t.key),i=i.delete(t.key),n.track({type:1,doc:t})}return{Qu:s,zu:n,$i:o,mutatedKeys:i}}Hu(t,e){return t.hasLocalMutations&&e.hasCommittedMutations&&!e.hasLocalMutations}applyChanges(t,e,n){const r=this.Qu;this.Qu=t.Qu,this.mutatedKeys=t.mutatedKeys;const i=t.zu.Eu();i.sort(((t,e)=>function(t,e){const n=t=>{switch(t){case 0:return 1;case 2:case 3:return 2;case 1:return 0;default:return Wi()}};return n(t)-n(e)}(t.type,e.type)||this.Gu(t.doc,e.doc))),this.Ju(n);const s=e?this.Yu():[],o=0===this.Ku.size&&this.current?1:0,a=o!==this.Uu;return this.Uu=o,0!==i.length||a?{snapshot:new Zc(this.query,t.Qu,r,i,t.mutatedKeys,0===o,a,!1,!!n&&n.resumeToken.approximateByteSize()>0),Xu:s}:{Xu:s}}bu(t){return this.current&&"Offline"===t?(this.current=!1,this.applyChanges({Qu:this.Qu,zu:new Jc,mutatedKeys:this.mutatedKeys,$i:!1},!1)):{Xu:[]}}Zu(t){return!this.qu.has(t)&&!!this.Qu.has(t)&&!this.Qu.get(t).hasLocalMutations}Ju(t){t&&(t.addedDocuments.forEach((t=>this.qu=this.qu.add(t))),t.modifiedDocuments.forEach((t=>{})),t.removedDocuments.forEach((t=>this.qu=this.qu.delete(t))),this.current=t.current)}Yu(){if(!this.current)return[];const t=this.Ku;this.Ku=Ya(),this.Qu.forEach((t=>{this.Zu(t.key)&&(this.Ku=this.Ku.add(t.key))}));const e=[];return t.forEach((t=>{this.Ku.has(t)||e.push(new cl(t))})),this.Ku.forEach((n=>{t.has(n)||e.push(new ul(n))})),e}tc(t){this.qu=t.Hi,this.Ku=Ya();const e=this.Wu(t.documents);return this.applyChanges(e,!0)}ec(){return Zc.fromInitialDocuments(this.query,this.Qu,this.mutatedKeys,0===this.Uu,this.hasCachedResults)}}class hl{constructor(t,e,n){this.query=t,this.targetId=e,this.view=n}}class fl{constructor(t){this.key=t,this.nc=!1}}class dl{constructor(t,e,n,r,i,s){this.localStore=t,this.remoteStore=e,this.eventManager=n,this.sharedClientState=r,this.currentUser=i,this.maxConcurrentLimboResolutions=s,this.sc={},this.ic=new ja((t=>na(t)),ea),this.rc=new Map,this.oc=new Set,this.uc=new xo(vs.comparator),this.cc=new Map,this.ac=new Xu,this.hc={},this.lc=new Map,this.fc=Ku.vn(),this.onlineState="Unknown",this.dc=void 0}get isPrimaryClient(){return!0===this.dc}}async function pl(t,e){const n=Dl(t);let r,i;const s=n.ic.get(e);if(s)r=s.targetId,n.sharedClientState.addLocalQueryTarget(r),i=s.view.ec();else{const t=await dc(n.localStore,Jo(e));n.isPrimaryClient&&Oc(n.remoteStore,t);const s=n.sharedClientState.addLocalQueryTarget(t.targetId);r=t.targetId,i=await gl(n,e,r,"current"===s,t.resumeToken)}return i}async function gl(t,e,n,r,i){t._c=(e,n,r)=>async function(t,e,n,r){let i=e.view.Wu(n);i.$i&&(i=await gc(t.localStore,e.query,!1).then((({documents:t})=>e.view.Wu(t,i))));const s=r&&r.targetChanges.get(e.targetId),o=e.view.applyChanges(i,t.isPrimaryClient,s);return El(t,e.targetId,o.Xu),o.snapshot}(t,e,n,r);const s=await gc(t.localStore,e,!0),o=new ll(e,s.Hi),a=o.Wu(s.documents),u=tu.createSynthesizedTargetChangeForCurrentChange(n,r&&"Offline"!==t.onlineState,i),c=o.applyChanges(a,t.isPrimaryClient,u);El(t,n,c.Xu);const l=new hl(e,n,o);return t.ic.set(e,l),t.rc.has(n)?t.rc.get(n).push(e):t.rc.set(n,[e]),c.snapshot}async function ml(t,e){const n=Yi(t),r=n.ic.get(e),i=n.rc.get(r.targetId);if(i.length>1)return n.rc.set(r.targetId,i.filter((t=>!ea(t,e)))),void n.ic.delete(e);n.isPrimaryClient?(n.sharedClientState.removeLocalQueryTarget(r.targetId),n.sharedClientState.isActiveQueryTarget(r.targetId)||await pc(n.localStore,r.targetId,!1).then((()=>{n.sharedClientState.clearQueryState(r.targetId),Mc(n.remoteStore,r.targetId),_l(n,r.targetId)})).catch(Ss)):(_l(n,r.targetId),await pc(n.localStore,r.targetId,!0))}async function yl(t,e){const n=Yi(t);try{const t=await function(t,e){const n=Yi(t),r=e.snapshotVersion;let i=n.qi;return n.persistence.runTransaction("Apply remote event","readwrite-primary",(t=>{const s=n.Gi.newChangeBuffer({trackRemovals:!0});i=n.qi;const o=[];e.targetChanges.forEach(((s,a)=>{const u=i.get(a);if(!u)return;o.push(n.Cs.removeMatchingKeys(t,s.removedDocuments,a).next((()=>n.Cs.addMatchingKeys(t,s.addedDocuments,a))));let c=u.withSequenceNumber(t.currentSequenceNumber);e.targetMismatches.has(a)?c=c.withResumeToken(Ps.EMPTY_BYTE_STRING,ds.min()).withLastLimboFreeSnapshotVersion(ds.min()):s.resumeToken.approximateByteSize()>0&&(c=c.withResumeToken(s.resumeToken,r)),i=i.insert(a,c),function(t,e,n){return 0===t.resumeToken.approximateByteSize()||e.snapshotVersion.toMicroseconds()-t.snapshotVersion.toMicroseconds()>=3e8||n.addedDocuments.size+n.modifiedDocuments.size+n.removedDocuments.size>0}(u,c,s)&&o.push(n.Cs.updateTargetData(t,c))}));let a=qa(),u=Ya();if(e.documentUpdates.forEach((r=>{e.resolvedLimboDocuments.has(r)&&o.push(n.persistence.referenceDelegate.updateLimboDocument(t,r))})),o.push(fc(t,s,e.documentUpdates).next((t=>{a=t.Wi,u=t.zi}))),!r.isEqual(ds.min())){const e=n.Cs.getLastRemoteSnapshotVersion(t).next((e=>n.Cs.setTargetsMetadata(t,t.currentSequenceNumber,r)));o.push(e)}return As.waitFor(o).next((()=>s.apply(t))).next((()=>n.localDocuments.getLocalViewOfDocuments(t,a,u))).next((()=>a))})).then((t=>(n.qi=i,t)))}(n.localStore,e);e.targetChanges.forEach(((t,e)=>{const r=n.cc.get(e);r&&(Qi(t.addedDocuments.size+t.modifiedDocuments.size+t.removedDocuments.size<=1),t.addedDocuments.size>0?r.nc=!0:t.modifiedDocuments.size>0?Qi(r.nc):t.removedDocuments.size>0&&(Qi(r.nc),r.nc=!1))})),await Cl(n,t,e)}catch(t){await Ss(t)}}function vl(t,e,n){const r=Yi(t);if(r.isPrimaryClient&&0===n||!r.isPrimaryClient&&1===n){const t=[];r.ic.forEach(((n,r)=>{const i=r.view.bu(e);i.snapshot&&t.push(i.snapshot)})),function(t,e){const n=Yi(t);n.onlineState=e;let r=!1;n.queries.forEach(((t,n)=>{for(const t of n.listeners)t.bu(e)&&(r=!0)})),r&&ol(n)}(r.eventManager,e),t.length&&r.sc.Wo(t),r.onlineState=e,r.isPrimaryClient&&r.sharedClientState.setOnlineState(e)}}async function wl(t,e,n){const r=Yi(t);r.sharedClientState.updateQueryState(e,"rejected",n);const i=r.cc.get(e),s=i&&i.key;if(s){let t=new xo(vs.comparator);t=t.insert(s,Po.newNoDocument(s,ds.min()));const n=Ya().add(s),i=new Za(ds.min(),new Map,new Oo(ls),t,n);await yl(r,i),r.uc=r.uc.remove(s),r.cc.delete(e),Il(r)}else await pc(r.localStore,e,!1).then((()=>_l(r,e,n))).catch(Ss)}function _l(t,e,n=null){t.sharedClientState.removeLocalQueryTarget(e);for(const r of t.rc.get(e))t.ic.delete(r),n&&t.sc.wc(r,n);t.rc.delete(e),t.isPrimaryClient&&t.ac.ls(e).forEach((e=>{t.ac.containsKey(e)||bl(t,e)}))}function bl(t,e){t.oc.delete(e.path.canonicalString());const n=t.uc.get(e);null!==n&&(Mc(t.remoteStore,n),t.uc=t.uc.remove(e),t.cc.delete(n),Il(t))}function El(t,e,n){for(const r of n)r instanceof ul?(t.ac.addReference(r.key,e),Tl(t,r)):r instanceof cl?(zi("SyncEngine","Document no longer in limbo: "+r.key),t.ac.removeReference(r.key,e),t.ac.containsKey(r.key)||bl(t,r.key)):Wi()}function Tl(t,e){const n=e.key,r=n.path.canonicalString();t.uc.get(n)||t.oc.has(r)||(zi("SyncEngine","New document in limbo: "+n),t.oc.add(r),Il(t))}function Il(t){for(;t.oc.size>0&&t.uc.size<t.maxConcurrentLimboResolutions;){const e=t.oc.values().next().value;t.oc.delete(e);const n=new vs(gs.fromString(e)),r=t.fc.next();t.cc.set(r,new fl(n)),t.uc=t.uc.insert(n,r),Oc(t.remoteStore,new Pu(Jo(Go(n.path)),r,2,Ns.at))}}async function Cl(t,e,n){const r=Yi(t),i=[],s=[],o=[];r.ic.isEmpty()||(r.ic.forEach(((t,a)=>{o.push(r._c(a,e,n).then((t=>{if((t||n)&&r.isPrimaryClient&&r.sharedClientState.updateQueryState(a.targetId,(null==t?void 0:t.fromCache)?"not-current":"current"),t){i.push(t);const e=oc.Ci(a.targetId,t);s.push(e)}})))})),await Promise.all(o),r.sc.Wo(i),await async function(t,e){const n=Yi(t);try{await n.persistence.runTransaction("notifyLocalViewChanges","readwrite",(t=>As.forEach(e,(e=>As.forEach(e.Si,(r=>n.persistence.referenceDelegate.addReference(t,e.targetId,r))).next((()=>As.forEach(e.Di,(r=>n.persistence.referenceDelegate.removeReference(t,e.targetId,r)))))))))}catch(t){if(!Ds(t))throw t;zi("LocalStore","Failed to update sequence numbers: "+t)}for(const t of e){const e=t.targetId;if(!t.fromCache){const t=n.qi.get(e),r=t.snapshotVersion,i=t.withLastLimboFreeSnapshotVersion(r);n.qi=n.qi.insert(e,i)}}}(r.localStore,s))}async function Sl(t,e){const n=Yi(t);if(!n.currentUser.isEqual(e)){zi("SyncEngine","User change. New user:",e.toKey());const t=await lc(n.localStore,e);n.currentUser=e,function(t,e){t.lc.forEach((t=>{t.forEach((t=>{t.reject(new Ji(Xi.CANCELLED,"'waitForPendingWrites' promise is rejected due to a user change."))}))})),t.lc.clear()}(n),n.sharedClientState.handleUserChange(e,t.removedBatchIds,t.addedBatchIds),await Cl(n,t.ji)}}function Al(t,e){const n=Yi(t),r=n.cc.get(e);if(r&&r.nc)return Ya().add(r.key);{let t=Ya();const r=n.rc.get(e);if(!r)return t;for(const e of r){const r=n.ic.get(e);t=t.unionWith(r.view.ju)}return t}}function Dl(t){const e=Yi(t);return e.remoteStore.remoteSyncer.applyRemoteEvent=yl.bind(null,e),e.remoteStore.remoteSyncer.getRemoteKeysForTarget=Al.bind(null,e),e.remoteStore.remoteSyncer.rejectListen=wl.bind(null,e),e.sc.Wo=il.bind(null,e.eventManager),e.sc.wc=sl.bind(null,e.eventManager),e}class Nl{constructor(){this.synchronizeTabs=!1}async initialize(t){this.yt=Cc(t.databaseInfo.databaseId),this.sharedClientState=this.gc(t),this.persistence=this.yc(t),await this.persistence.start(),this.localStore=this.Ic(t),this.gcScheduler=this.Tc(t,this.localStore),this.indexBackfillerScheduler=this.Ec(t,this.localStore)}Tc(t,e){return null}Ec(t,e){return null}Ic(t){return cc(this.persistence,new ac,t.initialUser,this.yt)}yc(t){return new rc(sc.Bs,this.yt)}gc(t){return new vc}async terminate(){this.gcScheduler&&this.gcScheduler.stop(),await this.sharedClientState.shutdown(),await this.persistence.shutdown()}}class kl{async initialize(t,e){this.localStore||(this.localStore=t.localStore,this.sharedClientState=t.sharedClientState,this.datastore=this.createDatastore(e),this.remoteStore=this.createRemoteStore(e),this.eventManager=this.createEventManager(e),this.syncEngine=this.createSyncEngine(e,!t.synchronizeTabs),this.sharedClientState.onlineStateHandler=t=>vl(this.syncEngine,t,1),this.remoteStore.remoteSyncer.handleCredentialChange=Sl.bind(null,this.syncEngine),await Hc(this.remoteStore,this.syncEngine.isPrimaryClient))}createEventManager(t){return new el}createDatastore(t){const e=Cc(t.databaseInfo.databaseId),n=(r=t.databaseInfo,new Tc(r));var r;return function(t,e,n,r){return new Nc(t,e,n,r)}(t.authCredentials,t.appCheckCredentials,n,e)}createRemoteStore(t){var e,n,r,i,s;return e=this.localStore,n=this.datastore,r=t.asyncQueue,i=t=>vl(this.syncEngine,t,0),s=_c.C()?new _c:new wc,new xc(e,n,r,i,s)}createSyncEngine(t,e){return function(t,e,n,r,i,s,o){const a=new dl(t,e,n,r,i,s);return o&&(a.dc=!0),a}(this.localStore,this.remoteStore,this.eventManager,this.sharedClientState,t.initialUser,t.maxConcurrentLimboResolutions,e)}terminate(){return async function(t){const e=Yi(t);zi("RemoteStore","RemoteStore shutting down."),e._u.add(5),await Lc(e),e.mu.shutdown(),e.gu.set("Unknown")}(this.remoteStore)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function xl(t,e,n){if(!n)throw new Ji(Xi.INVALID_ARGUMENT,`Function ${t}() cannot be called with an empty ${e}.`)}function Rl(t){if(!vs.isDocumentKey(t))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid document reference. Document references must have an even number of segments, but ${t} has ${t.length}.`)}function Ll(t){if(vs.isDocumentKey(t))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid collection reference. Collection references must have an odd number of segments, but ${t} has ${t.length}.`)}function Ol(t){if(void 0===t)return"undefined";if(null===t)return"null";if("string"==typeof t)return t.length>20&&(t=`${t.substring(0,20)}...`),JSON.stringify(t);if("number"==typeof t||"boolean"==typeof t)return""+t;if("object"==typeof t){if(t instanceof Array)return"an array";{const e=function(t){return t.constructor?t.constructor.name:null}(t);return e?`a custom ${e} object`:"an object"}}return"function"==typeof t?"a function":Wi()}function Ml(t,e){if("_delegate"in t&&(t=t._delegate),!(t instanceof e)){if(e.name===t.constructor.name)throw new Ji(Xi.INVALID_ARGUMENT,"Type does not match the expected instance. Did you pass a reference from a different Firestore SDK?");{const n=Ol(t);throw new Ji(Xi.INVALID_ARGUMENT,`Expected type '${e.name}', but it was: ${n}`)}}return t}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const Vl=new Map;class Fl{constructor(t){var e;if(void 0===t.host){if(void 0!==t.ssl)throw new Ji(Xi.INVALID_ARGUMENT,"Can't provide ssl option if host option is not set");this.host="firestore.googleapis.com",this.ssl=!0}else this.host=t.host,this.ssl=null===(e=t.ssl)||void 0===e||e;if(this.credentials=t.credentials,this.ignoreUndefinedProperties=!!t.ignoreUndefinedProperties,void 0===t.cacheSizeBytes)this.cacheSizeBytes=41943040;else{if(-1!==t.cacheSizeBytes&&t.cacheSizeBytes<1048576)throw new Ji(Xi.INVALID_ARGUMENT,"cacheSizeBytes must be at least 1048576");this.cacheSizeBytes=t.cacheSizeBytes}this.experimentalForceLongPolling=!!t.experimentalForceLongPolling,this.experimentalAutoDetectLongPolling=!!t.experimentalAutoDetectLongPolling,this.useFetchStreams=!!t.useFetchStreams,function(t,e,n,r){if(!0===e&&!0===r)throw new Ji(Xi.INVALID_ARGUMENT,`${t} and ${n} cannot be used together.`)}("experimentalForceLongPolling",t.experimentalForceLongPolling,"experimentalAutoDetectLongPolling",t.experimentalAutoDetectLongPolling)}isEqual(t){return this.host===t.host&&this.ssl===t.ssl&&this.credentials===t.credentials&&this.cacheSizeBytes===t.cacheSizeBytes&&this.experimentalForceLongPolling===t.experimentalForceLongPolling&&this.experimentalAutoDetectLongPolling===t.experimentalAutoDetectLongPolling&&this.ignoreUndefinedProperties===t.ignoreUndefinedProperties&&this.useFetchStreams===t.useFetchStreams}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class Pl{constructor(t,e,n,r){this._authCredentials=t,this._appCheckCredentials=e,this._databaseId=n,this._app=r,this.type="firestore-lite",this._persistenceKey="(lite)",this._settings=new Fl({}),this._settingsFrozen=!1}get app(){if(!this._app)throw new Ji(Xi.FAILED_PRECONDITION,"Firestore was not initialized using the Firebase SDK. 'app' is not available");return this._app}get _initialized(){return this._settingsFrozen}get _terminated(){return void 0!==this._terminateTask}_setSettings(t){if(this._settingsFrozen)throw new Ji(Xi.FAILED_PRECONDITION,"Firestore has already been started and its settings can no longer be changed. You can only modify settings before calling any other methods on a Firestore object.");this._settings=new Fl(t),void 0!==t.credentials&&(this._authCredentials=function(t){if(!t)return new es;switch(t.type){case"gapi":const e=t.client;return new ss(e,t.sessionIndex||"0",t.iamToken||null,t.authTokenFactory||null);case"provider":return t.client;default:throw new Ji(Xi.INVALID_ARGUMENT,"makeAuthCredentialsProvider failed due to invalid credential type")}}(t.credentials))}_getSettings(){return this._settings}_freezeSettings(){return this._settingsFrozen=!0,this._settings}_delete(){return this._terminateTask||(this._terminateTask=this._terminate()),this._terminateTask}toJSON(){return{app:this._app,databaseId:this._databaseId,settings:this._settings}}_terminate(){return function(t){const e=Vl.get(t);e&&(zi("ComponentProvider","Removing Datastore"),Vl.delete(t),e.terminate())}(this),Promise.resolve()}}function Ul(t,e,n,r={}){var i;const s=(t=Ml(t,Pl))._getSettings();if("firestore.googleapis.com"!==s.host&&s.host!==e&&Gi("Host has been set in both settings() and useEmulator(), emulator host will be used"),t._setSettings(Object.assign(Object.assign({},s),{host:`${e}:${n}`,ssl:!1})),r.mockUserToken){let e,n;if("string"==typeof r.mockUserToken)e=r.mockUserToken,n=ji.MOCK_USER;else{e=D(r.mockUserToken,null===(i=t._app)||void 0===i?void 0:i.options.projectId);const s=r.mockUserToken.sub||r.mockUserToken.user_id;if(!s)throw new Ji(Xi.INVALID_ARGUMENT,"mockUserToken must contain 'sub' or 'user_id' field!");n=new ji(s)}t._authCredentials=new ns(new ts(e,n))}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class jl{constructor(t,e,n){this.converter=e,this._key=n,this.type="document",this.firestore=t}get _path(){return this._key.path}get id(){return this._key.path.lastSegment()}get path(){return this._key.path.canonicalString()}get parent(){return new ql(this.firestore,this.converter,this._key.path.popLast())}withConverter(t){return new jl(this.firestore,t,this._key)}}class Bl{constructor(t,e,n){this.converter=e,this._query=n,this.type="query",this.firestore=t}withConverter(t){return new Bl(this.firestore,t,this._query)}}class ql extends Bl{constructor(t,e,n){super(t,e,Go(n)),this._path=n,this.type="collection"}get id(){return this._query.path.lastSegment()}get path(){return this._query.path.canonicalString()}get parent(){const t=this._path.popLast();return t.isEmpty()?null:new jl(this.firestore,null,new vs(t))}withConverter(t){return new ql(this.firestore,t,this._path)}}function $l(t,e,...n){if(t=O(t),xl("collection","path",e),t instanceof Pl){const r=gs.fromString(e,...n);return Ll(r),new ql(t,null,r)}{if(!(t instanceof jl||t instanceof ql))throw new Ji(Xi.INVALID_ARGUMENT,"Expected first argument to collection() to be a CollectionReference, a DocumentReference or FirebaseFirestore");const r=t._path.child(gs.fromString(e,...n));return Ll(r),new ql(t.firestore,null,r)}}function zl(t,e){if(t=Ml(t,Pl),xl("collectionGroup","collection id",e),e.indexOf("/")>=0)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid collection ID '${e}' passed to function collectionGroup(). Collection IDs must not contain '/'.`);return new Bl(t,null,function(t){return new zo(gs.emptyPath(),t)}(e))}function Kl(t,e,...n){if(t=O(t),1===arguments.length&&(e=cs.R()),xl("doc","path",e),t instanceof Pl){const r=gs.fromString(e,...n);return Rl(r),new jl(t,null,new vs(r))}{if(!(t instanceof jl||t instanceof ql))throw new Ji(Xi.INVALID_ARGUMENT,"Expected first argument to collection() to be a CollectionReference, a DocumentReference or FirebaseFirestore");const r=t._path.child(gs.fromString(e,...n));return Rl(r),new jl(t.firestore,t instanceof ql?t.converter:null,new vs(r))}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Gl{constructor(t){this.observer=t,this.muted=!1}next(t){this.observer.next&&this.Rc(this.observer.next,t)}error(t){this.observer.error?this.Rc(this.observer.error,t):Ki("Uncaught Error in snapshot listener:",t.toString())}bc(){this.muted=!0}Rc(t,e){this.muted||setTimeout((()=>{this.muted||t(e)}),0)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Hl{constructor(t,e,n,r){this.authCredentials=t,this.appCheckCredentials=e,this.asyncQueue=n,this.databaseInfo=r,this.user=ji.UNAUTHENTICATED,this.clientId=cs.R(),this.authCredentialListener=()=>Promise.resolve(),this.appCheckCredentialListener=()=>Promise.resolve(),this.authCredentials.start(n,(async t=>{zi("FirestoreClient","Received user=",t.uid),await this.authCredentialListener(t),this.user=t})),this.appCheckCredentials.start(n,(t=>(zi("FirestoreClient","Received new app check token=",t),this.appCheckCredentialListener(t,this.user))))}async getConfiguration(){return{asyncQueue:this.asyncQueue,databaseInfo:this.databaseInfo,clientId:this.clientId,authCredentials:this.authCredentials,appCheckCredentials:this.appCheckCredentials,initialUser:this.user,maxConcurrentLimboResolutions:100}}setCredentialChangeListener(t){this.authCredentialListener=t}setAppCheckTokenChangeListener(t){this.appCheckCredentialListener=t}verifyNotTerminated(){if(this.asyncQueue.isShuttingDown)throw new Ji(Xi.FAILED_PRECONDITION,"The client has already been terminated.")}terminate(){this.asyncQueue.enterRestrictedMode();const t=new Zi;return this.asyncQueue.enqueueAndForgetEvenWhileRestricted((async()=>{try{this.onlineComponents&&await this.onlineComponents.terminate(),this.offlineComponents&&await this.offlineComponents.terminate(),this.authCredentials.shutdown(),this.appCheckCredentials.shutdown(),t.resolve()}catch(e){const n=Yc(e,"Failed to shutdown persistence");t.reject(n)}})),t.promise}}async function Wl(t,e){t.asyncQueue.verifyOperationInProgress(),zi("FirestoreClient","Initializing OfflineComponentProvider");const n=await t.getConfiguration();await e.initialize(n);let r=n.initialUser;t.setCredentialChangeListener((async t=>{r.isEqual(t)||(await lc(e.localStore,t),r=t)})),e.persistence.setDatabaseDeletedListener((()=>t.terminate())),t.offlineComponents=e}async function Ql(t,e){t.asyncQueue.verifyOperationInProgress();const n=await Yl(t);zi("FirestoreClient","Initializing OnlineComponentProvider");const r=await t.getConfiguration();await e.initialize(n,r),t.setCredentialChangeListener((t=>Gc(e.remoteStore,t))),t.setAppCheckTokenChangeListener(((t,n)=>Gc(e.remoteStore,n))),t.onlineComponents=e}async function Yl(t){return t.offlineComponents||(zi("FirestoreClient","Using default OfflineComponentProvider"),await Wl(t,new Nl)),t.offlineComponents}async function Xl(t){return t.onlineComponents||(zi("FirestoreClient","Using default OnlineComponentProvider"),await Ql(t,new kl)),t.onlineComponents}async function Jl(t){const e=await Xl(t),n=e.eventManager;return n.onListen=pl.bind(null,e.syncEngine),n.onUnlisten=ml.bind(null,e.syncEngine),n}function Zl(t,e,n={}){const r=new Zi;return t.asyncQueue.enqueueAndForget((async()=>function(t,e,n,r,i){const s=new Gl({next:n=>{e.enqueueAndForget((()=>rl(t,o))),n.fromCache&&"server"===r.source?i.reject(new Ji(Xi.UNAVAILABLE,'Failed to get documents from server. (However, these documents may exist in the local cache. Run again without setting source to "server" to retrieve the cached documents.)')):i.resolve(n)},error:t=>i.reject(t)}),o=new al(n,s,{includeMetadataChanges:!0,Nu:!0});return nl(t,o)}(await Jl(t),t.asyncQueue,e,n,r))),r.promise}class th{constructor(){this.Bc=Promise.resolve(),this.Lc=[],this.qc=!1,this.Uc=[],this.Kc=null,this.Gc=!1,this.Qc=!1,this.jc=[],this.xo=new Sc(this,"async_queue_retry"),this.Wc=()=>{const t=Ic();t&&zi("AsyncQueue","Visibility state changed to "+t.visibilityState),this.xo.Po()};const t=Ic();t&&"function"==typeof t.addEventListener&&t.addEventListener("visibilitychange",this.Wc)}get isShuttingDown(){return this.qc}enqueueAndForget(t){this.enqueue(t)}enqueueAndForgetEvenWhileRestricted(t){this.zc(),this.Hc(t)}enterRestrictedMode(t){if(!this.qc){this.qc=!0,this.Qc=t||!1;const e=Ic();e&&"function"==typeof e.removeEventListener&&e.removeEventListener("visibilitychange",this.Wc)}}enqueue(t){if(this.zc(),this.qc)return new Promise((()=>{}));const e=new Zi;return this.Hc((()=>this.qc&&this.Qc?Promise.resolve():(t().then(e.resolve,e.reject),e.promise))).then((()=>e.promise))}enqueueRetryable(t){this.enqueueAndForget((()=>(this.Lc.push(t),this.Jc())))}async Jc(){if(0!==this.Lc.length){try{await this.Lc[0](),this.Lc.shift(),this.xo.reset()}catch(t){if(!Ds(t))throw t;zi("AsyncQueue","Operation failed with retryable error: "+t)}this.Lc.length>0&&this.xo.Ro((()=>this.Jc()))}}Hc(t){const e=this.Bc.then((()=>(this.Gc=!0,t().catch((t=>{this.Kc=t,this.Gc=!1;const e=function(t){let e=t.message||"";return t.stack&&(e=t.stack.includes(t.message)?t.stack:t.message+"\n"+t.stack),e}(t);throw Ki("INTERNAL UNHANDLED ERROR: ",e),t})).then((t=>(this.Gc=!1,t))))));return this.Bc=e,e}enqueueAfterDelay(t,e,n){this.zc(),this.jc.indexOf(t)>-1&&(e=0);const r=Qc.createAndSchedule(this,t,e,n,(t=>this.Yc(t)));return this.Uc.push(r),r}zc(){this.Kc&&Wi()}verifyOperationInProgress(){}async Xc(){let t;do{t=this.Bc,await t}while(t!==this.Bc)}Zc(t){for(const e of this.Uc)if(e.timerId===t)return!0;return!1}ta(t){return this.Xc().then((()=>{this.Uc.sort(((t,e)=>t.targetTimeMs-e.targetTimeMs));for(const e of this.Uc)if(e.skipDelay(),"all"!==t&&e.timerId===t)break;return this.Xc()}))}ea(t){this.jc.push(t)}Yc(t){const e=this.Uc.indexOf(t);this.Uc.splice(e,1)}}class eh extends Pl{constructor(t,e,n,r){super(t,e,n,r),this.type="firestore",this._queue=new th,this._persistenceKey=(null==r?void 0:r.name)||"[DEFAULT]"}_terminate(){return this._firestoreClient||rh(this),this._firestoreClient.terminate()}}function nh(t){return t._firestoreClient||rh(t),t._firestoreClient.verifyNotTerminated(),t._firestoreClient}function rh(t){var e;const n=t._freezeSettings(),r=function(t,e,n,r){return new ks(t,e,n,r.host,r.ssl,r.experimentalForceLongPolling,r.experimentalAutoDetectLongPolling,r.useFetchStreams)}(t._databaseId,(null===(e=t._app)||void 0===e?void 0:e.options.appId)||"",t._persistenceKey,n);t._firestoreClient=new Hl(t._authCredentials,t._appCheckCredentials,t._queue,r)}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class ih{constructor(t){this._byteString=t}static fromBase64String(t){try{return new ih(Ps.fromBase64String(t))}catch(t){throw new Ji(Xi.INVALID_ARGUMENT,"Failed to construct data from Base64 string: "+t)}}static fromUint8Array(t){return new ih(Ps.fromUint8Array(t))}toBase64(){return this._byteString.toBase64()}toUint8Array(){return this._byteString.toUint8Array()}toString(){return"Bytes(base64: "+this.toBase64()+")"}isEqual(t){return this._byteString.isEqual(t._byteString)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class sh{constructor(...t){for(let e=0;e<t.length;++e)if(0===t[e].length)throw new Ji(Xi.INVALID_ARGUMENT,"Invalid field name at argument $(i + 1). Field names must not be empty.");this._internalPath=new ys(t)}isEqual(t){return this._internalPath.isEqual(t._internalPath)}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class oh{constructor(t){this._methodName=t}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */class ah{constructor(t,e){if(!isFinite(t)||t<-90||t>90)throw new Ji(Xi.INVALID_ARGUMENT,"Latitude must be a number between -90 and 90, but was: "+t);if(!isFinite(e)||e<-180||e>180)throw new Ji(Xi.INVALID_ARGUMENT,"Longitude must be a number between -180 and 180, but was: "+e);this._lat=t,this._long=e}get latitude(){return this._lat}get longitude(){return this._long}isEqual(t){return this._lat===t._lat&&this._long===t._long}toJSON(){return{latitude:this._lat,longitude:this._long}}_compareTo(t){return ls(this._lat,t._lat)||ls(this._long,t._long)}}
/**
 * @license
 * Copyright 2017 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */const uh=/^__.*__$/;function ch(t){switch(t){case 0:case 2:case 1:return!0;case 3:case 4:return!1;default:throw Wi()}}class lh{constructor(t,e,n,r,i,s){this.settings=t,this.databaseId=e,this.yt=n,this.ignoreUndefinedProperties=r,void 0===i&&this.na(),this.fieldTransforms=i||[],this.fieldMask=s||[]}get path(){return this.settings.path}get sa(){return this.settings.sa}ia(t){return new lh(Object.assign(Object.assign({},this.settings),t),this.databaseId,this.yt,this.ignoreUndefinedProperties,this.fieldTransforms,this.fieldMask)}ra(t){var e;const n=null===(e=this.path)||void 0===e?void 0:e.child(t),r=this.ia({path:n,oa:!1});return r.ua(t),r}ca(t){var e;const n=null===(e=this.path)||void 0===e?void 0:e.child(t),r=this.ia({path:n,oa:!1});return r.na(),r}aa(t){return this.ia({path:void 0,oa:!0})}ha(t){return _h(t,this.settings.methodName,this.settings.la||!1,this.path,this.settings.fa)}contains(t){return void 0!==this.fieldMask.find((e=>t.isPrefixOf(e)))||void 0!==this.fieldTransforms.find((e=>t.isPrefixOf(e.field)))}na(){if(this.path)for(let t=0;t<this.path.length;t++)this.ua(this.path.get(t))}ua(t){if(0===t.length)throw this.ha("Document fields must not be empty");if(ch(this.sa)&&uh.test(t))throw this.ha('Document fields cannot begin and end with "__"')}}class hh{constructor(t,e,n){this.databaseId=t,this.ignoreUndefinedProperties=e,this.yt=n||Cc(t)}da(t,e,n,r=!1){return new lh({sa:t,methodName:e,fa:n,path:ys.emptyPath(),oa:!1,la:r},this.databaseId,this.yt,this.ignoreUndefinedProperties)}}function fh(t){const e=t._freezeSettings(),n=Cc(t._databaseId);return new hh(t._databaseId,!!e.ignoreUndefinedProperties,n)}function dh(t,e,n,r=!1){return ph(n,t.da(r?4:3,e))}function ph(t,e){if(mh(t=O(t)))return yh("Unsupported field value:",e,t),gh(t,e);if(t instanceof oh)return function(t,e){if(!ch(e.sa))throw e.ha(`${t._methodName}() can only be used with update() and set()`);if(!e.path)throw e.ha(`${t._methodName}() is not currently supported inside arrays`);const n=t._toFieldTransform(e);n&&e.fieldTransforms.push(n)}(t,e),null;if(void 0===t&&e.ignoreUndefinedProperties)return null;if(e.path&&e.fieldMask.push(e.path),t instanceof Array){if(e.settings.oa&&4!==e.sa)throw e.ha("Nested arrays are not supported");return function(t,e){const n=[];let r=0;for(const i of t){let t=ph(i,e.aa(r));null==t&&(t={nullValue:"NULL_VALUE"}),n.push(t),r++}return{arrayValue:{values:n}}}(t,e)}return function(t,e){if(null===(t=O(t)))return{nullValue:"NULL_VALUE"};if("number"==typeof t)return la(e.yt,t);if("boolean"==typeof t)return{booleanValue:t};if("string"==typeof t)return{stringValue:t};if(t instanceof Date){const n=fs.fromDate(t);return{timestampValue:fu(e.yt,n)}}if(t instanceof fs){const n=new fs(t.seconds,1e3*Math.floor(t.nanoseconds/1e3));return{timestampValue:fu(e.yt,n)}}if(t instanceof ah)return{geoPointValue:{latitude:t.latitude,longitude:t.longitude}};if(t instanceof ih)return{bytesValue:du(e.yt,t._byteString)};if(t instanceof jl){const n=e.databaseId,r=t.firestore._databaseId;if(!r.isEqual(n))throw e.ha(`Document reference is for database ${r.projectId}/${r.database} but should be for database ${n.projectId}/${n.database}`);return{referenceValue:gu(t.firestore._databaseId||e.databaseId,t._key.path)}}throw e.ha(`Unsupported field value: ${Ol(t)}`)}(t,e)}function gh(t,e){const n={};return Os(t)?e.path&&e.path.length>0&&e.fieldMask.push(e.path):Ls(t,((t,r)=>{const i=ph(r,e.ra(t));null!=i&&(n[t]=i)})),{mapValue:{fields:n}}}function mh(t){return!("object"!=typeof t||null===t||t instanceof Array||t instanceof Date||t instanceof fs||t instanceof ah||t instanceof ih||t instanceof jl||t instanceof oh)}function yh(t,e,n){if(!mh(n)||!function(t){return"object"==typeof t&&null!==t&&(Object.getPrototypeOf(t)===Object.prototype||null===Object.getPrototypeOf(t))}(n)){const r=Ol(n);throw"an object"===r?e.ha(t+" a custom object"):e.ha(t+" "+r)}}const vh=new RegExp("[~\\*/\\[\\]]");function wh(t,e,n){if(e.search(vh)>=0)throw _h(`Invalid field path (${e}). Paths must not contain '~', '*', '/', '[', or ']'`,t,!1,void 0,n);try{return new sh(...e.split("."))._internalPath}catch(r){throw _h(`Invalid field path (${e}). Paths must not be empty, begin with '.', end with '.', or contain '..'`,t,!1,void 0,n)}}function _h(t,e,n,r,i){const s=r&&!r.isEmpty(),o=void 0!==i;let a=`Function ${e}() called with invalid data`;n&&(a+=" (via `toFirestore()`)"),a+=". ";let u="";return(s||o)&&(u+=" (found",s&&(u+=` in field ${r}`),o&&(u+=` in document ${i}`),u+=")"),new Ji(Xi.INVALID_ARGUMENT,a+t+u)}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class bh{constructor(t,e,n,r,i){this._firestore=t,this._userDataWriter=e,this._key=n,this._document=r,this._converter=i}get id(){return this._key.path.lastSegment()}get ref(){return new jl(this._firestore,this._converter,this._key)}exists(){return null!==this._document}data(){if(this._document){if(this._converter){const t=new Eh(this._firestore,this._userDataWriter,this._key,this._document,null);return this._converter.fromFirestore(t)}return this._userDataWriter.convertValue(this._document.data.value)}}get(t){if(this._document){const e=this._document.data.field(Th("DocumentSnapshot.get",t));if(null!==e)return this._userDataWriter.convertValue(e)}}}class Eh extends bh{data(){return super.data()}}function Th(t,e){return"string"==typeof e?wh(t,e):e instanceof sh?e._internalPath:e._delegate._internalPath}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */function Ih(t){if("L"===t.limitType&&0===t.explicitOrderBy.length)throw new Ji(Xi.UNIMPLEMENTED,"limitToLast() queries require specifying at least one orderBy() clause")}class Ch{}class Sh extends Ch{}function Ah(t,e,...n){let r=[];e instanceof Ch&&r.push(e),r=r.concat(n),function(t){const e=t.filter((t=>t instanceof kh)).length,n=t.filter((t=>t instanceof Dh)).length;if(e>1||e>0&&n>0)throw new Ji(Xi.INVALID_ARGUMENT,"InvalidQuery. When using composite filters, you cannot use more than one filter at the top level. Consider nesting the multiple filters within an `and(...)` statement. For example: change `query(query, where(...), or(...))` to `query(query, and(where(...), or(...)))`.")}(r);for(const e of r)t=e._apply(t);return t}class Dh extends Sh{constructor(t,e,n){super(),this._field=t,this._op=e,this._value=n,this.type="where"}static _create(t,e,n){return new Dh(t,e,n)}_apply(t){const e=this._parse(t);return Lh(t._query,e),new Bl(t.firestore,t.converter,Zo(t._query,e))}_parse(t){const e=fh(t.firestore),n=function(t,e,n,r,i,s,o){let a;if(i.isKeyField()){if("array-contains"===s||"array-contains-any"===s)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid Query. You can't perform '${s}' queries on documentId().`);if("in"===s||"not-in"===s){Rh(o,s);const e=[];for(const n of o)e.push(xh(r,t,n));a={arrayValue:{values:e}}}else a=xh(r,t,o)}else"in"!==s&&"not-in"!==s&&"array-contains-any"!==s||Rh(o,s),a=dh(n,"where",o,"in"===s||"not-in"===s);return fo.create(i,s,a)}(t._query,0,e,t.firestore._databaseId,this._field,this._op,this._value);return n}}function Nh(t,e,n){const r=e,i=Th("where",t);return Dh._create(i,r,n)}class kh extends Ch{constructor(t,e){super(),this.type=t,this._queryConstraints=e}static _create(t,e){return new kh(t,e)}_parse(t){const e=this._queryConstraints.map((e=>e._parse(t))).filter((t=>t.getFilters().length>0));return 1===e.length?e[0]:po.create(e,this._getOperator())}_apply(t){const e=this._parse(t);return 0===e.getFilters().length?t:(function(t,e){let n=t;const r=e.getFlattenedFilters();for(const t of r)Lh(n,t),n=Zo(n,t)}(t._query,e),new Bl(t.firestore,t.converter,Zo(t._query,e)))}_getQueryConstraints(){return this._queryConstraints}_getOperator(){return"and"===this.type?"and":"or"}}function xh(t,e,n){if("string"==typeof(n=O(n))){if(""===n)throw new Ji(Xi.INVALID_ARGUMENT,"Invalid query. When querying with documentId(), you must provide a valid document ID, but it was an empty string.");if(!Yo(e)&&-1!==n.indexOf("/"))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid query. When querying a collection by documentId(), you must provide a plain document ID, but '${n}' contains a '/' character.`);const r=e.path.child(gs.fromString(n));if(!vs.isDocumentKey(r))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid query. When querying a collection group by documentId(), the value provided must result in a valid document path, but '${r}' is not because it has an odd number of segments (${r.length}).`);return to(t,new vs(r))}if(n instanceof jl)return to(t,n._key);throw new Ji(Xi.INVALID_ARGUMENT,`Invalid query. When querying with documentId(), you must provide a valid string or a DocumentReference, but it was: ${Ol(n)}.`)}function Rh(t,e){if(!Array.isArray(t)||0===t.length)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid Query. A non-empty array is required for '${e.toString()}' filters.`);if(t.length>10)throw new Ji(Xi.INVALID_ARGUMENT,`Invalid Query. '${e.toString()}' filters support a maximum of 10 elements in the value array.`)}function Lh(t,e){if(e.isInequality()){const n=Qo(t),r=e.field;if(null!==n&&!n.isEqual(r))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid query. All where filters with an inequality (<, <=, !=, not-in, >, or >=) must be on the same field. But you have inequality filters on '${n.toString()}' and '${r.toString()}'`);const i=Wo(t);null!==i&&Oh(t,r,i)}const n=function(t,e){for(const n of t)for(const t of n.getFlattenedFilters())if(e.indexOf(t.op)>=0)return t.op;return null}(t.filters,function(t){switch(t){case"!=":return["!=","not-in"];case"array-contains":return["array-contains","array-contains-any","not-in"];case"in":return["array-contains-any","in","not-in"];case"array-contains-any":return["array-contains","array-contains-any","in","not-in"];case"not-in":return["array-contains","array-contains-any","in","not-in","!="];default:return[]}}(e.op));if(null!==n)throw n===e.op?new Ji(Xi.INVALID_ARGUMENT,`Invalid query. You cannot use more than one '${e.op.toString()}' filter.`):new Ji(Xi.INVALID_ARGUMENT,`Invalid query. You cannot use '${e.op.toString()}' filters with '${n.toString()}' filters.`)}function Oh(t,e,n){if(!n.isEqual(e))throw new Ji(Xi.INVALID_ARGUMENT,`Invalid query. You have a where filter with an inequality (<, <=, !=, not-in, >, or >=) on field '${e.toString()}' and so you must also use '${e.toString()}' as your first argument to orderBy(), but your first orderBy() is on field '${n.toString()}' instead.`)}class Mh{convertValue(t,e="none"){switch(Hs(t)){case 0:return null;case 1:return t.booleanValue;case 2:return Bs(t.integerValue||t.doubleValue);case 3:return this.convertTimestamp(t.timestampValue);case 4:return this.convertServerTimestamp(t,e);case 5:return t.stringValue;case 6:return this.convertBytes(qs(t.bytesValue));case 7:return this.convertReference(t.referenceValue);case 8:return this.convertGeoPoint(t.geoPointValue);case 9:return this.convertArray(t.arrayValue,e);case 10:return this.convertObject(t.mapValue,e);default:throw Wi()}}convertObject(t,e){const n={};return Ls(t.fields,((t,r)=>{n[t]=this.convertValue(r,e)})),n}convertGeoPoint(t){return new ah(Bs(t.latitude),Bs(t.longitude))}convertArray(t,e){return(t.values||[]).map((t=>this.convertValue(t,e)))}convertServerTimestamp(t,e){switch(e){case"previous":const n=zs(t);return null==n?null:this.convertValue(n,e);case"estimate":return this.convertTimestamp(Ks(t));default:return null}}convertTimestamp(t){const e=js(t);return new fs(e.seconds,e.nanos)}convertDocumentKey(t,e){const n=gs.fromString(t);Qi(Ru(n));const r=new xs(n.get(1),n.get(3)),i=new vs(n.popFirst(5));return r.isEqual(e)||Ki(`Document ${i} contains a document reference within a different database (${r.projectId}/${r.database}) which is not supported. It will be treated as a reference in the current database (${e.projectId}/${e.database}) instead.`),i}}
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @license
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
class Vh{constructor(t,e){this.hasPendingWrites=t,this.fromCache=e}isEqual(t){return this.hasPendingWrites===t.hasPendingWrites&&this.fromCache===t.fromCache}}class Fh extends bh{constructor(t,e,n,r,i,s){super(t,e,n,r,s),this._firestore=t,this._firestoreImpl=t,this.metadata=i}exists(){return super.exists()}data(t={}){if(this._document){if(this._converter){const e=new Ph(this._firestore,this._userDataWriter,this._key,this._document,this.metadata,null);return this._converter.fromFirestore(e,t)}return this._userDataWriter.convertValue(this._document.data.value,t.serverTimestamps)}}get(t,e={}){if(this._document){const n=this._document.data.field(Th("DocumentSnapshot.get",t));if(null!==n)return this._userDataWriter.convertValue(n,e.serverTimestamps)}}}class Ph extends Fh{data(t={}){return super.data(t)}}class Uh{constructor(t,e,n,r){this._firestore=t,this._userDataWriter=e,this._snapshot=r,this.metadata=new Vh(r.hasPendingWrites,r.fromCache),this.query=n}get docs(){const t=[];return this.forEach((e=>t.push(e))),t}get size(){return this._snapshot.docs.size}get empty(){return 0===this.size}forEach(t,e){this._snapshot.docs.forEach((n=>{t.call(e,new Ph(this._firestore,this._userDataWriter,n.key,n,new Vh(this._snapshot.mutatedKeys.has(n.key),this._snapshot.fromCache),this.query.converter))}))}docChanges(t={}){const e=!!t.includeMetadataChanges;if(e&&this._snapshot.excludesMetadataChanges)throw new Ji(Xi.INVALID_ARGUMENT,"To include metadata changes with your document changes, you must also pass { includeMetadataChanges:true } to onSnapshot().");return this._cachedChanges&&this._cachedChangesIncludeMetadataChanges===e||(this._cachedChanges=function(t,e){if(t._snapshot.oldDocs.isEmpty()){let e=0;return t._snapshot.docChanges.map((n=>{const r=new Ph(t._firestore,t._userDataWriter,n.doc.key,n.doc,new Vh(t._snapshot.mutatedKeys.has(n.doc.key),t._snapshot.fromCache),t.query.converter);return n.doc,{type:"added",doc:r,oldIndex:-1,newIndex:e++}}))}{let n=t._snapshot.oldDocs;return t._snapshot.docChanges.filter((t=>e||3!==t.type)).map((e=>{const r=new Ph(t._firestore,t._userDataWriter,e.doc.key,e.doc,new Vh(t._snapshot.mutatedKeys.has(e.doc.key),t._snapshot.fromCache),t.query.converter);let i=-1,s=-1;return 0!==e.type&&(i=n.indexOf(e.doc.key),n=n.delete(e.doc.key)),1!==e.type&&(n=n.add(e.doc),s=n.indexOf(e.doc.key)),{type:jh(e.type),doc:r,oldIndex:i,newIndex:s}}))}}(this,e),this._cachedChangesIncludeMetadataChanges=e),this._cachedChanges}}function jh(t){switch(t){case 0:return"added";case 2:case 3:return"modified";case 1:return"removed";default:return Wi()}}class Bh extends Mh{constructor(t){super(),this.firestore=t}convertBytes(t){return new ih(t)}convertReference(t){const e=this.convertDocumentKey(t,this.firestore._databaseId);return new jl(this.firestore,null,e)}}function qh(t){t=Ml(t,Bl);const e=Ml(t.firestore,eh),n=nh(e),r=new Bh(e);return Ih(t._query),Zl(n,t._query).then((n=>new Uh(e,r,t,n)))}!function(t,e=!0){Bi="9.15.0",wt(new M("firestore",((t,{instanceIdentifier:n,options:r})=>{const i=t.getProvider("app").getImmediate(),s=new eh(new rs(t.getProvider("auth-internal")),new as(t.getProvider("app-check-internal")),function(t,e){if(!Object.prototype.hasOwnProperty.apply(t.options,["projectId"]))throw new Ji(Xi.INVALID_ARGUMENT,'"projectId" not provided in firebase.initializeApp.');return new xs(t.options.projectId,e)}(i,n),i);return r=Object.assign({useFetchStreams:e},r),s._setSettings(r),s}),"PUBLIC").setMultipleInstances(!0)),Ct(Ui,"3.8.0",t),Ct(Ui,"3.8.0","esm2017")}();var $h=r("f1q41");const zh=function(t,e){const n="string"==typeof t?t:e||"(default)",r=_t("object"==typeof t?t:It(),"firestore").getImmediate({identifier:n});if(!r._initialized){const t=S("firestore");t&&Ul(r,...t)}return r}(Tt({apiKey:"AIzaSyCf_0n4ehVdWJwQ4qPT4Abu-dzB_cFipCQ",authDomain:"patdeployments.firebaseapp.com",databaseURL:"https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app",projectId:"patdeployments",storageBucket:"patdeployments.appspot.com",messagingSenderId:"347571404214",appId:"1:347571404214:web:b14c10f03f7e63accb1517",measurementId:"G-4C07Z35G64"}));!async function(){const t=await Ah(zl(zh,"studies")),e=await qh(t);var n=[],r=document.getElementById("myTable");e.forEach((t=>{var e=t.data().studyId;if(!n.includes(e)){n.push(e);let t=document.createElement("tr"),i=document.createElement("td"),s=document.createElement("td"),o=document.createElement("button");i.textContent=e,s.setAttribute("id",e),o.textContent="Download",s.addEventListener("click",(function(){return async function(t){try{const e=await Ah(zl(zh,"studies"),Nh("studyId","==",t)),n=await qh(e),r=[];for(const t of n.docs){console.log("🚀 ~ file: index.ts:76 ~ getStudies ~ study",t);const e=t.data(),n=e.type;let i=[];if("survey"===n&&(i=$h.map(e.values,(t=>({questionId:t.questionId,value:t.value})))),"pat"===n){const n=[],r=$l(zh,"users"),s=$l(Kl(r,`${e.userId}/studies`,t.id),"trials");(await qh(s)).forEach((t=>{n.push(t.data())})),i={baselines:e.baselines,trials:n}}r.push({userId:e.userId,studyId:e.studyId,moduleId:e.moduleId,sectionId:e.sectionId,type:n,datetime:e.datetime?.seconds||e.startTrial?.seconds,values:JSON.stringify(i)})}!function(t=[],e="veris-test-data"){const n=document.createElement("a"),r=";",i=[];$h.forEach(t[0],((t,e)=>{i.push(e)}));let s=function(t,e){let n="";const r="\r\n";for(let r=0;r<t.length;r++)n+=`${r>0?e:""}"${t[r]}"`;return n+r}(i,r);s+=function(t,e,n){const r=t,i="\r\n";let s,o="";for(let t=0;t<r.length;t++){for(let i=0;i<e.length;i++)s=e[i],o+=`${i>0?n:""}"${r[t][s]?r[t][s]:0}"`;o+=i}return o}(t,i,r);const o=new Blob([s],{type:"text/csv;charset=utf-8;"}),a=URL.createObjectURL(o);n.setAttribute("href",a),n.setAttribute("download",`${e}-${new Date}.csv`),n.style.visibility="hidden",document.body.appendChild(n),n.click(),document.body.removeChild(n)}(r)}catch(t){console.log("🚀 ~ file: index.ts:123 ~ getStudies ~ error",t)}}(e)})),s.appendChild(o),t.appendChild(i),t.appendChild(s),r.appendChild(t)}}))}();
//# sourceMappingURL=index.a2dab5d3.js.map
