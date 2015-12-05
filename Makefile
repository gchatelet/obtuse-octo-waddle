CFLAGS=-O -std=c++0x -Wall
BUILD_DIR=build

SRC:=$(wildcard src/*.cpp)
OBJECTS:=$(patsubst %.cpp,$(BUILD_DIR)/%.o,$(notdir $(SRC)))

$(BUILD_DIR)/hash: $(OBJECTS)
	$(CXX) $(CFLAGS) -static -static-libstdc++ $^ -o $@

$(BUILD_DIR)/%.o: src/%.cpp $(INCLUDES) build_directory
	$(CXX) $(CFLAGS) $(GTEST_FLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -Rf $(BUILD_DIR)

.PHONY: build_directory
build_directory:
	mkdir -p $(BUILD_DIR)
