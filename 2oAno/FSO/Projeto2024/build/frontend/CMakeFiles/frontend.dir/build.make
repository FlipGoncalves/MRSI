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
include frontend/CMakeFiles/frontend.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include frontend/CMakeFiles/frontend.dir/compiler_depend.make

# Include the progress variables for this target.
include frontend/CMakeFiles/frontend.dir/progress.make

# Include the compile flags for this target's objects.
include frontend/CMakeFiles/frontend.dir/flags.make

frontend/CMakeFiles/frontend.dir/sim.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/sim.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/sim.cpp
frontend/CMakeFiles/frontend.dir/sim.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object frontend/CMakeFiles/frontend.dir/sim.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/sim.cpp.o -MF CMakeFiles/frontend.dir/sim.cpp.o.d -o CMakeFiles/frontend.dir/sim.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/sim.cpp

frontend/CMakeFiles/frontend.dir/sim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/sim.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/sim.cpp > CMakeFiles/frontend.dir/sim.cpp.i

frontend/CMakeFiles/frontend.dir/sim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/sim.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/sim.cpp -o CMakeFiles/frontend.dir/sim.cpp.s

frontend/CMakeFiles/frontend.dir/jdt.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/jdt.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/jdt.cpp
frontend/CMakeFiles/frontend.dir/jdt.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object frontend/CMakeFiles/frontend.dir/jdt.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/jdt.cpp.o -MF CMakeFiles/frontend.dir/jdt.cpp.o.d -o CMakeFiles/frontend.dir/jdt.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/jdt.cpp

frontend/CMakeFiles/frontend.dir/jdt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/jdt.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/jdt.cpp > CMakeFiles/frontend.dir/jdt.cpp.i

frontend/CMakeFiles/frontend.dir/jdt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/jdt.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/jdt.cpp -o CMakeFiles/frontend.dir/jdt.cpp.s

frontend/CMakeFiles/frontend.dir/pct.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/pct.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/pct.cpp
frontend/CMakeFiles/frontend.dir/pct.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object frontend/CMakeFiles/frontend.dir/pct.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/pct.cpp.o -MF CMakeFiles/frontend.dir/pct.cpp.o.d -o CMakeFiles/frontend.dir/pct.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/pct.cpp

frontend/CMakeFiles/frontend.dir/pct.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/pct.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/pct.cpp > CMakeFiles/frontend.dir/pct.cpp.i

frontend/CMakeFiles/frontend.dir/pct.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/pct.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/pct.cpp -o CMakeFiles/frontend.dir/pct.cpp.s

frontend/CMakeFiles/frontend.dir/mem.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/mem.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/mem.cpp
frontend/CMakeFiles/frontend.dir/mem.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object frontend/CMakeFiles/frontend.dir/mem.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/mem.cpp.o -MF CMakeFiles/frontend.dir/mem.cpp.o.d -o CMakeFiles/frontend.dir/mem.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/mem.cpp

frontend/CMakeFiles/frontend.dir/mem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/mem.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/mem.cpp > CMakeFiles/frontend.dir/mem.cpp.i

frontend/CMakeFiles/frontend.dir/mem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/mem.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/mem.cpp -o CMakeFiles/frontend.dir/mem.cpp.s

frontend/CMakeFiles/frontend.dir/rdy.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/rdy.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/rdy.cpp
frontend/CMakeFiles/frontend.dir/rdy.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object frontend/CMakeFiles/frontend.dir/rdy.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/rdy.cpp.o -MF CMakeFiles/frontend.dir/rdy.cpp.o.d -o CMakeFiles/frontend.dir/rdy.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/rdy.cpp

frontend/CMakeFiles/frontend.dir/rdy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/rdy.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/rdy.cpp > CMakeFiles/frontend.dir/rdy.cpp.i

frontend/CMakeFiles/frontend.dir/rdy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/rdy.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/rdy.cpp -o CMakeFiles/frontend.dir/rdy.cpp.s

frontend/CMakeFiles/frontend.dir/swp.cpp.o: frontend/CMakeFiles/frontend.dir/flags.make
frontend/CMakeFiles/frontend.dir/swp.cpp.o: /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/swp.cpp
frontend/CMakeFiles/frontend.dir/swp.cpp.o: frontend/CMakeFiles/frontend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object frontend/CMakeFiles/frontend.dir/swp.cpp.o"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT frontend/CMakeFiles/frontend.dir/swp.cpp.o -MF CMakeFiles/frontend.dir/swp.cpp.o.d -o CMakeFiles/frontend.dir/swp.cpp.o -c /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/swp.cpp

frontend/CMakeFiles/frontend.dir/swp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/frontend.dir/swp.cpp.i"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/swp.cpp > CMakeFiles/frontend.dir/swp.cpp.i

frontend/CMakeFiles/frontend.dir/swp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/frontend.dir/swp.cpp.s"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/filipino/Desktop/somm24nm-fso-g02/src/frontend/swp.cpp -o CMakeFiles/frontend.dir/swp.cpp.s

# Object files for target frontend
frontend_OBJECTS = \
"CMakeFiles/frontend.dir/sim.cpp.o" \
"CMakeFiles/frontend.dir/jdt.cpp.o" \
"CMakeFiles/frontend.dir/pct.cpp.o" \
"CMakeFiles/frontend.dir/mem.cpp.o" \
"CMakeFiles/frontend.dir/rdy.cpp.o" \
"CMakeFiles/frontend.dir/swp.cpp.o"

# External object files for target frontend
frontend_EXTERNAL_OBJECTS =

/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/sim.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/jdt.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/pct.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/mem.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/rdy.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/swp.cpp.o
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/build.make
/home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a: frontend/CMakeFiles/frontend.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/filipino/Desktop/somm24nm-fso-g02/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX static library /home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a"
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && $(CMAKE_COMMAND) -P CMakeFiles/frontend.dir/cmake_clean_target.cmake
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/frontend.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
frontend/CMakeFiles/frontend.dir/build: /home/filipino/Desktop/somm24nm-fso-g02/lib/libfrontend.a
.PHONY : frontend/CMakeFiles/frontend.dir/build

frontend/CMakeFiles/frontend.dir/clean:
	cd /home/filipino/Desktop/somm24nm-fso-g02/build/frontend && $(CMAKE_COMMAND) -P CMakeFiles/frontend.dir/cmake_clean.cmake
.PHONY : frontend/CMakeFiles/frontend.dir/clean

frontend/CMakeFiles/frontend.dir/depend:
	cd /home/filipino/Desktop/somm24nm-fso-g02/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/filipino/Desktop/somm24nm-fso-g02/src /home/filipino/Desktop/somm24nm-fso-g02/src/frontend /home/filipino/Desktop/somm24nm-fso-g02/build /home/filipino/Desktop/somm24nm-fso-g02/build/frontend /home/filipino/Desktop/somm24nm-fso-g02/build/frontend/CMakeFiles/frontend.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : frontend/CMakeFiles/frontend.dir/depend

