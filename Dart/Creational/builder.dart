/// Enum to define the CPU types
enum CPU { i5, i7, i9, ryzen5, ryzen7, ryzen9 }

/// Enum to define the GPU types
enum GPU { nvidiaRTX3060, nvidiaRTX3070, nvidiaRTX3080, amdRX6700, amdRX6800 }

/// Enum to define the Storage types
enum StorageType { HDD, SSD }

/// Computer class to hold computer details
class Computer {
  final CPU cpu;
  final GPU gpu;
  final int ram;
  final StorageType storageType;
  final int storageSize;

  Computer({
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.storageType,
    required this.storageSize,
  });

  /// Method to copy and modify properties
  Computer copyWith({
    CPU? cpu,
    GPU? gpu,
    int? ram,
    StorageType? storageType,
    int? storageSize,
  }) {
    return Computer(
      cpu: cpu ?? this.cpu,
      gpu: gpu ?? this.gpu,
      ram: ram ?? this.ram,
      storageType: storageType ?? this.storageType,
      storageSize: storageSize ?? this.storageSize,
    );
  }

  @override
  String toString() {
    return '''
Computer Specifications:
  CPU: $cpu
  GPU: $gpu
  RAM: ${ram}GB
  Storage: ${storageSize}GB $storageType
''';
  }
}

/// Interface defines how to build a Computer
abstract class ComputerBuilder {
  void setCPU(CPU cpu);
  void setGPU(GPU gpu);
  void setRAM(int ram);
  void setStorage(StorageType storageType, int storageSize);
  Computer getComputer();
}

/// Concrete Gaming Computer builder
class GamingComputerBuilder implements ComputerBuilder {
  late Computer _computer;

  @override
  void setCPU(CPU cpu) {
    _computer = Computer(
      cpu: cpu,
      gpu: GPU.nvidiaRTX3080, // Default GPU for gaming
      ram: 16, // Default RAM
      storageType: StorageType.SSD,
      storageSize: 1000, // Default storage size
    );
  }

  @override
  void setGPU(GPU gpu) {
    _computer = _computer.copyWith(gpu: gpu);
  }

  @override
  void setRAM(int ram) {
    _computer = _computer.copyWith(ram: ram);
  }

  @override
  void setStorage(StorageType storageType, int storageSize) {
    _computer =
        _computer.copyWith(storageType: storageType, storageSize: storageSize);
  }

  @override
  Computer getComputer() => _computer;
}

/// Concrete Office Computer builder
class OfficeComputerBuilder implements ComputerBuilder {
  late Computer _computer;

  @override
  void setCPU(CPU cpu) {
    _computer = Computer(
      cpu: cpu,
      gpu: GPU.nvidiaRTX3060, // Default GPU for office work
      ram: 8, // Default RAM
      storageType: StorageType.SSD,
      storageSize: 500, // Default storage size
    );
  }

  @override
  void setGPU(GPU gpu) {
    _computer = _computer.copyWith(gpu: gpu);
  }

  @override
  void setRAM(int ram) {
    _computer = _computer.copyWith(ram: ram);
  }

  @override
  void setStorage(StorageType storageType, int storageSize) {
    _computer =
        _computer.copyWith(storageType: storageType, storageSize: storageSize);
  }

  @override
  Computer getComputer() => _computer;
}

/// Concrete Workstation Computer builder
class WorkstationComputerBuilder implements ComputerBuilder {
  late Computer _computer;

  @override
  void setCPU(CPU cpu) {
    _computer = Computer(
      cpu: cpu,
      gpu: GPU.amdRX6800, // Default GPU for workstations
      ram: 32, // Default RAM
      storageType: StorageType.SSD,
      storageSize: 2000, // Default storage size
    );
  }

  @override
  void setGPU(GPU gpu) {
    _computer = _computer.copyWith(gpu: gpu);
  }

  @override
  void setRAM(int ram) {
    _computer = _computer.copyWith(ram: ram);
  }

  @override
  void setStorage(StorageType storageType, int storageSize) {
    _computer =
        _computer.copyWith(storageType: storageType, storageSize: storageSize);
  }

  @override
  Computer getComputer() => _computer;
}

/// Director to build all kinds of computers
class Director {
  Computer buildComputer(ComputerBuilder builder, CPU cpu, GPU gpu, int ram,
      StorageType storageType, int storageSize) {
    builder.setCPU(cpu);
    builder.setGPU(gpu);
    builder.setRAM(ram);
    builder.setStorage(storageType, storageSize);
    return builder.getComputer();
  }
}

void main() {
  final director = Director();

  final gamingComputer = director.buildComputer(GamingComputerBuilder(), CPU.i9,
      GPU.nvidiaRTX3080, 32, StorageType.SSD, 2000);
  final officeComputer = director.buildComputer(OfficeComputerBuilder(), CPU.i5,
      GPU.nvidiaRTX3060, 16, StorageType.SSD, 512);
  final workstationComputer = director.buildComputer(
      WorkstationComputerBuilder(),
      CPU.ryzen9,
      GPU.amdRX6800,
      64,
      StorageType.SSD,
      4000);

  print(gamingComputer);
  print(officeComputer);
  print(workstationComputer);

  /// Here is the result:
  /*
  Computer Specifications:
    CPU: CPU.i9
    GPU: GPU.nvidiaRTX3080
    RAM: 32GB
    Storage: 2000GB StorageType.SSD
  
  Computer Specifications:
    CPU: CPU.i5
    GPU: GPU.nvidiaRTX3060
    RAM: 16GB
    Storage: 512GB StorageType.SSD
  
  Computer Specifications:
    CPU: CPU.ryzen9
    GPU: GPU.amdRX6800
    RAM: 64GB
    Storage: 4000GB StorageType.SSD
  */
}
