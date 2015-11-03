OBJ_FILES=main.o api_robot.o

all: uoli

api_robot.o: api_robot.s api_robot.h
	