# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/pjd-vm/Documents/CLion-2020.1/clion-2020.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/pjd-vm/Documents/CLion-2020.1/clion-2020.1/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pjd-vm/Betriebssysteme/Aufgabe7

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Aufgabe6.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Aufgabe6.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Aufgabe6.dir/flags.make

CMakeFiles/Aufgabe6.dir/main.c.o: CMakeFiles/Aufgabe6.dir/flags.make
CMakeFiles/Aufgabe6.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Aufgabe6.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Aufgabe6.dir/main.c.o   -c /home/pjd-vm/Betriebssysteme/Aufgabe7/main.c

CMakeFiles/Aufgabe6.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Aufgabe6.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pjd-vm/Betriebssysteme/Aufgabe7/main.c > CMakeFiles/Aufgabe6.dir/main.c.i

CMakeFiles/Aufgabe6.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Aufgabe6.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pjd-vm/Betriebssysteme/Aufgabe7/main.c -o CMakeFiles/Aufgabe6.dir/main.c.s

# Object files for target Aufgabe6
Aufgabe6_OBJECTS = \
"CMakeFiles/Aufgabe6.dir/main.c.o"

# External object files for target Aufgabe6
Aufgabe6_EXTERNAL_OBJECTS =

Aufgabe6: CMakeFiles/Aufgabe6.dir/main.c.o
Aufgabe6: CMakeFiles/Aufgabe6.dir/build.make
Aufgabe6: CMakeFiles/Aufgabe6.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable Aufgabe6"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Aufgabe6.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Aufgabe6.dir/build: Aufgabe6

.PHONY : CMakeFiles/Aufgabe6.dir/build

CMakeFiles/Aufgabe6.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Aufgabe6.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Aufgabe6.dir/clean

CMakeFiles/Aufgabe6.dir/depend:
	cd /home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pjd-vm/Betriebssysteme/Aufgabe7 /home/pjd-vm/Betriebssysteme/Aufgabe7 /home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug /home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug /home/pjd-vm/Betriebssysteme/Aufgabe7/cmake-build-debug/CMakeFiles/Aufgabe6.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Aufgabe6.dir/depend

