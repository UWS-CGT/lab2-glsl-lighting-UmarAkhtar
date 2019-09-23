// textured.vert
// use textures, but no lighting
#version 330

uniform mat4 modelview;
uniform mat4 projection;
lightStruct light;
materialStruct material;

in  vec3 in_Position;
in vec3 in_Normal;
//in  vec3 in_Colour; // colour not used with lighting
//in  vec3 in_Normal;
//out vec4 ex_Color;

in vec2 in_TexCoord;
out vec2 ex_TexCoord;
out vec4 ex_Color;
out float ex_Dist;
// multiply each vertex position by the MVP matrix
void main(void) {

	// vertex into eye coordinates
	vec4 vertexPosition = modelview * vec4(in_Position,1.0);
    gl_Position = projection * vertexPosition;

	// Find V - in eye coordinates, eye is at (0,0,0)
    vec3 V = normalize(-vertexPosition.xyz);
    // Vertex normal in eye coordinates
    mat3 normalmatrix = transpose(inverse(mat3(modelview)));
    vec3 screenNormal = normalize(normalmatrix * in_Normal);

    // Ambient intensity
    vec4 ambientI = light.ambient * material.ambient;
    // L - to light source from vertex
    vec3 L = normalize(light.position.xyz – vertexPosition.xyz);
    
    // Diffuse intensity
    vec4 diffuseI = light.diffuse * material.diffuse * max(dot(screenNormal,L),0);
    
    // Specular intensity
     // Calculate R - reflection of light
    vec3 R = normalize(-reflect(L,screenNormal));
    vec4 specularI = light.specular * material.specular;
    specularI = specularI * pow(max(dot(R,V),0), material.shininess);
    ex_Colour = ambientI + diffuseI + specularI;

	ex_TexCoord = in_TexCoord;
}