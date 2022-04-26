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

-- L0248@0011. .map 0;
0 => X"11",

1 => X"07",

2 => X"07",

3 => X"07",

4 => X"07",

5 => X"07",

6 => X"07",

7 => X"07",

8 => X"07",

-- L0249@0011. .map 0x09;
9 => X"11",

10 => X"07",

11 => X"07",

12 => X"07",

-- L0255@0012. .map 0x0D;
13 => X"12",

14 => X"07",

15 => X"07",

16 => X"07",

17 => X"07",

18 => X"07",

19 => X"07",

20 => X"07",

21 => X"07",

22 => X"07",

23 => X"07",

24 => X"07",

25 => X"07",

26 => X"07",

27 => X"07",

28 => X"07",

29 => X"07",

30 => X"07",

31 => X"07",

-- L0250@0011. .map ' ';
32 => X"11",

33 => X"07",

34 => X"07",

-- L0417@0069. .map '#';
35 => X"69",

-- L0392@0055. .map '$';
36 => X"55",

37 => X"07",

38 => X"07",

39 => X"07",

40 => X"07",

41 => X"07",

-- L0363@0043. .map '*';
42 => X"43",

-- L0340@003A. .map '+';
43 => X"3A",

44 => X"07",

-- L0350@003E. .map '-';
45 => X"3E",

46 => X"07",

-- L0357@0041. .map '/';
47 => X"41",

-- L0451@0086. .map '0';
48 => X"86",

-- L0452@0086. .map '1';
49 => X"86",

-- L0453@0086. .map '2';
50 => X"86",

-- L0454@0086. .map '3';
51 => X"86",

-- L0455@0086. .map '4';
52 => X"86",

-- L0456@0086. .map '5';
53 => X"86",

-- L0457@0086. .map '6';
54 => X"86",

-- L0458@0086. .map '7';
55 => X"86",

-- L0459@0086. .map '8';
56 => X"86",

-- L0460@0086. .map '9';
57 => X"86",

58 => X"07",

59 => X"07",

-- L0288@001C. .map '<';
60 => X"1C",

61 => X"07",

-- L0282@001A. .map '>';
62 => X"1A",

63 => X"07",

64 => X"07",

-- L0464@0087. .map 'A';
65 => X"87",

-- L0474@0089. .map 'B';
66 => X"89",

-- L0470@0088. .map 'C';
67 => X"88",

-- L0476@0089. .map 'D';
68 => X"89",

-- L0466@0087. .map 'E';
69 => X"87",

-- L0478@0089. .map 'F';
70 => X"89",

71 => X"07",

72 => X"07",

73 => X"07",

74 => X"07",

75 => X"07",

76 => X"07",

77 => X"07",

-- L0326@0035. .map 'N';
78 => X"35",

79 => X"07",

80 => X"07",

-- L0295@001E. .map 'Q';
81 => X"1E",

-- L0269@0016. .map 'R';
82 => X"16",

-- L0276@0018. .map 'S';
83 => X"18",

84 => X"07",

-- L0262@0014. .map 'U';
85 => X"14",

86 => X"07",

87 => X"07",

88 => X"07",

89 => X"07",

-- L0332@0036. .map 'Z';
90 => X"36",

91 => X"07",

92 => X"07",

93 => X"07",

94 => X"07",

95 => X"07",

96 => X"07",

-- L0463@0087. .map 'a';
97 => X"87",

-- L0473@0089. .map 'b';
98 => X"89",

-- L0469@0088. .map 'c';
99 => X"88",

-- L0475@0089. .map 'd';
100 => X"89",

-- L0465@0087. .map 'e';
101 => X"87",

-- L0477@0089. .map 'f';
102 => X"89",

103 => X"07",

104 => X"07",

105 => X"07",

106 => X"07",

107 => X"07",

108 => X"07",

109 => X"07",

-- L0325@0035. .map 'n';
110 => X"35",

111 => X"07",

112 => X"07",

-- L0294@001E. .map 'q';
113 => X"1E",

-- L0268@0016. .map 'r';
114 => X"16",

-- L0275@0018. .map 's';
115 => X"18",

116 => X"07",

-- L0261@0014. .map 'u';
117 => X"14",

118 => X"07",

119 => X"07",

120 => X"07",

121 => X"07",

-- L0331@0036. .map 'z';
122 => X"36",

123 => X"07",

124 => X"07",

125 => X"07",

126 => X"07",

127 => X"07",

128 => X"07",

129 => X"07",

130 => X"07",

131 => X"07",

132 => X"07",

133 => X"07",

134 => X"07",

135 => X"07",

136 => X"07",

137 => X"07",

138 => X"07",

139 => X"07",

140 => X"07",

141 => X"07",

142 => X"07",

143 => X"07",

144 => X"07",

145 => X"07",

146 => X"07",

147 => X"07",

148 => X"07",

149 => X"07",

150 => X"07",

151 => X"07",

152 => X"07",

153 => X"07",

154 => X"07",

155 => X"07",

156 => X"07",

157 => X"07",

158 => X"07",

159 => X"07",

160 => X"07",

161 => X"07",

162 => X"07",

163 => X"07",

164 => X"07",

165 => X"07",

166 => X"07",

167 => X"07",

168 => X"07",

169 => X"07",

170 => X"07",

171 => X"07",

172 => X"07",

173 => X"07",

174 => X"07",

175 => X"07",

176 => X"07",

177 => X"07",

178 => X"07",

179 => X"07",

180 => X"07",

181 => X"07",

182 => X"07",

183 => X"07",

184 => X"07",

185 => X"07",

186 => X"07",

187 => X"07",

188 => X"07",

189 => X"07",

190 => X"07",

191 => X"07",

192 => X"07",

193 => X"07",

194 => X"07",

195 => X"07",

196 => X"07",

197 => X"07",

198 => X"07",

199 => X"07",

200 => X"07",

201 => X"07",

202 => X"07",

203 => X"07",

204 => X"07",

205 => X"07",

206 => X"07",

207 => X"07",

208 => X"07",

209 => X"07",

210 => X"07",

211 => X"07",

212 => X"07",

213 => X"07",

214 => X"07",

215 => X"07",

216 => X"07",

217 => X"07",

218 => X"07",

219 => X"07",

220 => X"07",

221 => X"07",

222 => X"07",

223 => X"07",

224 => X"07",

225 => X"07",

226 => X"07",

227 => X"07",

228 => X"07",

229 => X"07",

230 => X"07",

231 => X"07",

232 => X"07",

233 => X"07",

234 => X"07",

235 => X"07",

236 => X"07",

237 => X"07",

238 => X"07",

239 => X"07",

240 => X"07",

241 => X"07",

242 => X"07",

243 => X"07",

244 => X"07",

245 => X"07",

246 => X"07",

247 => X"07",

248 => X"07",

249 => X"07",

250 => X"07",

251 => X"07",

252 => X"07",

253 => X"07",

254 => X"07",

255 => X"07");

end hexcalc_map;

