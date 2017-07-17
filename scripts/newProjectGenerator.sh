#!/bin/bash

PROJECT_NAME=$1
SRC_DIR="./src"
TESTS_DIR="./tests"
BUILD_DIR="./build"

mkdir "./"$PROJECT_NAME

cd "./"$PROJECT_NAME

mkdir $SRC_DIR $TESTS_DIR $BUILD_DIR
git init

touch CMakeLists.txt $SRC_DIR/CMakeLists.txt $TESTS_DIR/CMakeLists.txt $SRC_DIR/main.cpp $TESTS_DIR/main.cpp $SRC_DIR/$PROJECT_NAME.cpp $SRC_DIR/$PROJECT_NAME.hpp $TESTS_DIR/$PROJECT_NAME'Tests.hpp'

#MAIN CMAKELIST
echo "project($PROJECT_NAME)
cmake_minimum_required(VERSION 2.8)
aux_source_directory(. SRC_LIST)

if (\"\${CMAKE_CXX_COMPILER_ID}\" STREQUAL \"Clang\")
    add_definitions(-std=c++1z)
elseif (\"\${CMAKE_CXX_COMPILER_ID}\" STREQUAL \"MSVC\")
    add_definitions(-D_SCL_SECURE_NO_WARNINGS)
elseif (\"\${CMAKE_CXX_COMPILER_ID}\" STREQUAL \"GNU\")
    SET(CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -Wall -Wextra -g -std=c++1z -O3\")
endif()

add_subdirectory(src)
include_directories(\${CMAKE_CURRENT_SOURCE_DIR}/src)

add_subdirectory(tests)" > CMakeLists.txt

#SCR CMAKELIST

echo "cmake_minimum_required(VERSION 2.8)

project($PROJECT_NAME)

set(SRC
    main.cpp
    $PROJECT_NAME.cpp
    )

set(HDR
    $PROJECT_NAME.hpp
    )
add_library(\${PROJECT_NAME}-lib \${HDR} \${SRC})

add_executable(\${PROJECT_NAME} main.cpp)

target_link_libraries(\${PROJECT_NAME} \${PROJECT_NAME}-lib)" > $SRC_DIR/CMakeLists.txt

#TEST CMAKELIST
TEST_NAME=$PROJECT_NAME"Tests.hpp"
UT="Ut"
echo "cmake_minimum_required(VERSION 2.8)

project($PROJECT_NAME$UT)

set(SRC
    main.cpp
    )

set(HDR
    $TEST_NAME
    )

link_libraries(gtest)

add_executable(\${PROJECT_NAME} \${SRC} \${HDR})
target_link_libraries(\${PROJECT_NAME} $PROJECT_NAME-lib pthread)" > $TESTS_DIR/CMakeLists.txt

# SRC MAIN
echo "int main()
{
    return 0;
}" > $SRC_DIR/main.cpp

# TEST MAIN
echo "#include <gtest/gtest.h>

#include \"$TEST_NAME\"

int main(int argc, char** argv)
{
    try
    {
        testing::InitGoogleTest(&argc, argv);
        return RUN_ALL_TESTS();
    }
    catch(...)
    {
        return 0;
    }
    return 0;
}" > $TESTS_DIR/main.cpp

echo "class $PROJECT_NAME
{
};" > $SRC_DIR/$PROJECT_NAME.hpp

echo "#include \"$PROJECT_NAME.hpp\"" > $SRC_DIR/$PROJECT_NAME.cpp

SHOULD="Should"
echo "#include <memory>
#include <gtest/gtest.h>
#include \"../src/$PROJECT_NAME.hpp\"

class $PROJECT_NAME$SHOULD : public testing::Test
{
public:
    $PROJECT_NAME$SHOULD()
    {
        sut_ = std::make_shared<$PROJECT_NAME>();
    }

protected:
    std::shared_ptr<$PROJECT_NAME> sut_;
};" > $TESTS_DIR/$PROJECT_NAME'Tests.hpp'

cd $BUILD_DIR

cmake ..
make -j

cd ../
git add $SRC_DIR $TESTS_DIR CMakeLists.txt
git ci -am \'init\'

touch .gitignore

echo '.gitignore
build/
' > .gitignore
