f9files = ['elcoll_20121126', 'elcoll_20130117', 'elcoll_20131112', 'elcoll_20140101']
f5files = ['elcoll_20120104', 'elcoll_20120403',  $
	'elcoll_20121211']

color = ['red','dark green', 'magenta']
thick=2

;dfpsplot, 'past_elcoll.ps', /color, /square

position=fltarr(4, 6)
position[*,4] = [0.55, 0.6, 0.9, 0.85]
position[*,0] = [0.55, 0.35, 0.9, 0.6]
position[*,5] = [0.55, 0.1, 0.9, 0.35]

position[*,1] = [0.1, 0.6, 0.45, 0.85]
position[*,2] = [0.1, 0.35, 0.45, 0.6]
position[*,3] = [0.1, 0.1, 0.45, 0.35]


!P.MULTI = [0, 2, 3]
origpos = !P.position
!P.charsize=1.5
!x.thick=thick
!Y.thick=thick
!P.thick=thick
!P.charthick=thick  
!P.position=reform(position[*,0])
djs_plot, [0], [0], /nodata, xrange=[20, 90], yrange=[100, 550], $
	ytitle='\theta_x (arcsec)', $
	/xs, xtitle='Elevation (deg)', /ys
p1 = !P & x1 = !X & y1 = !Y
	

djs_xyouts, 25, -50, 'F5 Elcoll Data'
djs_xyouts, 25, -150, '20120411 Excluded', color='brown'
djs_xyouts, 25, -250, strmid(f5files[0],7, 8), color=color[0]
djs_xyouts, 25, -300, strmid(f5files[1],7, 8), color=color[1]
djs_xyouts, 25, -350, strmid(f5files[2], 7, 8), color=color[2]
	
djs_xyouts, 25, -200, 'No Amplitude correction', color='blue'

!P.position=position[*,1]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[1000, 4000], $
	ytitle='Y (\mum)', xtickformat='(A1)'
p2 = !P & x2 = !X & y2 = !Y

!P.position=position[*,2]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[-1200, 1200], $
	ytitle='X (\mum)', xtickformat='(A1)', /ys
p3 = !P & x3 = !X & y3 = !Y
	
	
!P.position=position[*,3]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[13000, 15000]/1e4, $
	ytitle='Focus (10^4 \mum)', xtitle='Elevation (deg)', /ys
p4 = !P & x4 = !X & y4 = !Y

!P.position=position[*,4]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[-100, 500], $
	ytitle='\theta_y (arcsec)', /ys, $
	xtickformat='(a1)'
p5 = !P & x5 = !X & y5 = !Y	

	
for ii = 0, n_elements(f5files)-1 do begin
	readcol, f5files[ii], el, tiltx, tilty, transx, transy, focus
	
	!P = p1 & !X = x1 & !Y = y1
	djs_oplot, el, tiltx, color=color[ii], ps=4
	
	!P = p2 & !X = x2 & !Y = y2
	djs_oplot, el,transy, ps=4, color=color[ii]
	
	!P = p3 & !X = x3 & !Y = y3
	djs_oplot, el, transx, ps=4, color=color[ii]
	
	!P = p4 & !x = x4 & !y = y4
	djs_oplot, el, focus/1e4, ps=4, color=color[ii]

	!P = p5 & !X = x5 & !Y = y5
	djs_oplot, el, tilty, ps=4, color=color[ii]

endfor

!P.position=origpos


position=fltarr(4, 6)
position[*,4] = [0.55, 0.6, 0.9, 0.85]
position[*,0] = [0.55, 0.35, 0.9, 0.6]
position[*,5] = [0.55, 0.1, 0.9, 0.35]

position[*,1] = [0.1, 0.6, 0.45, 0.85]
position[*,2] = [0.1, 0.35, 0.45, 0.6]
position[*,3] = [0.1, 0.1, 0.45, 0.35]


!P.MULTI = [0, 2, 3]
origpos = !P.position
!P.charsize=1.5
!x.thick=thick
!Y.thick=thick
!P.thick=thick
!P.charthick=thick  
!P.position=reform(position[*,0])
djs_plot, [0], [0], /nodata, xrange=[20, 90], yrange=[000, 250], $
	ytitle='\theta_x (arcsec)', $
	/xs, xtitle='Elevation (deg)', /ys
p1 = !P & x1 = !X & y1 = !Y
	

djs_xyouts, 25, -100, 'F9 Elcoll Data'
djs_xyouts, 25, -175, strmid(f9files[0],7, 8), color=color[0]
djs_xyouts, 25, -200, strmid(f9files[1],7, 8), color=color[1]
	
djs_xyouts, 25, -125, 'No Amplitude correction', color='blue'

!P.position=position[*,1]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[-1000, 2000], $
	ytitle='Y (\mum)', xtickformat='(A1)'
p2 = !P & x2 = !X & y2 = !Y

!P.position=position[*,2]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[-200, 1500], $
	ytitle='X (\mum)', xtickformat='(A1)', /ys
p3 = !P & x3 = !X & y3 = !Y
	
	
!P.position=position[*,3]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[000, 1200], $
	ytitle='Focus (\mum)', xtitle='Elevation (deg)', /ys
p4 = !P & x4 = !X & y4 = !Y

!P.position=position[*,4]
djs_plot, [0], [0], /nodata, xrange=[20, 90], /xs, yrange=[-100, 250], $
	ytitle='\theta_y (arcsec)', /ys, $
	xtickformat='(a1)'
p5 = !P & x5 = !X & y5 = !Y	

	
for ii = 0, n_elements(f9files)-1 do begin
	readcol, f9files[ii], el, tiltx, tilty, transx, transy, focus
	
	!P = p1 & !X = x1 & !Y = y1
	djs_oplot, el, tiltx, color=color[ii], ps=4
	
	!P = p2 & !X = x2 & !Y = y2
	djs_oplot, el,transy, ps=4, color=color[ii]
	
	!P = p3 & !X = x3 & !Y = y3
	djs_oplot, el, transx, ps=4, color=color[ii]
	
	!P = p4 & !x = x4 & !y = y4
	djs_oplot, el, focus, ps=4, color=color[ii]

	!P = p5 & !X = x5 & !Y = y5
	djs_oplot, el, tilty, ps=4, color=color[ii]

endfor

!P.position=origpos






dfpsclose

END

