cmake_minimum_required(VERSION 3.0)
project(main)
add_compile_options(-std=c++11) #optional to use c++11

find_package(Eigen3 REQUIRED NO_MODULE)

include_directories(include)
link_directories(${Eigen_INCLUDE_DIRS})

# file(GLOB VENDORS_SOURCES dependencies/glad/src/glad.c
#                           dependencies/stb/stb.cpp)
file(GLOB PROJECT_HEADERS include/*.hpp)
file(GLOB PROJECT_SOURCES src/*.cpp)
file(GLOB PROJECT_CONFIGS CMakeLists.txt)

source_group("Headers" FILES ${PROJECT_HEADERS})
source_group("Sources" FILES ${PROJECT_SOURCES})
# source_group("Vendors" FILES ${VENDORS_SOURCES})

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES} ${PROJECT_HEADERS}
                               ${PROJECT_CONFIGS} ${PROJECT_SHADERS}
                               ${VENDORS_SOURCES})

target_link_libraries(${PROJECT_NAME}
                      Eigen3::Eigen)