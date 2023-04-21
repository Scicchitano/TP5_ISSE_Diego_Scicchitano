SRC_DIR = ./src
INC_DIR = ./inc
OUT_DIR = ./build
OBJ_DIR = $(OUT_DIR)/obj

SRC_FILES = $(wildcard $(SRC_DIR)/*.c) 
$(info $(SRC_FILES))

OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
$(info $(OBJ_FILES))

.DEFAULT_GOAL := all

-include $(patsubst %.o,%.d,$(OBJ_FILES))
all: $(OBJ_FILES)
	@echo Enlazando $@ 
	@gcc $(OBJ_FILES) -o $(OBJ_DIR)/app.out

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	@echo Compilando $< 
	@mkdir -p $(OBJ_DIR)
	@gcc -o $@ -c $< -I$(INC_DIR) -MMD

$(OBJ_DIR): $(OUT_DIR)
	mkdir -p $@

$(OUT_DIR):
	mkdir -p $@

clean:
	rm -r $(OUT_DIR)
# SRC_FILES = ./source/main.c ./source/bar.c ./source/bar.c
#OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))
# OBJ_FILES = $(patsubst ./source/%.c, ./build/%.o, $(SRC_FILES))
# OBJ_FILES = ./build/main.o ./build/bar.o ./build/bar.o