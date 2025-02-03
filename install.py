#!/usr/env python
import subprocess
import threading
import queue
import shlex


def read_output(process, queue):
    while True:
        output = process.stdout.readline().decode('utf-8')
        if output == '' and process.poll() is not None:
            break
        if output:
            queue.put(output)


def write_lines(process, output_queue):
    while True:
        try:
            output = output_queue.get(timeout=1)
            print(output, end='')
        except queue.Empty:
            if process.poll() is not None:
                break


def run(cmd):
    process = subprocess.Popen(shlex.split(cmd), stdout=subprocess.PIPE, text=False)
    output_queue = queue.Queue()

    thread = threading.Thread(target=read_output, args=(process, output_queue))
    thread.start()

    write_lines(process, output_queue)

    process.wait()
    thread.join()


def main():
    run("ansible-galaxy install -r requirements.yaml -f --ignore-errors")
    run("ansible-playbook playbook-heitec-arch.yaml")


if __name__ == "__main__":
    main()