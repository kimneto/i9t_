'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "02c4827160abd742f739d502577a435a",
"assets/assets/fonts/dosis/Dosis-Bold.ttf": "77c62314f5d3d19c081ddb58872ed5da",
"assets/assets/fonts/dosis/Dosis-ExtraBold.ttf": "b6d17f25e8b1f17f848c82c9c506eff5",
"assets/assets/fonts/dosis/Dosis-ExtraLight.ttf": "18640b6254dc6331b1ae12276bd60b7d",
"assets/assets/fonts/dosis/Dosis-Light.ttf": "16cd99c1ac888ba28fe737785bf001be",
"assets/assets/fonts/dosis/Dosis-Medium.ttf": "9bc7d1d17b09ff0b8bb1017bd51533b4",
"assets/assets/fonts/dosis/Dosis-Regular.ttf": "f955f2f8e27d40d466433459d2df444c",
"assets/assets/fonts/dosis/Dosis-SemiBold.ttf": "cacdd7a5c24ba9c2da2519d31f210b54",
"assets/assets/fonts/dosis/Dosis-VariableFont_wght.ttf": "ab8cfacc57bad648fadac5f0ff0e39de",
"assets/assets/fonts/gil/gill.ttf": "25e5ce9784cf3324af89cfd13fa59517",
"assets/assets/fonts/gil/gilm.ttf": "d8ee4539e9ba9211a8b532e325075577",
"assets/assets/fonts/gil/gilr.ttf": "22d25e11ebe6b43e5a9bc87d0a0ccb61",
"assets/assets/fonts/roboto/Roboto-Black.ttf": "301fe70f8f0f41c236317504ec05f820",
"assets/assets/fonts/roboto/Roboto-BlackItalic.ttf": "c470ca2b5b4f4437a3fe71b113a289a2",
"assets/assets/fonts/roboto/Roboto-Bold.ttf": "9ece5b48963bbc96309220952cda38aa",
"assets/assets/fonts/roboto/Roboto-BoldItalic.ttf": "0be9fa8f2863998d1e52c84165976880",
"assets/assets/fonts/roboto/Roboto-Italic.ttf": "465d1affcd03e9c6096f3313a47e0bf5",
"assets/assets/fonts/roboto/Roboto-Light.ttf": "6090d256d88dcd7f0244eaa4a3eafbba",
"assets/assets/fonts/roboto/Roboto-LightItalic.ttf": "2ffc058ddedacfeaa23542026c8108e2",
"assets/assets/fonts/roboto/Roboto-Medium.ttf": "b2d307df606f23cb14e6483039e2b7fa",
"assets/assets/fonts/roboto/Roboto-MediumItalic.ttf": "cabdb4a12e5de710afde298809306937",
"assets/assets/fonts/roboto/Roboto-Regular.ttf": "f36638c2135b71e5a623dca52b611173",
"assets/assets/fonts/roboto/Roboto-Thin.ttf": "4f0b85f5b601a405bdc7b23aad6d2a47",
"assets/assets/fonts/roboto/Roboto-ThinItalic.ttf": "7384da64612787e3662872e9d19cbc2d",
"assets/assets/icon/car_checked.png": "cee2e5b39d7979533bd367eaecefac1a",
"assets/assets/icon/icon.png": "cb26e8f6775660e42b88b10d27069f08",
"assets/assets/image/404.png": "c23630d5344ddc2251045f6bcee1b5e6",
"assets/assets/image/brasao.png": "6b35c0e54992f48fa620e896df590a53",
"assets/assets/image/logo.png": "3d66af11ccac23be1c1b599627397ed7",
"assets/assets/image/ponte_pira.jpg": "003b6ad092d9e4340d22fa099e5414db",
"assets/assets/image/vtr.png": "65c0979e3a00157b223ae60cfe0e5c2f",
"assets/assets/image/vtr2.png": "6cd4c8c3122e427a53dc3fdf11e27682",
"assets/FontManifest.json": "56ac98591d08cfa3d6cd6e7a3d1d3f99",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "754fd988fc498755bf764a2e6e051556",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b62641afc9ab487008e996a5c5865e56",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8c4854380f98446cc1f43e3d040e77eb",
"/": "8c4854380f98446cc1f43e3d040e77eb",
"main.dart.js": "4ed6f989bc4b2f9c1e2cc49ba0e2b65c",
"manifest.json": "6a069b36f23502273087ad15d1707eb9",
"splash/img/dark-1x.png": "098d8c3ce304ca644bbae8b1867d09fb",
"splash/img/dark-2x.png": "dc944daee9c0dd0283924e3f77c6d2bf",
"splash/img/dark-3x.png": "3f45d6ef6ebdc4c955b6c81b0d4c260f",
"splash/img/dark-4x.png": "c2300cbf27095e4fe2d519fe247b3392",
"splash/img/light-1x.png": "098d8c3ce304ca644bbae8b1867d09fb",
"splash/img/light-2x.png": "dc944daee9c0dd0283924e3f77c6d2bf",
"splash/img/light-3x.png": "3f45d6ef6ebdc4c955b6c81b0d4c260f",
"splash/img/light-4x.png": "c2300cbf27095e4fe2d519fe247b3392",
"splash/style.css": "b36d85ea8702efc8aaed306c4d2ca733",
"version.json": "8426c640919a126d447fc28c5f93d14e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
