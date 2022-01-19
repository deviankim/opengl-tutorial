
#include <stdexcept>
#include <stdio.h>
#include <stdlib.h>
#include <GL/glew.h>
#include <glfw3.h>

#include <glm/glm.hpp>

using namespace glm;

GLFWwindow* window;

static int initializeGlfw() {
    if (!glfwInit()) {
        throw std::runtime_error("Failed to initialize GLFW!");
    }
    
    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
}

int main() {
    
    initializeGlfw();

    
    window = glfwCreateWindow(800, 800, "나 안죽음", NULL, NULL);
    
    if (window == NULL) {
        glfwTerminate();
        throw std::runtime_error("Failed to open window. 니 3.3 호환 되는거 맞나?");
    }
    
    glfwMakeContextCurrent(window);
    glewExperimental = true;
    
    if (glewInit() != GLEW_OK) {
        throw std::runtime_error("Failed to initialize GLEW.");
    }
    
    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);
    
    while (true) {
        if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS) {
            fprintf(stdout, "ESC key!\n");
            break;
        }
        
        if (glfwWindowShouldClose(window) != 0) {
            fprintf(stdout, "Window closed!\n");
            break;
        }
        
        glClear(GL_COLOR_BUFFER_BIT);
        
        glfwSwapBuffers(window);
        glfwPollEvents();
        
    }

    
}

