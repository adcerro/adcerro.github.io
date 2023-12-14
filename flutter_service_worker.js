'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "33457c361ebe0febac06ca1cc854c5fd",
"index.html": "0aa8d1ff6d72c556bd0503ddf994ced7",
"/": "0aa8d1ff6d72c556bd0503ddf994ced7",
"main.dart.js": "de7e724146950380747d29abae0e506a",
"assets/FontManifest.json": "2267eec3ecf8c98a3dd7be04320ad002",
"assets/AssetManifest.json": "a5140e4c524442944fff9ac713673ac5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.bin": "246df5888d7b4ea268f5b24ce9c93f76",
"assets/assets/tabata.png": "9cb3fd4fb6ce07d8e28a85281388d5a9",
"assets/assets/alan.jpeg": "8e30e3e4cbd2ac67429f302acfad6b07",
"assets/assets/katy.png": "ddacceaf4415e38b6d16c92cc94c1b09",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/fonts/MaterialIcons-Regular.otf": "c25d9bf6b6e87115c3afc7a083f67d06",
"assets/fonts/SourceSans3-Regular.ttf": "04f1a4f0fdf585fc5b56885fefc9e8d2",
"assets/fonts/SourceSans3-Bold.ttf": "a923b66a888fa07af060554d8c28644b",
"assets/NOTICES": "536fcb97224b5bcdb4767264f0b22ba1",
"assets/AssetManifest.bin.json": "1654484fefd4e939619607b9a730ff38",
"version.json": "a0f109d3342253b582ac3392b93dc85c",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"browserconfig.xml": "80016bcba5707e506c8278ca49483585",
"icons/apple-icon-114x114.png": "eb875a98bd7b4b987dbf8c0e22e90ee8",
"icons/apple-icon-144x144.png": "f992c40185018d9b7631ef839d4c68f7",
"icons/apple-icon-152x152.png": "b3fc1e78f11c88098cc3735c5a1bdf40",
"icons/android-icon-144x144.png": "f992c40185018d9b7631ef839d4c68f7",
"icons/android-icon-36x36.png": "11affb347192d3119cced3564fa2b3b3",
"icons/apple-icon-60x60.png": "62f2f7152e095983a522779541f1077c",
"icons/favicon-16x16.png": "a7be3debd692e42f44f2a0bfbeba6c36",
"icons/ms-icon-144x144.png": "f992c40185018d9b7631ef839d4c68f7",
"icons/apple-icon-76x76.png": "e52f6330e7b7a49030281667f5c68b4d",
"icons/ms-icon-70x70.png": "13dff66131056dd6250d99dc798cd217",
"icons/favicon-96x96.png": "d2409a650426b422c2ae492064af33c8",
"icons/ms-icon-310x310.png": "03bfdd84f9af56232261b172c0adec28",
"icons/android-icon-192x192.png": "15460ec83bb2c2f032b7f7077628dfa2",
"icons/apple-icon.png": "2a9ecdab27b058e3fe626f9b111a75e5",
"icons/apple-icon-57x57.png": "c4b97eeb7227f04a4ac29f9a851fef31",
"icons/android-icon-72x72.png": "19a0c545ed9000e15f5d37a704ceb994",
"icons/apple-icon-180x180.png": "6979cefd9252fab3ec9c45f08f02e5e4",
"icons/apple-icon-120x120.png": "bc48decc6ec5bcb457e4b9a1c5c08b51",
"icons/apple-icon-72x72.png": "19a0c545ed9000e15f5d37a704ceb994",
"icons/android-icon-48x48.png": "1893eba9bc229aad0ee580c0b48c1294",
"icons/favicon-32x32.png": "bd16577fe90b2576c973c92b4e4db270",
"icons/favicon.ico": "ceff596d5c233bf08c8027911b1c3d4f",
"icons/apple-icon-precomposed.png": "2a9ecdab27b058e3fe626f9b111a75e5",
"icons/ms-icon-150x150.png": "fc03605d364f96c2c9beafc959035178",
"icons/android-icon-96x96.png": "d2409a650426b422c2ae492064af33c8",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
