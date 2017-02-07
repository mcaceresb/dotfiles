.First <- function() {
    options(repos = c(CRAN = "https://cran.rstudio.com/"),
            browserNLdisabled = TRUE)
}

if (interactive()){
    suppressMessages(require(devtools))

	#Global options to work with Vim
	options(vimcom.verbose = 1)
	options(vimcom.allnames = TRUE)

	# Library options to work with Vim and get nice colors
	require(setwidth) # Set width when running R from terminal
	require(vimcom)   # Talk to Vim
	require(colorout) # Colorize terminal

	# Output color scheme for white terminal
	# setOutputColors256 (normal   = 17,
	# 				      number   = 52,
	# 				      string   = 244,
	# 				      const    = 35,
	# 				      stderror = 21,
	# 				      warn     = c(1, 0, 196),
	# 				      error    = c(1, 15))

	# Output color scheme for black terminal
	setOutputColors256 (normal   = 255, # 122
						number   = 208,
						string   = 246,
						const    = 35,
						stderror = 33,
						warn     = c(1 ,0 ,1),
						error    = c(1 ,15))
}
