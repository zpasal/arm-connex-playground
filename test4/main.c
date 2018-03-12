static int arr[] = { 1, 10, 4, 5, 6, 7 };
static int sum;
static const int n = sizeof(arr) / sizeof(arr[0]);

volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;

void print_uart0(const char *s) {
	while(*s != '\0') { /* Loop until end of string */
 		*UART0DR = (unsigned int)(*s); /* Transmit char */
 		s++; /* Next char */
 	}
}


int main() {
    for (int i = 0; i < n; i++) {
        sum += arr[i];
    }
    print_uart0("Hello");
}