# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build"

# Include any dependencies generated for this target.
include CMakeFiles/main_executable.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/main_executable.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/main_executable.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main_executable.dir/flags.make

CMakeFiles/main_executable.dir/src/main.c.o: CMakeFiles/main_executable.dir/flags.make
CMakeFiles/main_executable.dir/src/main.c.o: ../src/main.c
CMakeFiles/main_executable.dir/src/main.c.o: CMakeFiles/main_executable.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/main_executable.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main_executable.dir/src/main.c.o -MF CMakeFiles/main_executable.dir/src/main.c.o.d -o CMakeFiles/main_executable.dir/src/main.c.o -c "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/main.c"

CMakeFiles/main_executable.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main_executable.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/main.c" > CMakeFiles/main_executable.dir/src/main.c.i

CMakeFiles/main_executable.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main_executable.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/main.c" -o CMakeFiles/main_executable.dir/src/main.c.s

CMakeFiles/main_executable.dir/src/expose_metrics.c.o: CMakeFiles/main_executable.dir/flags.make
CMakeFiles/main_executable.dir/src/expose_metrics.c.o: ../src/expose_metrics.c
CMakeFiles/main_executable.dir/src/expose_metrics.c.o: CMakeFiles/main_executable.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/main_executable.dir/src/expose_metrics.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main_executable.dir/src/expose_metrics.c.o -MF CMakeFiles/main_executable.dir/src/expose_metrics.c.o.d -o CMakeFiles/main_executable.dir/src/expose_metrics.c.o -c "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/expose_metrics.c"

CMakeFiles/main_executable.dir/src/expose_metrics.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main_executable.dir/src/expose_metrics.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/expose_metrics.c" > CMakeFiles/main_executable.dir/src/expose_metrics.c.i

CMakeFiles/main_executable.dir/src/expose_metrics.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main_executable.dir/src/expose_metrics.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/expose_metrics.c" -o CMakeFiles/main_executable.dir/src/expose_metrics.c.s

CMakeFiles/main_executable.dir/src/metrics.c.o: CMakeFiles/main_executable.dir/flags.make
CMakeFiles/main_executable.dir/src/metrics.c.o: ../src/metrics.c
CMakeFiles/main_executable.dir/src/metrics.c.o: CMakeFiles/main_executable.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/main_executable.dir/src/metrics.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main_executable.dir/src/metrics.c.o -MF CMakeFiles/main_executable.dir/src/metrics.c.o.d -o CMakeFiles/main_executable.dir/src/metrics.c.o -c "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/metrics.c"

CMakeFiles/main_executable.dir/src/metrics.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main_executable.dir/src/metrics.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/metrics.c" > CMakeFiles/main_executable.dir/src/metrics.c.i

CMakeFiles/main_executable.dir/src/metrics.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main_executable.dir/src/metrics.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/src/metrics.c" -o CMakeFiles/main_executable.dir/src/metrics.c.s

# Object files for target main_executable
main_executable_OBJECTS = \
"CMakeFiles/main_executable.dir/src/main.c.o" \
"CMakeFiles/main_executable.dir/src/expose_metrics.c.o" \
"CMakeFiles/main_executable.dir/src/metrics.c.o"

# External object files for target main_executable
main_executable_EXTERNAL_OBJECTS =

main_executable: CMakeFiles/main_executable.dir/src/main.c.o
main_executable: CMakeFiles/main_executable.dir/src/expose_metrics.c.o
main_executable: CMakeFiles/main_executable.dir/src/metrics.c.o
main_executable: CMakeFiles/main_executable.dir/build.make
main_executable: CMakeFiles/main_executable.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable main_executable"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main_executable.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main_executable.dir/build: main_executable
.PHONY : CMakeFiles/main_executable.dir/build

CMakeFiles/main_executable.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main_executable.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main_executable.dir/clean

CMakeFiles/main_executable.dir/depend:
	cd "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11" "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11" "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build" "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build" "/home/dario/Escritorio/version 8/so-i-24-dariocastillo11/build/CMakeFiles/main_executable.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/main_executable.dir/depend

