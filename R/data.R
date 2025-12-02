# -------- PACKAGE DOCUMENTATION --------
#' CurlR
#'
#' Data package for Mixed Doubles Curling.
#'
#' @docType package
#' @keywords internal
"_PACKAGE"


# -------- DATASET: mxd_games --------
#' Mixed Doubles Curling — Game-Level Data
#'
#' A data frame containing game-level information for Mixed Doubles curling
#' events from OWG and WMDCC competitions.
#'
#' @name mxd_games
#' @docType data
#' @format A data frame with 1112 rows and 168 columns.
#' @source Created by Robyn Ritchie via text scraping and image processing of
#'   results books from \url{https://curlit.com/results}.
#' @examples
#' data("mxd_games")
#' str(mxd_games)
"mxd_games"


# -------- DATASET: mxd_shots --------
#' Mixed Doubles Curling — Shot-Level Data
#'
#' A data frame containing shot-by-shot details from Mixed Doubles curling
#' competitions (OWG and WMDCC).
#'
#' @name mxd_shots
#' @docType data
#' @format A data frame with 66632 rows and 104 columns.
#' @source Created by Robyn Ritchie via text scraping and image processing of
#'   results books from \url{https://curlit.com/results}.
#' @examples
#' data("mxd_shots")
#' str(mxd_shots)
"mxd_shots"
