INCLUDES=-I../../../llvm/include -I../../../llvm/build/include -I../../include -I./
LINK_LIBS=-lncurses -ltinfo
CXX=g++ 
SRC=ASTTableGen.cpp  ClangDataCollectorsEmitter.cpp  ClangTypeNodesEmitter.cpp  ClangASTNodesEmitter.cpp                            ClangDiagnosticsEmitter.cpp     MveEmitter.cpp   ClangASTPropertiesEmitter.cpp                       ClangOpcodesEmitter.cpp         NeonEmitter.cpp   ClangAttrEmitter.cpp                                ClangOpenCLBuiltinEmitter.cpp   RISCVVEmitter.cpp   ClangCommentCommandInfoEmitter.cpp        ClangOptionDocEmitter.cpp       SveEmitter.cpp  ClangCommentHTMLNamedCharacterReferenceEmitter.cpp  ClangSACheckersEmitter.cpp        ClangCommentHTMLTagsEmitter.cpp ClangSyntaxEmitter.cpp
OBJS = $(patsubst %.cpp,%.o,$(SRC))
LINK_OBJS=$(shell find ../../../llvm/build/lib -name "*.a") 
EXEC=TableGen.out
TARGET=out
ifdef OBJ_ONLY
all: $(OBJS)
else
all: $(OBJS) $(EXEC)
endif
$(OBJS): %.o : %.cpp 
	$(CXX) -c  $(INCLUDES) $^ -o $@
$(TARGET): $(OBJS)
	$(CXX) $^ $(LINK_OBJS) $(LINK_LIBS)  -o $@
$(EXEC): %.out : %.cpp
	@echo compiling $(EXEC)
	@g++ -frtti -fpermissive -I./ $(INCLUDES) $^ *.o $(LINK_OBJS) $(LINK_LIBS) -L./ -lllvmsupport -o $@
clean:
	rm -rf $(EXEC)
clean_all:
	rm -rf *.o *.a

