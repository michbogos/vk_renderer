CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

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
