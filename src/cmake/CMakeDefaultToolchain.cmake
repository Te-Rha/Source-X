MESSAGE (STATUS "Toolchain not specified. Detecting the one to use.")
IF (MSVC)
	INCLUDE ("src/cmake/toolchains/Windows-MSVC.cmake")
ELSE (MSVC)
	IF (APPLE)
			MESSAGE (STATUS "Defaulting to x86_64 arch.")
			INCLUDE ("src/cmake/toolchains/OSX-x86_64.cmake")
	ELSEIF (UNIX)
		IF (NOT ARCH_HAS_x86_64 EQUAL -1)
			INCLUDE ("src/cmake/toolchains/Linux-GNU-x86_64.cmake")
		ELSEIF (NOT ARCH_HAS_x86 EQUAL -1)
			INCLUDE ("src/cmake/toolchains/Linux-GNU-x86.cmake")
		ELSE ()
			MESSAGE (STATUS "Unsupported architecture, defaulting to native.")
			INCLUDE ("src/cmake/toolchains/Linux-GNU-native.cmake")
		ENDIF ()
	ELSE ()
		IF (NOT ARCH_HAS_x86_64 EQUAL -1)
			INCLUDE ("src/cmake/toolchains/Windows-GNU-x86_64.cmake")
		ELSEIF (NOT ARCH_HAS_x86 EQUAL -1)
			INCLUDE ("src/cmake/toolchains/Windows-GNU-x86.cmake")
		ELSE ()
			MESSAGE (STATUS "Unsupported architecture, defaulting to native.")
			INCLUDE ("src/cmake/toolchains/Windows-GNU-native.cmake")
		ENDIF ()
	ENDIF ()
ENDIF (MSVC)