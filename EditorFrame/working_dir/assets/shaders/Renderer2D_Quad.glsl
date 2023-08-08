// Basic Texture Shader

#type vertex
#version 300 es
precision mediump float;
layout(location=0)in vec3 a_Position;
layout(location=1)in vec4 a_Color;
layout(location=2)in vec2 a_TexCoord;
layout(location=3)in float a_TexIndex;
layout(location=4)in float a_TilingFactor;
layout(location=5)in int a_EntityID;

layout(std140)uniform Camera
{
	mat4 u_ViewProjection;
};

struct VertexOutput
{
	vec4 Color;
	vec2 TexCoord;
	float TilingFactor;
};

out VertexOutput v_vertex;
flat out float v_TexIndex;
flat out int v_EntityID;

void main()
{
	v_vertex.Color=a_Color;
	v_vertex.TexCoord=a_TexCoord;
	v_vertex.TilingFactor=a_TilingFactor;
	v_TexIndex=a_TexIndex;
	v_EntityID=a_EntityID;
	
	gl_Position=u_ViewProjection*vec4(a_Position,1.);
}

#type fragment
#version 300 es
precision mediump float;
layout(location=0) out vec4 o_Color;
layout(location=1) out int o_EntityID;

struct VertexOutput
{
	vec4 Color;
	vec2 TexCoord;
	float TilingFactor;
};

in VertexOutput v_vertex;
flat in float v_TexIndex;
flat in int v_EntityID;


uniform sampler2D u_Textures[32];

void main()
{
	vec4 texColor=v_vertex.Color;
	
	switch(int(v_TexIndex))
	{
		case 0:texColor*=texture(u_Textures[0],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 1:texColor*=texture(u_Textures[1],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 2:texColor*=texture(u_Textures[2],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 3:texColor*=texture(u_Textures[3],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 4:texColor*=texture(u_Textures[4],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 5:texColor*=texture(u_Textures[5],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 6:texColor*=texture(u_Textures[6],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 7:texColor*=texture(u_Textures[7],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 8:texColor*=texture(u_Textures[8],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 9:texColor*=texture(u_Textures[9],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 10:texColor*=texture(u_Textures[10],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 11:texColor*=texture(u_Textures[11],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 12:texColor*=texture(u_Textures[12],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 13:texColor*=texture(u_Textures[13],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 14:texColor*=texture(u_Textures[14],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 15:texColor*=texture(u_Textures[15],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 16:texColor*=texture(u_Textures[16],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 17:texColor*=texture(u_Textures[17],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 18:texColor*=texture(u_Textures[18],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 19:texColor*=texture(u_Textures[19],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 20:texColor*=texture(u_Textures[20],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 21:texColor*=texture(u_Textures[21],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 22:texColor*=texture(u_Textures[22],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 23:texColor*=texture(u_Textures[23],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 24:texColor*=texture(u_Textures[24],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 25:texColor*=texture(u_Textures[25],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 26:texColor*=texture(u_Textures[26],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 27:texColor*=texture(u_Textures[27],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 28:texColor*=texture(u_Textures[28],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 29:texColor*=texture(u_Textures[29],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 30:texColor*=texture(u_Textures[30],v_vertex.TexCoord*v_vertex.TilingFactor);break;
		case 31:texColor*=texture(u_Textures[31],v_vertex.TexCoord*v_vertex.TilingFactor);break;
	}
	
	if(texColor.a==0.)
	discard;
	
	o_Color=texColor;
	o_EntityID=v_EntityID;
}
