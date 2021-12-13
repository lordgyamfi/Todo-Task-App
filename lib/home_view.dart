import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_todo_app/create_todo_view.dart';
import 'package:my_todo_app/utils.dart';

// short cut for writting stateless widget, stl= stateless widget
// while stf = stateful widget

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'todo';

  final List<Map<String, dynamic>> _uncompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus feugiat leo, a tempus mauris volutpat a. Pellentesque lorem nisl, finibus at tempor nec, porta eu nibh. Etiam mauris velit, porta nec maximus id, tincidunt eget ipsum. Sed imperdiet, massa quis volutpat consectetur, dui augue molestie metus, at interdum mi nisi et enim. Sed posuere, mauris in aliquam ornare, purus arcu consequat libero, vitae dignissim elit purus sit amet lacus. Praesent dignissim ante at tortor tincidunt fringilla. Donec venenatis magna at nibh aliquet, id tempor libero consequat. Nullam in vehicula sapien, nec rutrum nibh. Etiam finibus lectus tortor. Nam et scelerisque ipsum, id egestas metus.',
      'date_time': 'Yesterday',
      'status': true,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus feugiat leo, a tempus mauris volutpat a. Pellentesque lorem nisl, finibus at tempor nec, porta eu nibh. Etiam mauris velit, porta nec maximus id, tincidunt eget ipsum. Sed imperdiet, massa quis volutpat consectetur, dui augue molestie metus, at interdum mi nisi et enim. Sed posuere, mauris in aliquam ornare, purus arcu consequat libero, vitae dignissim elit purus sit amet lacus. Praesent dignissim ante at tortor tincidunt fringilla. Donec venenatis magna at nibh aliquet, id tempor libero consequat. Nullam in vehicula sapien, nec rutrum nibh. Etiam finibus lectus tortor. Nam et scelerisque ipsum, id egestas metus.',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus feugiat leo, a tempus mauris volutpat a. Pellentesque lorem nisl, finibus at tempor nec, porta eu nibh. Etiam mauris velit, porta nec maximus id, tincidunt eget ipsum. Sed imperdiet, massa quis volutpat consectetur, dui augue molestie metus, at interdum mi nisi et enim. Sed posuere, mauris in aliquam ornare, purus arcu consequat libero, vitae dignissim elit purus sit amet lacus. Praesent dignissim ante at tortor tincidunt fringilla. Donec venenatis magna at nibh aliquet, id tempor libero consequat. Nullam in vehicula sapien, nec rutrum nibh. Etiam finibus lectus tortor. Nam et scelerisque ipsum, id egestas metus.',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus feugiat leo, a tempus mauris volutpat a. Pellentesque lorem nisl, finibus at tempor nec, porta eu nibh. Etiam mauris velit, porta nec maximus id, tincidunt eget ipsum. Sed imperdiet, massa quis volutpat consectetur, dui augue molestie metus, at interdum mi nisi et enim. Sed posuere, mauris in aliquam ornare, purus arcu consequat libero, vitae dignissim elit purus sit amet lacus. Praesent dignissim ante at tortor tincidunt fringilla. Donec venenatis magna at nibh aliquet, id tempor libero consequat. Nullam in vehicula sapien, nec rutrum nibh. Etiam finibus lectus tortor. Nam et scelerisque ipsum, id egestas metus.',
      'date_time': 'Today',
      'status': false,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus feugiat leo, a tempus mauris volutpat a. Pellentesque lorem nisl, finibus at tempor nec, porta eu nibh. Etiam mauris velit, porta nec maximus id, tincidunt eget ipsum. Sed imperdiet, massa quis volutpat consectetur, dui augue molestie metus, at interdum mi nisi et enim. Sed posuere, mauris in aliquam ornare, purus arcu consequat libero, vitae dignissim elit purus sit amet lacus. Praesent dignissim ante at tortor tincidunt fringilla. Donec venenatis magna at nibh aliquet, id tempor libero consequat. Nullam in vehicula sapien, nec rutrum nibh. Etiam finibus lectus tortor. Nam et scelerisque ipsum, id egestas metus.',
      'date_time': 'Mon. 15 Dec',
      'status': false,
    }
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element['status']) {
        _uncompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Tasks',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: const Center(
            child: FlutterLogo(
          size: 41,
        )),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('Todo'),
                    value: 'todo',
                  ),
                  const PopupMenuItem(
                    child: Text('Completed'),
                    value: 'completed',
                  ),
                ];
              }),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              SizedBox(
                width: constraints.maxWidth / 2,
                child: TodoListViewWidget(
                    selectedItem: selectedItem,
                    uncompletedData: _uncompletedData,
                    completedData: _completedData),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          );
        }

        return TodoListViewWidget(
            selectedItem: selectedItem,
            uncompletedData: _uncompletedData,
            completedData: _completedData);
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return TaslkCardWidget(
                            dateTime: _completedData[index]['date_time'],
                            description: _completedData[index]['description'],
                            title: _completedData[index]['title'],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: _completedData.length);
                  });
            },
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(37, 43, 103, 1),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${_completedData.length}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoListViewWidget extends StatelessWidget {
  const TodoListViewWidget({
    Key? key,
    required this.selectedItem,
    required List<Map<String, dynamic>> uncompletedData,
    required List<Map<String, dynamic>> completedData,
  })  : _uncompletedData = uncompletedData,
        _completedData = completedData,
        super(key: key);

  final String selectedItem;
  final List<Map<String, dynamic>> _uncompletedData;
  final List<Map<String, dynamic>> _completedData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return TaslkCardWidget(
            dateTime: selectedItem == 'todo'
                ? _uncompletedData[index]['date_time']
                : _completedData[index]['date_time'],
            title: selectedItem == 'todo'
                ? _uncompletedData[index]['title']
                : _completedData[index]['title'],
            description: selectedItem == 'todo'
                ? _uncompletedData[index]['description']
                : _completedData[index]['description'],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: selectedItem == 'todo'
            ? _uncompletedData.length
            : _completedData.length);
  }
}

class TaslkCardWidget extends StatelessWidget {
  const TaslkCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.dateTime})
      : super(key: key);

  final String title;
  final String description;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 31,
              color: customColor(date: dateTime),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromRGBO(37, 43, 103, 1)),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: customColor(date: dateTime),
                ),
                Text(
                  dateTime,
                  style: TextStyle(color: customColor(date: dateTime)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
