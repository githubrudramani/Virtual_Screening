proc draw_box {center sides} {
      # get the min and max values for each of the directions
      # (I'm not sure if this is the best way ... )
      set x0 [lindex $center 0]
      set y0 [lindex $center 1]
      set z0 [lindex $center 2]

      set x [lindex $sides 0]
      set y [lindex $sides 1]
      set z [lindex $sides 2]

      
      set minx [expr $x0-$x/2]
      set maxx [expr $x0+$x/2]
      
      set miny [expr $y0-$y/2]
      set maxy [expr $y0+$y/2]

      set minz [expr $z0-$z/2]
      set maxz [expr $z0+$z/2]

      puts "$minx $miny $minz ; $maxx $miny $minz"
      # and draw the lines
      draw materials off
      draw color red

      draw line "$minx $miny $minz" "$maxx $miny $minz"
      draw line "$minx $miny $minz" "$minx $maxy $minz"
      draw line "$minx $miny $minz" "$minx $miny $maxz"

      draw line "$maxx $miny $minz" "$maxx $maxy $minz"
      draw line "$maxx $miny $minz" "$maxx $miny $maxz"

      draw line "$minx $maxy $minz" "$maxx $maxy $minz"
      draw line "$minx $maxy $minz" "$minx $maxy $maxz"

      draw line "$minx $miny $maxz" "$maxx $miny $maxz"
      draw line "$minx $miny $maxz" "$minx $maxy $maxz"

      draw line "$maxx $maxy $maxz" "$maxx $maxy $minz"
      draw line "$maxx $maxy $maxz" "$minx $maxy $maxz"
      draw line "$maxx $maxy $maxz" "$maxx $miny $maxz"
      draw sphere $center radius 2
      
}
draw delete all

