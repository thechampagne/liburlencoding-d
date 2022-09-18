# liburlencoding-d

[![](https://img.shields.io/github/v/tag/thechampagne/liburlencoding-d?label=version)](https://github.com/thechampagne/liburlencoding-d/releases/latest) [![](https://img.shields.io/github/license/thechampagne/liburlencoding-d)](https://github.com/thechampagne/liburlencoding-d/blob/main/LICENSE)

D binding for **liburlencoding**.

### Download
[DUB](https://code.dlang.org/packages/urlencoding/)

```
dub add urlencoding
```

### API

```d
char[] encode(string data);

char[] encodeBinary(string data);

char[] decode(string data);

char[] decodeBinary(string data);

void free(char[] data);
```

### References
 - [liburlencoding](https://github.com/thechampagne/liburlencoding)

### License

This repo is released under the [MIT](https://github.com/thechampagne/liburlencoding-d/blob/main/LICENSE).
