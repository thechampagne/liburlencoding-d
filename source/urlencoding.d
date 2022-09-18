/*
 * Copyright (c) 2022 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
module urlencoding;

import std.string;

extern (C) char* url_encoding_encode(const(char)* data);

extern (C) char* url_encoding_encode_binary(const(char)* data, size_t length);

extern (C) char* url_encoding_decode(const(char)* data);

extern (C) char* url_encoding_decode_binary(const(char)* data, size_t length);

extern (C) void url_encoding_free(char* ptr);

/*
* Percent-encodes every byte except alphanumerics and -, _, ., ~. Assumes UTF-8 encoding.
* 
* Example:
* * *
* int main()
* {
*     char[] res = encode("This string will be URL encoded.");
*     writeln(res);
*     free(res);
*     return 0;
* }
* * *
* 
* @param data
* @return char[]
*/
char[] encode(string data)
{
	auto res = url_encoding_encode(data.toStringz());
	if (res == null)
	{
		return null;
	}
	return fromStringz(res);
}

/*
* Percent-encodes every byte except alphanumerics and -, _, ., ~.
* 
* Example:
* * *
* int main()
* {
*     char[] res = encodeBinary("This string will be URL encoded.");
*     writeln(res);
*     free(res);
*     return 0;
* }
* * *
* 
* @param data
* @return char[]
*/
char[] encodeBinary(string data)
{
	auto res = url_encoding_encode_binary(data.toStringz(), data.length);
	if (res == null)
	{
		return null;
	}
	return fromStringz(res);
}

/*
* Decode percent-encoded string assuming UTF-8 encoding.
* 
* Example:
* * *
* int main()
* {
*     char[] res = decode("%F0%9F%91%BE%20Exterminate%21");
*     writeln(res);
*     free(res);
*     return 0;
* }
* * *
* 
* @param data
* @return char[]
*/
char[] decode(string data)
{
	auto res = url_encoding_decode(data.toStringz());
	if (res == null)
	{
		return null;
	}
	return fromStringz(res);
}

/*
* Decode percent-encoded string as binary data, in any encoding.
* 
* Example:
* * *
* int main()
* {
*     char[] res = decodeBinary("%F1%F2%F3%C0%C1%C2");
*     writeln(res);
*     free(res);
*     return 0;
* }
* * *
* 
* @param data
* @return char[]
*/
char[] decodeBinary(string data)
{
	auto res = url_encoding_decode_binary(data.toStringz(), data.length);
	if (res == null)
	{
		return null;
	}
	return fromStringz(res);
}

/*
* function to free the memory after using urlencoding functions
*
* @data ptr string returned from urlencoding functions
*/
void free(char[] data)
{
	url_encoding_free(data.ptr);
}