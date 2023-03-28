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
  help_type = "text",
  browser = "/usr/bin/chromium"
)

if(interactive()) {
  suppressMessages(prettycode::prettycode())
}

wideScreen = function(howWide = trunc(as.integer(Sys.getenv("COLUMNS")) * 0.9)) {
  if (! is.na(howWide)) {
    if ((howWide > 10) || (howWide < 10000))
      options(width = howWide)
  }
}

# Just use 1 core by default:
Sys.setenv(OMP_NUM_THREADS=1)
Sys.setenv(OMP_THREAD_LIMIT=1)
try(data.table::setDTthreads(1))
#try(RhpcBLASctl::blas_set_num_threads(1))
#try(RhpcBLASctl::omp_set_num_threads(1))

wideScreen()

