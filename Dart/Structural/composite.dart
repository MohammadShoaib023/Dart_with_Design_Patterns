/// Interface for file system components (either File or Directory)
abstract interface class FileSystemComponent {
  int getSize();
}

/// Concrete implementation of a File in the file system
class File implements FileSystemComponent {
  File({required this.name, required this.size});

  final String name;
  final int size; // Size of the file in bytes

  @override
  int getSize() => size;
}

/// Concrete implementation of a Directory in the file system
class Directory implements FileSystemComponent {
  Directory({required this.name, required this.children});

  final String name;
  final List<FileSystemComponent> children; // Files and subdirectories

  @override
  int getSize() => children.fold(
      0, (totalSize, component) => totalSize + component.getSize());
}

void main() {
  // Creating files
  final file1 = File(name: 'file1.txt', size: 100);
  final file2 = File(name: 'file2.txt', size: 200);
  final file3 = File(name: 'file3.txt', size: 150);

  // Creating directories and nesting files and directories
  final directory1 = Directory(name: 'Folder1', children: [file1, file2]);
  final directory2 = Directory(name: 'Folder2', children: [file3]);
  final rootDirectory =
      Directory(name: 'Root', children: [directory1, directory2]);

  // Calculating total size of the file system
  final totalSize = rootDirectory.getSize();

  // Printing out the file system structure and total size
  print('File system structure:');
  printFileSystem(rootDirectory, '');

  print('Total size of the file system: $totalSize bytes');
}

void printFileSystem(FileSystemComponent component, String indent) {
  print('$indent${component.runtimeType}: ${component.getSize()} bytes');
  if (component is Directory) {
    for (var child in component.children) {
      printFileSystem(child, '$indent  ');
    }
  }
}
