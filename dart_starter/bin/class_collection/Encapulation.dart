void main() {
  var project = Project();
  project
    ..name = 'abc'
    ..decs = 'THIS IS ABC';
  print(project);

  var project2 = Project();
  project2
    ..name = 'abcdefj'
    ..decs = 'THIS IS ABCDEFJ';
  print(project);
}

class Project {
  String _projectName;
  String decs;

  //getter
  String get name => _projectName == null ? '' : _projectName.toUpperCase();

  //setter
  set name(String name) {
    if (name.length > 5) {
      throw 'Please input less than 5';
    }
    _projectName = name;
  }

  @override
  String toString() => 'Project Name is $_projectName - $decs';
}
