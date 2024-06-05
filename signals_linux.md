In Linux, signals are a form of inter-process communication (IPC) that allow processes to send notifications to each other or to the kernel. Signals are used to inform a process that a particular event has occurred or to control a process's execution (e.g., to pause, resume, or terminate it).

### Common Signals and Their Uses

1. **SIGINT (Signal Interrupt)**

    - **Signal Number**: 2
    - **Default Action**: Terminate the process.
    - **Use Case**: This signal is typically sent when the user presses `Ctrl+C` in the terminal. It's used to interrupt and terminate a running process.
    - **Example**:
        ```sh
        # Run a long-running command
        sleep 1000
        # Press Ctrl+C to send SIGINT and terminate the sleep command.
        ```

2. **SIGTERM (Signal Terminate)**

    - **Signal Number**: 15
    - **Default Action**: Terminate the process.
    - **Use Case**: It is a polite way to ask a process to terminate. Unlike SIGKILL, it can be caught and handled, allowing the process to perform cleanup before exiting.
    - **Example**:
        ```sh
        # Find the process ID of the target process
        pid=$(pgrep -f "process_name")
        # Send SIGTERM to the process
        kill $pid
        ```

3. **SIGKILL (Signal Kill)**

    - **Signal Number**: 9
    - **Default Action**: Immediately terminate the process.
    - **Use Case**: This signal cannot be caught or ignored by the process, making it useful to forcefully terminate a stubborn or unresponsive process.
    - **Example**:
        ```sh
        # Find the process ID of the target process
        pid=$(pgrep -f "process_name")
        # Send SIGKILL to the process
        kill -9 $pid
        ```

4. **SIGSTOP (Signal Stop)**

    - **Signal Number**: 19 (on most systems)
    - **Default Action**: Stop (pause) the process.
    - **Use Case**: Suspends a process, which can be resumed later with SIGCONT. This signal cannot be caught or ignored.
    - **Example**:
        ```sh
        # Find the process ID of the target process
        pid=$(pgrep -f "process_name")
        # Send SIGSTOP to the process
        kill -s SIGSTOP $pid
        ```

5. **SIGCONT (Signal Continue)**

    - **Signal Number**: 18 (on most systems)
    - **Default Action**: Continue a stopped process.
    - **Use Case**: Resumes a process that has been stopped with SIGSTOP or SIGTSTP.
    - **Example**:
        ```sh
        # Send SIGCONT to the process
        kill -s SIGCONT $pid
        ```

6. **SIGHUP (Signal Hang Up)**

    - **Signal Number**: 1
    - **Default Action**: Terminate the process.
    - **Use Case**: Originally sent to a process when the terminal is disconnected. Often used to signal a daemon to reload its configuration without restarting.
    - **Example**:
        ```sh
        # Find the process ID of the target daemon
        pid=$(pgrep -f "daemon_name")
        # Send SIGHUP to the daemon to reload configuration
        kill -s SIGHUP $pid
        ```

7. **SIGUSR1 and SIGUSR2 (User-defined signals)**
    - **Signal Numbers**: 10 and 12, respectively.
    - **Default Action**: Terminate the process (though typically these are caught and handled).
    - **Use Case**: These signals are reserved for user-defined purposes. They can be used to trigger custom behavior in a process.
    - **Example**:
        ```sh
        # Send SIGUSR1 to a process
        kill -s SIGUSR1 $pid
        ```

### Handling Signals in a Program

In a program, you can define signal handlers to perform specific actions when a signal is received. Here's an example in C:

```c
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

void handle_sigint(int sig) {
    printf("Caught SIGINT signal %d\n", sig);
    exit(0);
}

int main() {
    // Register signal handler for SIGINT
    signal(SIGINT, handle_sigint);

    while (1) {
        printf("Running...\n");
        sleep(1);
    }

    return 0;
}
```

### Sending Signals from the Command Line

-   **kill**: Sends a signal to a process by its PID.

    ```sh
    kill -s SIGTERM 1234  # Send SIGTERM to process with PID 1234
    kill -9 1234          # Forcefully kill process with PID 1234 using SIGKILL
    ```

-   **killall**: Sends a signal to all processes with a given name.

    ```sh
    killall -s SIGTERM process_name
    ```

-   **pkill**: Sends a signal to processes based on name and other attributes.
    ```sh
    pkill -SIGTERM process_name
    ```

Understanding and using signals in Linux is essential for managing and controlling processes effectively. Whether you're developing applications or managing a system, knowing how to handle signals can help you create more robust and responsive systems.
