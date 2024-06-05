System calls are the mechanisms by which a program requests a service from the kernel of the operating system. They provide an interface between a process and the operating system, allowing user-level processes to perform functions that the operating system provides. Here are explanations and examples of some common system calls:

### File Operations

-   `open()`: Open or create a file.
-   `close()`: Close a file descriptor.
-   `read()`: Read data from a file descriptor.
-   `write()`: Write data to a file descriptor.
-   `lseek()`: Move the read/write file offset.
-   `unlink()`: Remove a directory entry.
-   `link()`: Create a new name for a file.
-   `symlink()`: Create a symbolic link to a file.
-   `stat()`: Get file status.
-   `fstat()`: Get file status (using file descriptor).
-   `lstat()`: Get file status (no follow of symbolic links).
-   `rename()`: Rename a file.
-   `chmod()`: Change file permissions.
-   `fchmod()`: Change file permissions (using file descriptor).
-   `chown()`: Change file owner and group.
-   `fchown()`: Change file owner and group (using file descriptor).
-   `truncate()`: Truncate a file to a specified length.
-   `ftruncate()`: Truncate a file to a specified length (using file descriptor).
-   `mkdir()`: Create a directory.
-   `rmdir()`: Remove a directory.
-   `readdir()`: Read a directory entry.
-   `fsync()`: Synchronize a file's in-core state with storage device.

### Process Control

-   `fork()`: Create a child process.
-   `execve()`: Execute a program.
-   `wait()`: Wait for process to change state.
-   `waitpid()`: Wait for process to change state.
-   `exit()`: Terminate the calling process.
-   `_exit()`: Terminate the calling process immediately.
-   `getpid()`: Get process ID.
-   `getppid()`: Get parent process ID.
-   `kill()`: Send a signal to a process.
-   `alarm()`: Set an alarm clock for delivery of a signal.
-   `pause()`: Wait for a signal.
-   `getuid()`: Get user ID.
-   `geteuid()`: Get effective user ID.
-   `getgid()`: Get group ID.
-   `getegid()`: Get effective group ID.
-   `setuid()`: Set user ID.
-   `setgid()`: Set group ID.
-   `setpgid()`: Set process group ID.
-   `getpgid()`: Get process group ID.

### Memory Management

-   `mmap()`: Map files or devices into memory.
-   `munmap()`: Unmap files or devices from memory.
-   `brk()`: Change data segment size.
-   `sbrk()`: Change data segment size.

### Inter-Process Communication (IPC)

-   `pipe()`: Create an inter-process channel.
-   `shmget()`: Allocate a System V shared memory segment.
-   `shmat()`: Attach a System V shared memory segment.
-   `shmdt()`: Detach a System V shared memory segment.
-   `shmctl()`: Control operations on a System V shared memory segment.
-   `semget()`: Get a System V semaphore set identifier.
-   `semop()`: Perform operations on System V semaphores.
-   `semctl()`: Control operations on a System V semaphore set.
-   `msgget()`: Get a System V message queue identifier.
-   `msgsnd()`: Send a message to a System V message queue.
-   `msgrcv()`: Receive a message from a System V message queue.
-   `msgctl()`: Control operations on a System V message queue.

### Networking

-   `socket()`: Create an endpoint for communication.
-   `bind()`: Bind a name to a socket.
-   `listen()`: Listen for connections on a socket.
-   `accept()`: Accept a connection on a socket.
-   `connect()`: Initiate a connection on a socket.
-   `send()`: Send a message on a socket.
-   `recv()`: Receive a message from a socket.
-   `sendto()`: Send a message on a socket.
-   `recvfrom()`: Receive a message from a socket.
-   `sendmsg()`: Send a message on a socket.
-   `recvmsg()`: Receive a message from a socket.
-   `shutdown()`: Shut down part of a full-duplex connection.
-   `setsockopt()`: Set options on a socket.
-   `getsockopt()`: Get options on a socket.
-   `getpeername()`: Get name of connected peer socket.
-   `getsockname()`: Get socket name.

### Time Management

-   `time()`: Get the current time.
-   `gettimeofday()`: Get the current time.
-   `settimeofday()`: Set the current time.
-   `clock_gettime()`: Get time of a specified clock.
-   `clock_settime()`: Set time of a specified clock.
-   `nanosleep()`: High-resolution sleep.
-   `alarm()`: Set an alarm clock for delivery of a signal.

### Miscellaneous

-   `getcwd()`: Get current working directory.
-   `chdir()`: Change working directory.
-   `fchdir()`: Change working directory (using file descriptor).
-   `mount()`: Mount a filesystem.
-   `umount()`: Unmount a filesystem.
-   `syslog()`: Generate a log message.
-   `ioctl()`: Control device.
-   `fcntl()`: File control operations.
-   `uname()`: Get system information.

These system calls form the backbone of interaction between user-space applications and the kernel, enabling a wide range of functionalities needed for complex software operations.

### 1. `open()`

**Purpose:** Open a file for reading, writing, or both.

**Example:**

```c
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int fd = open("example.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return 1;
    }
    // Use the file descriptor (fd) to read/write operations
    close(fd);
    return 0;
}
```

### 2. `read()`

**Purpose:** Read data from a file descriptor.

**Example:**

```c
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int fd = open("example.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    char buffer[100];
    ssize_t bytesRead = read(fd, buffer, sizeof(buffer) - 1);
    if (bytesRead == -1) {
        perror("read");
        close(fd);
        return 1;
    }

    buffer[bytesRead] = '\0';  // Null-terminate the string
    printf("Read %zd bytes: %s\n", bytesRead, buffer);

    close(fd);
    return 0;
}
```

### 3. `write()`

**Purpose:** Write data to a file descriptor.

**Example:**

```c
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int fd = open("example.txt", O_WRONLY | O_CREAT, 0644);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    const char *data = "Hello, World!";
    ssize_t bytesWritten = write(fd, data, strlen(data));
    if (bytesWritten == -1) {
        perror("write");
        close(fd);
        return 1;
    }

    printf("Wrote %zd bytes\n", bytesWritten);

    close(fd);
    return 0;
}
```

### 4. `close()`

**Purpose:** Close a file descriptor, releasing the associated resources.

**Example:**

```c
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    int fd = open("example.txt", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return 1;
    }

    // Perform read/write operations

    if (close(fd) == -1) {
        perror("close");
        return 1;
    }

    return 0;
}
```

### 5. `fork()`

**Purpose:** Create a new process by duplicating the calling process.

**Example:**

```c
#include <unistd.h>
#include <stdio.h>

int main() {
    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Child process
        printf("This is the child process\n");
    } else {
        // Parent process
        printf("This is the parent process with child PID: %d\n", pid);
    }

    return 0;
}
```

### 6. `exec()`

**Purpose:** Replace the current process image with a new process image.

**Example:**

```c
#include <unistd.h>
#include <stdio.h>

int main() {
    char *args[] = {"/bin/ls", "-l", NULL};
    if (execvp(args[0], args) == -1) {
        perror("exec");
        return 1;
    }

    // This line will not be executed if exec is successful
    printf("This won't be printed\n");

    return 0;
}
```

### 7. `wait()`

**Purpose:** Wait for a child process to change state.

**Example:**

```c
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Child process
        printf("Child process\n");
        _exit(0);
    } else {
        // Parent process
        int status;
        wait(&status);
        printf("Child process finished with status: %d\n", status);
    }

    return 0;
}
```

### 8. `kill()`

**Purpose:** Send a signal to a process.

**Example:**

```c
#include <signal.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Child process: wait to be killed
        while (1) {
            printf("Child process running...\n");
            sleep(1);
        }
    } else {
        // Parent process: wait a bit then kill the child
        sleep(3);
        kill(pid, SIGKILL);
        printf("Sent SIGKILL to child process\n");
    }

    return 0;
}
```

### Summary

System calls are the essential interface between a program and the operating system, enabling a variety of crucial operations like file manipulation, process control, and inter-process communication. The examples provided illustrate how to use some of the most common system calls in Unix-like systems, including file operations (`open`, `read`, `write`, `close`), process control (`fork`, `exec`, `wait`), and signaling (`kill`). Each of these examples demonstrates the syntax and usage of the respective system calls, helping to understand their role and functionality in system programming.
