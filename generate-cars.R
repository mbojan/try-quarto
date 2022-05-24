# -------------------------------------------------------------------------
# Generate car qmd's in `cars` folder
# -------------------------------------------------------------------------



# Proceed if rendering the whole project, exit otherwise
if (!nzchar(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"))) {
  quit()
}

library(whisker)

data("mtcars", package = "datasets")

templ <- readLines("template.whisker")
dir.create("cars", showWarnings = FALSE)
for(rowid in seq(1, nrow(mtcars))) {
  car_name <- rownames(mtcars)[rowid]
  writeLines(
    whisker::whisker.render(templ, list(rowid = rowid, car_name = car_name)),
    file.path("cars", paste0(rowid, ".qmd"))
  )
  message("Done with ", rowid)
}
