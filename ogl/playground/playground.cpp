
#include <stdexcept>
#include <stdio.h>
#include <stdlib.h>
#include <GL/glew.h>
#include <glfw3.h>

#include <glm/glm.hpp>
#include <common/shader.hpp>


using namespace glm;


void update(GLFWwindow *window);

void initializeGlfw() {
    if (!glfwInit()) {
        throw std::runtime_error("Failed to initialize GLFW!");
    }
    
    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    
    glewExperimental = true;
}

GLFWwindow* prepareWindow(int width, int height, const char* title) {
    GLFWwindow* window = glfwCreateWindow(width, height, title, NULL, NULL);
    
    if (window == NULL) {
        glfwTerminate();
        throw std::runtime_error("Failed to open window. 니 3.3 호환 되는거 맞나?");
    }

    glfwMakeContextCurrent(window);

    if (glewInit() != GLEW_OK) {
        throw std::runtime_error("Failed to initialize GLEW.");
    }
    
    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

    return window;
}

bool isExitWindow(GLFWwindow* window) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS) {
        fprintf(stdout, "ESC key!\n");
        return true;
    }
    
    if (glfwWindowShouldClose(window) != 0) {
        fprintf(stdout, "Window closed!\n");
        return true;
    }
    
    return false;
}


void initializeShaders() {
    GLuint programID = LoadShaders( "SimpleVertexShader.glsl", "SimpleFragmentShader.glsl" );
 
    glUseProgram(programID);
}


int main() {
    initializeGlfw();

    GLFWwindow* window = prepareWindow(800, 800, "Refactoring 하면서 짠다.");

    initializeShaders();
    
    while (!isExitWindow(window)) {
        update(window);
    }
    
}

void drawTriangle() {
    GLuint VertexArrayID;
    glGenVertexArrays(1, &VertexArrayID);
    glBindVertexArray(VertexArrayID);
    
    GLuint vertexbuffer;
    glGenBuffers(1, &vertexbuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    const GLfloat p = 0.3f;
    
    const GLfloat g_vertex_buffer_data[] = {
        +p, -p, +p,
        -p, +p, +p,
        -p, -p, +p,

        +p, -p, +p,
        -p, +p, +p,
        +p, +p, +p,

        +p, -p, -p,
        -p, +p, -p,
        -p, -p, -p,

        +p, -p, -p,
        -p, +p, -p,
        +p, +p, -p,

    };
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(g_vertex_buffer_data), g_vertex_buffer_data, GL_STATIC_DRAW);
    
    // 1st attribute buffer : vertices
    glEnableVertexAttribArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    glVertexAttribPointer(
       0,                  // attribute 0. No particular reason for 0, but must match the layout in the shader.
       3,                  // size
       GL_FLOAT,           // type
       GL_FALSE,           // normalized?
       0,                  // stride
       (void*)0            // array buffer offset
    );
    // Draw the triangle !
    int countVertex = sizeof(g_vertex_buffer_data)/sizeof(GLfloat);
    glDrawArrays(GL_TRIANGLES, 0, countVertex); // Starting from vertex 0; 3 vertices total -> 1 triangle
    glDisableVertexAttribArray(0);
}

void update(GLFWwindow *window) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    drawTriangle();
    
    glfwSwapBuffers(window);
    glfwPollEvents();
}
