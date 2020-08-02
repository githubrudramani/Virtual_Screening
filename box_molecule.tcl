proc box_molecule {molid r} {
      # get the min and max values for each of the directions
      # (I'm not sure if this is the best way ... )
      set sel [atomselect top "(same residue as protein and within $r of resname UNL1) and not resname UNL1"]

      set coords [lsort -real [$sel get x]]
      set minx [lindex $coords 0]
      set maxx [lindex [lsort -real -decreasing $coords] 0]

      set coords [lsort -real [$sel get y]]
      set miny [lindex $coords 0]
      set maxy [lindex [lsort -real -decreasing $coords] 0]

      set coords [lsort -real [$sel get z]]
      set minz [lindex $coords 0]
      set maxz [lindex [lsort -real -decreasing $coords] 0]

      # and draw the lines
      draw materials off
      draw color yellow
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
      set x [expr $maxx-$minx]
      set y [expr $maxy-$miny]
      set z [expr $maxz-$minz]

      set a [expr ($maxx+$minx)/2]
      set b [expr ($maxy+$miny)/2]
      set c [expr ($maxz+$minz)/2]
      


      puts "x: $x       y: $y       z: $z"
      puts "center: $a $b $c"
      set center [list $a $b $c]
      draw sphere $center radius 2
}
draw delete all
box_molecule top 5