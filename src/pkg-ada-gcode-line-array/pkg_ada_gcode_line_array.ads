-- File: pkg_ada_gcode_line_array.ads
-- Date   : Fri 26 Feb 2021 08:39:05 PM +08
-- Author : WRY wruslan.ump@gmail.com

-- ========================================================
package pkg_ada_gcode_line_array    -- Spec PAGLA
-- ========================================================
--    with SPARK_Mode => on
is
   
   procedure exec_build_array_lineStrings (inp_fname : in String);
   
   procedure exec_build_array_unbounded_lineStrings (inp_fname : in String);
   
   
-- ======================================================== 
end pkg_ada_gcode_line_array;
-- ========================================================
