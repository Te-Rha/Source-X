INCLUDE("${CMAKE_CURRENT_LIST_DIR}/include/Linux-Clang_common.inc.cmake")

function (toolchain_after_project)
	MESSAGE (STATUS "Toolchain: Linux-Clang-x86.cmake.")
	#SET(CMAKE_SYSTEM_NAME	"Linux"		PARENT_SCOPE)
	SET(ARCH_BASE			"x86"		CACHE INTERNAL "" FORCE) # override
	SET(ARCH_BITS			32			CACHE INTERNAL "" FORCE) # override
	SET(ARCH				"x86"		CACHE INTERNAL "" FORCE) # override
	SET(CMAKE_SYSTEM_PROCESSOR "${ARCH}" CACHE INTERNAL "" FORCE)

	toolchain_after_project_common()

	SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY	"${CMAKE_BINARY_DIR}/bin-x86"	PARENT_SCOPE)

	SET (CMAKE_C_FLAGS		"${CMAKE_C_FLAGS}   -march=i686 -m32" PARENT_SCOPE)
	SET (CMAKE_CXX_FLAGS	"${CMAKE_CXX_FLAGS} -march=i686 -m32" PARENT_SCOPE)
endfunction()


function (toolchain_exe_stuff)
	toolchain_exe_stuff_common()

	# Propagate global variables set in toolchain_exe_stuff_common to the upper scope
	#SET (CMAKE_C_FLAGS			"${CMAKE_C_FLAGS} ${C_ARCH_OPTS}"       PARENT_SCOPE)
	#SET (CMAKE_CXX_FLAGS        "${CMAKE_CXX_FLAGS} ${CXX_ARCH_OPTS}"	PARENT_SCOPE)
	#SET (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" 			PARENT_SCOPE)
endfunction()
