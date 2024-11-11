CXX = g++
CXXFLAGS = -Wall -std=c++11
TARGET = cpp
SOURCES = main.cpp

all: $(TARGET)

$(TARGET): $(SOURCES)
$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCES)

clean:
rm -f $(TARGET)