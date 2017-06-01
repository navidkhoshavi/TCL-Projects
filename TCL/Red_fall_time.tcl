# To parse mt files
set project_name "read_mt"
set outfile [open "Red_fall_time.out" w]
#set infiles [glob *.mt?]


for {set i 0} {$i <= 0} {incr i} {
	set infile "$project_name.out"
	set ifp [open $infile r]
	set lineno 1
	#  Slurp up the data file
	set file_data [read $ifp]

	 #  Process data file
	set data [split $file_data "\n"]
	set counter 0
	

	foreach line $data {
		# do some line processing here
	

		if { $lineno > 0 } {
			puts -nonewline  $outfile  "[lindex $line 2] \n"
		}
		
		incr lineno
		
	}
	close $ifp
	
}

			

close $outfile