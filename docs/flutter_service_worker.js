'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "ae539fb66634713b8c5f046db8a625a2",
"assets/AssetManifest.bin.json": "9015afc99e4ae8d4cdc40563a221e572",
"assets/AssetManifest.json": "73a3bd7c6d29752a1162a0c336bef662",
"assets/assets/data/questions.json": "2b9f84779102d7d60bde198b2fcfa4a4",
"assets/assets/images/%25D8%25A3%25D8%25B3%25D8%25A6%25D9%2584%25D8%25A9%2520%25D8%25B0%25D9%2583%25D8%25A7%25D8%25A1%2520%2520-%2520%25D8%25B1%25D9%258A%25D8%25A7%25D8%25B6%25D9%258A%25D8%25A7%25D8%25AA%2520-%2520%25D8%25A3%25D9%2584%25D8%25BA%25D8%25A7%25D8%25B2.jpg": "71c97324f8a4923af87ebce26921fa53",
"assets/assets/images/%25D8%25A3%25D9%2587%2520%25D8%25A3%25D9%2588%2520%25D9%2584%25D8%25A3%2520%25D8%25A3%25D9%2583%25D9%2584%25D8%25A7%25D8%25AA.jpg": "41f759afacec845ee42365a8b7b4fe75",
"assets/assets/images/%25D8%25A3%25D9%2587%2520%25D8%25A3%25D9%2588%2520%25D9%2584%25D8%25A3.jpg": "5bbb510590466f01fc7535a00c0111b5",
"assets/assets/images/%25D8%25A5%25D8%25B3%25D9%2584%25D8%25A7%25D9%2585%25D9%258A%2520%25D8%25B9%25D8%25A7%25D9%2585%2520-%2520%25D8%25B9%25D9%2582%25D9%258A%25D8%25AF%25D8%25A9%2520-%2520%25D9%2581%25D9%2582%25D9%2587%2520-%2520%25D8%25AA%25D9%2581%25D8%25B3%25D9%258A%25D8%25B1.jpg": "0a494668679dde32c565feaccdab62ee",
"assets/assets/images/%25D8%25A7%25D9%2584%25D8%25B3%25D9%258A%25D8%25B1%25D8%25A9%2520%25D8%25A7%25D9%2584%25D9%2586%25D8%25A8%25D9%2588%25D9%258A%25D8%25A9.jpg": "2b8e5e5976105db62cb3df5194370f8e",
"assets/assets/images/%25D8%25A7%25D9%2584%25D8%25B4%25D9%2581%25D8%25B1%25D8%25A9.jpg": "3c6b5bd3d41294134e8f95130a0e8301",
"assets/assets/images/%25D8%25A7%25D9%2584%25D8%25B5%25D8%25AD%25D8%25A7%25D8%25A8%25D8%25A9.jpg": "57f13cda73690697a2537a8bd6320853",
"assets/assets/images/%25D8%25A7%25D9%2584%25D8%25BA%25D8%25B2%25D9%2588%25D8%25A7%25D8%25AA.jpg": "d6bc49cd810bbdeef5acbac16a58ffee",
"assets/assets/images/%25D8%25A7%25D9%2584%25D9%2582%25D8%25B1%25D8%25A2%25D9%2586.jpg": "158e7a0be965c35d81f64a21a98e323f",
"assets/assets/images/%25D8%25A8%25D8%25B1%25D9%2585%25D8%25AC%25D8%25A9.jpg": "b585b3fe7b8b2dbbdf74f1a5aa2652dd",
"assets/assets/images/%25D8%25B9%25D8%25B1%25D8%25A8%25D9%258A%25D8%25A7%25D8%25AA.jpg": "ed293df4c7b0fae1fda228dec4b65724",
"assets/assets/images/%25D9%2582%25D8%25B5%25D8%25B5%2520%25D8%25A7%25D9%2584%25D8%25A3%25D9%2586%25D8%25A8%25D9%258A%25D8%25A7%25D8%25A1.jpg": "be523f1586361e213a443153081ef702",
"assets/assets/images/%25D9%2583%25D9%2584%25D9%2585%25D8%25A9%2520%25D9%2588%2520%25D8%25B1%25D8%25B3%25D9%2585%25D8%25A9.jpg": "e7e29a242900068a9d7824ca4c478aa3",
"assets/assets/images/%25D9%2584%25D8%25BA%25D8%25A9%2520%25D9%2588%2520%25D9%2585%25D8%25B9%25D8%25A7%25D9%2586%25D9%258A.jpg": "7201b0abd5d7027f90f2d9a5cc02943b",
"assets/assets/images/%25D9%2585%25D8%25B3%25D8%25AA%25D9%2584%25D8%25B2%25D9%2585%25D8%25A7%25D8%25AA%2520%25D9%2586%25D8%25B3%25D8%25A7%25D8%25A6%25D9%258A%25D8%25A9.jpg": "d60f0684dc659a182acf346bf5458ba5",
"assets/assets/images/%25D9%2585%25D8%25B9%25D9%2584%25D9%2588%25D9%2585%25D8%25A7%25D8%25AA%2520%25D8%25B9%25D8%25A7%25D9%2585%25D8%25A9.jpg": "994f68e5d750bd037fb3fb027257d2f9",
"assets/assets/images/%25D9%2585%25D9%2586%2520%25D8%25BA%25D9%258A%25D8%25B1%2520%25D9%2583%25D9%2584%25D8%25A7%25D9%2585%2520(%25D8%25A3%25D9%2581%25D9%2584%25D8%25A7%25D9%2585).jpg": "e7a3230d03fb360e1169b4e36e80dcd2",
"assets/assets/images/%25D9%2585%25D9%2586%2520%25D8%25BA%25D9%258A%25D8%25B1%2520%25D9%2583%25D9%2584%25D8%25A7%25D9%2585%2520(%25D8%25B9%25D8%25A7%25D9%2585%25D8%25A9).jpg": "dab149f582512592b4fe012823bafea7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d8c5e1d1890c890a0269808944b77841",
"assets/NOTICES": "e4b98538264aff2423c28895e19b7ba4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "b8989661da8b63ad8ad3368760539be9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "812a86c78742c49191027c6836aa7359",
"/": "812a86c78742c49191027c6836aa7359",
"main.dart.js": "ba42f4bcb0e0bb6c414f6eac74fb827a",
"manifest.json": "5ae598507b5e610decb011f86dd8789a",
"version.json": "b5ba01aab2061e67525b8ab1b4e16ba1"};
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
