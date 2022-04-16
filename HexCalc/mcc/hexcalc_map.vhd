--------------------------------------------------------
-- mcc V1.2.0404 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'mapper_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [SIZES], [NAME], [TYPE], [INSTANCE], [SIGNAL], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hexcalc_map is

-- memory block size
constant MAPPER_DATA_WIDTH: 	positive := 8;
constant MAPPER_ADDRESS_WIDTH: 	positive := 8;
constant MAPPER_ADDRESS_LAST: 	positive := 255;


type hxc_mapper_memory is array(0 to 255) of std_logic_vector(7 downto 0);

signal hxc_instructionstart: std_logic_vector(7 downto 0);

--hxc_instructionstart <= hxc_mapper(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically the 'instruction_register'



constant hxc_mapper: hxc_mapper_memory := (

-- L0239@0010. .map 0;
0 => X"10",

1 => X"06",

2 => X"06",

3 => X"06",

4 => X"06",

5 => X"06",

6 => X"06",

7 => X"06",

8 => X"06",

-- L0240@0010. .map 0x09;
9 => X"10",

10 => X"06",

11 => X"06",

12 => X"06",

-- L0247@0012. .map 0x0D;
13 => X"12",

14 => X"06",

15 => X"06",

16 => X"06",

17 => X"06",

18 => X"06",

19 => X"06",

20 => X"06",

21 => X"06",

22 => X"06",

23 => X"06",

24 => X"06",

25 => X"06",

26 => X"06",

27 => X"06",

28 => X"06",

29 => X"06",

30 => X"06",

31 => X"06",

-- L0241@0010. .map ' ';
32 => X"10",

33 => X"06",

34 => X"06",

-- L0425@0077. .map '#';
35 => X"77",

-- L0397@0060. .map '$';
36 => X"60",

37 => X"06",

38 => X"06",

39 => X"06",

40 => X"06",

41 => X"06",

-- L0367@004D. .map '*';
42 => X"4D",

-- L0309@002B. .map '+';
43 => X"2B",

44 => X"06",

-- L0321@0030. .map '-';
45 => X"30",

46 => X"06",

-- L0329@0034. .map '/';
47 => X"34",

-- L0463@0098. .map '0';
48 => X"98",

-- L0464@0098. .map '1';
49 => X"98",

-- L0465@0098. .map '2';
50 => X"98",

-- L0466@0098. .map '3';
51 => X"98",

-- L0467@0098. .map '4';
52 => X"98",

-- L0468@0098. .map '5';
53 => X"98",

-- L0469@0098. .map '6';
54 => X"98",

-- L0470@0098. .map '7';
55 => X"98",

-- L0471@0098. .map '8';
56 => X"98",

-- L0472@0098. .map '9';
57 => X"98",

58 => X"06",

59 => X"06",

-- L0285@0021. .map '<';
60 => X"21",

61 => X"06",

-- L0278@001E. .map '>';
62 => X"1E",

63 => X"06",

64 => X"06",

-- L0476@0099. .map 'A';
65 => X"99",

-- L0486@009B. .map 'B';
66 => X"9B",

-- L0482@009A. .map 'C';
67 => X"9A",

-- L0488@009B. .map 'D';
68 => X"9B",

-- L0478@0099. .map 'E';
69 => X"99",

-- L0490@009B. .map 'F';
70 => X"9B",

71 => X"06",

72 => X"06",

73 => X"06",

74 => X"06",

75 => X"06",

76 => X"06",

77 => X"06",

-- L0293@0024. .map 'N';
78 => X"24",

79 => X"06",

80 => X"06",

81 => X"06",

-- L0263@0018. .map 'R';
82 => X"18",

-- L0271@001B. .map 'S';
83 => X"1B",

84 => X"06",

-- L0255@0015. .map 'U';
85 => X"15",

86 => X"06",

87 => X"06",

88 => X"06",

89 => X"06",

-- L0300@0026. .map 'Z';
90 => X"26",

91 => X"06",

92 => X"06",

93 => X"06",

94 => X"06",

95 => X"06",

96 => X"06",

-- L0475@0099. .map 'a';
97 => X"99",

-- L0485@009B. .map 'b';
98 => X"9B",

-- L0481@009A. .map 'c';
99 => X"9A",

-- L0487@009B. .map 'd';
100 => X"9B",

-- L0477@0099. .map 'e';
101 => X"99",

-- L0489@009B. .map 'f';
102 => X"9B",

103 => X"06",

104 => X"06",

105 => X"06",

106 => X"06",

107 => X"06",

108 => X"06",

109 => X"06",

-- L0292@0024. .map 'n';
110 => X"24",

111 => X"06",

112 => X"06",

113 => X"06",

-- L0262@0018. .map 'r';
114 => X"18",

-- L0270@001B. .map 's';
115 => X"1B",

116 => X"06",

-- L0254@0015. .map 'u';
117 => X"15",

118 => X"06",

119 => X"06",

120 => X"06",

121 => X"06",

-- L0299@0026. .map 'z';
122 => X"26",

123 => X"06",

124 => X"06",

125 => X"06",

126 => X"06",

127 => X"06",

128 => X"06",

129 => X"06",

130 => X"06",

131 => X"06",

132 => X"06",

133 => X"06",

134 => X"06",

135 => X"06",

136 => X"06",

137 => X"06",

138 => X"06",

139 => X"06",

140 => X"06",

141 => X"06",

142 => X"06",

143 => X"06",

144 => X"06",

145 => X"06",

146 => X"06",

147 => X"06",

148 => X"06",

149 => X"06",

150 => X"06",

151 => X"06",

152 => X"06",

153 => X"06",

154 => X"06",

155 => X"06",

156 => X"06",

157 => X"06",

158 => X"06",

159 => X"06",

160 => X"06",

161 => X"06",

162 => X"06",

163 => X"06",

164 => X"06",

165 => X"06",

166 => X"06",

167 => X"06",

168 => X"06",

169 => X"06",

170 => X"06",

171 => X"06",

172 => X"06",

173 => X"06",

174 => X"06",

175 => X"06",

176 => X"06",

177 => X"06",

178 => X"06",

179 => X"06",

180 => X"06",

181 => X"06",

182 => X"06",

183 => X"06",

184 => X"06",

185 => X"06",

186 => X"06",

187 => X"06",

188 => X"06",

189 => X"06",

190 => X"06",

191 => X"06",

192 => X"06",

193 => X"06",

194 => X"06",

195 => X"06",

196 => X"06",

197 => X"06",

198 => X"06",

199 => X"06",

200 => X"06",

201 => X"06",

202 => X"06",

203 => X"06",

204 => X"06",

205 => X"06",

206 => X"06",

207 => X"06",

208 => X"06",

209 => X"06",

210 => X"06",

211 => X"06",

212 => X"06",

213 => X"06",

214 => X"06",

215 => X"06",

216 => X"06",

217 => X"06",

218 => X"06",

219 => X"06",

220 => X"06",

221 => X"06",

222 => X"06",

223 => X"06",

224 => X"06",

225 => X"06",

226 => X"06",

227 => X"06",

228 => X"06",

229 => X"06",

230 => X"06",

231 => X"06",

232 => X"06",

233 => X"06",

234 => X"06",

235 => X"06",

236 => X"06",

237 => X"06",

238 => X"06",

239 => X"06",

240 => X"06",

241 => X"06",

242 => X"06",

243 => X"06",

244 => X"06",

245 => X"06",

246 => X"06",

247 => X"06",

248 => X"06",

249 => X"06",

250 => X"06",

251 => X"06",

252 => X"06",

253 => X"06",

254 => X"06",

255 => X"06");

end hexcalc_map;

