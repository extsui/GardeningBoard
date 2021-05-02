TARGET = PumpTest.exe
SRC = ../Pump/PumpUtil.cpp ../Pump/PumpScript.cpp PumpTest.cpp
DEF = -DBUILD_CONFIG_PC

all:
	g++ $(SRC) $(DEF) -lgtest -lpthread -o $(TARGET)

run:
	./PumpTest.exe
