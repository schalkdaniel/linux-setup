local({
	r = getOption("repos")
	r["CRAN"] = "https://ftp.gwdg.de/pub/misc/cran/"
	options(repos = r)
})
options(
  menu.graphics=FALSE, #no popups
  useFancyQuotes = FALSE, #no directional quotes
  max.print = 10000, #stop R from crashing because it prints to much sh**t
  digits = 4, #don't print a million digits
  scipen = 2, #use scientific notation for values >10^7
  deparse.max.lines = 3L, # reduce output of traceback
  editor = "vim",
  help_type = "text"
)

if(interactive()) {
  suppressMessages(prettycode::prettycode())
}
