set(LLVM_LINK_COMPONENTS Support)

add_executable(clang-tblgen 
  ASTTableGen.cpp
  ClangASTNodesEmitter.cpp
  ClangASTPropertiesEmitter.cpp
  ClangAttrEmitter.cpp
  ClangCommentCommandInfoEmitter.cpp
  ClangCommentHTMLNamedCharacterReferenceEmitter.cpp
  ClangCommentHTMLTagsEmitter.cpp
  ClangDataCollectorsEmitter.cpp
  ClangDiagnosticsEmitter.cpp
  ClangOpcodesEmitter.cpp
  ClangOpenCLBuiltinEmitter.cpp
  ClangOptionDocEmitter.cpp
  ClangSACheckersEmitter.cpp
  ClangSyntaxEmitter.cpp
  ClangTypeNodesEmitter.cpp
  MveEmitter.cpp
  NeonEmitter.cpp
  RISCVVEmitter.cpp
  SveEmitter.cpp
  TableGen.cpp
  )

set(A ${CMAKE_CURRENT_SOURCE_DIR}/../../../llvm/include)
set(B ${CMAKE_CURRENT_SOURCE_DIR}/../../../llvm/build/include)
set(C ${CMAKE_CURRENT_SOURCE_DIR}/../../include)
target_include_directories(clang-tblgen PRIVATE ${A} ${B} ${C})
target_link_directories(clang-tblgen PRIVATE
	${CMAKE_CURRENT_SOURCE_DIR}/../../../llvm/build/lib)
target_link_libraries(clang-tblgen PRIVATE  clangSupport LLVMTableGen
	#${CMAKE_SOURCE_DIR}/../llvm/build/lib/XRay/CMakeFiles/LLVMXRay.dir/FDRRecords.cpp.o
	#${CMAKE_SOURCE_DIR}/../llvm/build/lib/TableGen/CMakeFiles/LLVMTableGen.dir/Record.cpp.o
	#${CMAKE_SOURCE_DIR}/../llvm/build/lib/Object/CMakeFiles/LLVMObject.dir/RecordStreamer.cpp.o
	#${CMAKE_SOURCE_DIR}/../llvm/build/lib/MC/CMakeFiles/LLVMMC.dir/MCStreamer.cpp.o)
	)

set_target_properties(clang-tblgen PROPERTIES FOLDER "Clang tablegenning")
