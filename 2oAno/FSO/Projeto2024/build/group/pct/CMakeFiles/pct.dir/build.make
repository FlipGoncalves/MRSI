# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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
CMAKE_SOURCE_DIR = /home/filipino/Desktop/somm24nm-fso-g02/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/filipino/Desktop/somm24nm-fso-g02/build

# Include any dependencies generated for this target.
include group/pct/CMakeFiles/pct.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include group/pct/CMakeFiles/pct.dir/compiler_depend.make

# Include the progress variables for this target.
include group/pct/CMakeFiles/pct.dir/progress.make

# Include the compile flags for this target's objects.
include group/pct/CMakeFiles/pct.dir/flags.make

group/pct/CMakeFiles/pct.dir/pct_init.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_init.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_init.cpp
group/pct/CMakeFiles/pct.dir/pct_init.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_init.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_init.cpp.o -MF CMakeFiles/pct.dir/pct_init.cpp.o.d -o CMakeFiles/pct.dir/pct_init.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_init.cpp

group/pct/CMakeFiles/pct.dir/pct_init.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_init.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_init.cpp > CMakeFiles/pct.dir/pct_init.cpp.i

group/pct/CMakeFiles/pct.dir/pct_init.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_init.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_init.cpp -o CMakeFiles/pct.dir/pct_init.cpp.s

group/pct/CMakeFiles/pct.dir/pct_term.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_term.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_term.cpp
group/pct/CMakeFiles/pct.dir/pct_term.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_term.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_term.cpp.o -MF CMakeFiles/pct.dir/pct_term.cpp.o.d -o CMakeFiles/pct.dir/pct_term.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_term.cpp

group/pct/CMakeFiles/pct.dir/pct_term.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_term.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_term.cpp > CMakeFiles/pct.dir/pct_term.cpp.i

group/pct/CMakeFiles/pct.dir/pct_term.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_term.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_term.cpp -o CMakeFiles/pct.dir/pct_term.cpp.s

group/pct/CMakeFiles/pct.dir/pct_print.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_print.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_print.cpp
group/pct/CMakeFiles/pct.dir/pct_print.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_print.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_print.cpp.o -MF CMakeFiles/pct.dir/pct_print.cpp.o.d -o CMakeFiles/pct.dir/pct_print.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_print.cpp

group/pct/CMakeFiles/pct.dir/pct_print.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_print.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_print.cpp > CMakeFiles/pct.dir/pct_print.cpp.i

group/pct/CMakeFiles/pct.dir/pct_print.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_print.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_print.cpp -o CMakeFiles/pct.dir/pct_print.cpp.s

group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_new_process.cpp
group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o -MF CMakeFiles/pct.dir/pct_new_process.cpp.o.d -o CMakeFiles/pct.dir/pct_new_process.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_new_process.cpp

group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_new_process.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_new_process.cpp > CMakeFiles/pct.dir/pct_new_process.cpp.i

group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_new_process.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_new_process.cpp -o CMakeFiles/pct.dir/pct_new_process.cpp.s

group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_getters.cpp
group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o -MF CMakeFiles/pct.dir/pct_getters.cpp.o.d -o CMakeFiles/pct.dir/pct_getters.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_getters.cpp

group/pct/CMakeFiles/pct.dir/pct_getters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_getters.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_getters.cpp > CMakeFiles/pct.dir/pct_getters.cpp.i

group/pct/CMakeFiles/pct.dir/pct_getters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_getters.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_getters.cpp -o CMakeFiles/pct.dir/pct_getters.cpp.s

group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o: group/pct/CMakeFiles/pct.dir/flags.make
group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_update_state.cpp
group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o: group/pct/CMakeFiles/pct.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o -MF CMakeFiles/pct.dir/pct_update_state.cpp.o.d -o CMakeFiles/pct.dir/pct_update_state.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_update_state.cpp

group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pct.dir/pct_update_state.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_update_state.cpp > CMakeFiles/pct.dir/pct_update_state.cpp.i

group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pct.dir/pct_update_state.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct/pct_update_state.cpp -o CMakeFiles/pct.dir/pct_update_state.cpp.s

# Object files for target pct
pct_OBJECTS = \
"CMakeFiles/pct.dir/pct_init.cpp.o" \
"CMakeFiles/pct.dir/pct_term.cpp.o" \
"CMakeFiles/pct.dir/pct_print.cpp.o" \
"CMakeFiles/pct.dir/pct_new_process.cpp.o" \
"CMakeFiles/pct.dir/pct_getters.cpp.o" \
"CMakeFiles/pct.dir/pct_update_state.cpp.o"

# External object files for target pct
pct_EXTERNAL_OBJECTS =

/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_init.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_term.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_print.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_new_process.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_getters.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/pct_update_state.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/build.make
/home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a: group/pct/CMakeFiles/pct.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX static library /home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && $(CMAKE_COMMAND) -P CMakeFiles/pct.dir/cmake_clean_target.cmake
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pct.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
group/pct/CMakeFiles/pct.dir/build: /home/filipino/Desktop/somm24nm-fso-g02/lib/libpct.a
.PHONY : group/pct/CMakeFiles/pct.dir/build

group/pct/CMakeFiles/pct.dir/clean:
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct && $(CMAKE_COMMAND) -P CMakeFiles/pct.dir/cmake_clean.cmake
.PHONY : group/pct/CMakeFiles/pct.dir/clean

group/pct/CMakeFiles/pct.dir/depend:
	cd /home/filipino/Desktop/somm24nm-fso-g02/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/filipino/Desktop/somm24nm-fso-g02/src /home/filipino/Desktop/somm24nm-fso-g02/src/group/pct /home/filipino/Desktop/somm24nm-fso-g02/build /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct /home/filipino/Desktop/somm24nm-fso-g02/build/group/pct/CMakeFiles/pct.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : group/pct/CMakeFiles/pct.dir/depend

