/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_2879692634")

  // update collection data
  unmarshal({
    "name": "demo_requests"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_2879692634")

  // update collection data
  unmarshal({
    "name": "demo_request"
  }, collection)

  return app.save(collection)
})
