##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=lab5
ConfigurationName      :=Debug
WorkspacePath          :=/Users/keivan/Downloads/Chalmers/MOP/lab5
ProjectPath            :=/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Keivan Saberian
Date                   :=08/03/2019
CodeLitePath           :="/Users/keivan/Library/Application Support/CodeLite"
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="lab5.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -W $(Preprocessors)
CFLAGS   :=  -g -O0 -w -mthumb -march=armv6-m  -mfloat-abi=soft -std=c99 $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
ARM_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/Obstacles.c$(ObjectSuffix) $(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IntermediateDirectory)/rendering.c$(ObjectSuffix) $(IntermediateDirectory)/IRQ.c$(ObjectSuffix) $(IntermediateDirectory)/graphicdisplay.c$(ObjectSuffix) $(IntermediateDirectory)/ball.c$(ObjectSuffix) $(IntermediateDirectory)/main.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	/Applications/codelite.app/Contents/SharedSupport//tools/gcc-arm/arm-none-eabi/bin/objcopy -S -O srec  ./Debug/lab5.elf ./Debug/lab5.s19
	/Applications/codelite.app/Contents/SharedSupport//tools/gcc-arm/arm-none-eabi/bin/objdump -D -S ./Debug/lab5.elf > ./Debug/lab5.dass
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/Obstacles.c$(ObjectSuffix): Obstacles.c $(IntermediateDirectory)/Obstacles.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/Obstacles.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Obstacles.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Obstacles.c$(DependSuffix): Obstacles.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Obstacles.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Obstacles.c$(DependSuffix) -MM Obstacles.c

$(IntermediateDirectory)/Obstacles.c$(PreprocessSuffix): Obstacles.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Obstacles.c$(PreprocessSuffix) Obstacles.c

$(IntermediateDirectory)/keypad.c$(ObjectSuffix): keypad.c $(IntermediateDirectory)/keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keypad.c$(DependSuffix): keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad.c$(DependSuffix) -MM keypad.c

$(IntermediateDirectory)/keypad.c$(PreprocessSuffix): keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keypad.c$(PreprocessSuffix) keypad.c

$(IntermediateDirectory)/delays.c$(ObjectSuffix): delays.c $(IntermediateDirectory)/delays.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/delays.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/delays.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/delays.c$(DependSuffix): delays.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/delays.c$(ObjectSuffix) -MF$(IntermediateDirectory)/delays.c$(DependSuffix) -MM delays.c

$(IntermediateDirectory)/delays.c$(PreprocessSuffix): delays.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/delays.c$(PreprocessSuffix) delays.c

$(IntermediateDirectory)/rendering.c$(ObjectSuffix): rendering.c $(IntermediateDirectory)/rendering.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/rendering.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/rendering.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/rendering.c$(DependSuffix): rendering.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/rendering.c$(ObjectSuffix) -MF$(IntermediateDirectory)/rendering.c$(DependSuffix) -MM rendering.c

$(IntermediateDirectory)/rendering.c$(PreprocessSuffix): rendering.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/rendering.c$(PreprocessSuffix) rendering.c

$(IntermediateDirectory)/IRQ.c$(ObjectSuffix): IRQ.c $(IntermediateDirectory)/IRQ.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/IRQ.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/IRQ.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/IRQ.c$(DependSuffix): IRQ.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/IRQ.c$(ObjectSuffix) -MF$(IntermediateDirectory)/IRQ.c$(DependSuffix) -MM IRQ.c

$(IntermediateDirectory)/IRQ.c$(PreprocessSuffix): IRQ.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/IRQ.c$(PreprocessSuffix) IRQ.c

$(IntermediateDirectory)/graphicdisplay.c$(ObjectSuffix): graphicdisplay.c $(IntermediateDirectory)/graphicdisplay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/graphicdisplay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/graphicdisplay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/graphicdisplay.c$(DependSuffix): graphicdisplay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/graphicdisplay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/graphicdisplay.c$(DependSuffix) -MM graphicdisplay.c

$(IntermediateDirectory)/graphicdisplay.c$(PreprocessSuffix): graphicdisplay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/graphicdisplay.c$(PreprocessSuffix) graphicdisplay.c

$(IntermediateDirectory)/ball.c$(ObjectSuffix): ball.c $(IntermediateDirectory)/ball.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/ball.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ball.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ball.c$(DependSuffix): ball.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ball.c$(ObjectSuffix) -MF$(IntermediateDirectory)/ball.c$(DependSuffix) -MM ball.c

$(IntermediateDirectory)/ball.c$(PreprocessSuffix): ball.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ball.c$(PreprocessSuffix) ball.c

$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/keivan/Downloads/Chalmers/MOP/lab5/lab5/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM main.c

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) main.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


