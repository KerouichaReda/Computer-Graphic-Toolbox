function n = noise(x, y, z)
% noise(x, y, z) generates (I believe) 3 dimensional noise. To use, iterate
% through your array and generate each value with a call this function.
% Note that it is very slow.
%
% Based Ken Perlin's "Improved Noise" in 2001, or 2002, or something.

% The unit cube which contains this point
uX = mod(floor(x), 256);
uY = mod(floor(y), 256);
uZ = mod(floor(z), 256);

% Find relative x, y, z of point in cube
x =x- floor(x);
y =y- floor(y);
z =z- floor(z);

% The mysterious "fade" function
fade = @(t) t * t * t * (t * (t * 6 - 15) + 10);

% Compute fade curved for each of x, y, z
u = fade(x);
v = fade(y);
w = fade(z);

% Hash coordinates of the 8 cube corners
p_half = [151 160 137 91 90 15 ...
   131 13 201 95 96 53 194 233 7 225 140 36 103 30 69 142 8 99 37 240 21 10 23 ...
   190  6 148 247 120 234 75 0 26 197 62 94 252 219 203 117 35 11 32 57 177 33 ...
   88 237 149 56 87 174 20 125 136 171 168  68 175 74 165 71 134 139 48 27 166 ...
   77 146 158 231 83 111 229 122 60 211 133 230 220 105 92 41 55 46 245 40 244 ...
   102 143 54  65 25 63 161  1 216 80 73 209 76 132 187 208  89 18 169 200 196 ...
   135 130 116 188 159 86 164 100 109 198 173 186  3 64 52 217 226 250 124 123 ...
   5 202 38 147 118 126 255 82 85 212 207 206 59 227 47 16 58 17 182 189 28 42 ...
   223 183 170 213 119 248 152  2 44 154 163  70 221 153 101 155 167  43 172 9 ...
   129 22 39 253  19 98 108 110 79 113 224 232 178 185  112 104 218 246 97 228 ...
   251 34 242 193 238 210 144 12 191 179 162 241  81 51 145 235 249 14 239 107 ...
   49 192 214  31 181 199 106 157 184  84 204 176 115 121 50 45 127  4 150 254 ...
   138 236 205 93 222 114 67 29 24 72 243 141 128 195 78 66 215 61 156 180];
p = [p_half, p_half];

a = p(1+uX) + uY;
aa = p(1+a) + uZ;
ab = p(1+a + 1) + uZ;

b = p(1+uX + 1) + uY;
ba = p(1+b) + uZ;
bb = p(1+b + 1) + uZ;

% "Lerp" is a shorter, more confusing name for "linear interpolation"
lerp = @(t, a, b) a + t * (b - a);



% And add blended results from 8 corners of cube
n = lerp(w, lerp(v, lerp(u, grad(p(1+aa), x, y, z), ...
    grad(p(1+ba), x - 1, y, z)), ...
    lerp(u, grad(p(1+ab), x, y - 1, z), ...
    grad(p(1+bb), x - 1, y - 1, z))), ...
    lerp(v, lerp(u, grad(p(1+aa + 1), x, y, z - 1), ...
    grad(p(1+ba + 1), x - 1, y, z - 1)), ...
    lerp(u, grad(p(1+ab + 1), x, y - 1, z - 1), ...
    grad(p(1+bb + 1), x - 1, y - 1, z - 1))));
end
% This is how he gets the gradient
    function g = grad(hash, x, y, z)
        %Convert the low 4 bits of hash code into 12 gradient directions
        h = mod(hash, 16);

        % 50% chance for u to be on x or y
        if h < 8
            u_comp = x;
        else
            u_comp = y;
        end

        % 50% chance to reverse either component
        if mod(h, 2) == 0
            u_comp = -u_comp;
        end

        % 12.5% chance for v to be on x, 25% chance to be on y, 62.5% chance for z
        if (h == 12 || h == 14)
            v_comp = x;
        elseif (h < 4)
            v_comp = y;
        else
            v_comp = z;
        end

        % 50% chance to reverse either component
        if mod(h/2, 2) == 0
            v_comp = -v_comp;
        end

        g = u_comp + v_comp;
    end
