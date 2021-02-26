-- File: main_ada_array_processing.adb
-- Date: Fri 26 Feb 2021 08:39:05 PM +08
-- Author: WRY wruslan.ump@gmail.com
-- ========================================================
-- IMPORT STANDARD ADA PACKAGES
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
-- with Ada.Strings.Unbounded;
-- with GNAT.String_Split;

-- IMPORT USER-DEFINED ADA PACKAGES
with pkg_ada_dtstamp;
with pkg_ada_gcode_line_array;

-- ========================================================
procedure main_ada_array_processing
-- ========================================================
--	with SPARK_Mode => on
is 
   -- RENAME STANDARD ADA PACKAGES FOR CONVENIENCE
   package ATIO    renames Ada.Text_IO;
   package ART     renames Ada.Real_Time;
   -- package ASU     renames Ada.Strings.Unbounded;
   -- package GSS     renames GNAT.String_Split;
   
   -- RENAME USER-DEFINED ADA PACKAGES FOR CONVENIENCE
   package PADTS   renames pkg_ada_dtstamp;
   package PAGLA   renames pkg_ada_gcode_line_array;
   
    
   -- GLOBAL MAIN VARIABLES
   -- ====================================================
   inp_fname_Str   : String := "files/gcode_of_lineStrings.txt";
   inp_fname_ubStr : String := "files/gcode_of_lineUBStrings.txt";   
   
   
-- =======================================================      
begin
   PADTS.dtstamp; ATIO.Put_Line ("Bismillah 3 times WRY");
   PADTS.dtstamp; ATIO.Put_Line ("Executing: main_ada_array_processing"); 
   ATIO.New_Line;
   -- ====================================================
   
   -- Build gcode_array(idx) with array elements of same length
   PAGLA.exec_build_array_lineStrings (inp_fname_Str);
   
   -- Build gcode_array(idx) with array elements of different lengths
   PAGLA.exec_build_array_unbounded_lineStrings (inp_fname_UBStr);
   
   -- ====================================================      
   ATIO.New_Line; 
   PADTS.dtstamp; ATIO.Put_Line ("Ended main: Alhamdulillah 3 times WRY");
-- ========================================================   
end main_ada_array_processing;
-- ========================================================
