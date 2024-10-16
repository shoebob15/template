CC = gcc

SRC_DIR = src
LIB_DIR = lib
BUILD_DIR = build

SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
LIB_FILES = $(wildcard $(LIB_DIR)/*/*.c)
OBJ_FILES = $(patsubst %.c,$(BUILD_DIR)/%.o,$(SRC_FILES)) $(patsubst %.c,$(BUILD_DIR)/%.o,$(LIB_FILES))

TARGET = $(BUILD_DIR)/project

FLAGS = -Wall -Wextra -Wpedantic -I$(SRC_DIR) -I$(LIB_DIR)/std/src

all: $(TARGET)

$(TARGET): $(OBJ_FILES)
	$(CC) -o $@ $^

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)/src/* $(TARGET)

.PHONY: all clean

