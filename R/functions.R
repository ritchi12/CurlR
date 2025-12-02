#' Filter Curling Shot Data
#'
#' @description Quickly filter by tournament, team, end, player, throw, or percent.
#'
#' @param df A data.frame or tibble.
#' @param tournament Tournament abbreviation.
#' @param team Team name.
#' @param player Player name.
#' @param end End number.
#' @param throw throw type
#' @param min_percent Minimum shot score.
#'
#' @return A filtered data.frame.
#' @export
#'
#' @examples
#' # Create example dataset
#' df <- data.frame(
#'   tournament = c("WMDCC2025","WMDCC2025","WMDCC2025","WMDCC2025"),
#'   T1 = c("CAN-Canada", "USA-UnitedStates", "CAN-Canada", "SWE-Sweden"),
#'   T2 = c("USA-UnitedStates", "CAN-Canada", "SWE", "CAN-Canada"),
#'   Thrower = c("Alice", "Bob", "Carol", "Dave"),
#'   throw = c("Guard", "Draw", "Draw", "Raise"),
#'   percent = c(75, 50, 100, 25),
#'   end = c(1, 2, 8, 8),
#'   hammer_end = c("CAN-Canada", "USA-UnitedStates", "CAN-Canada", "SWE"),
#'   pp_team = c("CAN-Canada", "USA-UnitedStates", "CAN-Canada", "SWE"),
#'   stringsAsFactors = FALSE
#' )
#'
#' # All shots by Team Canada in end 8
#' filter_shots(df, team = "CAN-Canada", end = 8)
filter_shots <- function(df, tournament=NULL, team = NULL, player = NULL,
                         end = NULL, throw = NULL, min_percent = NULL) {

  # Copy input to avoid modifying original
  df_out <- df

  if (!is.null(tournament)) {
    df_out <- df_out[df_out$ID == tournament, , drop = FALSE]
  }
  if (!is.null(team)) {
    df_out <- df_out[df_out$T1 == team | df_out$T2 == team, , drop = FALSE]
  }
  if (!is.null(player)) {
    df_out <- df_out[df_out$Thrower == player, , drop = FALSE]
  }
  if (!is.null(end)) {
    df_out <- df_out[df_out$End == end, , drop = FALSE]
  }
  if (!is.null(throw)) {
    df_out <- df_out[df_out$Throw == throw, , drop = FALSE]
  }
  if (!is.null(min_percent)) {
    df_out <- df_out[df_out$Percent >= min_percent, , drop = FALSE]
  }

  return(df_out)
}
#' List Variables in Curling Dataset
#'
#' @description Prints variable names and their types using base R.
#'
#' @param df A data.frame or tibble.
#'
#' @return A data.frame with variable names and types.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   a = 1:3,
#'   b = c("x","y","z"),
#'   c = c(TRUE, FALSE, TRUE),
#'   stringsAsFactors = FALSE
#' )
#'
#' list_variables(df)
list_variables <- function(df) {
  data.frame(
    variable = names(df),
    type = sapply(df, function(x) class(x)[1]),
    stringsAsFactors = FALSE
  )
}
