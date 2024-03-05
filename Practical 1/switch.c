long calculate(long a, long b, int fn) {
    int arr[3] = {1,2,3};
    fn = fn % 4;
    switch (fn) {
        case 0:
            return a + b;
        case 1:
            return a * b;
        case 2:
            return a % b;
        case 3:
            return a / b;
    }
    return 0;
}