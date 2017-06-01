# To parse mt files
set project_name "i5_CCP_N2_D0_P10"
set outfile [open "read_mt.out" w]
#set infiles [glob *.mt?]


for {set i 0} {$i <= 96} {incr i} {
	set infile "$project_name.sp.mt$i@ra"
	set ifp [open $infile r]
	set lineno 1
	#  Slurp up the data file
	set file_data [read $ifp]

	 #  Process data file
	set data [split $file_data "\n"]
	set counter 0
	

	foreach line $data {
		# do some line processing here
	

		if { $counter == 0 && $lineno > 5 } {
			puts -nonewline  $outfile  "[lindex $line 1] \t [lindex $line 2] \t [lindex $line 3]"
			set counter  1
		} elseif { $counter == 1 && $lineno > 5 } {
			puts -nonewline  $outfile  "\t [lindex $line 0] \t [lindex $line 3]"
			set counter  2
		} elseif { $counter == 2 && $lineno > 5 } {
			puts -nonewline  $outfile "\n"
			set counter  0
		}
		
		incr lineno
		
	}
	close $ifp
	
}

			

close $outfile