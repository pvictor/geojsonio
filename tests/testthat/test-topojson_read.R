context("topojson_read")

test_that("topojson_read works with file inputs", {
  file <- system.file("examples", "us_states.topojson", package = "geojsonio")
  aa <- topojson_read(file)
  
  expect_is(aa, "SpatialPolygonsDataFrame")
  expect_is(aa@data, "data.frame")
  expect_is(aa@polygons, "list")
})

test_that("topojson_read works with url inputs", {
  skip_on_cran()
  
  url <- "https://raw.githubusercontent.com/shawnbot/d3-cartogram/master/data/us-states.topojson"
  aa <- topojson_read(url)
  
  expect_is(aa, "SpatialPolygonsDataFrame")
  expect_is(aa@data, "data.frame")
  expect_is(aa@polygons, "list")
})

test_that("topojson_read works with as.location inputs", {
  file <- system.file("examples", "us_states.topojson", package = "geojsonio")
  aa <- topojson_read(as.location(file))
  
  expect_is(aa, "SpatialPolygonsDataFrame")
  expect_is(aa@data, "data.frame")
  expect_is(aa@polygons, "list")
})

test_that("topojson_read works with .json extension", {
  file <- tempfile(fileext = ".json")
  cat('{"type":"Topology","objects":{"foo":{"type":"LineString","arcs":[0]}},"arcs":[[[100,0],[101,1]]],"bbox":[100,0,101,1]}', 
      file = file)
  aa <- topojson_read(file)
  
  expect_is(aa, "SpatialLinesDataFrame")
  expect_is(aa@data, "data.frame")
  expect_is(aa@proj4string, "CRS")
})
