# conv - Currency Converter

A simple, fast, and Unix-friendly command-line currency converter that supports 200+ currencies including Bitcoin.

## Features

- 🚀 **Fast & Lightweight** - Single bash script, no heavy dependencies
- 💰 **200+ Currencies** - Support for fiat currencies and Bitcoin
- ₿ **Bitcoin Support** - Full support for Bitcoin conversions
- 🎯 **Unix Principles** - Does one thing well, clean output, composable
- 🆓 **Free API** - Uses free currency API with no rate limits
- 🔢 **Smart Precision** - Dynamic decimal places (2 for large amounts, up to 10 for small amounts)

## Installation

### Quick Install

```bash
# Download the script
curl -o conv https://raw.githubusercontent.com/yourusername/conv/main/conv
chmod +x conv

# Move to your PATH (optional)
sudo mv conv /usr/local/bin/
# OR for user installation:
mv conv ~/.local/bin/
```

### Using Make

```bash
git clone https://github.com/yourusername/conv.git
cd conv

# System-wide installation (requires sudo)
make install

# User-only installation (no sudo required)
make install-user
```

## Dependencies

The following tools must be installed:

- `curl` - for API requests
- `jq` - for JSON parsing  
- `bc` - for arbitrary precision arithmetic

### Install Dependencies

**Ubuntu/Debian:**
```bash
sudo apt install curl jq bc
```

**macOS:**
```bash
brew install curl jq bc
```

**CentOS/RHEL/Fedora:**
```bash
sudo yum install curl jq bc
# OR for newer versions:
sudo dnf install curl jq bc
```

## Usage

```bash
conv <FROM_CURRENCY> <TO_CURRENCY> <AMOUNT>
```

### Examples

```bash
# Basic fiat currency conversion
conv USD EUR 100
# Output: 85.75

# Bitcoin conversions
conv BTC USD 1
# Output: 116834.71

conv USD BTC 1000
# Output: 0.0085591

# Other currencies
conv EUR GBP 50
# Output: 43.38

conv JPY USD 10000
# Output: 67.12

# Case insensitive
conv usd eur 100
```

### Help and Version

```bash
conv --help     # Show detailed usage information
conv -h         # Show help

conv --version  # Show version
conv -v         # Show version
```

## Supported Currencies

The converter supports 200+ currencies including:

### Fiat Currencies
- USD, EUR, GBP, JPY, CAD, AUD, CHF, CNY, INR, KRW, and many more

### Bitcoin
- BTC (Bitcoin)

To see all supported currencies, visit the [currency list](https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies.json).

## Output Format

- **Large amounts (≥1)**: Shows 2 decimal places
  - Example: `1000.00`
- **Small amounts (<1)**: Shows up to 10 decimal places with trailing zeros removed
  - Example: `0.0085591`

## API Information

This tool uses the free [fawazahmed0/currency-api](https://github.com/fawazahmed0/exchange-api):

- ✅ **No API key required**
- ✅ **No rate limits**
- ✅ **Daily updated exchange rates**
- ✅ **200+ currencies supported**
- ✅ **Reliable CDN delivery**

## Error Handling

The tool provides clear error messages for common issues:

```bash
# Invalid currency
conv XYZ USD 100
# Output: Error: Currency 'XYZ' not supported

# Invalid currency pair  
conv USD XYZ 100
# Output: Error: Currency pair USD/XYZ not supported

# Invalid amount
conv USD EUR abc
# Output: Error: Amount must be a valid number

# Missing arguments
conv USD EUR
# Output: Usage: conv <FROM CURRENCY> <TO CURRENCY> <AMOUNT>
```

## Integration Examples

### In Shell Scripts

```bash
#!/bin/bash
price=$(conv BTC USD 1)
echo "1 Bitcoin is worth $${price} USD"
```

### With Other Unix Tools

```bash
# Convert multiple amounts
echo "100 200 500" | xargs -n1 conv USD EUR

# Use in calculations
amount=$(conv USD EUR 100)
echo "With 5% fee: $(echo "$amount * 1.05" | bc)"
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Troubleshooting

### Command not found
Make sure the script is executable and in your PATH:
```bash
chmod +x conv
echo $PATH  # Check if the script location is in PATH
```

### Dependency issues
Ensure all dependencies are installed:
```bash
which curl jq bc  # Should return paths for all three
```

### Network issues
The tool requires internet access to fetch exchange rates. Check your connection if you see network-related errors.

### Precision issues
For very large numbers, you may want to use different tools. This converter is optimized for typical currency conversion amounts.

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Acknowledgments

- Currency data provided by [fawazahmed0/currency-api](https://github.com/fawazahmed0/exchange-api)
- Inspired by Unix philosophy of simple, composable tools
