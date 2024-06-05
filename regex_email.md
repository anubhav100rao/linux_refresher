To eliminate email addresses from an HTML file using regular expressions (RegEx), you can use a pattern that matches typical email addresses and replace them with an empty string. Here's how you can do it using Python:

### Step-by-Step Solution

1. **Read the HTML File:**

    - Read the content of the HTML file into a string.

2. **Define the Email RegEx Pattern:**

    - Use a RegEx pattern to match email addresses.

3. **Substitute Email Addresses:**
    - Use the `re.sub` function to replace email addresses with an empty string.

### Example Code in Python

Here's a complete example:

```python
import re

# Define the function to eliminate email addresses
def eliminate_emails(html_content):
    # Regular expression pattern to match email addresses
    email_pattern = r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'

    # Replace email addresses with an empty string
    cleaned_html = re.sub(email_pattern, '', html_content)

    return cleaned_html

# Read the HTML file
with open('example.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# Eliminate email addresses
cleaned_html = eliminate_emails(html_content)

# Write the cleaned HTML back to a file
with open('cleaned_example.html', 'w', encoding='utf-8') as file:
    file.write(cleaned_html)

print("Email addresses have been eliminated from the HTML file.")
```

### Explanation

1. **Regular Expression Pattern:**

    - The pattern `r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'` matches common email addresses.
        - `[a-zA-Z0-9._%+-]+` matches the local part of the email address.
        - `@` matches the @ symbol.
        - `[a-zA-Z0-9.-]+` matches the domain part.
        - `\.[a-zA-Z]{2,}` matches the top-level domain (e.g., `.com`, `.org`).

2. **Reading and Writing Files:**
    - The HTML content is read from `example.html` and the cleaned content is written back to `cleaned_example.html`.

### Edge Cases

-   **Hidden or Obfuscated Emails:** This pattern won't catch obfuscated or hidden email addresses (e.g., using JavaScript or encoding).
-   **Non-standard Email Formats:** Emails with uncommon formats might not be matched.

### Additional Considerations

-   **Performance:** For very large HTML files, consider processing the file in chunks to avoid high memory usage.
-   **Accuracy:** Ensure the RegEx pattern fits the specific email formats present in your HTML file.

By using this approach, you can effectively remove email addresses from your HTML content.
