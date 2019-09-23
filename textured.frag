// textured.frag
#version 330

// Some drivers require the following
precision highp float;

uniform sampler2D textureUnit0;
uniform float attConst;
uniform float attLinear;
uniform float attQuadratic;

in vec2 ex_TexCoord;
in vec4 ex_Color;
in float ex_D;

out vec4 gl_FragColor;
layout(location = 0) out vec4 out_Color;
 
void main(void) {
    
	// Fragment colour
	//out_Color = texture(textureUnit0, ex_TexCoord);
	ex_D = distance(vertexPosition,lightPosition);

	gl_FragColor = ex_Color;


	//float attenuation = attConst + attLinear
//* ex_D + attQuadratic * ex_D*ex_D;
//vec4 tmp_Color = (diffuseI +                   NEED HELP
//specularI);//attenuation does not
//affect ambient light
//vec4 litColour = ambientI+vec4(tmp_Color.rgb /
//attenuation, 1.0);

}