files = findfile('/mmt/wfsdat/*/ELCOLL')
for ii = 0, n_elements(files) -1 do begin
	junk = strsplit(files[ii], '/', /extract)
	newname = 'elcoll_' + junk[n_elements(junk)-2]
	spawn, 'cp ' + files[ii] + ' ' + newname
endfor
END


