1:"$Sreact.fragment"
7:I[1402,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],""]
8:I[7912,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
9:I[4157,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
a:I[9766,[],""]
b:I[8924,[],""]
c:I[7409,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
e:I[4431,[],"OutletBoundary"]
10:I[5278,[],"AsyncMetadataOutlet"]
12:I[4431,[],"ViewportBoundary"]
14:I[4431,[],"MetadataBoundary"]
15:"$Sreact.suspense"
17:I[9693,["296","static/chunks/296-aa02d9af162417f2.js","459","static/chunks/app/learn/page-3ba200e52c828511.js"],"default"]
18:I[7815,["296","static/chunks/296-aa02d9af162417f2.js","459","static/chunks/app/learn/page-3ba200e52c828511.js"],"default"]
2:T10fb,window.__KC_BP="/functions/v1/miniapp";window.__KC_RB="https://bpfdsobekqkeeijeqsoo.supabase.co/functions/v1/miniapp";(function () {
  if (window.__kcMiniappShim) return;
  var BASE_PATH = window.__KC_BP || '';
  var RUNTIME_BASE = window.__KC_RB || '';
  if (!BASE_PATH && !RUNTIME_BASE) return;
  window.__kcMiniappShim = true;

  function isRscRequest(url, init, requestHeaders) {
    try {
      if (/[?&]_rsc=/.test(String(url))) return true;
      var headers = (init && init.headers) || null;
      if (headers) {
        if (typeof headers.get === 'function' && headers.get('rsc')) return true;
        if (headers['Rsc'] || headers['rsc'] || headers['RSC']) return true;
      }
      if (requestHeaders && typeof requestHeaders.get === 'function' && requestHeaders.get('rsc')) return true;
    } catch (error) { /* fall through */ }
    return false;
  }

  // Normalises fetch inputs to same-origin paths: document-origin absolute
  // URLs (Request#url is always absolute) become paths so the rewrite rules
  // can see them; foreign origins pass through untouched.
  function toSameOriginPath(url) {
    if (typeof url !== 'string') return url;
    if (/^https?:\/\//i.test(url)) {
      try {
        var abs = new URL(url);
        if (abs.origin === window.location.origin) return abs.pathname + abs.search;
      } catch (error) { /* malformed — leave as-is */ }
      return url;
    }
    return url;
  }

  function rewrite(url, init, requestHeaders) {
    var path = typeof url === 'string' ? toSameOriginPath(url) : url;
    if (typeof path !== 'string' || path.charAt(0) !== '/' || path.indexOf('//') === 0) return path;
    // API traffic always goes to the edge runtime (cross-origin, CORS).
    if (RUNTIME_BASE && path.indexOf('/api/') === 0) return RUNTIME_BASE + path;
    // RSC/flight traffic goes to the runtime as well: the document host can
    // only answer HTML, and text/x-component passes the Supabase gateway.
    if (RUNTIME_BASE && isRscRequest(path, init, requestHeaders)) {
      return RUNTIME_BASE + (path.indexOf(BASE_PATH) === 0 ? path.slice(BASE_PATH.length) : path);
    }
    // Everything else keeps the basePath (pages/assets on the document host).
    return BASE_PATH ? BASE_PATH + path : path;
  }

  var originalFetch = window.fetch.bind(window);
  window.fetch = function (input, init) {
    try {
      if (typeof input === 'string') {
        return originalFetch(rewrite(input, init), init);
      }
      // URL-object inputs: Next.js's router prefetches pass new URL(...) —
      // normalise to the href string so the rewrite rules can see it.
      if (input && typeof input === 'object' && typeof input.href === 'string') {
        var href = rewrite(input.href, init);
        if (href !== input.href) {
          return originalFetch(href, init);
        }
        return originalFetch(input, init);
      }
      if (typeof Request !== 'undefined' && input instanceof Request) {
        var rewritten = rewrite(input.url, init, input.headers);
        if (rewritten !== input.url && (input.method === 'GET' || input.method === 'HEAD')) {
          // Router/RSC fetches are body-less GETs: rebuilding via init (not a
          // Request clone) avoids inheriting a same-origin mode on the new
          // cross-origin URL. Bodied requests fall through untouched.
          return originalFetch(rewritten, {
            method: input.method,
            headers: input.headers,
            signal: input.signal,
            mode: 'cors'
          });
        }
      }
    } catch (error) { /* fall through to the untouched call */ }
    return originalFetch(input, init);
  };

  if (typeof XMLHttpRequest !== 'undefined') {
    var originalOpen = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function (method, url) {
      var target = typeof url === 'string' ? toSameOriginPath(url) : url;
      if (typeof target === 'string' && target.charAt(0) === '/' && target.indexOf('//') !== 0) {
        target = (RUNTIME_BASE && target.indexOf('/api/') === 0)
          ? RUNTIME_BASE + target
          : (BASE_PATH ? BASE_PATH + target : target);
        var rest = Array.prototype.slice.call(arguments, 2);
        return originalOpen.apply(this, [method, target].concat(rest));
      }
      return originalOpen.apply(this, arguments);
    };
  }
})();0:{"b":"Pu9BifSPENZREfcTPyL5M","f":[[["",{"children":["learn",{"children":["__PAGE__?{\"dialect\":\"sorani\"}",{}]}]},"$undefined","$undefined",true],["",["$","$1","c",{"children":[[["$","link","0",{"rel":"stylesheet","href":"/functions/v1/miniapp/_next/static/css/e7e2028186f9119a.css","precedence":"next","crossOrigin":"$undefined","nonce":"$undefined"}]],["$","html",null,{"lang":"fa","dir":"rtl","suppressHydrationWarning":true,"children":[["$","head",null,{"children":[["$","script",null,{"dangerouslySetInnerHTML":{"__html":"\n(function () {\n  try {\n    var valid = { olive: true, day: true, dark: true, pink: true };\n    var saved = window.localStorage.getItem('kc-theme');\n    var theme = valid[saved] ? saved : null;\n    if (!theme) {\n      var params = window.Telegram && window.Telegram.WebApp && window.Telegram.WebApp.themeParams;\n      var bg = params && params.bg_color;\n      if (bg && /^#[0-9a-f]{6}$/i.test(bg)) {\n        var rgb = bg.slice(1).match(/.{2}/g).map(function (part) { return parseInt(part, 16); });\n        var luminance = (0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2]) / 255;\n        theme = luminance < 0.48 ? 'dark' : 'day';\n      }\n    }\n    document.documentElement.dataset.theme = theme || 'olive';\n  } catch (error) {\n    document.documentElement.dataset.theme = 'olive';\n  }\n})();\n"}}],["$","script",null,{"dangerouslySetInnerHTML":{"__html":"$2"}}]]}],"$L3"]}]]}],{"children":["learn","$L4",{"children":["__PAGE__","$L5",{},null,false]},null,false]},null,false],"$L6",false]],"S":false}
3:["$","body",null,{"className":"__variable_d4e4c3 __variable_b88586","children":[["$","$L7",null,{"src":"https://telegram.org/js/telegram-web-app.js","strategy":"beforeInteractive"}],["$","$L8",null,{"children":[["$","main",null,{"className":"shell","children":[["$","header",null,{"className":"topbar","children":[["$","div",null,{"className":"brand","children":[["$","span",null,{"className":"brand__name","children":"KurdishCopilot"}],["$","span",null,{"className":"brand__tag","children":"مدرس صوتی سورانی و کرمانجی"}]]}],["$","span",null,{"className":"dialect-pill","children":"دو گویش فعال"}]]}],["$","$L9",null,{"children":["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}]}]]}],["$","$Lc",null,{}]]}]]}]
4:["$","$1","c",{"children":[null,["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}]
5:["$","$1","c",{"children":["$Ld",null,["$","$Le",null,{"children":["$Lf",["$","$L10",null,{"promise":"$@11"}]]}]]}]
6:["$","$1","h",{"children":[null,["$","$1","B5LNvSiDDcfKdFBqP0j0vv",{"children":[["$","$L12",null,{"children":"$L13"}],["$","meta",null,{"name":"next-size-adjust","content":""}]]}],["$","$L14","B5LNvSiDDcfKdFBqP0j0vm",{"children":["$","div",null,{"hidden":true,"children":["$","$15",null,{"fallback":null,"children":"$L16"}]}]}]]}]
d:[["$","$L17",null,{"screen":"learn"}],["$","section",null,{"className":"hero","style":{"paddingBottom":4},"children":[["$","div",null,{"className":"card__eyebrow","children":"یادگیری فعال"}],["$","h1",null,{"style":{"fontSize":"2rem"},"children":"تمرین امروز"}],["$","p",null,{"children":"یک عبارت، یک انتخاب، یک بازخورد کوتاه — همه‌روزه."}]]}],["$","$L18",null,{"initialDialect":"sorani"}]]
13:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
f:null
19:I[622,[],"IconMark"]
11:{"metadata":[["$","title","0",{"children":"یادگیری | KurdishCopilot"}],["$","meta","1",{"name":"description","content":"تمرین کوتاه روزانه با بازخورد فوری فارسی"}],["$","link","2",{"rel":"icon","href":"/functions/v1/miniapp/icon.svg?8cea87890adb1c42","type":"image/svg+xml","sizes":"any"}],["$","$L19","3",{}]],"error":null,"digest":"$undefined"}
16:"$11:metadata"
