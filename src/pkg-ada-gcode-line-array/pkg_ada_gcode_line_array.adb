-- File   : pkg_ada_gcode_line_array.adb
-- Date   : Fri 26 Feb 2021 08:39:05 PM +08
-- Author : WRY wruslan.ump@gmail.com
-- ========================================================

with Ada.Text_IO; 
with Ada.Characters.Latin_1;
with GNAT.String_Split;
with Ada.Strings.Unbounded;

with pkg_ada_dtstamp;

-- ========================================================
package body pkg_ada_gcode_line_array   -- Body PAGLA
-- ========================================================
--   with SPARK_Mode => on
is
   -- RENAMING STANDARD PACKAGES FOR CONVENIENCE
   package ATIO   renames Ada.Text_IO;
   package ACL1   renames Ada.Characters.Latin_1;
   package GSS    renames GNAT.String_Split;
   package PADTS  renames pkg_ada_dtstamp;
   package ASU    renames Ada.Strings.Unbounded;
   
   -- DEFINE PACKAGE WIDE VARIABLES
   -- =====================================================
   inp_fhandle, out_fhandle : ATIO.File_Type;
   
   -- =====================================================
   procedure exec_build_array_lineStrings (inp_fname : in String) 
   -- =====================================================
   --   with SPARK_Mode => on
   is
      lineNum       : Integer := 999;  
      UBlineStr     : ASU.Unbounded_String;
      len_UBlineStr : Natural := 999;
      gcode_array   : array(1 .. 13) of ASU.Unbounded_String;
      
      -- NEXT TO DO NEED FOR DYNAMIC ARRAY
      
   begin
      ATIO.Put_Line ("===========================================================");
      PADTS.dtstamp; ATIO.Put_Line ("Started PAGLA.exec_build_array_lineStrings"); 
      ATIO.New_LINE;
            
      -- ATIO.Put_Line ("ToOpen input file : " & inp_fname); 
      ATIO.Open (inp_fhandle, ATIO.In_File, inp_fname);
      -- ATIO.Put_Line ("Opened input file : " & inp_fname & " successfully."); 
      
      lineNum := 0;
      -- PROCESS LINE-BY-LINE strings IN FILE
      while not ATIO.End_Of_File (inp_fhandle) loop
         UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle));
         lineNum := lineNum + 1; 
         len_UBlineStr := ASU.Length (UBlineStr);
         
         -- ATIO.Put ("Processing lineNum = " & Integer'Image(lineNum) & " ");
         -- ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (UBlineStr));
         
         -- ADD EACH LINE AS A ROW ELEMENT INTO A SINGLE LARGE-SIZE ARRAY
         gcode_array(lineNum) := (UBlineStr);
         
      end loop;   
      ATIO.Close (inp_fhandle);
      PADTS.exec_delay_sec (1); -- Ensure closing completed before next open
      
      -- TEST ARRAY USING INDEX
      for idx in 5 .. 10 loop 
         ATIO.Put ("gcode_array(" & Integer'image(idx) & "): " &  ASU.To_String(gcode_array(idx)));
         ATIO.Put (ACL1.HT & " length: " & Natural'image(len_UBlineStr));
         ATIO.New_Line;
                        
      end loop;
      
      ATIO.New_Line; 
      PADTS.dtstamp; ATIO.Put_Line ("Ended PAGLA.exec_build_array_lineStrings");
      ATIO.Put_Line ("===========================================================");
      
   end exec_build_array_lineStrings;  
   
   -- =====================================================
   procedure exec_build_array_unbounded_lineStrings (inp_fname : in String)
   -- =====================================================
   --   with SPARK_Mode => on
   is
      lineNum : Integer := 999;
      UBlineStr : ASU.Unbounded_String;
      gcode_array : array(1 .. 13) of ASU.Unbounded_String;
      
      
   begin
      ATIO.Put_Line ("===========================================================");
      PADTS.dtstamp; ATIO.Put_Line ("Started PAGLA.exec_build_array_unbounded_lineStrings"); 
      ATIO.New_LINE;
            
      -- ATIO.Put_Line ("ToOpen input file : " & inp_fname); 
      ATIO.Open (inp_fhandle, ATIO.In_File, inp_fname);
      -- ATIO.Put_Line ("Opened input file : " & inp_fname & " successfully."); 
      
      lineNum := 0;
      -- PROCESS LINE-BY-LINE unbounded_strings IN FILE
      while not ATIO.End_Of_File (inp_fhandle) loop
         UBlineStr := ASU.To_Unbounded_String(ATIO.Get_Line (inp_fhandle));
         lineNum := lineNum + 1; 
         
         
         -- ATIO.Put ("Processing lineNum = " & Integer'Image(lineNum) & " ");
         -- ATIO.Put_Line (ATIO.Standard_Output, ASU.To_String (UBlineStr)); 
         
         -- ADD EACH LINE AS A ROW ELEMENT INTO A SINGLE LARGE-SIZE ARRAY
         gcode_array(lineNum) := (UBlineStr);
         
      end loop;   
      ATIO.Close (inp_fhandle);
      PADTS.exec_delay_sec (1); -- Ensure closing completed before next open
           
      -- TEST ARRAY USING INDEX
      for idx in 3 .. 7 loop 
         ATIO.Put ("gcode_array(" & Integer'image(idx) & "): " &  ASU.To_String(gcode_array(idx)));
         ATIO.Put (ACL1.HT & " length: " & Natural'image(ASU.Length(gcode_array(idx))));
         ATIO.New_Line;
      end loop;
         
      ATIO.New_Line; 
      PADTS.dtstamp; ATIO.Put_Line ("Ended PAGLA.exec_build_array_unbounded_lineStrings");
      ATIO.Put_Line ("===========================================================");
   
   end exec_build_array_unbounded_lineStrings;  
   
   
   
-- ========================================================
begin
    null;
-- ========================================================
end pkg_ada_gcode_line_array ;
-- ========================================================

