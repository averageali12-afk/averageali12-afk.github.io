1:"$Sreact.fragment"
6:I[7150,[],""]
:HL["/functions/v1/miniapp/_next/static/media/1abbc144918f74fd-s.p.woff2","font",{"crossOrigin":"","type":"font/woff2"}]
:HL["/functions/v1/miniapp/_next/static/media/fb12bdfc6f99d938-s.p.woff2","font",{"crossOrigin":"","type":"font/woff2"}]
:HL["/functions/v1/miniapp/_next/static/css/e7e2028186f9119a.css","style"]
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
})();0:{"P":null,"b":"Pu9BifSPENZREfcTPyL5M","p":"/functions/v1/miniapp","c":["",""],"i":false,"f":[[["",{"children":["__PAGE__",{}]},"$undefined","$undefined",true],["",["$","$1","c",{"children":[[["$","link","0",{"rel":"stylesheet","href":"/functions/v1/miniapp/_next/static/css/e7e2028186f9119a.css","precedence":"next","crossOrigin":"$undefined","nonce":"$undefined"}]],["$","html",null,{"lang":"fa","dir":"rtl","suppressHydrationWarning":true,"children":[["$","head",null,{"children":[["$","script",null,{"dangerouslySetInnerHTML":{"__html":"\n(function () {\n  try {\n    var valid = { olive: true, day: true, dark: true, pink: true };\n    var saved = window.localStorage.getItem('kc-theme');\n    var theme = valid[saved] ? saved : null;\n    if (!theme) {\n      var params = window.Telegram && window.Telegram.WebApp && window.Telegram.WebApp.themeParams;\n      var bg = params && params.bg_color;\n      if (bg && /^#[0-9a-f]{6}$/i.test(bg)) {\n        var rgb = bg.slice(1).match(/.{2}/g).map(function (part) { return parseInt(part, 16); });\n        var luminance = (0.299 * rgb[0] + 0.587 * rgb[1] + 0.114 * rgb[2]) / 255;\n        theme = luminance < 0.48 ? 'dark' : 'day';\n      }\n    }\n    document.documentElement.dataset.theme = theme || 'olive';\n  } catch (error) {\n    document.documentElement.dataset.theme = 'olive';\n  }\n})();\n"}}],["$","script",null,{"dangerouslySetInnerHTML":{"__html":"$2"}}]]}],"$L3"]}]]}],{"children":["__PAGE__","$L4",{},null,false]},null,false],"$L5",false]],"m":"$undefined","G":["$6",[]],"s":false,"S":true}
7:I[1402,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],""]
8:I[7912,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
9:I[4157,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
a:I[9766,[],""]
b:I[8924,[],""]
c:I[7409,["619","static/chunks/619-ba102abea3e3d0e4.js","177","static/chunks/app/layout-237575fd6026482d.js"],"default"]
d:I[9693,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
e:I[4347,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
f:I[8258,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
10:I[6197,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
11:I[3157,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
12:I[2619,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"*"]
19:I[4431,[],"ViewportBoundary"]
1b:I[4431,[],"MetadataBoundary"]
1c:"$Sreact.suspense"
3:["$","body",null,{"className":"__variable_d4e4c3 __variable_b88586","children":[["$","$L7",null,{"src":"https://telegram.org/js/telegram-web-app.js","strategy":"beforeInteractive"}],["$","$L8",null,{"children":[["$","main",null,{"className":"shell","children":[["$","header",null,{"className":"topbar","children":[["$","div",null,{"className":"brand","children":[["$","span",null,{"className":"brand__name","children":"KurdishCopilot"}],["$","span",null,{"className":"brand__tag","children":"مدرس صوتی سورانی و کرمانجی"}]]}],["$","span",null,{"className":"dialect-pill","children":"دو گویش فعال"}]]}],["$","$L9",null,{"children":["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[[["$","title",null,{"children":"404: This page could not be found."}],["$","div",null,{"style":{"fontFamily":"system-ui,\"Segoe UI\",Roboto,Helvetica,Arial,sans-serif,\"Apple Color Emoji\",\"Segoe UI Emoji\"","height":"100vh","textAlign":"center","display":"flex","flexDirection":"column","alignItems":"center","justifyContent":"center"},"children":["$","div",null,{"children":[["$","style",null,{"dangerouslySetInnerHTML":{"__html":"body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"}}],["$","h1",null,{"className":"next-error-h1","style":{"display":"inline-block","margin":"0 20px 0 0","padding":"0 23px 0 0","fontSize":24,"fontWeight":500,"verticalAlign":"top","lineHeight":"49px"},"children":404}],["$","div",null,{"style":{"display":"inline-block"},"children":["$","h2",null,{"style":{"fontSize":14,"fontWeight":400,"lineHeight":"49px","margin":0},"children":"This page could not be found."}]}]]}]}]],[]],"forbidden":"$undefined","unauthorized":"$undefined"}]}]]}],["$","$Lc",null,{}]]}]]}]
4:["$","$1","c",{"children":[[["$","$Ld",null,{"screen":"home"}],["$","$Le",null,{}],["$","$Lf",null,{}],["$","section",null,{"className":"hero hero--home","children":[["$","div",null,{"className":"card__eyebrow","children":"یادگیری کاربردی زبان کردی"}],["$","h1",null,{"children":["کردی را بشنو، ",["$","span",null,{"className":"hero__accent","children":"بگو"}]," و یاد بگیر."]}],["$","p",null,{"children":"KurdishCopilot مدرس فارسی‌فهم تو برای سورانی و کرمانجی است؛ درس کوتاه، تلفظ نمونه و تمرین واقعی در تلگرام."}],["$","div",null,{"className":"hero__badges","aria-label":"خلاصهٔ امکانات","children":[["$","span",null,{"className":"hero__badge","children":"🎧 تلفظ نمونه"}],["$","span",null,{"className":"hero__badge","children":"⚡ درس ۱ دقیقه‌ای"}],["$","span",null,{"className":"hero__badge","children":"🇮🇷 فارسی → کردی"}]]}]]}],["$","section",null,{"className":"card card--accent wotd","aria-label":"واژهٔ امروز","children":[["$","div",null,{"className":"wotd__head","children":[["$","span",null,{"className":"wotd__chip","aria-hidden":"true","children":"🗓"}],["$","div",null,{"children":[["$","div",null,{"className":"card__eyebrow","children":"واژهٔ امروز"}],["$","h2",null,{"className":"wotd__title","children":"یک عبارت جدید، هر روز"}]]}]]}],["$","div",null,{"className":"wotd__body","children":[["$","div",null,{"className":"wotd__fa","children":"می‌دانم."}],["$","div",null,{"className":"wotd__ku","dir":"ltr","children":"Ez dizanim."}],["$","div",null,{"className":"wotd__equivalent","children":[["$","span",null,{"className":"wotd__equivalent-label","children":"معادل سورانی"}],["$","span",null,{"className":"wotd__equivalent-text","dir":"rtl","children":"دەزانم."}]]}],["$","div",null,{"className":"wotd__actions","children":[["$","$L10",null,{"text":"Ez dizanim.","dialect":"kurmanji","lessonId":"kurmanji-verb-know"}],["$","$L11",null,{"fa":"می‌دانم.","ku":"Ez dizanim.","transliteration":"Ez dizanim.","dialect":"kurmanji"}]]}],["$","p",null,{"className":"wotd__note","children":["💡 ","منفی‌اش «Ez nizanim» است — نمی‌دانم."]}]]}],["$","div",null,{"className":"wotd__foot","children":[["$","span",null,{"className":"wotd__dialect","children":"کرمانجی · Latîni"}],["$","span",null,{"className":"wotd__category","children":"فعل‌های پرکاربرد"}],["$","$L12",null,{"className":"cta cta--compact","href":"/learn?dialect=kurmanji","style":{"textDecoration":"none"},"children":"تمرین این عبارت"}]]}]]}],["$","section",null,{"className":"card about-card","aria-label":"دربارهٔ بات","children":[["$","div",null,{"className":"card__eyebrow","children":"دربارهٔ KurdishCopilot"}],["$","h2",null,{"children":"این بات چیست و برای چیست؟"}],["$","p",null,{"className":"about-card__lead","children":"مینی‌اپ آموزشی داخل تلگرام برای فارسی‌زبانان — از صفر تا مکالمهٔ روزمرهٔ کردی، بدون کتاب سنگین."}],["$","ul",null,{"className":"about-card__points","children":[["$","li",null,{"children":[["$","span",null,{"aria-hidden":"true","children":"📅"}]," هر روز یک عبارت کاربردی"]}],["$","li",null,{"children":[["$","span",null,{"aria-hidden":"true","children":"🔁"}]," یک تمرین و یک مرور کوتاه"]}],["$","li",null,{"children":[["$","span",null,{"aria-hidden":"true","children":"🎯"}]," مسیر مرحله‌ای و شخصی"]}]]}]]}],["$","section",null,{"className":"card","style":{"marginTop":12},"aria-label":"راهنمای استفاده","children":[["$","div",null,{"className":"card__eyebrow","children":"طرز استفاده"}],["$","h2",null,{"children":"در چهار قدم شروع کن"}],["$","div",null,{"style":{"display":"grid","gap":10,"marginTop":12},"children":[["$","div","۱",{"className":"lesson-row","children":[["$","div",null,{"className":"lesson-row__num","children":"۱"}],["$","div",null,{"children":[["$","strong",null,{"children":"مینی‌اپ را از داخل ربات باز کن"}],["$","div",null,{"style":{"color":"var(--muted)","fontSize":".82rem","marginTop":3},"children":"دکمهٔ شروع در پیام خوش‌آمد ربات، مینی‌اپ را بی‌درنگ در تلگرام باز می‌کند."}]]}]]}],["$","div","۲",{"className":"lesson-row","children":[["$","div",null,{"className":"lesson-row__num","children":"۲"}],["$","div",null,{"children":[["$","strong",null,{"children":"گویش موردنظرت را انتخاب کن"}],["$","div",null,{"style":{"color":"var(--muted)","fontSize":".82rem","marginTop":3},"children":"سورانی (خط عربی) یا کرمانجی (خط لاتین) — هر زمان هم می‌توانی عوضش کنی."}]]}]]}],["$","div","۳",{"className":"lesson-row","children":[["$","div",null,{"className":"lesson-row__num","children":"۳"}],["$","div",null,{"children":[["$","strong",null,{"children":"درس کوتاه روزانه را پاس بده"}],["$","div",null,{"style":{"color":"var(--muted)","fontSize":".82rem","marginTop":3},"children":"هر درس یک عبارت کاربردی است: معنی فارسی، شکل کردی، آوانویسی و نکتهٔ کوتاه."}]]}]]}],"$L13"]}],"$L14"]}],"$L15","$L16","$L17"],null,"$L18"]}]
5:["$","$1","h",{"children":[null,[["$","$L19",null,{"children":"$L1a"}],["$","meta",null,{"name":"next-size-adjust","content":""}]],["$","$L1b",null,{"children":["$","div",null,{"hidden":true,"children":["$","$1c",null,{"fallback":null,"children":"$L1d"}]}]}]]}]
1e:I[683,["619","static/chunks/619-ba102abea3e3d0e4.js","296","static/chunks/296-aa02d9af162417f2.js","974","static/chunks/app/page-2e30539ec356c588.js"],"default"]
1f:I[4431,[],"OutletBoundary"]
21:I[5278,[],"AsyncMetadataOutlet"]
13:["$","div","۴",{"className":"lesson-row","children":[["$","div",null,{"className":"lesson-row__num","children":"۴"}],["$","div",null,{"children":[["$","strong",null,{"children":"با مدرس صوتی تمرین کن"}],["$","div",null,{"style":{"color":"var(--muted)","fontSize":".82rem","marginTop":3},"children":"در بخش «مدرس صوتی» فارسی بپرس؛ پاسخ کردی با تلفظ نمونه دریافت کن."}]]}]]}]
14:["$","$L12",null,{"className":"cta cta--hero","href":"/learn","style":{"marginTop":13,"textDecoration":"none"},"children":"شروع درس امروز"}]
15:["$","section",null,{"style":{"marginTop":12},"aria-label":"قابلیت‌ها","children":[["$","div",null,{"className":"card","style":{"marginBottom":12},"children":[["$","div",null,{"className":"card__eyebrow","children":"قابلیت‌ها"}],["$","h2",null,{"children":"چه چیزی در اختیارت است؟"}]]}],["$","div",null,{"className":"grid grid--two","children":[["$","div","درس‌های کوتاه دوگویشی",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"📚"}],["$","strong",null,{"children":"درس‌های کوتاه دوگویشی"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"عبارت‌های کاربردی روزمره در سورانی و کرمانجی با بازخورد فوری."}]]}],["$","div","مدرس صوتی هوشمند",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"🧑‍🏫"}],["$","strong",null,{"children":"مدرس صوتی هوشمند"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"به فارسی بپرس، پاسخ آموزشی کردی با تلفظ نمونه بگیر."}]]}],["$","div","یادگیری در تلگرام",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"💬"}],["$","strong",null,{"children":"یادگیری در تلگرام"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"بدون نصب اپ جدا؛ همه‌چیز داخل تلگرام و در چند ثانیه."}]]}],["$","div","پیگیری پیشرفت",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"📈"}],["$","strong",null,{"children":"پیگیری پیشرفت"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"تمرین‌ها، روزهای فعال و گویش فعال‌ات در پروفایل ثبت می‌شود."}]]}],["$","div","ایمنی محتوا",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"🛡️"}],["$","strong",null,{"children":"ایمنی محتوا"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"فقط محتوای آموزشی بی‌طرف زبان؛ فیلتر ایمنی چندلایه فعال است."}]]}],["$","div","سبک و سریع",{"className":"card feature-card","children":[["$","span",null,{"className":"feature-card__icon","aria-hidden":"true","children":"⚡"}],["$","strong",null,{"children":"سبک و سریع"}],["$","p",null,{"style":{"color":"var(--muted)","fontSize":".85rem","marginTop":6},"children":"صفحات کم‌حجم با حالت شب/روز و طراحی راست‌به‌چپ فارسی."}]]}]]}]]}]
16:["$","section",null,{"style":{"marginTop":12},"aria-label":"مسیرهای آموزشی","children":[["$","div",null,{"className":"card","style":{"marginBottom":12},"children":[["$","div",null,{"className":"card__eyebrow","children":"شروع سریع"}],["$","h2",null,{"children":"گویشت را انتخاب کن"}]]}],["$","div",null,{"className":"grid grid--two","children":[["$","$L12","sorani",{"className":"action","href":"/learn?dialect=sorani","style":{"textDecoration":"none"},"children":[["$","strong",null,{"children":"سورانی"}],["$","span",null,{"children":["کوردی سۆرانی"," · ","خط عربی-کردی"]}]]}],["$","$L12","kurmanji",{"className":"action","href":"/learn?dialect=kurmanji","style":{"textDecoration":"none"},"children":[["$","strong",null,{"children":"کرمانجی"}],["$","span",null,{"children":["Kurdî Kurmancî"," · ","خط لاتین"]}]]}]]}]]}]
17:["$","$L1e",null,{}]
18:["$","$L1f",null,{"children":["$L20",["$","$L21",null,{"promise":"$@22"}]]}]
1a:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
20:null
23:I[622,[],"IconMark"]
22:{"metadata":[["$","title","0",{"children":"KurdishCopilot | مدرس صوتی کردی"}],["$","meta","1",{"name":"description","content":"مینی‌اپ آموزشی سورانی و کرمانجی در تلگرام"}],["$","link","2",{"rel":"icon","href":"/functions/v1/miniapp/icon.svg?8cea87890adb1c42","type":"image/svg+xml","sizes":"any"}],["$","$L23","3",{}]],"error":null,"digest":"$undefined"}
1d:"$22:metadata"
