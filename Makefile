# Variables
CC = gcc
CFLAGS = -Wall -Wextra -O2
TARGET = tsukifetch
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
PREFIX = /usr/local

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# Compile the source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Install the executable
install: $(TARGET)
	install -d $(PREFIX)/bin
	install $(TARGET) $(PREFIX)/bin

# Clean the build artifacts
clean:
	rm -f $(OBJ) $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)

# Phony targets
.PHONY: all clean run install
