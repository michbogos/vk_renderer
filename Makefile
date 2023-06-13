CFLAGS = -std=c++17 -O3
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

STB_INCLUDE_PATH = .stb_image.h

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS) -I $(STB_INCLUDE_PATH)

Shaders: shaders/shader.frag shaders/shader.vert
	glslc shaders/shader.frag -o shaders/frag.spv
	glslc shaders/shader.vert -o shaders/vert.spv

.PHONY: test clean

test: VulkanTest Shaders
	./VulkanTest > log.txt

clean:
	rm -f VulkanTest
	rm shaders/frag.spv
	rm shaders/vert.spv
