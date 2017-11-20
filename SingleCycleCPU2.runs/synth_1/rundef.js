//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "E:/Vivado/xlinix/SDK/2017.3/bin;E:/Vivado/xlinix/Vivado/2017.3/ids_lite/ISE/bin/nt64;E:/Vivado/xlinix/Vivado/2017.3/ids_lite/ISE/lib/nt64;E:/Vivado/xlinix/Vivado/2017.3/bin;";
} else {
  PathVal = "E:/Vivado/xlinix/SDK/2017.3/bin;E:/Vivado/xlinix/Vivado/2017.3/ids_lite/ISE/bin/nt64;E:/Vivado/xlinix/Vivado/2017.3/ids_lite/ISE/lib/nt64;E:/Vivado/xlinix/Vivado/2017.3/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log MainCPU.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source MainCPU.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
