#include <stdio.h>
#include <openssl/sha.h>



// The data to be hashed
unsigned char hashFunc(char data[])
{
	size_t length = strlen(data);
	unsigned char hash[SHA_DIGEST_LENGTH];
	SHA256(data, length, hash);
	// hash now contains the 20-byte SHA-1 hash
	return hash
}

int main()
{
	char doto = "hello world";
	print(hashFunc(doto));	

}