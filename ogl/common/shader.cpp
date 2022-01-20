#include <stdio.h>
#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;

#include <stdlib.h>
#include <string.h>

#include <GL/glew.h>

#include "shader.hpp"

std::string loadCode(const char* path, bool required) {
    std::string result;
    std::ifstream istream(path, std::ios::in);
    if (istream.is_open()) {
        std::string Line = "";
        while(getline(istream, Line))
            result += "\n" + Line;
        istream.close();
    }else if (required) {
        printf("Impossible to open %s. Are you in the right directory ? Don't forget to read the FAQ !\n", path);
        getchar();
        char message[256];
        sprintf(message, "Failed to load shader code %s", path);
        throw std::runtime_error(message);
    }
    
    return result;
}

void checkShader(GLuint id)
{
    GLint Result = GL_FALSE;
    int InfoLogLength;

    glGetShaderiv(id, GL_COMPILE_STATUS, &Result);
    glGetShaderiv(id, GL_INFO_LOG_LENGTH, &InfoLogLength);
    
    if ( InfoLogLength > 0 ){
        std::vector<char> errorMessage(InfoLogLength+1);
        glGetShaderInfoLog(id, InfoLogLength, NULL, &errorMessage[0]);
        printf("%s\n", &errorMessage[0]);
    }
}


GLuint loadShaderId(GLuint id, const char* path) {
    
    GLuint result = glCreateShader(id);

    printf("Compiling shader : %s\n", path);

    std::string code = loadCode(path, true);
    char const * codePointer = code.c_str();
    
    glShaderSource(result, 1, &codePointer , NULL);
    glCompileShader(result);

    checkShader(result);
    
    return result;
}

void checkProgram(GLuint id) {
    GLint Result = GL_FALSE;
    int InfoLogLength;
    
    glGetProgramiv(id, GL_LINK_STATUS, &Result);
    glGetProgramiv(id, GL_INFO_LOG_LENGTH, &InfoLogLength);
    
    if ( InfoLogLength > 0 ){
        std::vector<char> errorMessage(InfoLogLength+1);
        glGetProgramInfoLog(id, InfoLogLength, NULL, &errorMessage[0]);
        printf("%s\n", &errorMessage[0]);
    }
}

GLuint LoadShaders(const char * vertex_file_path,const char * fragment_file_path){

    printf("Linking program\n");
    GLuint programId = glCreateProgram();

    GLuint VertexShaderID = loadShaderId(GL_VERTEX_SHADER, vertex_file_path);
    glAttachShader(programId, VertexShaderID);

    GLuint FragmentShaderID = loadShaderId(GL_FRAGMENT_SHADER, fragment_file_path);
    glAttachShader(programId, FragmentShaderID);

    glLinkProgram(programId);
    
    checkProgram(programId);

    glDetachShader(programId, VertexShaderID);
    glDeleteShader(VertexShaderID);

    glDetachShader(programId, FragmentShaderID);
    glDeleteShader(FragmentShaderID);

    return programId;
}


