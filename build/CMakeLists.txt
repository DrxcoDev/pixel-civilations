cmake_minimum_required(VERSION 3.10)
project(MyGame)

set(CMAKE_CXX_STANDARD 17)

find_package(SDL2 REQUIRED)

add_executable(mygame app.cpp)
target_include_directories(mygame PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(mygame PRIVATE ${SDL2_LIBRARIES})
