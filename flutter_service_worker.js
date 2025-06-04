'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d15e6fbae5830d4e3c3cbad63a8d6c82",
"assets/AssetManifest.bin.json": "60a2f6ffa60e2b02a2dda6c3a807dac1",
"assets/AssetManifest.json": "b1f9cc5b1b1335e9eba1fa2b3752f7e0",
"assets/assets/images/aldo.jpeg": "cc850cfffbe8b791ea03d7fb9dbe52f2",
"assets/assets/images/fb.png": "5d6ea38a769498dfc19fe6389d14db39",
"assets/assets/images/ig.png": "26d9974a1feec9905a4e0d5e5ddf8db6",
"assets/assets/images/j%2520(1).JPG": "8e4a1ad24c490bf2286275b2900e0b10",
"assets/assets/images/j%2520(10).JPG": "3a103ad2b6f6297d4900b89c42002063",
"assets/assets/images/j%2520(11).JPG": "36b0f4ca549b805906740994f4870ed2",
"assets/assets/images/j%2520(12).JPG": "834905659c51f5ce55c640574ad7246a",
"assets/assets/images/j%2520(13).JPG": "a59e3a8284cb3763fafe6f382806cb8c",
"assets/assets/images/j%2520(14).JPG": "239ff245da6136503df8fa6bed6a88b3",
"assets/assets/images/j%2520(15).JPG": "87ebb35a91e93b5cdcafa29461caacda",
"assets/assets/images/j%2520(16).JPG": "723751f117ca28f8e944143b2012f565",
"assets/assets/images/j%2520(17).JPG": "49c829689c2c250192b8472c50a72c36",
"assets/assets/images/j%2520(18).JPG": "2d540664d1dd42499f176cafde7d5561",
"assets/assets/images/j%2520(19).JPG": "6dc9b62e3301008c61552168c8a85459",
"assets/assets/images/j%2520(2).JPG": "5b31721d38188d7f1f620e1975a9d991",
"assets/assets/images/j%2520(20).JPG": "4d3add342fc94be35f40e99a4f18313d",
"assets/assets/images/j%2520(21).JPG": "994947aa898e2ad3ec30ecd24098ef91",
"assets/assets/images/j%2520(22).JPG": "08e3d2028faafb8f8ab5d401de92e29f",
"assets/assets/images/j%2520(23).JPG": "24c2a4c61dabda5a59a30b81d33bc440",
"assets/assets/images/j%2520(24).JPG": "5688c79613ac87669d6e2b4ece0bda9e",
"assets/assets/images/j%2520(25).JPG": "73ab2ea85aaf5efe7fa137c5a8e4afc9",
"assets/assets/images/j%2520(3).JPG": "3892273d2b5b4b257d9fcb61cdeb2543",
"assets/assets/images/j%2520(4).JPG": "71e1e6f3f307f5a8d6eef509cc3f53a3",
"assets/assets/images/j%2520(5).JPG": "7bed8a6aca2d97e9bb1301ba4b3e4d18",
"assets/assets/images/j%2520(6).JPG": "01e8c790cd58abb1aca3a63eb6607532",
"assets/assets/images/j%2520(7).JPG": "0903358afad7b7b9f584ba710b88852b",
"assets/assets/images/j%2520(8).JPG": "41ded96b364f2cc91d6c5e1c09569df9",
"assets/assets/images/j%2520(9).JPG": "b1def4469c63d9e4b648ca5a5fdb1149",
"assets/assets/images/jasemina.jpeg": "135126e3de7b6bf9d989ad8a6caabac7",
"assets/assets/images/logo.jpg.jpg": "b68fd47a81864b6fe6f7fa4e438fba31",
"assets/assets/images/omer.jpeg": "04853421ec9bb6bc12ddc5a8fbf3a9f0",
"assets/assets/images/placeholder.png": "4480b20cb77c1a0c90a29cddeee460dd",
"assets/assets/images/tw.png": "b9f4dfa0916910b8afb2547a3f6aff30",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/fonts/MaterialIcons-Regular.otf": "428c6f84d5ac1e372d29481d41b77bce",
"assets/NOTICES": "21c28abc974d8fef7e74b1ac499ca233",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "de68a32dd1026a880a204905bea598ce",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "7bd38d6d25230fefd54c5387d1f29b7f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "813b2839922dfae726f687cf6b826af8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4841bffa9f033d6bd9850a2d4f6875a2",
"/": "4841bffa9f033d6bd9850a2d4f6875a2",
"main.dart.js": "434813acbc151635d9fb66740c0a607c",
"manifest.json": "bf24c84c3bf99672a631c4f84464e793",
"version.json": "78d7bd30a4d00f36e484d2889fd287ec"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
