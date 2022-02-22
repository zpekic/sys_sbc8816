--------------------------------------------------------
-- mcc V1.2.0208 - Custom microcode compiler (c)2020-... 
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
constant MAPPER_DATA_WIDTH: 	positive := 7;
constant MAPPER_ADDRESS_WIDTH: 	positive := 8;
constant MAPPER_ADDRESS_LAST: 	positive := 255;


type hxc_mapper_memory is array(0 to 255) of std_logic_vector(6 downto 0);

signal hxc_instructionstart: std_logic_vector(6 downto 0);

--hxc_instructionstart <= hxc_mapper(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically the 'instruction_register'



constant hxc_mapper: hxc_mapper_memory := (

-- L0226@0010. .map 0;
0 => "0010000",

1 => "0000111",

2 => "0000111",

3 => "0000111",

4 => "0000111",

5 => "0000111",

6 => "0000111",

7 => "0000111",

8 => "0000111",

-- L0227@0010. .map 0x09;
9 => "0010000",

10 => "0000111",

11 => "0000111",

12 => "0000111",

-- L0304@0037. .map 0x0D;
13 => "0110111",

14 => "0000111",

15 => "0000111",

16 => "0000111",

17 => "0000111",

18 => "0000111",

19 => "0000111",

20 => "0000111",

21 => "0000111",

22 => "0000111",

23 => "0000111",

24 => "0000111",

25 => "0000111",

26 => "0000111",

27 => "0000111",

28 => "0000111",

29 => "0000111",

30 => "0000111",

31 => "0000111",

-- L0228@0010. .map ' ';
32 => "0010000",

33 => "0000111",

34 => "0000111",

35 => "0000111",

36 => "0000111",

37 => "0000111",

38 => "0000111",

39 => "0000111",

40 => "0000111",

41 => "0000111",

-- L0269@0022. .map '*';
42 => "0100010",

-- L0254@0019. .map '+';
43 => "0011001",

44 => "0000111",

-- L0261@001D. .map '-';
45 => "0011101",

46 => "0000111",

47 => "0000111",

-- L0309@0039. .map '0';
48 => "0111001",

-- L0312@003A. .map '1';
49 => "0111010",

-- L0315@003B. .map '2';
50 => "0111011",

-- L0318@003C. .map '3';
51 => "0111100",

-- L0321@003D. .map '4';
52 => "0111101",

-- L0324@003E. .map '5';
53 => "0111110",

-- L0327@003F. .map '6';
54 => "0111111",

-- L0330@0040. .map '7';
55 => "1000000",

-- L0333@0041. .map '8';
56 => "1000001",

-- L0336@0042. .map '9';
57 => "1000010",

58 => "0000111",

59 => "0000111",

60 => "0000111",

61 => "0000111",

62 => "0000111",

63 => "0000111",

64 => "0000111",

-- L0340@0043. .map 'A';
65 => "1000011",

-- L0344@0044. .map 'B';
66 => "1000100",

-- L0348@0045. .map 'C';
67 => "1000101",

-- L0352@0046. .map 'D';
68 => "1000110",

-- L0356@0047. .map 'E';
69 => "1000111",

-- L0360@0048. .map 'F';
70 => "1001000",

71 => "0000111",

72 => "0000111",

73 => "0000111",

74 => "0000111",

75 => "0000111",

76 => "0000111",

77 => "0000111",

-- L0239@0013. .map 'N';
78 => "0010011",

79 => "0000111",

80 => "0000111",

81 => "0000111",

82 => "0000111",

-- L0233@0011. .map 'S';
83 => "0010001",

84 => "0000111",

85 => "0000111",

86 => "0000111",

87 => "0000111",

88 => "0000111",

89 => "0000111",

-- L0244@0014. .map 'Z';
90 => "0010100",

91 => "0000111",

92 => "0000111",

93 => "0000111",

94 => "0000111",

95 => "0000111",

96 => "0000111",

-- L0339@0043. .map 'a';
97 => "1000011",

-- L0343@0044. .map 'b';
98 => "1000100",

-- L0347@0045. .map 'c';
99 => "1000101",

-- L0351@0046. .map 'd';
100 => "1000110",

-- L0355@0047. .map 'e';
101 => "1000111",

-- L0359@0048. .map 'f';
102 => "1001000",

103 => "0000111",

104 => "0000111",

105 => "0000111",

106 => "0000111",

107 => "0000111",

108 => "0000111",

109 => "0000111",

-- L0238@0013. .map 'n';
110 => "0010011",

111 => "0000111",

112 => "0000111",

113 => "0000111",

114 => "0000111",

-- L0232@0011. .map 's';
115 => "0010001",

116 => "0000111",

117 => "0000111",

118 => "0000111",

119 => "0000111",

120 => "0000111",

121 => "0000111",

-- L0243@0014. .map 'z';
122 => "0010100",

123 => "0000111",

124 => "0000111",

125 => "0000111",

126 => "0000111",

127 => "0000111",

128 => "0000111",

129 => "0000111",

130 => "0000111",

131 => "0000111",

132 => "0000111",

133 => "0000111",

134 => "0000111",

135 => "0000111",

136 => "0000111",

137 => "0000111",

138 => "0000111",

139 => "0000111",

140 => "0000111",

141 => "0000111",

142 => "0000111",

143 => "0000111",

144 => "0000111",

145 => "0000111",

146 => "0000111",

147 => "0000111",

148 => "0000111",

149 => "0000111",

150 => "0000111",

151 => "0000111",

152 => "0000111",

153 => "0000111",

154 => "0000111",

155 => "0000111",

156 => "0000111",

157 => "0000111",

158 => "0000111",

159 => "0000111",

160 => "0000111",

161 => "0000111",

162 => "0000111",

163 => "0000111",

164 => "0000111",

165 => "0000111",

166 => "0000111",

167 => "0000111",

168 => "0000111",

169 => "0000111",

170 => "0000111",

171 => "0000111",

172 => "0000111",

173 => "0000111",

174 => "0000111",

175 => "0000111",

176 => "0000111",

177 => "0000111",

178 => "0000111",

179 => "0000111",

180 => "0000111",

181 => "0000111",

182 => "0000111",

183 => "0000111",

184 => "0000111",

185 => "0000111",

186 => "0000111",

187 => "0000111",

188 => "0000111",

189 => "0000111",

190 => "0000111",

191 => "0000111",

192 => "0000111",

193 => "0000111",

194 => "0000111",

195 => "0000111",

196 => "0000111",

197 => "0000111",

198 => "0000111",

199 => "0000111",

200 => "0000111",

201 => "0000111",

202 => "0000111",

203 => "0000111",

204 => "0000111",

205 => "0000111",

206 => "0000111",

207 => "0000111",

208 => "0000111",

209 => "0000111",

210 => "0000111",

211 => "0000111",

212 => "0000111",

213 => "0000111",

214 => "0000111",

215 => "0000111",

216 => "0000111",

217 => "0000111",

218 => "0000111",

219 => "0000111",

220 => "0000111",

221 => "0000111",

222 => "0000111",

223 => "0000111",

224 => "0000111",

225 => "0000111",

226 => "0000111",

227 => "0000111",

228 => "0000111",

229 => "0000111",

230 => "0000111",

231 => "0000111",

232 => "0000111",

233 => "0000111",

234 => "0000111",

235 => "0000111",

236 => "0000111",

237 => "0000111",

238 => "0000111",

239 => "0000111",

240 => "0000111",

241 => "0000111",

242 => "0000111",

243 => "0000111",

244 => "0000111",

245 => "0000111",

246 => "0000111",

247 => "0000111",

248 => "0000111",

249 => "0000111",

250 => "0000111",

251 => "0000111",

252 => "0000111",

253 => "0000111",

254 => "0000111",

255 => "0000111");

end hexcalc_map;

