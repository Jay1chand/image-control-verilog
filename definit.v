// Define a task to open a file for reading
task open_file;
    input string filename;
    output int file_descriptor;
    begin
        file_descriptor = $fopen(filename, "r");
        if (file_descriptor == 0)
            $display("Error opening file '%s'", filename);
    end
endtask

// Define a task to read a byte from the file
task read_byte;
    input int file_descriptor;
    output byte data;
    begin
        data = $fgetc(file_descriptor);
    end
endtask

// Define a task to close the file
task close_file;
    input int file_descriptor;
    begin
        $fclose(file_descriptor);
    end
endtask
